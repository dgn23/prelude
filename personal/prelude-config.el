;; DGN-PRELUDE-CONFIG:
;;; MINOR CONFIG SETTINGS LOADED AFTER PRELUDE CORE

;;; Pallet Config -- not so sure about this. I think I'm going to try and use use-package instead
(require 'cask " /Users/dustinneuman/.emacs.d/elpa/cask-20150528.752/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; run emacs in server mode
(server-start)

;;; Tell Emacs about elget packages
(add-to-list 'load-path "~/.emacs.d/el-get/" )
(add-to-list 'load-path "~/.emacs.d/themes/emacs-color-theme-solarized/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/elisp/DGN-Solarized-theme.el")
(add-to-list 'load-path "~/.emacs.d/elisp/sandbox/")
(load "~/.emacs.d/elisp/DGN-Solarized-theme.el" t)

;; PATH Setup
(setenv  "PATH" (concat "/usr/local/bin:/opt/local/bin:/usr/bin:/bin:/usr/texbin:
~/Library/Haskell/bin:" (getenv "PATH")))

;;; Make it so eshell has the right path (more or less)
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)





;; Requirements
(require 'cl)
(require 'cl-lib)
(require 'uniquify)
(require 'flyspell)
(require 'helm)
(require 'company)
(require 'auto-complete-auctex)
(require 'org-notify)


;; setting up deft to work with nvalt as per http://rwx.io/blog/2013/03/04/nvalt-and-emacs/
(require 'deft)
(setq deft-extension "md")
(setq deft-directory "~/Dropbox/.deft")
(setq deft-text-mode 'markdown-mode)
(setq deft-use-filename-as-title t)


;;; Gets rid of that annoying magit 1.4.0 message re: buffer reversion.
(setq magit-last-seen-setup-instructions "1.4.0")

;; FLYSPELL SETTINGS

  (require 'flyspell)
  (setq ispell-program-name "aspell"
        ispell-dictionary "en_US"
        ispell-dictionary-alist
        (let ((default '("[A-Za-z]" "[^A-Za-z]" "[']" nil
                         ("-B" "-d" "english")
                         nil iso-8859-1)))
          `((nil ,@default)
            ("english" ,@default))))
        (setq ispell-extra-args '("--sug-mode=ultra"))
  ;;(setq ispell-personal-dictionary "~/.aspell.en.pws")
  (setq flyspell-issue-message-flag nil)

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
 (cond ((eq window-system nil) nil)
 ((font-existsp "Myriad Pro")
	 (set-face-attribute 'default nil :height 131 :font "Myriad Pro"))
((font-existsp "Source Code Pro")
 (set-face-attribute 'default nil :height 121:font "Source Code Pro"))
((font-existsp "Menlo")
	(set-face-attribute 'default nil :height 121 :font "Menlo"))
((font-existsp "Consolas") (set-face-attribute 'default nil :height 121 :font "Consolas"))
((font-existsp "Inconsolata")
	(set-face-attribute 'default nil :height 121 :font "Inconsolata"))
((font-existsp "Envy Code R")
 (set-face-attribute 'default nil :height 121 :font "Envy Code R")))

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
(icicle-mode t)
(pretty-mode t)
(prettify-symbols-mode t)
(pretty-lambda-mode t)
(global-prettify-symbols-mode t)
(set-cursor-color "blue")
(nyan-mode t)
(rainbow-mode t)
(fancy-battery-mode t)
(fancy-narrow-mode t)
(golden-ratio-mode t)
(exec-path-from-shell-initialize)


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

(require 'latex-pretty-symbols)
(require 'reftex)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'pandoc-mode-hook 'turn-on-reftex)  ; with Pandoc mode
(autoload 'reftex-mode     "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex  "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode
(add-hook 'LaTeX-mode-hook 'company-auctex-init)

;; Make RefTeX faster
(setq reftex-enable-partial-scans t)
(setq reftex-save-parse-info t)
(setq reftex-use-multiple-selection-buffers t)
(setq reftex-plug-into-AUCTeX t)

'(reftex-cite-format
  (quote
   ((13 . "\\cite[]{%l}")
    (99 . "\\textcite{%l}")
    (97 . "\\autocite[]{%l}")
    (79 . "\\parencite{%l}")
    (102 . "\\footcite[][]{%l}")
    (70 . "\\fullcite[]{%l}")
    (80 . "[@%l]")
    (84 . "@%l [p. ]")
    (120 . "[]{%l}")
    (88 . "{%l}")
    (112 . "\\citep{%l}")
    (116 . "\\citet{%l}")
    (121 . "\\citeyearpar{%l}"))))

(eval-after-load "tex"
  '(add-to-list 'TeX-command-list '("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")))

(eval-after-load "tex"
  '(add-to-list 'TeX-command-list '("latexmk" "latexmk -synctex=1 -shell-escape -pdf %s" TeX-run-TeX nil t :help "Process file with latexmk")))

  ;;(eval-after-load "tex"
   ;; '(add-to-list 'Tex-command-list '("xelatex" "xelatex -synctex=1 -shell-escape -pdf %s" Tex-run-Tex nil t :help "Process file with xelatex")))

;; Guide-key and Guide-Key-Tip
(add-to-list 'load-path "~/.emacs.d/el-get/guide-key")
(add-to-list 'load-path "~/.emacs.d/el-get/guide-key-tip")
(require 'guide-key)
(require 'guide-key-tip)
(setq guide-key/guide-key-sequence t)
(setq guide-key/idle-delay 0.7)
(setq guide-key-tip/enabled t)
(guide-key-mode 1)




;;; Provides 'Prelude-Config.el'
