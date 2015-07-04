;;    DGN-Prelude Priority Settings:
;; Summary: This is called 'dgn-alist' only to ensure it gets loaded first (among personal)

;; bootstrapping
;(setq load-prefer-newer t) (already in prelude init.el)
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) 
(package-initialize)

;;; Cask/Pallet
(eval-when-compile (require 'cl))
(require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

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

;; run emacs in server mode
(server-start)

;;; Tell emacs about the proper load-path
(add-to-list 'load-path "~/.emacs.d/.cask/24.5.1/bootstrap/")
(add-to-list 'load-path "~/.emacs.d/.cask/24.5.1/elpa/")
(add-to-list 'load-path "~/.emacs.d/el-get/" )
(add-to-list 'load-path "~/.emacs.d/themes/")
(add-to-list 'load-path "~/.emacs.d/elisp/externals/")
(add-to-list 'load-path "~/.emacs.d/predictive/")
(add-to-list 'load-path "~/.emacs.d/elisp/solarized-emacs/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")

;; The good solarized lives here
(if (load "~/.emacs.d/elisp/solarized-emacs/solarized")
    (load "~/.emacs.d/elisp/solarized-emacs/solarized-theme")
  and (load "~/.emacs.d/elisp/solarized-emacs/solarized-dark-theme"))

;; PATH Setup
(setenv  "PATH" (concat "/usr/local/bin:/opt/local/bin:/usr/bin:/bin:/usr/texbin:/usr/local/texlive/2015/:
~/Library/Haskell/bin:opt/local/share/:/usr/local/Cellar/" (getenv "PATH")))
(exec-path-from-shell-initialize)

;; Trackpad scrolling
(global-set-key [wheel-up] 'previous-line)
(global-set-key [wheel-down] 'next-line)
(global-set-key [wheel-right] 'previous-line)
(global-set-key [double-wheel-right] 'previous-line)
(global-set-key [wheel-left] 'next-line)
(global-set-key [double-wheel-left] 'next-line)

;;; OS X Tweak - CUA-style copy region is super-c (i.e., fn-c)
(if (equal system-type 'darwin)
    (setq NS-function-modifier 'super)) ;Hooray! I think it works.

;; fonts
(defun font-existsp (font)

"Check to see if the named FONT is available."
 (if (null (x-list-fonts font)) nil t))
 ;; Set default font. First one found is selected.
(cond
  ((eq window-system nil) nil)
    ((font-existsp "Source Code Pro")
      (set-face-attribute 'default nil :height 131 :font "Source Code Pro"))
    ((font-existsp "Myriad Pro")
      (set-face-attribute 'default nil :height 121:font "Myriad Pro")))

(provide 'dgn-alist)

;;; dgn-alist ends here
