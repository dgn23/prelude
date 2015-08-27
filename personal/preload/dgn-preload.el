;;; DGN-Preload.el
;;; Summary: Anything that should be loaded before prelude (and anything else besides init.el).

;;; License: (for ESKH) Copyleft 2015 -- Do What Thou Wilt (Just Don't Blame Me!)

;;; Code:

;; System-wide, package-indepedent settings

(setq load-prefer-newer t)
(setq debug-on-error nil)
(setq scroll-bar-mode nil)

;; Cask/Pallet

(require 'cl)
(require 'cask "/usr/local/Cellar/cask/0.7.2_1/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; El-Get: Basic setup for user .emacs
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;(el-get 'sync)

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Package Mode Setup
(eval-when-compile  (require 'use-package))
(require 'bind-key)
(require 'diminish)
(require 'cl-lib)
(require 'uniquify)
(require 'exec-path-from-shell)


;; PATH Setup
(setenv  "PATH" (concat "/usr/local/bin:/usr/texbin:/usr/local/texlive/2015:~/Library/Haskell/bin" (getenv "PATH")))
;(add-to-list 'after-init-hook (exec-path-from-shell-initialize))

;; Tell emacs about the proper load-path
(add-to-list 'load-path "~/.emacs.d/.cask/24.5.1/bootstrap")
(add-to-list 'load-path "~/.emacs.d/.cask/24.5.1/elpa")
(add-to-list 'load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/elisp/externals")
(add-to-list 'load-path "~/.emacs.d/predictive")
;;(add-to-list 'load-path "~/.emacs.d/elisp/solarized-emacs")
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")

;; Trackpad scrolling -- Trackpad scrolling will be left in DGN-keybindings.el as well (at least
;; until I figure out whether this works)

(global-set-key [wheel-up] 'previous-line)
(global-set-key [wheel-down] 'next-line)
(global-set-key [wheel-right] 'previous-line)
(global-set-key [double-wheel-right] 'previous-line)
(global-set-key [wheel-left] 'next-line)
(global-set-key [double-wheel-left] 'next-line)
