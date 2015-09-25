;; This is a basic custom set-up to deal with persistence issues.

;; Buffer Menu
(setq Buffer-menu-name-width 29)
(setq Buffer-menu-mode-width 26)

;; Auto-Complete
(setq ac-dictionary-directories
      (quote ("/Users/dustinneuman/.emacs.d/elpa/auto-complete-20150618.1949/dict" "/Users/dustinneuman/dicts")))
(setq ac-modes
      (quote (emacs-lisp-mode lisp-mode lisp-interaction-mode
      slime-repl-mode c-mode cc-mode c++-mode go-mode java-mode
      malabar-mode clojure-mode clojurescript-mode scala-mode
      scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode
      agda-mode agda2-mode perl-mode cperl-mode python-mode
      ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode
      js-mode js2-mode php-mode css-mode scss-mode less-css-mode
      makefile-mode sh-mode fortran-mode f90-mode ada-mode
      xml-mode sgml-mode web-mode ts-mode sclang-mode
      verilog-mode qml-mode LaTeX-mode latex-mode tex-mode
      markdown-mode text-mode org-mode)))
(setq ac-user-dictionary
      (quote ("Users/dustinneuman/dicts/LocalDictionary")))

;; Ace-Window
(setq ace-window-display-mode t)

;; Authorization
(setq auth-source-protocols
   (quote
    ((imap "imap" "imaps" "143" "993")
     (pop3 "pop3" "pop" "pop3s" "110" "995")
     (ssh "ssh" "22")
     (sftp "sftp" "115")
     (smtp "smtp" "25" "587"))))
(setq auto-encryption-mode nil)

;; Cursor
(blink-cursor-mode t)
(setq blink-cursor-blinks 15)
(setq blink-cursor-delay .55)
(setq blink-cursor-interval .6)
(setq cursor-type (quote box))
(set-cursor-color "cyan")

;; Color Theme
(setq color-theme-directory "~/.emacs.d/themes")
(setq color-theme-is-cumulative nil)
(setq color-theme-is-global nil)

;; TODO: Find that color-theme-looper (or alist or whatever) and set it up here!
;; 

;; Company Mode and Completion
(setq company-auto-complete t)
(setq company-auto-complete-chars (quote (32)))
(setq company-backends (quote ((company-files
				company-nixos-options company-elisp company-ghc company-dabbrev)
			       company-files company-nixos-options company-capf company-elisp
			       company-bbdb company-nxml (company-dabbrev-code company-gtags
									       company-etags company-keywords))))
(setq company-lighter-base "co.")
(setq company-show-numbers t)
(setq company-tooltip-minimum 4)
(setq completion-search-distance 0)
(setq dynamic-completion-mode t)
(setq ecomplete-database-file "~/.emacs.d/.ecompleterc")
(setq ecomplete-database-file-coding-system (quote UTF-8))


;; El-Get
(setq el-get-is-lazy t)
(setq el-get-verbose t)


;; Fixmee-Mode
(setq fixmee-mode-lighter "🜂")


;; Global Settings
(global-hl-line-mode -1)
(global-highline-mode -1)
(setq global-anzu-mode t)
(setq global-auto-complete-mode t)
(setq global-ace-isearch-mode nil)


;; Golden Ration
(setq golden-ratio-mode t)



;; Lisp-mode-hook
(setq lisp-mode-hook
   (quote
    (completion-lisp-mode-hook slime-lisp-mode-hook sly-editing-mode)))

;; Mail
(setq message-send-mail-function (quote message-smtpmail-send-it))

;; Mu4e
(setq mu4e-attachment-dir "/Users/dustinneuman/Downloads"
      mu4e-auto-retrieve-keys t
      mu4e-compose-auto-include-date t
      mu4e-drafts-folder "/[Gmail].Drafts"
      mu4e-get-mail-command "offlineimap -u quiet"
      mu4e-headers-include-related t
      mu4e-maildir-shortcuts
      (quote
       (("/INBOX" . 105)
	("/Archive" . 97)
	("/[Gmail].Drafts" . 100)
	("/[Gmail].Important" . 73)
	("/[Mailbox].TODO!" . 116)
	("/[Mailbox].receipts etc (no deadlines)" . 114)))
      mu4e-refile-folder "/Archive"
      mu4e-sent-folder "/[Gmail].Sent Mail"
      mu4e-split-view (quote vertical)
      mu4e-trash-folder "/[Gmail].Trash"
      mu4e-use-fancy-chars t
      mu4e-user-mail-address-list
      (quote ("dustin.neuman@gmail.com" "dneuman@berkeley.edu" "dustin@dustinneuman.com")))


;; Org-etc.
(setq org-trello-current-prefix-keybinding "C-c o")
(setq org-wikinodes-scope (quote directory))

;; OS X Psuedo Daemon
(setq osx-pseudo-daemon-mode t)

;; Paradox
(setq paradox-automatically-star nil)
;; Placeholder for paradox github access token 

;; Pretty Symbols
(setq pretty-symbol-categories (lambda relational logical nil))

;; RefTex
(setq reftex-ref-style-default-list (quote ("Default" "Hyperref")))

;; smtp
(setq smtpmail-queue-dir "~/Maildir/queue/")
(setq smtpmail-smtp-user "dustin.neuman@gmail.com")

;; telephone
(setq telephone-line-mode nil)

;; which key
(setq which-key-mode t)

;; yas-snippet
(setq yas-snippet-revival nil)

