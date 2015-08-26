;; Text Library:
;; For $emacs-dir/lib

(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(require 'diminish)

(use-package auto-complete
  :load-path "/Users/dustinneuman/.emacs.d/.cask/24.5.1/elpa/" ; FIX-MEE!
  :ensure t
  :defer 5
  :diminish "AC"
  :commands  (auto-complete global-auto-complete-mode)
  :bind ("M-TAB" . auto-complete)
  :init
        ;; (ac-config-default)
        (global-auto-complete-mode t)
        (bind-keys :map ac-menu-map
           ("C-n" . ac-next)
          ("C-p"  . ac-previous))
        (bind-keys :map ac-completing-map
          ("t"    . ac-expand)
          ("r"    . ac-complete)
          ("C-."  . ac-stop))
  :config (progn
;(use-package auto-complete-config :ensure auto-complete :load-path "~/.emacs.d/elisp/externals")
;(use-package auto-complete-auctex :ensure auto-complete :load-path "~/.emacs.d/elisp/externals")
        (setq ac-use-quick-help t
              ac-use-comphist t
              ac-quick-help-delay 0.3
              ac-auto-start 4
              ac-candidate-limit 20
              ac-delay 0.5
              ac-dwim t
              ac-ignore-case t
              ac-quick-help-prefer-pos-tip t
              ac-use-fuzzy t
              ac-use-menu-map t
              ac-expand-on-auto-complete nil
              ac-user-dictionary "~/dicts/LocalDictionary")
        (setq ac-sources '(ac-source-filename
              ac-source-words-in-all-buffer
              ac-source-words-in-same-mode-buffers
              ac-source-dictionary
              ac-source-words-in-buffer
              ac-source-functions
              ac-source-variables
              ac-source-symbols
              ac-source-features
              ac-source-abbrev))
      (setq ac-dictionary-files
        '( "/Users/dustinneuman/dicts/LocalDictionary"
            "/Users/dustinneuman/dicts/dict-latex-preamble.word-list"
            "/Users/dustinneuman/dicts/dgn-dict.txt"
            "/Users/dustinneuman/dicts/dict-ams-latex-env.word-list"
            "/Users/dustinneuman/dicts/dicts-ams-latex-math.word-list"
            "/Users/dustinneuman/dicts/dicts-ams-latex.word-list"
            "/Users/dustinneuman/dicts/dict-latex-env.word-list"
            "/Users/dustinneuman/dicts/dict-english-new.word-list"
            "/Users/dustinneuman/dicts/dict-english-org.word-list"
            "/Users/dustinneuman/dicts/dict-english.word-list"))))

;; Predictive -- DL first!
(use-package predictive
  :load-path "~/.emacs.d/elisp/predictive"
  :init (setq predictive-auto-learn t)
  (setq predictive-use-buffer-local-dict t)
  (setq predictive-fuzzy-completion t)
  :defer 25
  :config (predictive-mode t))

(use-package helm
  :bind (("C-x C-f" . helm-find-files)
	 ("M-x"     . helm-M-x)
	 ("C-x b"      . helm-mini)
        ("C-x C-3"    . helm-occur)
        ("C-x C-2"    . helm-swoop)
        ("C-c C-d"    . helm-descbinds))
  :init (require 'helm-config)
  :config (setq helm-split-window-in-side-p t
                helm-move-to-line-cycle-in-source t 
                helm-ff-search-library-in-sexp t
                helm-ff-skip-boring-files t
                helm-ff-file-name-history-use-recentf t
                helm-scroll-amount 8 helm-quick-update t
                helm-M-x-fuzzy-match t
                helm-apropos-fuzzy-match t 
                helm-buffers-fuzzy-matching t
		helm-imenu-fuzzy-match t
		helm-locate-fuzzy-match t
		helm-recentf-fuzzy-match t
		helm-semantic-fuzzy-match t
		helm-mode 1))

	  

;;   Helm
;; (use-package helm
;;   :ensure t
;;   :diminish helm-mode
;; ;  :init (use-package helm-swoop :ensure t)
;;   :bind (("C-x C-f"   . helm-find-files)
;;         ("M-x"        . helm-M-x)
;;         ("C-x b"      . helm-mini)
;;         ("C-x C-3"    . helm-occur)
;;         ("C-x C-2"    . helm-swoop)
;;         ("C-c C-d"    . helm-descbinds))
;;   :config
;;    (progn
;;     (require 'helm-config)
;;     (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
;;     (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
;;     (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
;;     (when (executable-find "curl")
;;       (setq helm-google-suggest-use-curl-p              t))
;;     (when (executable-find "ack")
;;       (setq helm-grep-default-command "ack -Hn --no-group --no-color %e %p %f"
;;             helm-grep-default-recurse-command "ack -H --no-group --no-color %e %p %f"))
;;     (setq helm-split-window-in-side-p t)
;;     (setq helm-move-to-line-cycle-in-source t) 
;;     helm-ff-search-library-in-sexp t)
   
;;       helm-ff-skip-boring-files t) (setq
;;       helm-ff-file-name-history-use-recentf t) (setq
;;       helm-scroll-amount 8) (setq helm-quick-update t) (setq
;;       helm-M-x-fuzzy-match t) (setq helm-apropos-fuzzy-match t) (setq
;;       helm-buffers-fuzzy-matching t) (setq helm-imenu-fuzzy-match t)
;;       (setq helm-locate-fuzzy-match t) (setq helm-recentf-fuzzy-match
;;       t) (setq helm-semantic-fuzzy-match t) (add-to-list
;;       'helm-sources-using-default-as-input 'helm-source-man-pages)
;;       (helm-mode)))


;;     ibuffer <-- fix spacing!
(use-package ibuffer
  :bind (([remap list-buffers] . ibuffer)
          ("C-x C-b" . ibuffer))
  :init (setq ibuffer-expert t)
  :config  (progn
    (setq ibuffer-show-empty-filter-groups nil
          ibuffer-saved-filter-groups '(("default"
                                         ("org" (or (name . "\\.org$")
                                                    (mode . org-mode)))
                                         ("elisp" (or (name . "\\.el$")
                                                      (mode . emacs-lisp-mode)))
                                         ("latex" (or (name . "\\.tex$")
                                                      (name . "\\.bib$")
                                                      (mode . LaTeX-mode)
                                                      (mode . bibtex-mode)
                                                      (mode . tex-mode)))                                       
                                         ("less" (name . "\\.less$"))
                                         ("snippet" (or (name . "\\.yasnippet$")
                                                        (mode . snippet-mode)))
                                         ("pdf" (name . "\\.pdf$"))
                                         ("markdown" (or (name . "\\.md$")
                                                         (mode . markdown-mode)))
                                         ("yml" (or (name . "\\.yml$")
                                                    (mode . yaml-mode)))
                                         ("dired" (mode . dired-mode))
                                         ("gnus" (or
                                                  (mode . message-mode)
                                                  (mode . bbdb-mode)
                                                  (mode . mail-mode)
                                                  (mode . gnus-group-mode)
                                                  (mode . gnus-summary-mode)
                                                  (mode . gnus-article-mode)
                                                  (name . "^\\.bbdb$")
                                                  (name . "^\\.newsrc-dribble$")))
                                         ("special" (name . "^\\*.*\\*")))))
                            (add-hook 'ibuffer-mode-hook
                                        (lambda ()
                                        (ibuffer-switch-to-saved-filter-groups "default")
                                        (ibuffer-auto-mode 1)
                                        (hl-line-mode 1)))
                           (defadvice ibuffer
                             (around ibuffer-point-to-most-recent first () activate)
                             "Open ibuffer with cursor pointed to most recent buffer name."
                             (let ((recent-buffer-name (buffer-name)))
                               ad-do-it
                               (ibuffer-jump-to-buffer recent-buffer-name)))))

;;     ibuffer-vc
(use-package ibuffer-vc :ensure t :defer t
  :init (add-hook 'ibuffer-hook
                    (lambda ()
                      (ibuffer-vc-set-filter-groups-by-vc-root)
                      (unless (eq ibuffer-sorting-mode 'alphabetic)
                        (ibuffer-do-sort-by-alphabetic)))))

;;    ispell <-- Set up first!
(use-package ispell
  :init (progn (setq ispell-program-name "/usr/local/bin/aspell" )
               (setq ispell-personal-dictionary "~/.aspell.en.pws")
               (setq ispell-silently-savep t)))


;; (use-package smex :defer t
;;   :init (global-set-key (kbd "M-X") 'smex))
(use-package helm-descbinds       
  ;:ensure helm
  :config (helm-descbinds-mode))
(use-package helm-buffers         
  ;; :ensure helm
  :defer t :config (setq helm-buffers-fuzzy-matching t))
(use-package helm-descbinds       
  ;; :ensure helm
  :init (helm-descbinds-mode 1))
(use-package helm-unicode         
  ;; :ensure helm
  :bind ("C-c h 8" . helm-unicode))
(use-package flycheck             
  :ensure t    :defer t)
;; (use-package auto-complete-auctex 
;;   :ensure t    :defer t)
(use-package icicles              
  :disabled t   :init (icicle-mode nil))
(use-package golden-ratio         
  :ensure t    :config (golden-ratio-mode t))
(use-package pretty-mode          
  :ensure t    :config (progn (global-pretty-mode t)))
(use-package egg                  
  :ensure t    :config (egg-set-global-mode))
(use-package visible-mark         
  :ensure t    :config (global-visible-mark-mode t))
(use-package pallet               
  :ensure t    :config (progn (pallet-mode t)))
(use-package rainbow-mode         
  :ensure t    :config (progn (rainbow-mode t)))
(use-package pretty-lambdada      
  :ensure t    :config (progn (global-pretty-lambda-mode t)))
(use-package pretty-symbols       
  :ensure t    :config (progn (global-prettify-symbols-mode t)))
(use-package uniquify                          :config (setq uniquify-buffer-name-style 'forward))
(use-package visual-regexp        
  :ensure t    :bind (("C-c r" . vr/query-replace) ("C-c R" . vr/replace)))
(use-package hl-line              
  :ensure t    :init (global-hl-line-mode nil))
(use-package paradox              
  :ensure t    :init (progn (setq paradox-github-token  "05f357727e2b27c83410fcc63fc9b1a9a4afc651"))  
  :bind (("C-c x p" . paradox-list-packages) ("C-c x P" . package-list-packages-no-fetch)))
(use-package smooth-scrolling     
  :ensure t    :config (setq smooth-scroll-margin 4))
(use-package markdown-mode        
  :ensure t :mode (("\\.md\\'" . markdown-mode) ("\\.mmd\\'" . markdown-mode) ("\\.markdown\\'" . markdown-mode)))

(use-package undo-tree            
  :ensure t :config (progn (setq undo-tree-mode-lighter nil) (setq global-undo-tree-mode nil)))
(use-package fixmee               
  :ensure t :defer 10 :config (progn (require 'button-lock) (global-fixmee-mode)))
(use-package drag-stuff           
  :ensure t :config (progn (setq drag-stuff-modifier '(meta shift)) (drag-stuff-global-mode t)))
(use-package smart-tab            
  :ensure t :config (progn(smart-tab-mode 1)))
(use-package unicode-mode         
  :load-path "~/.emacs.d/elisp/externals" :defer t  :diminish "Uni-Mode")


;;    auctex --- >> ALL THE LOAD PATHS BELOW NEED CHECKING/CHANGING ONCE YOU GET THAT SQUARED WITH NIX
(use-package tex-site
  :load-path "/Users/dustinneuman/.emacs.d/.cask/24.5.1/elpa/auctex-11.88.7/"
  :ensure auctex
  :defer t
  :init (setq      TeX-auto-save t
                   TeX-parse-self t
                   TeX-save-query nil
                   TeX-PDF-mode t)
        (setq-default TeX-master nil)
  :config  (progn
             (add-hook 'LaTeX-mode-hook #'LaTeX-math-mode)
             (add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)
             (add-hook 'LaTeX-mode-hook #'flyspell-mode)
             (add-hook 'LaTeX-mode-hook #'turn-on-reftex)
             (add-hook 'LaTeX-mode-hook #'company-auctex-init)))

; (use-package ac-tex-ref
; :load-path "/Users/dustinneuman/.emacs.d/elisp/externals/ac-tex-ref.el"
; :diminish ""
; :defer t
; :commands ac-tex-ref
; :init (require 'ac-tex-ref))


(use-package latex-extra
  ;; :load-path "~/.emacs.d/.cask/24.5.1/elpa/latex-extra-20150428.1139/"
  :ensure auctex
  :defer t
  :config
  (progn
    ;; Teach TeX folding about KOMA script sections
    (setq TeX-outline-extra `((,(rx (0+ space) "\\section*{") 2)
                              (,(rx (0+ space) "\\subsection*{") 3)
                              (,(rx (0+ space) "\\subsubsection*{") 4)
                              (,(rx (0+ space) "\\minisec{") 5))
          ;; No language-specific hyphens please
          LaTeX-babel-hyphen nil)
    (add-hook 'LaTeX-mode-hook #'LaTeX-math-mode)))

;; (use-package auctex-latexmk
;;   :load-path "~/.emacs.d/.cask/24.5.1/elpa/auctex-latexmk-20140904.1918/"
;;   :ensure t
;;   :defer t
;;   :init (with-eval-after-load 'latex
;;           (auctex-latexmk-setup)))

;; (use-package auctex-skim                ; Skim as viewer for AUCTeX
;;   :load-path "~/.emacs.d/personal/"
;;   :commands (auctex-skim-select)
;;   :init (with-eval-after-load 'tex
;;           (auctex-skim-select)))

(use-package bibtex                     ; BibTeX editing
  :defer t
 ; :mode ("\\.bib" . bibtex-mode)
  :init (progn
          (setq bibtex-align-at-equal-sign t)
                 (add-hook 'bibtex-mode-hook (lambda () (set-fill-column 120)))
          (setq bibtex-cite-matcher-alist
                (quote
                      (("\\\\cite[]*{\\([^}]+\\)}" . 1)
                       ("\\\\citet[]*{\\([^}]+\\)}" . 1)
                       ("\\\\citep[]*{\\([^}]+\\)}" . 1)
                       ("\\\\citeyearpar[]*{\\([^}]+\\)}" . 1)
                       ("\\\\parencite[]*{\\([^}]+\\)}")
                       ("\\\\textcite[]*{\\([^}]+\\)}")
                       ("\\\\cite*[]*{\\([^}]+\\)}")
                       ("\\\\citetitle[]*{\\([^}]+\\)}")
                       ("\\\\citeauthor[]*{\\([^}]+\\)}")
                       ("\\\\citeyear[]*{\\([^}]+\\)}"))))
          (setq bibtex-file-path nil)
          (setq bibtex-files '("~/Dropbox/DuePapers/refs.bib"))
; (setq bibtex-files  (quote
;    ("\"~/refs.bib\"" "\"~/Dropbox/dgn/Papers/refs.bib\"" " \"~/BibFiles/\"")))
          (setq bibtex-maintain-sorted-entries t)
          (setq bibtex-search-entry-globally t))
  :config (progn (add-hook 'bibtex-mode-hook (lambda () (run-hooks 'prog-mode-hook)))
                 (bibtex-set-dialect 'biblatex)))

;;    preview
(use-package preview
;  :load-path "~/.emacs.d/.cask/24.5.1/elpa/auctex-11.88.7/preview.el"
  :ensure auctex
  :commands LaTeX-preview-setup
  :init (setq preview-scale 1.4
              preview-scale-function '(lambda () (* (/ 10.0 (preview-document-pt)) preview-scale))))

;;    reftex
(use-package reftex
  :defer t
  :ensure auctex
  :commands turn-on-reftex
  :init (add-hook 'LaTeX-mode-hook #'reftex-mode)
               (setq reftex-plug-into-AUCTeX               t)
               (setq reftex-enable-partial-scans           t)
               (setq reftex-save-parse-info                t)
               (setq reftex-use-multiple-selection-buffers t)
  :config (progn '(reftex-cite-format (quote
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
                  (121 . "\\citeyearpar{%l}")))))
  :diminish reftex-mode)


;; (use-package tex-buf                    ; TeX buffer management
;;   :ensure auctex
;;   :defer t
;;   ;; Don't ask for confirmation when saving before processing
;;   :config (setq TeX-save-query nil))

(use-package tex-fold                   ; TeX folding
  :ensure auctex
  :defer t
  :init (add-hook 'TeX-mode-hook #'TeX-fold-mode))

(use-package tex-mode                   ; TeX mode
  :ensure auctex
  :defer t
  :config
  (font-lock-add-keywords 'latex-mode
                          `((,(rx "\\"
                                  symbol-start
                                  "fx" (1+ (or (syntax word) (syntax symbol)))
                                  symbol-end)
                             . font-lock-warning-face))))

 (setq LaTeX-math-menu-unicode t)
 (setq LaTeX-mode-hook
   (quote
    (flyspell-mode company-auctex-init turn-on-reftex latex-unicode-simplified
                   (lambda nil
                     (run-hooks
                      (quote prelude-latex-mode-hook)))
                   er/add-latex-mode-expansions LaTeX-preview-setup latex-extra-mode)))
 (setq
   TeX-check-path
   (quote
    ("." "/Users/dustinneuman/Library/texmf/tex/" "/Users/dustinneuman/Library/texmf/bibtex/bst/" "/usr/local/texlive/2014/texmf-var/tex/" "/usr/local/texlive/texmf-local/tex/" "/usr/local/texlive/texmf-local/bibtex/bst/" "/usr/local/texlive/2014/texmf-dist/tex/" "/usr/local/texlive/2014/texmf-dist/bibtex/bst/" "/usr/texbin/" "/users/dustinneuman/Dropbox/dgn/Papers/")))
 (setq
   TeX-command-list
   (quote
    (("latexmk" "latexmk -synctex=1 -shell-escape -pdf %s" TeX-run-TeX nil t :help "Process file with latexmk")
     ("XeLatex" "xelatex -syntex=1 -shell-escape  -pdf %s" TeX-run-command nil
      (latex-mode context-mode ams-tex-mode)
      :help "Process file with xelatex")
     ("TeX" "%(PDF)%(tex) %(file-line-error) %(extraopts) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %(extraopts) %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo %(extraopts) --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "%(PDF)amstex %(extraopts) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "texexec --once --texutil %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "texexec %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "%(bibtex) %s" TeX-run-BibTeX nil t :help "Run BibTeX")
     ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")
     ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file")
     ("Index" "%(makeindex) %s" TeX-run-command nil t :help "Create index file")
     ("Xindy" "texindy %s" TeX-run-command nil t :help "Run xindy to create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("ChkTeX" "chktex -v6 %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for common mistakes")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))

(if (file-exists-p "~/.emacs.d/elisp/lib/latex-unicode.el")
    (load "~/.emacs.d/elisp/lib/latex-unicode.el"))

(use-package latex-unicode
  :load-path "~/.emacs.d/elisp/lib"
  :defer t
  :config (add-hook 'LaTeX-mode-hook 'latex-unicode-simplified))
