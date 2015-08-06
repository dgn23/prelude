(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-mode-hook
   (quote
    (LaTeX-math-mode preview-mode-setup flyspell-mode smart-tab-mode company-auctex-init turn-on-reftex latex-unicode-simplified
                     (lambda nil
                       (run-hooks
                        (quote prelude-latex-mode-hook)))
                     er/add-latex-mode-expansions latex-extra-mode turn-on-pretty-mode pretty-lambda-mode prettify-symbols-mode)))
 '(ac-modes
   (quote
    (latex-mode emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode c-mode cc-mode c++-mode go-mode java-mode malabar-mode clojure-mode clojurescript-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode scss-mode less-css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode web-mode ts-mode sclang-mode verilog-mode qml-mode org-mode deft-mode markdown-mode gnus message-mode rmail-mode)))
 '(ace-popup-menu-mode t)
 '(ace-window-display-mode nil)
 '(airline-utf-glyph-branch 57504)
 '(airline-utf-glyph-linenumber 57505)
 '(airline-utf-glyph-readonly 57506)
 '(airline-utf-glyph-separator-left 57520)
 '(airline-utf-glyph-separator-right 57522)
 '(airline-utf-glyph-subseparator-left 57521)
 '(airline-utf-glyph-subseparator-right 57523)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(auth-source-cache-expiry nil)
 '(auth-source-protocols
   (quote
    ((imap "imap" "imaps" "143" "993")
     (pop3 "pop3" "pop" "pop3s" "110" "995")
     (ssh "ssh" "22")
     (sftp "sftp" "115")
     (smtp "smtp" "25" "587"))))
 '(auto-completion-at-point-functions
   (quote
    (auto-complete helm-completing-read-with-cands-in-buffer helm-complete-file-name-at-point company-complete hippie-expand)))
 '(auto-completion-backward-delete-delay 0.2)
 '(auto-completion-delay (quote ((t . 0.3))))
 '(auto-insert-mode nil)
 '(avy-all-windows (quote all-frames))
 '(back-button-mode nil)
 '(battery-mode-line-format " [Batt. Perc: %p Time: %t ] ")
 '(bbyac-global-mode t)
 '(bind-key-describe-special-forms t)
 '(bmkp-last-as-first-bookmark-file "/Users/dustinneuman/.emacs.d/savefile/bookmarks")
 '(browse-url-dwim-mode nil)
 '(clocker-extra-annoying nil)
 '(clocker-mode nil)
 '(clocker-project-issue-folder "/Users/dustinneuman/org/clock")
 '(company-math-disallow-unicode-symbols-in-faces nil)
 '(completion-accept-or-reject-by-default (quote ((t . accept-common))))
 '(completion-ui-use-echo (quote ((t))))
 '(completion-ui-use-tooltip
   (quote
    ((t)
     (predictive)
     (predictive-latex)
     (predictive-latex-label . t)
     (predictive-latex-docclass . t)
     (predictive-latex-bibstyle . t))))
 '(custom-safe-themes
   (quote
    ("fc6ee2cdf073d6f21a9b96dd59d1395c736cab7dc9d53dc9e97a7cf55295775e" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(debug-on-error nil)
 '(deft-auto-save-interval 60.0)
 '(deft-use-filter-string-for-filename t)
 '(desktop-save-mode t)
 '(display-battery-mode t)
 '(display-time-day-and-date t)
 '(display-time-format " %a %R ")
 '(display-time-mail-face (quote default))
 '(display-time-mode t)
 '(display-time-use-mail-icon t)
 '(dynamic-completion-mode t)
 '(el-get-brew "/usr/local/bin/brew")
 '(el-get-go "/usr/local/bin/go")
 '(el-get-user-package-directory "~/.emacs.d/bin")
 '(el-get-verbose t)
 '(epa-global-mail-mode t)
 '(evil-cross-lines t)
 '(evil-default-cursor (set-cursor-color (quote blue)))
 '(evil-escape-mode t)
 '(evil-magic (quote very-magic))
 '(evil-snipe-auto-scroll t)
 '(evil-snipe-mode t)
 '(facemenu-listed-faces t)
 '(fancy-narrow-lighter "++")
 '(fancy-narrow-mode t)
 '(fixmee-mode-lighter nil)
 '(flyspell-highlight-flag t)
 '(follow-auto t)
 '(follow-mode-line-text "Fw")
 '(font-latex-user-keyword-classes
   (quote
    (("philex"
      (("lb" "[{{")
       ("lbu" "[{{{{")
       ("lbp" "[{{{")
       ("bpaformat" "{{{")
       ("lbpa" "[{{")
       ("lbpb" "[{{")
       ("lbpc" "[{{")
       ("lbpd" "[{{")
       ("rf" "[{")
       ("rn" "[{")
       ("rfx" "[{")
       ("rfn" "[{"))
      (:weight bold)
      noarg)
     ("dgn-macros"
      ("ess")
      (:family "Roboto" :weight bold)
      command))))
 '(git-gutter:hide-gutter t)
 '(git-gutter:modified-sign ">")
 '(git-gutter:window-width 2)
 '(global-ace-isearch-mode t)
 '(global-fasd-mode t)
 '(global-flex-isearch-mode t)
 '(global-git-gutter+-mode t)
 '(global-git-gutter-mode t)
 '(global-hi-lock-mode t)
 '(global-hl-todo-mode t)
 '(global-orglink-mode t)
 '(global-relative-line-numbers-mode nil)
 '(global-smart-tab-mode t)
 '(gnus-agent-expire-days 28)
 '(gnus-desktop-notify-mode nil nil (gnus))
 '(gnus-icalendar-org-capture-file "~/org/agenda/ical.org-mode")
 '(gnus-ignored-headers
   (quote
    ("^Path:" "^References:" "^Xref:" "^Lines:" "^Relay-Version:" "^Message-ID:" "^Approved:" "^Sender:" "^Received:" "^X-UIDL:" "^MIME-Version:" "^Return-Path:" "^In-Reply-To:" "^Content-Type:" "^Content-Transfer-Encoding:" "^X-WebTV-Signature:" "^X-MimeOLE:" "^X-MSMail-Priority:" "^X-Loop:" "^X-Authentication-Warning:" "^X-MIME-Autoconverted:" "^X-Face:" "^X-Attribution:" "^X-Originating-IP:" "^Delivered-To:" "^NNTP-[-A-Za-z]+:" "^Distribution:" "^X-no-archive:" "^X-Trace:" "^X-Complaints-To:" "^X-NNTP-Posting-Host:" "^X-Orig.*:" "^Abuse-Reports-To:" "^Cache-Post-Path:" "^X-Article-Creation-Date:" "^X-Poster:" "^X-Mail2News-Path:" "^X-Server-Date:" "^X-Cache:" "^Originator:" "^X-Problems-To:" "^X-Auth-User:" "^X-Post-Time:" "^X-Admin:" "^X-UID:" "^Resent-[-A-Za-z]+:" "^X-Mailing-List:" "^Precedence:" "^Original-[-A-Za-z]+:" "^X-filename:" "^X-Orcpt:" "^Old-Received:" "^X-Pgp:" "^X-Auth:" "^X-From-Line:" "^X-Gnus-Article-Number:" "^X-Majordomo:" "^X-Url:" "^X-Sender:" "^MBOX-Line:" "^Priority:" "^X400-[-A-Za-z]+:" "^Status:" "^X-Gnus-Mail-Source:" "^Cancel-Lock:" "^X-FTN:" "^X-EXP32-SerialNo:" "^Encoding:" "^Autoforwarded:" "^Original-Encoded-Information-Types:" "^X-Ya-Pop3:" "^X-Face-Version:" "^X-Vms-To:" "^X-ML-NAME:" "^X-ML-COUNT:" "^Mailing-List:" "^X-finfo:" "^X-md5sum:" "^X-md5sum-Origin:" "^X-Sun-Charset:" "^X-Accept-Language:" "^X-Envelope-Sender:" "^List-[A-Za-z]+:" "^X-Listprocessor-Version:" "^X-Received:" "^X-Distribute:" "^X-Sequence:" "^X-Juno-Line-Breaks:" "^X-Notes-Item:" "^X-MS-TNEF-Correlator:" "^x-uunet-gateway:" "^X-Received:" "^Content-length:" "^X-precedence:" "^X-Authenticated-User:" "^X-Comment:" "^X-Report:" "^X-Abuse-Info:" "^X-HTTP-Proxy:" "^X-Mydeja-Info:" "^X-Copyright:" "^X-No-Markup:" "^X-Abuse-Info:" "^X-From_:" "^X-Accept-Language:" "^Errors-To:" "^X-BeenThere:" "^X-Mailman-Version:" "^List-Help:" "^List-Post:" "^List-Subscribe:" "^List-Id:" "^List-Unsubscribe:" "^List-Archive:" "^X-Content-length:" "^X-Posting-Agent:" "^Original-Received:" "^X-Request-PGP:" "^X-Fingerprint:" "^X-WRIEnvto:" "^X-WRIEnvfrom:" "^X-Virus-Scanned:" "^X-Delivery-Agent:" "^X-Gateway:" "^X-Local-Origin:" "^X-Local-Destination:" "^X-UserInfo1:" "^X-Hashcash:" "^Face:" "^X-DMCA-Notifications:" "^X-Abuse-and-DMCA-Info:" "^X-Postfilter:" "^X-Gpg-.*:" "^X-Disclaimer:" "^Envelope-To:" "^System-Type:" "^X-Injected-Via-Gmane:" "^X-Gmane-NNTP-Posting-Host:" "^Jabber-ID:" "^Archived-At:" "^Envelope-Sender:" "^Envelope-Recipients:")))
 '(gnus-sorted-header-list
   (quote
    ("^Date:" "^From:" "^Subject:" "^Summary:" "^Keywords:" "^Newsgroups:" "^Followup-To:" "^To:" "^Cc:" "^Organization:")))
 '(golden-ratio-mode t)
 '(helm-adaptive-mode t nil (helm-adaptive))
 '(helm-bibtex-bibliography
   (quote
    ("/Users/dustinneuman/Dropbox/dgn/Papers/refs.bib" "/Users/dustinneuman/Dropbox/papers/Locke/Locke.bib" "/Users/dustinneuman/BibFiles/philmerged.bib")))
 '(helm-bibtex-library-path (quote ("/Users/dustinneuman/Documents/bibtex-pdf")))
 '(helm-command-prefix-key "C-x b")
 '(helm-completion-in-region-fuzzy-match t)
 '(helm-default-external-file-browser "pathfinder.app")
 '(helm-lisp-fuzzy-completion t)
 '(helm-mode-fuzzy-match t)
 '(helm-swoop-speed-or-color t)
 '(helm-swoop-split-direction (quote split-window-horizontally))
 '(hl-todo-keyword-faces
   (quote
    (("HOLD" . "#d0bf8f")
     ("TODO" . "#cc9393")
     ("NEXT" . "#dca3a3")
     ("THEM" . "#dc8cc3")
     ("PROG" . "#7cb8bb")
     ("OKAY" . "#7cb8bb")
     ("DONT" . "#5f7f5f")
     ("FAIL" . "#8c5353")
     ("DONE" . "#afd8af")
     ("NOTE" . "#d0bf8f")
     ("KLUDGE" . "#d0bf8f")
     ("FIXME" . "#cc9393")
     ("XXX" . "#cc9393")
     ("XXXX" . "#cc9393")
     ("???" . "#cc9393")
     ("NTS" . "#ff1419")
     ("CITE" . "#2aa198"))))
 '(hlt-auto-faces-flag nil)
 '(ispell-highlight-p t)
 '(ispell-silently-savep t)
 '(ivy-mode t)
 '(list-colors-sort (quote name))
 '(mode-icons-mode t)
 '(on-screen-global-mode nil)
 '(on-screen-highlight-method (quote fringe))
 '(org-archive-location
   "/Users/dustinneuman/org/archive/archive.org::\"* From %s\"")
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-crypt org-ctags org-docview org-gnus org-habit org-id org-info org-inlinetask org-irc org-mhe org-mouse org-protocol org-rmail org-w3m org-bookmark org-bullets org-checklist org-collector org-eval-light org-eval org-mac-iCal org-mac-link org-mairix org-mew org-notmuch org-registry org-wikinodes org-wl)))
 '(osx-pseudo-daemon-mode t)
 '(package-selected-packages (quote (s)) t)
 '(paradox-automatically-star nil)
 '(paradox-github-token "05f357727e2b27c83410fcc63fc9b1a9a4afc651" t)
 '(pdf-virtual-global-minor-mode t)
 '(predictive-add-to-dict-ask nil)
 '(predictive-auto-add-to-dict t)
 '(predictive-auto-complete t)
 '(predictive-completion-speed 0.25)
 '(predictive-fuzzy-completion nil)
 '(predictive-latex-docclass-alist (quote (("article" . latex-dict))))
 '(predictive-latex-electric-environments t)
 '(predictive-mode t)
 '(predictive-which-dict-mode nil)
 '(pretty-symbol-categories (lambda relational logical nil))
 '(preview-auto-cache-preamble t)
 '(projectile-mode-line
   (quote
    (:eval
     (format " Proj: [%s]"
             (projectile-project-name)))))
 '(reftex-cite-format
   (quote
    ((99 . "\\cite{%l}")
     (116 . "\\textcite{%l}")
     (112 . "\\parencite{%l}")
     (97 . "\\citeauthor{%l}")
     (121 . "\\citeyear{%l}")
     (84 . "\\citetitle{%l}")
     (67 . "\\citet{%l}")
     (80 . "\\citep{%l}")
     (89 . "\\citeyearpar{%l}"))))
 '(reftex-extra-bindings t)
 '(reftex-highlight-selection (quote both))
 '(scroll-bar-mode nil)
 '(synonyms-append-result-flag t)
 '(synonyms-cache-file
   "/Users/dustinneuman/Dropbox/papers/synonyms/cache/syn_cache")
 '(synonyms-file
   "/Users/dustinneuman/Dropbox/papers/synonyms/spell/mthesaur.txt")
 '(synonyms-match-more-flag t)
 '(synosaurus-choose-method (quote popup))
 '(tex-bibtex-command "biber")
 '(timeclock-mode-line-display nil)
 '(undo-tree-mode-lighter (quote (quote (undo))))
 '(unicode-fonts-fallback-font-list (quote ("Font Awesome" "Symbola" "Quivira")))
 '(unicode-fonts-skip-font-groups nil)
 '(which-key-echo-keystrokes 1)
 '(which-key-idle-delay 0.7)
 '(which-key-mode t)
 '(which-key-popup-type (quote side-window))
 '(which-key-side-window-location (quote (bottom right)))
 '(which-key-side-window-max-height 0.33)
 '(writeroom-mode-line t)
 '(writeroom-restore-window-config t)
 '(writeroom-width 90))

;;

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(airline-emacs-outer ((t (:background "#242321" :foreground "dark red" :weight semi-bold :height 1.1 :family "Myriad Pro"))))
 '(airline-normal-center ((t (:background "#767676" :foreground "cyan3" :weight semi-bold :family "Roboto"))))
 '(airline-visual-center ((t (:background "blue violet" :foreground "#000000" :weight normal))))
 '(clocker-mode-line-clock-in-face ((t (:inherit mode-line :background "dark green" :foreground "white"))))
 '(completion-highlight-face ((t (:background "MediumOrchid1" :foreground "black"))))
 '(fixmee-notice-face ((t (:inherit font-lock-warning-face :box (:line-width 2 :color "gray" :style released-button)))))
 '(git-gutter:unchanged ((t (:background "dodgerblue")))))
