;;; prelude-config.el --- Emacs DGN-Local-Prelude
;;; This file bootstraps cask/use-package & handles
;;; load-paths and require calls, etc. etc.

;;; Pallet Config -- not so sure about this. I think I'm going to try and use use-package instead
(require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; Package Mode Setup
(eval-when-compile  (require 'use-package))
(require 'use-package)
(require 'bind-key)
(require 'diminish)
(require 'cl)
(require 'cl-lib)
(require 'uniquify)

;; run emacs in server mode

(server-start)

;; bind-key
(use-package bind-key :ensure t)

(use-package ispell
  :ensure t 
  :config
    progn 
      ((setq ispell-program-name "/usr/local/bin/aspell")
       (setq ispell-personal-dictionary "~/.aspell.en.pws"))

;;; Tell emacs about the proper load-path
(add-to-list 'load-path "~/.emacs.d/el-get/" )
(add-to-list 'load-path "~/.emacs.d/themes/")
(add-to-list 'load-path "~/.emacs.d/elisp/externals/")
(add-to-list 'load-path "~/.emacs.d/predictive/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(add-to-list 'load-path "~/.emacs.d/elisp/solarized-emacs/")

;; The good solarized lives here
(if (load "~/.emacs.d/elisp/solarized-emacs/solarized")
    (load "~/.emacs.d/elisp/solarized-emacs/solarized-theme")
  and (load "~/.emacs.d/elisp/solarized-emacs/solarized-dark-theme"))

;; PATH Setup
(setenv  "PATH" (concat "/usr/local/bin:/opt/local/bin:/usr/bin:/bin:/usr/texbin:/usr/local/texlive/2015/:
~/Library/Haskell/bin:opt/local/share/:/usr/local/Cellar/" (getenv "PATH")))

;; Trackpad scrolling
(global-set-key [wheel-up] 'previous-line)
(global-set-key [wheel-down] 'next-line)
(global-set-key [wheel-right] 'previous-line)
(global-set-key [double-wheel-right] 'previous-line)
(global-set-key [wheel-left] 'next-line)
(global-set-key [double-wheel-left] 'next-line)

;; Copy current line with M-k
;; http://www.emacsblog.org/2009/05/18/copying-lines-not-killing/#comment-27462
(defun dgn/copy-line ()
  "Copy the current line to the kill-ring."
  (interactive)
  (kill-ring-save (line-beginning-position) (+ 1 (line-end-position))))
  (bind-key "M-k" 'dgn/copy-line)

;; undo-tree
(use-package undo-tree
  :ensure t
  :config
  (progn
    ;; Lighter displayed in mode line
    (setq undo-tree-mode-lighter nil)
    ;; ...and enable!
    (global-undo-tree-mode)))

;; Deft -- INTEGRATE ME!
(use-package deft
  :ensure t
  :bind ("C-! d" . deft)
  :init
  (progn
    (setq deft-directory "~/Dropbox/.deft/"
	  deft-extension "org"
	  deft-text-mode 'org-mode
	  deft-use-filename-as-title t)
    (defadvice deft-auto-save (around keep-whitespace-on-deft-auto-save activate)
      (flet ((delete-trailing-whitespace))
	ad-do-it))))

;; Find unbound keys

(use-package unbound
  :ensure t
  :commands describe-unbound-keys)

;; ace-jump (reminder: C-x C-SPC to pop-global-mark)
(use-package ace-jump-mode
  :ensure t
  :bind (("C-;" . ace-jump-mode)
	 ("C-x C-;" . ace-jump-mode-pop-mark))
  :init
  (setq ace-jump-mode-scope 'frame)
  :config
  (ace-jump-mode-enable-mark-sync))


;; Colorize strings that represent colors
(use-package rainbow-mode
  :ensure t
  :commands rainbow-mode
  :diminish rainbow-mode)

(use-package markdown-mode
 :ensure t
 :mode (("\\.md\\'" . markdown-mode)
  	 ("\\.mdwn\\'" . markdown-mode)
  	 ("\\.markdown\\'" . markdown-mode)))


(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :defer 15
  :config
  (progn
    ;; Snippets dir:
    ;; - make sure the local one (~/.emacs.d/snippets) comes first
    (setq yas-snippet-dirs
          (cons "~/.emacs.d/snippets"
                (cl-remove-if (lambda (item) (string-equal "~/.emacs.d/snippets" item))
                              yas-snippet-dirs)))
    (yas-global-mode 1)))

(use-package helm-company
  :ensure t
  :commands helm-company
  :init
  (eval-after-load 'company
    '(progn
       (define-key company-mode-map (kbd "C-:") 'helm-company)
       (define-key company-active-map (kbd "C-:") 'helm-company))))


(use-package helm-descbinds
  :ensure t
  :config (helm-descbinds-mode))

(use-package helm-flycheck
  :ensure t
  :commands helm-flycheck
  :init
  (eval-after-load 'flycheck
    '(bind-key "h" 'helm-flycheck flycheck-command-map)))

;; Fixmee
(use-package fixmee
  :ensure t
  :defer 10
  :config (progn (setq button-lock-mode-lighter nil)
                 (setq fixmee-mode-lighter nil)
                 (require 'button-lock)
                 (global-fixmee-mode)))

(use-package drag-stuff
  :ensure t
  :diminish drag-stuff-mode
  :config (progn
            (setq drag-stuff-modifier '(meta shift))
            (drag-stuff-global-mode t)))

(use-package auctex
  :ensure t
  :mode ("\\.tex\\'" . latex-mode)
  :commands (latex-mode LaTeX-mode plain-tex-mode)
  :init  (progn
           (add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)
           (add-hook 'LaTeX-mode-hook #'flyspell-mode)
           (add-hook 'LaTeX-mode-hook #'turn-on-reftex)
           (setq TeX-auto-save t
                 TeX-parse-self t
                 TeX-save-query nil
                 TeX-PDF-mode t)
           (setq-default TeX-master nil)))

(use-package preview
  :commands LaTeX-preview-setup
  :init
  (progn
    (setq-default preview-scale 1.4
		  preview-scale-function '(lambda () (* (/ 10.0 (preview-document-pt)) preview-scale)))))

(use-package reftex
  :commands turn-on-reftex
  :init
  (progn
    (setq reftex-plug-into-AUCTeX t)))

(use-package bibtex
  :mode ("\\.bib" . bibtex-mode)
  :init
  (progn
    (setq bibtex-align-at-equal-sign t)
    (add-hook 'bibtex-mode-hook (lambda () (set-fill-column 120)))))

;;; Auto-fill for LaTeX
(defun dgn/latex-auto-fill ()
  "Turn on auto-fill for LaTeX mode."
  (turn-on-auto-fill)
  (set-fill-column 80)
  (setq default-justification 'left))
(add-hook 'LaTeX-mode-hook #'dgn/latex-auto-fill)
(add-hook 'LaTeX-mode-hook (lambda () (setq compile-command "latexmk -pdf")))

;; Prevent ispell from verifying some LaTeX commands
;; http://stat.genopole.cnrs.fr/dw/~jchiquet/fr/latex/emacslatex
(defvar dgn/ispell-tex-skip-alists
  '("cite" "nocite" "includegraphics" "author" "affil" "ref" "eqref" "pageref" "label"))

(setq ispell-tex-skip-alists
      (list
       (append (car ispell-tex-skip-alists)
       (mapcar #'(lambda (cmd) (list (concat "\\\\" cmd) 'ispell-tex-arg-end)) dgn/ispell-tex-skip-alists))
       (cadr ispell-tex-skip-alists)))

;; Use dvipdfmx to convert DVI files to PDF in AUCTeX
(eval-after-load 'tex
  '(add-to-list 'TeX-command-list
                '("DVI to PDF" "dvipdfmx %d" TeX-run-command t t) t))

;; SyncTeX (http://www.emacswiki.org/emacs/AUCTeX#toc19)

(defun synctex/un-urlify (fname-or-url)
  "A trivial function that replaces a prefix of file:/// with just /."
  (if (string= (substring fname-or-url 0 8) "file:///")
      (substring fname-or-url 7)
    fname-or-url))

;; fonts
(defun font-existsp (font)
"Check to see if the named FONT is available."
 (if (null (x-list-fonts font)) nil t))
 ;; Set default font. First one found is selected.
(cond
 ((eq window-system nil) nil)
 ((font-existsp "Myriad Pro")
	 (set-face-attribute 'default nil :height 131 :font "Myriad Pro"))
((font-existsp "Source Code Pro")
 (set-face-attribute 'default nil :height 121:font "Source Code Pro")))


;;TODO: Add mode-hooks for faces/fonts. Source Code/(In)Consolata
;; in programming modes and Myriad in text modes.

;;; Full Screen ESKSS-style

(defun fullscreen (&optional f)
  (interactive)
  (set-frame-parameter f 'fullscreen
                       (if (frame-parameter f 'fullscreen) nil 'fullboth)))
(global-set-key (kbd "C-c f") 'fullscreen)
(add-hook 'after-make-frame-functions 'fullscreen)


;;;PRETTIFICATION

(global-prettify-symbols-mode t)
(pretty-lambda-mode t)
(global-prettify-symbols-mode t)
(set-cursor-color "blue")
(nyan-mode t)
(rainbow-mode t)
(fancy-battery-mode t)
(fancy-narrow-mode t)

;;; TODO: Move to org-settings and off-load as much as possible from custom.el

;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")
;; Set to the files (or directory of files) you want sync'd
;; (setq org-agenda-files (quote ("~/org/")))
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/org/from-mobile.org")


;;; Auctex Settings


(load "~/.emacs.d/personal/prelude-latex.el")
 ;(require 'latex-pretty-symbols)
;(require 'reftex)

;;; (provides prelude-config.el) ; TODO: Put a use-package call into
;;; init.el so i can get flymake to shut the fuck up.
;;; prelude-config ends here
