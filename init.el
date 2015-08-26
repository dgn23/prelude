;;; Emacs Starter-Kit for the Humanities:;;;
;;; :::::::::::::::::::::::::::::::::::::;;;
;;; "Where all the magic begins"....
;;; See ESKH.org for Documentation
;;; ESKH is based on (shameless stolen from) 
;;; + Kieren Healy's Emacs Social-Science Starter Kit [http://github.com/kjh/]
;;; + The ESSK itself is based on [technomancy] and [Phil H.] [FIXME]
;;; + Boris Batsov's Prelude [http://github.com/bbatsov/prelude]
;;; Special mention also to John Wiegley [http://github.com/jwiegley] who created many 
;;; of the libraries and packages essential to this kit. 

(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(defvar emacs-dir (file-name-directory load-file-name)
  "Set emacs root directory.")                  
(defvar lib-dir (expand-file-name "library" emacs-dir)   		       ;; emacs-dir/lib
  "The core library for local emacs functionality")
(defvar modules-dir (expand-file-name  "modules" emacs-dir)        ;; emacs-dir/modules
  "Modules are interactive and need not be loaded every time at start up.")
(defvar personal-dir (expand-file-name "personal" emacs-dir)       ;; emacs-dir/personal
  "This directory is for additional personal configuration\n 
  and keeping certain packages separate from cask.\n 
  All folders and subfolders will be loaded.")
(defvar el-get-dir (expand-file-name "el-get" emacs-dir)
	"Folder containing el-get packages and recipes.")
(defvar savefile-dir (expand-file-name "savefile" emacs-dir) ;;emacs-dir/savefile
  "This folder stores all the automatically generated save/history-files.")


;; Create the library, modules, personal, and savefile directories
;; if they don't already exist

;(unless (file-exists-p savefile-dir)
;  (make-directory emacs-savefile-dir))
;(unless (file-exists-p lib-dir)
;	(make-directory lib-dir))
;(unless (file-exists-p modules-dir)
;	(make-directory modules-dir))
;(unless (file-exists-p personal-dir)
;	(make-directory personal-dir))

(defun add-subfolders-to-load-path (parent-dir)
 "Add all level PARENT-DIR subdirs to the `load-path'."
 (dolist (f (directory-files parent-dir))
   (let ((name (expand-file-name f parent-dir)))
     (when (and (file-directory-p name)
                (not (string-prefix-p "." f)))
       (add-to-list 'load-path name)
       (add-subfolders-to-load-path name)))))

;; add emacs directories to Emacs's `load-path'
(add-to-list 'load-path lib-dir) ;; to add a file to load-path, add its containing directory.
(add-to-list 'load-path modules-dir)
(add-to-list 'load-path personal-dir)
(add-subfolders-to-load-path personal-dir)
(add-subfolders-to-load-path lib-dir)
(add-subfolders-to-load-path modules-dir)

;; Tell emacs about the proper load-path
(add-to-list 'load-path "~/.emacs.d/.cask/")
(add-to-list 'load-path "~/.emacs.d/.cask/24.5.1/bootstrap")
(add-to-list 'load-path "~/.emacs.d/.cask/24.5.1/elpa")
(add-to-list 'load-path "~/.emacs.d/predictive")

;; config changes made through the customize UI will be stored here
(setq custom-file (expand-file-name "custom.el" personal-dir))

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)
(fset 'yes-or-no-p 'y-or-n-p)
(setq load-prefer-newer t)
(setq debug-on-error nil)

;; setting paths for OS X (homebrew)
(when (eq system-type 'darwin)
  (setenv "PATH"
          (concat
           "/usr/local/bin" ":"
           "/usr/local/sbin" ":"
           "~/.rvm/bin" ":"
           "/usr/texbin/" ":"
           "/usr/local/texlive/2011/bin/x86_64-darwin" ":"
           (getenv "PATH")))
  (setq exec-path
        '("/usr/local/bin"
          "/usr/local/sbin"
          "~/.rvm/bin"
          "/usr/texbin/"
          "/usr/local/texlive/2015/bin/x86_64-darwin"
          "/usr/bin"
          "/bin"
          "/usr/sbin"
          "/sbin"
          "/usr/X11/bin"
          "/usr/local/Library/Contributions/examples")))

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

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



;; Package Mode Setup

(package-initialize)
(require 'use-package)
(require 'bind-key)
(require 'diminish)
(require 'cl-lib)
(require 'uniquify)
(require 'exec-path-from-shell)

;; Cask/Pallet

(require 'cl)
(require 'cask "/usr/local/Cellar/cask/0.7.2_1/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)


;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(unless (package-installed-p 'pallet)
  (package-refresh-contents)
  (package-install 'pallet))

(load-file "~/.emacs.d/library/default-settings-lib.el")
(load-file "~/.emacs.d/library/package-library.el")
(load-file "~/.emacs.d/modules/dgn-c-org.el")
(load-file "~/.emacs.d/modules/dgn-g-gnus.el")
(load-file "~/.emacs.d/personal/custom.el")

(message "emacs is up and running!")
