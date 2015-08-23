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

;; ++++++++++++++++++++ FONT ++++++++++++++++++++ ;;
;; fonts -- see about changing so as to make switching easier
;; (or even better, set up hooks so I get mono in prog and sans in text)

(defun font-existsp (font)

"Check to see if the named FONT is available."
 (if (null (x-list-fonts font)) nil t))
 ;; Set default font. First one found is selected.
(cond
  ((eq window-system nil) nil)
    ((font-existsp "Roboto")
      (set-face-attribute 'default nil :height 161 :font "Roboto"))
    ((font-existsp "Myriad Pro")
      (set-face-attribute 'default nil :height 121 :font "Myriad Pro")))


;; ++++++++++++++++++++ BACKGROUND ++++++++++++++++++++ ;;

;; Use-Package declaration to make themes available

(use-package moe-theme
  :load-path "~/.emacs.d/.cask/24.5.1/elpa/moe-theme-20150707.656"
  :ensure t
  :init (require 'moe-light-theme)
  (require 'moe-dark-theme)
  (require 'moe-theme-switcher)
  :config (progn
  (setq moe-theme-powerline-enable-p t)
  (setq moe-theme-resize-org-title t)
  (setq moe-theme-resize-markdown-title t)
  (setq moe-theme-switch-by-sunrise-and-sunset nil)))

(defun dgn/solarized-dark ()
  (interactive)
  (use-package solarized
  	:load-path "~/.emacs.d/elisp/solarized-emacs/"
  	:ensure solarized-theme
  	:init (load-theme 'solarized-dark 'no-confirm)))

(defun dgn/leuven-light ()
  (interactive)
  (use-package leuven-theme
  	:load-path "~/.emacs.d/.Cask/24.5.1/elpa/leuven-theme-20150622.306"
        :init (load-theme 'leuven t)))

(defun dgn/moe-dark ()
  (interactive)
  (use-package moe-dark-theme
    :load-path "~/.emacs.d/.cask/24.5.1/elpa/moe-theme-20150707.656"
    :init (load-theme 'moe-dark t)))

(defun dgn/moe-light ()
  (interactive)
  (use-package moe-dark-theme
    :load-path "~/.emacs.d/.cask/24.5.1/elpa/moe-theme-20150707.656"
    :init (load-theme 'moe-light t)))

(defun dgn/add-watchwords ()
  (interactive)
  "Highlight NTS, NOTE, TODO, and CITE in code"
  (font-lock-add-keywords
   nil '(("\\<\\(NTS\\|NOTE\\|TODO\\|CITE\\)\\>"
        1 '((:foreground "#D33682") (:weight bold)) t))))

(defun dgn/hl-line-on ()
  "Turn on hl-line-mode"
  (interactive)
  (hl-line-mode 1))


(defun dgn/hl-line-off ()
  "Turn off hl-line mode"
  (interactive)
   (hl-line-mode nil))

(add-hook 'org-mode-hook #'dgn/add-watchwords)
(add-hook 'prog-mode-hook #'dgn/add-watchwords)
(add-hook 'latex-mode-hook #'dgn/add-watchwords)

(use-package powerline
  :defer t
  :init (powerline-default-theme)
  :config (progn
            (setq powerline-arrow-shape 'curve)
            (setq powerline-default-separator 'utf-8)
            (setq powerline-default-separator-dir '(right . left))))

(use-package smart-mode-line
:disabled t
:init (progn (setq sml/theme 'moe-dark-theme
                   sml/name-width 20)
             (sml/setup)))

;;; MODELINE (adapted from emacs-fu)
(defun dgn/modeline ()
  "Turn on custom mode-line" (interactive)
(setq
 mode-line-format
  (list
    ;; the buffer name; the file name as a tool tip
    '(:eval (propertize " %b " 'face 'font-lock-keyword-face
        'help-echo (buffer-file-name)))

    ;; line and column
    "(" ;; '%02' to set to 2 chars at least; prevents flickering
      (propertize "%02l" 'face 'font-lock-type-face) ","
      (propertize "%02c" 'face 'font-lock-type-face)
    ") "

    ;; relative position, size of file
    "["
    (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
    "/"
    (propertize "%I" 'face 'font-lock-constant-face) ;; size
    "] "

    ;; the current major mode for the buffer.
    "["

    '(:eval (propertize "%m" 'face 'font-lock-string-face
              'help-echo buffer-file-coding-system))
    "] "


    "[" ;; insert vs overwrite mode, input-method in a tooltip
    '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
              'face 'font-lock-preprocessor-face
              'help-echo (concat "Buffer is in "
                           (if overwrite-mode "overwrite" "insert") " mode")))

    ;; was this buffer modified since the last save?
    '(:eval (when (buffer-modified-p)
              (concat ","  (propertize "Mod"
                             'face 'font-lock-warning-face
                             'help-echo "Buffer has been modified"))))

    ;; is this buffer read-only?
    '(:eval (when buffer-read-only
              (concat ","  (propertize "RO"
                             'face 'font-lock-type-face
                             'help-echo "Buffer is read-only"))))
    "] "

    ;; add the time, with the date and the emacs uptime in the tooltip
    '(:eval (propertize (format-time-string "%H:%M")
              'help-echo
              (concat (format-time-string "%c; ")
                      (emacs-uptime "Uptime:%hh"))))
    ;;" --"
    ;; i don't want to see minor-modes; but if you want, uncomment this:
    ;;  minor-mode-alist  ;; list of minor modes
    "" ;; fill with '-'
    )))

(use-package pretty-mode
  :ensure t
  :defer 5
  :init (global-pretty-mode))

; (use-package pretty-lambda-mode
;:ensure t
;  :defer 5
;  :init (global-pretty-lambda-mode))
