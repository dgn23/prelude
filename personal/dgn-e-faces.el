;; dgn-e-faces

;; TODO (WISHLIST)
;; 1. Modeline
;; 2. Font switching (or dynamic loading depending on major mode)
;; 3. Theme/color switching -- basically between sol. dark and leuven (light)

;;; Code:

(eval-when-compile (require 'use-package))

(setq ns-use-srgb-colorspace t)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)

(setq global-font-lock-mode t)

;;;; Background Color -- TODO make interactive

(defvar dgn/background 'dark)
;; (defvar dgn/background 'light)

(defun dgn-dark ()
  (interactive)
  (use-package solarized
  	:load-path "~/.emacs.d/elisp/solarized-emacs/"
  	:ensure solarized-theme
  	:init (load-theme 'solarized-dark 'no-confirm)))

(defun dgn-light ()
  (interactive)
  (use-package leuven-theme
  	:load-path "~/.emacs.d/.Cask/24.5.1/elpa/leuven-theme-20150622.306"
    :init (load-theme 'leuven t)))

(if (eq dgn/background 'dark)
    (dgn-dark)
  (dgn-light))

(defun dgn/add-watchwords ()
  "Highlight NTS, NOTE, TODO, and CITE in code"
  (font-lock-add-keywords
   nil '(("\\<\\(NTS\\|NOTE\\|TODO\\|CITE|\\)\\>"
        1 '((:foreground "#D33682") (:weight bold)) t))))
;; NOTE: REMOVED ! FROM CITE AND ADDED PIPE | AT ENDd

(defun dgn/turn-on-hl-line-mode ()
  "Turn on hl-line-mode"  (interactive)
  (hl-line-mode 1))

(add-hook 'prog-mode-hook #'dgn/add-watchwords)
(add-hook 'latex-mode-hook #'dgn/add-watchwords)
(add-hook 'prog-mode-hook #'dgn/turn-on-hl-line-mode)
(add-hook 'org-mode-hook #'dgn/turn-on-hl-line-mode)
(add-hook 'org-mode-hook #'dgn-light)

(use-package powerline
	:disabled t
	:init (powerline-default-theme))

(use-package smart-mode-line
	:disabled t
	:init (progn (setq sml/theme dgn/background
					   sml/name-width 20)
				 (sml/setup)))
;;; Amit's Mode Line Setup

(setq-default
  mode-line-format
    '(; Position, including warning for +80 column
      (:propertize "%4l:" face mode-line-position-face)
      (:eval (propertize "%3c" 'face
             (if (>= (current-column) 80)
                'mode-line-80col-face
                'mode-line-position-face)))
      ;; emacsclient [default -- keep?]
      mode-line-client
      " "
      ;; read-only or modified status
      (:eval
        (cond (buffer-read-only
              (propertize " RO " 'face 'mode-line-read-only-face))
        ((buffer-modified-p)
       (propertize " ** " 'face 'mode-line-modified-face))
        (t " ")))
      " "
      ;; directory and buffer/file name
      (:propertize (:eval (shorten-directory default-directory 30))
                   face mode-line-folder-face
      (:propertize "%b"
                   face mode-line-filename-face)
      ;; narrow [default -- keep?]
      ;; " %n "
      ;; mode indicators: vc, recursive edit, major mode, minor modes, process, global
      (vc-mode vc-mode)
      " %["
      (:propertize mode-name face mode-line-mode-face)
      "%] "
      (:eval (propertize (format-mode-line minor-mode-alist)
                         'face 'mode-line-minor-mode-face))
      (:propertize mode-line-process-face
                   face mode-line-process-face)
      " "
      ;; mode-line-misc-info is better than Amit's version
      mode-line-misc-info
      " "
      ;; nyan-mode used nyan cat as an alternative to %p
      (:eval (when nyan-mode (list (nyan-create))))
      )))

    ;; Helper function
    (defun shorten-directory (dir-max-length)
      "Show up to `max-length' characters of a directory name `dir'."
      (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
            (output ""))
        (when (and path (equal " " (car path)))
          (setq path (cdr path)))
        (while (and path (< (length output) (- max-length 4)))
          (setq output (concat (car path) "/" output))
          (setq path (cdr path)))
        (when path
          (setq output (concat ".../" output)))
        output))

;; Extra mode line faces
(make-face 'mode-line-read-only-face)
(make-face 'mode-line-modified-face)
(make-face 'mode-line-folder-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-position-face)
(make-face 'mode-line-process-face)
(make-face 'mode-line-mode-face)
(make-face 'mode-line-minor-mode-face)
(make-face 'mode-line-80col-face)

;; DGN NOTE: I'm taking these values from Lee's (writequite.org) setup, but he uses
;; a different theme than I do, so the colors and whatnot will need tweaking.

(set-face-attribute 'mode-line nil
                    :foreground "gray60" :background "gray20"
                    :inverse-video nil
                    :box '(:line-width 2 :color "gray20" :style nil))
(set-face-attribute 'mode-line-inactive nil
                    :foreground "gray80" :background "gray40"
                    :inverse-video nil
                    :box '(:line-width 2 :color "gray40" :style nil))
(set-face-attribute 'mode-line-read-only-face nil
                    :inherit 'mode-line-face
                    :foreground "#271ae"
                    :box '(:line-width 2 :color "#4271ae"))
(set-face-attribute 'mode-line-modified-face nil
                    :inherit 'mode-line-face
                    :foreground "#c82829"
                    :background "#ffffff"
                    :box '(:line-width 2 :color "#c82829"))
(set-face-attribute 'mode-line-folder-face nil
                    :inherit 'mode-line-face
                    :foreground "gray60")
(set-face-attribute 'mode-line-filename-face nil
                    :inherit 'mode-line-face
                    :foreground "#eab700"
                    :weight 'bold)
(set-face-attribute 'mode-line-position-face nil
                    :inherit 'mode-line-face
                    :family "Hasklig" :height 100)
(set-face-attribute 'mode-line-mode-face nil
                    :inherit 'mode-line-face
                    :foreground "gray80")
(set-face-attribute 'mode-line-minor-mode-face nil
                    :inherit 'mode-line-mode-face
                    :foreground "gray40"
                    :height 110)
(set-face-attribute 'mode-line-process-face nil
                    :inherit 'mode-line-face
                    :foreground "#718c00")
(set-face-attribute 'mode-line-80col-face nil
                    :inherit 'mode-line-position-face
                    :foreground "black" :background "#eab700")
