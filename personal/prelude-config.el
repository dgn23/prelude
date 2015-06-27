;;; prelude-config.el --- Emacs DGN-Local-Prelude

;;; Pallet Config -- not so sure about this. I think I'm going to try and use use-package instead
(require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;(eval-when-compile  (require 'use-package))

(require 'use-package)
(require 'bind-key)
(require 'diminish)

(require 'cl)
(require 'cl-lib)
(require 'uniquify)

;; ispell
(require 'ispell)
(setq ispell-program-name "/usr/local/bin/aspell")
(setq ispell-personal-dictionary "~/.aspell.en.pws")

;; run emacs in server mode
(server-start)

;;; Tell Emacs about elget packages
(add-to-list 'load-path "~/.emacs.d/el-get/" )
(add-to-list 'load-path "~/.emacs.d/themes/")
(add-to-list 'load-path "~/.emacs.d/elisp/externals/")
(add-to-list 'load-path "~/.emacs.d/predictive/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")

;; The good solarized lives here
(add-to-list 'load-path "~/.emacs.d/elisp/solarized-emacs/")
(if (load "~/.emacs.d/elisp/solarized-emacs/solarized")
    (load "~/.emacs.d/elisp/solarized-emacs/solarized-theme")
  and (load "~/.emacs.d/elisp/solarized-emacs/solarized-dark-theme"))

;; PATH Setup
(setenv  "PATH" (concat "/usr/local/bin:/opt/local/bin:/usr/bin:/bin:/usr/texbin:
~/Library/Haskell/bin:opt/local/share/:" (getenv "PATH")))

;; Requirements
(use-package flyspell)
(use-package helm :ensure t )
(use-package exec-path-from-shell :ensure t :config (exec-path-from-shell-initialize))
(use-package org-notify :defer t)
(use-package company :ensure t :bind ("C-x p" .   company-complete) :config (global-company-mode t))
;(use-package auto-complete-latex :load-path "~/.emacs.d/elisp/externals/" :defer t)
(use-package auto-complete-auctex :load-path"~/.emacs.d/elisp/externals/"	:defer t)
(use-package guide-key :load-path "~/.emacs.d/el-get/guide-key/"
	:init (setq guide-key/guide-key-sequence t) (setq guide-key/idle-delay 0.7) :config (guide-key-mode 1))
(use-package guide-key-tip :load-path "~/.emacs.d/el-get/guide-key-tip" :config (setq guide-key-tip/enabled t))
(use-package deft	:defer t	:config (setq deft-extension "md") (setq deft-directory "~/Dropbox/.deft")
	(setq deft-text-mode 'markdown-mode) (setq deft-use-filename-as-title t))
(use-package icicle	:defer t	:config (icicle-mode t))
(use-package golden-ratio :ensure t :config (golden-ration-mode t))
(use-package pretty-mode :ensure t :config (pretty-mode t))
(use-package edit-server :if window-system :init (add-hook 'after-init-hook 'server-start t) (add-hook 'after-init-hook 'edit-server-start t))
;;; Gets rid of that annoying magit 1.4.0 message re: buffer reversion
(setq magit-last-seen-setup-instructions "1.4.0")

;; ispell
(require 'ispell)
(setq ispell-program-name "/usr/local/bin/aspell")
(setq ispell-personal-dictionary "~/.aspell.en.pws")


;; Trackpad scrolling
(global-set-key [wheel-up] 'previous-line)
(global-set-key [wheel-down] 'next-line)
(global-set-key [wheel-right] 'previous-line)
(global-set-key [double-wheel-right] 'previous-line)
(global-set-key [wheel-left] 'next-line)
(global-set-key [double-wheel-left] 'next-line)

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
