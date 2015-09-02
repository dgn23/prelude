(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-dictionary-directories
   (quote
    ("/Users/dustinneuman/.emacs.d/elpa/auto-complete-20150618.1949/dict" "/Users/dustinneuman/dicts")))
 '(ac-user-dictionary (quote (quote (Users/dustinneuman/dicts/LocalDictionary))))
 '(auth-source-protocols
   (quote
    ((imap "imap" "imaps" "143" "993")
     (pop3 "pop3" "pop" "pop3s" "110" "995")
     (ssh "ssh" "22")
     (sftp "sftp" "115")
     (smtp "smtp" "25" "587"))))
 '(blink-cursor-blinks 20)
 '(color-theme-directory (quote ("~/.emacs.d/themes")))
 '(color-theme-is-cumulative nil)
 '(color-theme-is-global nil)
 '(completion-search-distance 0)
 '(cursor-type (quote box))
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "67c6ff5060132fa023d8e78a679d4c6573cf1b90c8aef4d1972634956c314da3" "6a02648ab4cfad12861ab54479aad35a68121cf0b91fa3e0cdd24d064d14cb7c" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "264e56a171afde5740ba73e8a5803eaed903f4614ee127d53d9d6b72d6bf7249" "9e1e2e7590c2f443c09a3f6240a05ada53f06566a6873c37eeae10d13dc372c9" "3b24f986084001ae46aa29ca791d2bc7f005c5c939646d2b800143526ab4d323" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "a6289444757a2ccc56e3cbfefd9c93d9570788847e1f04c16de81483790a1edf" "804dd83b709ca22fa6286bee885b8175b7e11e6d941c729ab299aefaf5e20041" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(dynamic-completion-mode t)
 '(el-get-is-lazy t)
 '(el-get-verbose t)
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #358d8d\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(fixmee-mode-lighter "'🜂 ")
 '(gnus-logo-colors (quote ("#0d7b72" "#adadad")) t)
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #358d8d\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")) t)
 '(lisp-mode-hook
   (quote
    (completion-lisp-mode-hook slime-lisp-mode-hook sly-editing-mode)))
 '(mode-icons-mode t)
 '(org-trello-current-prefix-keybinding "C-c o")
 '(osx-pseudo-daemon-mode nil)
 '(package-selected-packages
   (quote
    (ac-slime ace-link sx keyword-search auctex which-key bibtex-utils bundler evil evil-anzu evil-args evil-avy evil-commentary evil-easymotion evil-escape evil-jumper evil-leader evil-lisp-state evil-matchit evil-nerd-commenter evil-org evil-quickscope evil-search-highlight-persist evil-snipe evil-terminal-cursor-changer expand-region git-commit git-gutter git-gutter+ helm helm-cmd-t helm-core helm-fuzzy-find helm-ghc helm-ghq helm-mt icicles icomplete+ isearch+ langtool lexbind-mode lfe-mode lisp-extra-font-lock lispy list-environment lusty-explorer macrostep mag-menu magic-latex-buffer magit magit-annex magit-filenotify magit-find-file magit-gitflow magit-popup maildir markdown-mode markdown-mode+ markdown-toc markup-faces mew mhc quelpa quelpa-use-package quick-preview quickref ranger rbenv readability robe scratch-pop searchq shell-pop slime ucs-utils unicode-fonts websocket ac-haskell-process company-ghci flycheck-haskell flycheck-hdevtools ghc ghc-imported-from ghci-completion hindent hyai hyde hydra memento org-agenda-property org-autolist org-blog org-caldav org-cliplink org-context org-dashboard org-doing org-journal org-mac-link org-page org-pandoc org-pdfview org-plus-contrib org-pomodoro org-projectile org-trello org-wc org-webpage org-wunderlist org2jekyll orgbox sentence-navigation seoul256-theme sequence telephone-line theme-changer theme-looper yas-jit yasnippet-bundle yatemplate zenburn company-ghc ebal haskell-emacs haskell-emacs-base haskell-emacs-text haskell-snippets hayoo helm-hoogle hi2 shm aurora-theme base16-theme boron-theme cycle-themes deep-thought-theme fish-mode flatland-black-theme flatland-theme flatui-theme helm-dash helm-mu helm-themes helm-wordnet hipster-theme lavender-theme lenlen-theme leuven-theme load-theme-buffer-local material-theme per-buffer-theme wanderlust with-editor zenburn-theme alect-themes sequences bog bookmark+ browse-kill-ring calfw cdlatex cl-format cl-generic cl-lib color-identifiers-mode color-theme-buffer-local color-theme-cobalt color-theme-emacs-revert-theme color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow color-theme-solarized color-theme-tangotango color-theme-twilight color-theme-vim-insert-mode color-theme-wombat color-theme-x color-theme-zenburn command-t company-auctex company-math company-nixos-options company-statistics concurrent corral counsel dakrone-theme darcula-theme darktooth-theme dash dash-at-point dash-functional evil-surround sly smart-mode-line smart-mode-line-powerline-theme smex spacegray-theme annotate anzu artbollocks-mode auctex-latexmk auctex-lua auto-complete-auctex auto-package-update autumn-light-theme avy-zap ac-ispell ac-math ac-sly ace-flyspell ace-isearch ace-jump-buffer ace-jump-helm-line ace-jump-mode ace-jump-zap ace-window achievements afternoon-theme ag fontawesome helm-swoop auto-complete use-package pallet exec-path-from-shell)))
 '(paradox-automatically-star nil)
 '(paradox-github-token "c85391996956a3bbc7fe049a4ea2663f05806153")
 '(predictive-add-to-dict-ask nil)
 '(predictive-auto-add-to-dict t)
 '(predictive-completion-speed 0.5)
 '(predictive-fuzzy-completion nil)
 '(predictive-which-dict-mode nil)
 '(pretty-symbol-categories (lambda relational logical nil))
 '(telephone-line-mode nil)
 '(yas-snippet-revival nil))

;;

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
