(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-list (quote (("Skim" ("open -a skim.app %s") "skim.app"))))
 '(ac-quick-help-delay 0.5)
 '(ac-show-menu-immediately-on-auto-complete t)
 '(ac-trigger-key "C-c SPACE")
 '(ace-popup-menu-mode nil)
 '(ace-window-display-mode nil)
 '(achievements-mode t)
 '(auto-encryption-mode nil)
 '(auto-insert-directory "/Users/dustinneuman/.emacs.d/insert/")
 '(auto-insert-mode nil)
 '(avy-timeout-seconds 1.0)
 '(back-button-mode nil)
 '(bbyac-global-mode nil)
 '(blink-cursor-blinks 100)
 '(blink-cursor-delay 0.55)
 '(blink-cursor-interval 0.55)
 '(blink-cursor-mode nil)
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/savefile/bookmarks")
 '(browse-url-dwim-mode nil)
 '(clocker-mode nil)
 '(company-backends
   (quote
    (company-files
     (company-auctex-macros company-auctex-symbols company-auctex-environments)
     company-auctex-bibs company-auctex-labels company-math-symbols-latex company-math-symbols-unicode
     (company-ispell company-files company-capf company-dabbrev-code company-dabbrev company-elisp company-abbrev)
     company-dabbrev company-ispell company-files company-dabbrev-code company-abbrev company-keywords company-capf company-dabbrev-code company-gtags company-semantic
     (company-etags company-gtags company-etags company-keywords)
     company-oddmuse company-files company-dabbrev company-dabbrev)))
 '(completion-pcm-complete-word-inserts-delimiters t)
 '(completion-styles
   (quote
    (basic partial-completion emacs22 initials substring)))
 '(custom-enabled-themes (quote (moe-dark moe-light solarized-dark)))
 '(custom-safe-themes
   (quote
    ("eafda598b275a9d68cc1fbe1689925f503cab719ee16be23b10a9f2cc5872069" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "419637b7a8c9cb43f273980f0c9879c0cbadace6b38efac0281e031772c84eb2" "08c91195acc69d868f5ef1ac91f48514674e6e326e9dba999abf980438821639" "beeb5ac6b65fcccfe434071d4624ff0308b5968bf2f0c01b567d212bcaf66054" "133222702a3c75d16ea9c50743f66b987a7209fb8b964f2c0938a816a83379a0" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "fc6ee2cdf073d6f21a9b96dd59d1395c736cab7dc9d53dc9e97a7cf55295775e" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(deft-auto-save-interval 60.0)
 '(deft-use-filter-string-for-filename t)
 '(desktop-save-mode nil)
 '(display-battery-mode nil)
 '(display-time-mode nil)
 '(doc-view-continuous t)
 '(dynamic-completion-mode t)
 '(epa-global-mail-mode t)
 '(evil-snipe-mode nil)
 '(flycheck-error-list-minimum-level (quote warning))
 '(flyspell-sort-corrections t)
 '(follow-auto t)
 '(follow-mode-line-text "Fw")
 '(font-latex-match-biblatexnoarg-keywords (quote ("\"ess\"" "\"printbibliography\"")))
 '(global-ace-isearch-mode t)
 '(global-hl-line-mode nil)
 '(global-whitespace-mode nil)
 '(gnus-agent-expire-days 28)
 '(gnus-icalendar-org-capture-file "~/org/agenda/ical.org")
 '(gnus-ignored-headers
   (quote
    ("^Path:" "^References:" "^Xref:" "^Lines:" "^Relay-Version:" "^Message-ID:" "^Approved:" "^Sender:" "^Received:" "^X-UIDL:" "^MIME-Version:" "^Return-Path:" "^In-Reply-To:" "^Content-Type:" "^Content-Transfer-Encoding:" "^X-WebTV-Signature:" "^X-MimeOLE:" "^X-MSMail-Priority:" "^X-Loop:" "^X-Authentication-Warning:" "^X-MIME-Autoconverted:" "^X-Face:" "^X-Attribution:" "^X-Originating-IP:" "^Delivered-To:" "^NNTP-[-A-Za-z]+:" "^Distribution:" "^X-no-archive:" "^X-Trace:" "^X-Complaints-To:" "^X-NNTP-Posting-Host:" "^X-Orig.*:" "^Abuse-Reports-To:" "^Cache-Post-Path:" "^X-Article-Creation-Date:" "^X-Poster:" "^X-Mail2News-Path:" "^X-Server-Date:" "^X-Cache:" "^Originator:" "^X-Problems-To:" "^X-Auth-User:" "^X-Post-Time:" "^X-Admin:" "^X-UID:" "^Resent-[-A-Za-z]+:" "^X-Mailing-List:" "^Precedence:" "^Original-[-A-Za-z]+:" "^X-filename:" "^X-Orcpt:" "^Old-Received:" "^X-Pgp:" "^X-Auth:" "^X-From-Line:" "^X-Gnus-Article-Number:" "^X-Majordomo:" "^X-Url:" "^X-Sender:" "^MBOX-Line:" "^Priority:" "^X400-[-A-Za-z]+:" "^Status:" "^X-Gnus-Mail-Source:" "^Cancel-Lock:" "^X-FTN:" "^X-EXP32-SerialNo:" "^Encoding:" "^Autoforwarded:" "^Original-Encoded-Information-Types:" "^X-Ya-Pop3:" "^X-Face-Version:" "^X-Vms-To:" "^X-ML-NAME:" "^X-ML-COUNT:" "^Mailing-List:" "^X-finfo:" "^X-md5sum:" "^X-md5sum-Origin:" "^X-Sun-Charset:" "^X-Accept-Language:" "^X-Envelope-Sender:" "^List-[A-Za-z]+:" "^X-Listprocessor-Version:" "^X-Received:" "^X-Distribute:" "^X-Sequence:" "^X-Juno-Line-Breaks:" "^X-Notes-Item:" "^X-MS-TNEF-Correlator:" "^x-uunet-gateway:" "^X-Received:" "^Content-length:" "^X-precedence:" "^X-Authenticated-User:" "^X-Comment:" "^X-Report:" "^X-Abuse-Info:" "^X-HTTP-Proxy:" "^X-Mydeja-Info:" "^X-Copyright:" "^X-No-Markup:" "^X-Abuse-Info:" "^X-From_:" "^X-Accept-Language:" "^Errors-To:" "^X-BeenThere:" "^X-Mailman-Version:" "^List-Help:" "^List-Post:" "^List-Subscribe:" "^List-Id:" "^List-Unsubscribe:" "^List-Archive:" "^X-Content-length:" "^X-Posting-Agent:" "^Original-Received:" "^X-Request-PGP:" "^X-Fingerprint:" "^X-WRIEnvto:" "^X-WRIEnvfrom:" "^X-Virus-Scanned:" "^X-Delivery-Agent:" "^X-Gateway:" "^X-Local-Origin:" "^X-Local-Destination:" "^X-UserInfo1:" "^X-Hashcash:" "^Face:" "^X-DMCA-Notifications:" "^X-Abuse-and-DMCA-Info:" "^X-Postfilter:" "^X-Gpg-.*:" "^X-Disclaimer:" "^Envelope-To:" "^System-Type:" "^X-Injected-Via-Gmane:" "^X-Gmane-NNTP-Posting-Host:" "^Jabber-ID:" "^Archived-At:" "^Envelope-Sender:" "^Envelope-Recipients:")))
 '(gnus-sorted-header-list
   (quote
    ("^Date:" "^From:" "^Subject:" "^Summary:" "^Keywords:" "^Newsgroups:" "^Followup-To:" "^To:" "^Cc:" "^Organization:")))
 '(gnus-treat-body-boundary (quote head))
 '(gnus-treat-display-x-face (inherit (quote font-lock-default)))
 '(gnus-treat-hide-boring-headers (quote head))
 '(golden-ratio-mode t)
 '(helm-bibtex-bibliography
   (quote
    ("/Users/dustinneuman/Dropbox/dgn/Papers/refs.bib" "/Users/dustinneuman/Dropbox/papers/Locke/Locke.bib" "/Users/dustinneuman/BibFiles/philmerged.bib")))
 '(helm-bibtex-library-path (quote ("/Users/dustinneuman/Documents/bibtex-pdf")))
 '(helm-command-prefix-key "C-x b")
 '(helm-completion-in-region-fuzzy-match t)
 '(helm-default-external-file-browser "pathfinder.app")
 '(helm-ff-auto-update-initial-value t)
 '(helm-lisp-fuzzy-completion t)
 '(helm-mode-fuzzy-match t)
 '(helm-swoop-speed-or-color t)
 '(helm-swoop-split-direction (quote split-window-horizontally))
 '(hl-paren-colors
   (quote
    ("#B9F" "#B8D" "#B7B" "#B69" "#B57" "#B45" "#B33" "#B11")))
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
 '(icicle-Completions-display-min-input-chars 2)
 '(ispell-highlight-p nil)
 '(ispell-local-dictionary-alist nil)
 '(ispell-program-name "/usr/local/bin/aspell")
 '(ispell-silently-savep t)
 '(linum-delay t)
 '(list-colors-sort (quote name))
 '(menu-bar-mode t)
 '(minibuffer-eldef-shorten-default t)
 '(minibuffer-electric-default-mode t)
 '(mode-icons-mode t)
 '(on-screen-highlight-method (quote fringe))
 '(org-ac/ac-trigger-command-keys (quote ("\\" "*" "SPC" ":" "[" "+" "#")))
 '(org-archive-location
   "/Users/dustinneuman/org/archive/archive.org::\"* From %s\"")
 '(org-bullets-bullet-list (quote (" " "" "◉" "○" "" "" "✿" "✸" "")))
 '(org-capture-templates
   (quote
    (("t" "Todo" entry
      (file "~/org/agenda/gtd.org")
      "* TODO %?
%U
")
     ("n" "Notes" entry
      (file+headline "~/org/notes/notes.org" "Notes")
      "* %? :NOTE:
%U
")
     ("j" "Journal" entry
      (file+datetree "~/org/agenda/journal.org")
      "* %?
%U
")
     ("b" "Book/Article" entry
      (file+headline "~/org/notes/bibliography.org" "Refile")
      "* %?%^{TITLE}p%^{AUTHOR}p%^{TYPE}p"))) t)
 '(org-capture-templates-contexts
   (quote
    (("c" "`((\"c\" ((in-mode . \"org-mode\" \"latex-mode\"))))"
      ((in-file . "[aZ].org")
       (in-file . "[aZ].tex"))))))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-crypt org-ctags org-docview org-gnus org-habit org-id org-info org-inlinetask org-irc org-mhe org-mouse org-protocol org-rmail org-w3m org-bookmark org-bullets org-checklist org-collector org-eval-light org-eval org-mac-iCal org-mac-link org-mairix org-mew org-notmuch org-registry org-wikinodes org-wl)))
 '(org-ref-pdf-directory "~/Documents/bibtex-pdf/")
 '(org-speed-commands-user
   (quote
    (("p" . org-previous-visible-heading)
     ("n" . org-next-visible-heading))))
 '(org-tag-alist
   (quote
    (("work" . 119)
     ("Berkeley" . 98)
     ("grading" . 103)
     ("notes" . 110)
     ("writing" . 114)
     ("tasks" . 116)
     ("dev" . 100)
     ("export" . 101)
     ("noexport" . 110))))
 '(org-wikinodes-scope (quote directory))
 '(package-selected-packages (quote (s)) t)
 '(paradox-automatically-star nil)
 '(paradox-display-buffer-name t)
 '(paradox-display-download-count t)
 '(paradox-github-token "1813b4089765349f6bcf9e325f7ee64321cde037")
 '(paradox-lines-per-entry 2)
 '(paradox-spinner-type (quote progress-bar))
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
 '(projectile-completion-system (quote helm))
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
 '(safe-local-variable-values
   (quote
    ((eval when
           (and
            (buffer-file-name)
            (file-regular-p
             (buffer-file-name))
            (string-match-p "^[^.]"
                            (buffer-file-name)))
           (emacs-lisp-mode)
           (when
               (fboundp
                (quote flycheck-mode))
             (flycheck-mode -1))
           (unless
               (featurep
                (quote package-build))
             (let
                 ((load-path
                   (cons ".." load-path)))
               (require
                (quote package-build))))
           (package-build-minor-mode)
           (set
            (make-local-variable
             (quote package-build-working-dir))
            (expand-file-name "../working/"))
           (set
            (make-local-variable
             (quote package-build-archive-dir))
            (expand-file-name "../packages/"))
           (set
            (make-local-variable
             (quote package-build-recipes-dir))
            default-directory)))))
 '(scroll-bar-mode nil)
 '(speedbar-indentation-width 2)
 '(synonyms-append-result-flag t)
 '(synonyms-cache-file
   "/Users/dustinneuman/Dropbox/papers/synonyms/cache/syn_cache")
 '(synonyms-file
   "/Users/dustinneuman/Dropbox/papers/synonyms/spell/mthesaur.txt")
 '(synonyms-match-more-flag t)
 '(synosaurus-choose-method (quote popup))
 '(tex-bibtex-command "biber")
 '(transient-mark-mode t)
 '(undo-tree-mode-lighter (quote (quote (undo))))
 '(unicode-fonts-fallback-font-list (quote ("Font Awesome" "Symbola" "Quivira")))
 '(unicode-fonts-skip-font-groups nil)
 '(which-key-echo-keystrokes 1)
 '(which-key-idle-delay 0.7)
 '(which-key-mode nil)
 '(which-key-popup-type (quote side-window))
 '(which-key-side-window-location (quote (bottom right)))
 '(which-key-side-window-max-height 0.33)
 '(windmove-wrap-around t)
 '(writeroom-mode-line t)
 '(writeroom-restore-window-config t)
 '(writeroom-width 90))

;;

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(airline-emacs-outer ((t (:background "CadetBlue1" :foreground "black" :weight normal :height 1.1 :family "Roboto Condensed"))))
 '(airline-normal-center ((t (:background "#767676" :foreground "cyan3" :weight semi-bold :family "Roboto"))))
 '(airline-visual-center ((t (:background "blue violet" :foreground "#000000" :weight normal))))
 '(clocker-mode-line-clock-in-face ((t (:inherit mode-line :background "dark green" :foreground "white"))))
 '(completion-highlight-face ((t (:background "MediumOrchid1" :foreground "black"))))
 '(fixmee-notice-face ((t (:inherit font-lock-warning-face :box (:line-width 2 :color "gray" :style released-button)))))
 '(git-gutter:unchanged ((t (:background "dodgerblue"))))
 '(hl-line ((t (:background "aquamarine3" :foreground "black"))))
 '(hl-sentence-face ((t (:weight semi-bold)))))
