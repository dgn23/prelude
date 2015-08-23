(deftheme dgn-solarium
  "Created 2015-08-09.")

(custom-theme-set-variables
 'dgn-solarium
 '(LaTeX-mode-hook (quote (LaTeX-math-mode preview-mode-setup flyspell-mode smart-tab-mode company-auctex-init turn-on-reftex latex-unicode-simplified (lambda nil (run-hooks (quote prelude-latex-mode-hook))) er/add-latex-mode-expansions latex-extra-mode turn-on-pretty-mode pretty-lambda-mode prettify-symbols-mode)))
 '(TeX-command-list (quote (("latexmk" "latexmk -synctex=1 -shell-escape -pdf %s" TeX-run-TeX nil t :help "Process file with latexmk") ("XeLatex" "xelatex -syntex=1 -shell-escape  -pdf %s" TeX-run-command nil (latex-mode context-mode ams-tex-mode) :help "Process file with xelatex") ("TeX" "%(PDF)%(tex) %(file-line-error) %(extraopts) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (plain-tex-mode texinfo-mode ams-tex-mode) :help "Run plain TeX") ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX") ("Makeinfo" "makeinfo %(extraopts) %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with Info output") ("Makeinfo HTML" "makeinfo %(extraopts) --html %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with HTML output") ("AmSTeX" "%(PDF)amstex %(extraopts) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (ams-tex-mode) :help "Run AMSTeX") ("ConTeXt" "texexec --once --texutil %(extraopts) %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt once") ("ConTeXt Full" "texexec %(extraopts) %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt until completion") ("BibTeX" "%(bibtex) %s" TeX-run-BibTeX nil t :help "Run BibTeX") ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber") ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer") ("Print" "%p" TeX-run-command t t :help "Print the file") ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command) ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file") ("Index" "%(makeindex) %s" TeX-run-command nil t :help "Create index file") ("Xindy" "texindy %s" TeX-run-command nil t :help "Run xindy to create index file") ("Check" "lacheck %s" TeX-run-compile nil (latex-mode) :help "Check LaTeX file for correctness") ("ChkTeX" "chktex -v6 %s" TeX-run-compile nil (latex-mode) :help "Check LaTeX file for common mistakes") ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document") ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files") ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files") ("arara" "arara -v %s" TeX-run-compile t t "Arara") ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(ac-modes (quote (latex-mode emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode c-mode cc-mode c++-mode go-mode java-mode malabar-mode clojure-mode clojurescript-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode scss-mode less-css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode web-mode ts-mode sclang-mode verilog-mode qml-mode org-mode deft-mode markdown-mode gnus message-mode rmail-mode)))
 '(airline-utf-glyph-branch 57504)
 '(airline-utf-glyph-linenumber 57505)
 '(airline-utf-glyph-readonly 57506)
 '(airline-utf-glyph-separator-left 57520)
 '(airline-utf-glyph-separator-right 57522)
 '(airline-utf-glyph-subseparator-left 57521)
 '(airline-utf-glyph-subseparator-right 57523)
 '(ansi-color-faces-vector [default default default italic underline success warning error])
 '(ansi-color-names-vector ["#303030" "#ff4b4b" "#d7ff5f" "#fce94f" "#5fafd7" "#d18aff" "#afd7ff" "#c6c6c6"])
 '(auth-source-cache-expiry nil)
 '(auth-source-protocols (quote ((imap "imap" "imaps" "143" "993") (pop3 "pop3" "pop" "pop3s" "110" "995") (ssh "ssh" "22") (sftp "sftp" "115") (smtp "smtp" "25" "587"))))
 '(auto-completion-at-point-functions (quote (auto-complete helm-completing-read-with-cands-in-buffer helm-complete-file-name-at-point company-complete hippie-expand)))
 '(auto-completion-backward-delete-delay 0.2)
 '(auto-completion-delay (quote ((t . 0.3))))
 '(avy-all-windows (quote all-frames))
 '(battery-mode-line-format " [Batt. Perc: %p Time: %t ] ")
 '(bind-key-describe-special-forms t)
 '(clocker-extra-annoying nil)
 '(clocker-project-issue-folder "/Users/dustinneuman/org/clock")
 '(company-math-disallow-unicode-symbols-in-faces nil)
 '(completion-accept-or-reject-by-default (quote ((t . accept-common))))
 '(completion-ui-use-echo (quote ((t))))
 '(completion-ui-use-tooltip (quote ((t) (predictive) (predictive-latex) (predictive-latex-label . t) (predictive-latex-docclass . t) (predictive-latex-bibstyle . t))))
 '(debug-on-error nil)
 '(display-time-day-and-date t)
 '(display-time-default-load-average nil)
 '(display-time-format " %a %R ")
 '(display-time-mail-face (quote default))
 '(display-time-use-mail-icon t)
 '(el-get-brew "/usr/local/bin/brew")
 '(el-get-go "/usr/local/bin/go")
 '(el-get-user-package-directory "~/.emacs.d/bin")
 '(el-get-verbose t)
 '(facemenu-listed-faces t)
 '(fancy-narrow-lighter "++")
 '(fixmee-mode-lighter nil)
 '(flyspell-highlight-flag t)
 '(font-latex-user-keyword-classes (quote (("philex" (("lb" "[{{") ("lbu" "[{{{{") ("lbp" "[{{{") ("bpaformat" "{{{") ("lbpa" "[{{") ("lbpb" "[{{") ("lbpc" "[{{") ("lbpd" "[{{") ("rf" "[{") ("rn" "[{") ("rfx" "[{") ("rfn" "[{")) (:weight bold) noarg) ("dgn-macros" ("ess") (:family "Roboto" :weight bold) command))))
 '(git-gutter:hide-gutter t)
 '(git-gutter:modified-sign ">")
 '(git-gutter:window-width 2)
 '(helm-bibtex-bibliography (quote ("/Users/dustinneuman/Dropbox/dgn/Papers/refs.bib" "/Users/dustinneuman/Dropbox/papers/Locke/Locke.bib" "/Users/dustinneuman/BibFiles/philmerged.bib")))
 '(helm-bibtex-library-path (quote ("/Users/dustinneuman/Documents/bibtex-pdf")))
 '(helm-command-prefix-key "C-x b")
 '(helm-completion-in-region-fuzzy-match t)
 '(helm-default-external-file-browser "pathfinder.app")
 '(helm-lisp-fuzzy-completion t)
 '(helm-mode-fuzzy-match t)
 '(helm-swoop-speed-or-color t)
 '(helm-swoop-split-direction (quote split-window-horizontally))
 '(hl-todo-keyword-faces (quote (("HOLD" . "#d0bf8f") ("TODO" . "#cc9393") ("NEXT" . "#dca3a3") ("THEM" . "#dc8cc3") ("PROG" . "#7cb8bb") ("OKAY" . "#7cb8bb") ("DONT" . "#5f7f5f") ("FAIL" . "#8c5353") ("DONE" . "#afd8af") ("NOTE" . "#d0bf8f") ("KLUDGE" . "#d0bf8f") ("FIXME" . "#cc9393") ("XXX" . "#cc9393") ("XXXX" . "#cc9393") ("???" . "#cc9393") ("NTS" . "#ff1419") ("CITE" . "#2aa198"))))
 '(hlt-auto-faces-flag nil)
 '(ispell-highlight-p t)
 '(ispell-silently-savep t)
 '(list-colors-sort (quote name))
 '(on-screen-highlight-method (quote fringe))
 '(org-archive-location "/Users/dustinneuman/org/archive/archive.org::\"* From %s\"")
 '(org-modules (quote (org-bbdb org-bibtex org-crypt org-ctags org-docview org-gnus org-habit org-id org-info org-inlinetask org-irc org-mhe org-mouse org-protocol org-rmail org-w3m org-bookmark org-bullets org-checklist org-collector org-eval-light org-eval org-mac-iCal org-mac-link org-mairix org-mew org-notmuch org-registry org-wikinodes org-wl)))
 '(org-ref-pdf-directory "~/Documents/bibtex-pdf/")
 '(org-wikinodes-scope (quote directory))
 '(package-selected-packages (quote (s)))
 '(paradox-github-token "1813b4089765349f6bcf9e325f7ee64321cde037")
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
 '(projectile-mode-line (quote (:eval (format " Proj: [%s]" (projectile-project-name)))))
 '(reftex-cite-format (quote ((99 . "\\cite{%l}") (116 . "\\textcite{%l}") (112 . "\\parencite{%l}") (97 . "\\citeauthor{%l}") (121 . "\\citeyear{%l}") (84 . "\\citetitle{%l}") (67 . "\\citet{%l}") (80 . "\\citep{%l}") (89 . "\\citeyearpar{%l}"))))
 '(reftex-extra-bindings t)
 '(reftex-highlight-selection (quote both))
 '(safe-local-variable-values (quote ((eval when (and (buffer-file-name) (file-regular-p (buffer-file-name)) (string-match-p "^[^.]" (buffer-file-name))) (emacs-lisp-mode) (when (fboundp (quote flycheck-mode)) (flycheck-mode -1)) (unless (featurep (quote package-build)) (let ((load-path (cons ".." load-path))) (require (quote package-build)))) (package-build-minor-mode) (set (make-local-variable (quote package-build-working-dir)) (expand-file-name "../working/")) (set (make-local-variable (quote package-build-archive-dir)) (expand-file-name "../packages/")) (set (make-local-variable (quote package-build-recipes-dir)) default-directory)))))
 '(scroll-bar-mode nil)
 '(synonyms-append-result-flag t)
 '(synonyms-cache-file "/Users/dustinneuman/Dropbox/papers/synonyms/cache/syn_cache")
 '(synonyms-file "/Users/dustinneuman/Dropbox/papers/synonyms/spell/mthesaur.txt")
 '(synonyms-match-more-flag t)
 '(tex-bibtex-command "biber")
 '(undo-tree-mode-lighter (quote (quote (undo))))
 '(unicode-fonts-fallback-font-list (quote ("Font Awesome" "Symbola" "Quivira")))
 '(unicode-fonts-skip-font-groups nil)
 '(which-key-echo-keystrokes 1)
 '(which-key-idle-delay 0.7)
 '(which-key-popup-type (quote side-window))
 '(which-key-side-window-location (quote (bottom right)))
 '(which-key-side-window-max-height 0.33)
 '(ace-popup-menu-mode nil)
 '(ace-window-display-mode nil)
 '(auto-insert-mode nil)
 '(back-button-mode nil)
 '(bbyac-global-mode t)
 '(browse-url-dwim-mode nil)
 '(clocker-mode nil)
 '(desktop-save-mode t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(dynamic-completion-mode t)
 '(epa-global-mail-mode t)
 '(evil-escape-mode t)
 '(evil-snipe-mode t)
 '(fancy-narrow-mode t)
 '(global-fasd-mode t)
 '(global-flex-isearch-mode t)
 '(global-git-gutter+-mode nil)
 '(global-git-gutter-mode nil)
 '(global-hi-lock-mode t)
 '(global-hl-todo-mode t)
 '(global-orglink-mode t)
 '(global-relative-line-numbers-mode nil)
 '(global-smart-tab-mode t)
 '(global-whitespace-mode nil)
 '(gnus-desktop-notify-mode nil)
 '(golden-ratio-mode t)
 '(helm-adaptive-mode t)
 '(ivy-mode t)
 '(line-number-mode nil)
 '(on-screen-global-mode nil)
 '(osx-pseudo-daemon-mode t)
 '(timeclock-mode-line-display nil)
 '(which-key-mode t)
 '(custom-safe-themes (quote ("08c91195acc69d868f5ef1ac91f48514674e6e326e9dba999abf980438821639" "beeb5ac6b65fcccfe434071d4624ff0308b5968bf2f0c01b567d212bcaf66054" "133222702a3c75d16ea9c50743f66b987a7209fb8b964f2c0938a816a83379a0" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "fc6ee2cdf073d6f21a9b96dd59d1395c736cab7dc9d53dc9e97a7cf55295775e" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(mode-icons-mode t)
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/savefile/bookmarks"))

(custom-theme-set-faces
 'dgn-solarium
 '(airline-emacs-outer ((t (:background "CadetBlue1" :foreground "black" :weight normal :height 1.1 :family "Roboto Condensed"))))
 '(airline-normal-center ((t (:background "#767676" :foreground "cyan3" :weight semi-bold :family "Roboto"))))
 '(airline-visual-center ((t (:background "blue violet" :foreground "#000000" :weight normal))))
 '(clocker-mode-line-clock-in-face ((t (:inherit mode-line :background "dark green" :foreground "white"))))
 '(completion-highlight-face ((t (:background "MediumOrchid1" :foreground "black"))))
 '(fixmee-notice-face ((t (:inherit font-lock-warning-face :box (:line-width 2 :color "gray" :style released-button)))))
 '(git-gutter:unchanged ((t (:background "dodgerblue"))))
 '(mode-line ((t (:background "#002B35" :foreground "#2AA198" :inverse-video nil :box (:line-width 2 :color "grey75" :style released-button) :overline "Magenta" :underline t :weight regular :height 0.95 :width condensed)))))

(provide-theme 'dgn-solarium)
