;; (use-package ac-tex-ref
;;              :load-path "/Users/dustinneuman/.emacs.d/elisp/externals/ac-tex-ref.el"
;;              :diminish ""
;;              :defer t
;;              :commands ac-tex-ref
;;              :init (require 'ac-tex-ref)
;;              :config (require 'ac-tex-ref))


(use-package latex-extra
  :load-path "~/.emacs.d/.cask/24.5.1/elpa/latex-extra-20150428.1139/"
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

(use-package auctex-latexmk
  :load-path "~/.emacs.d/.cask/24.5.1/elpa/auctex-latexmk-20140904.1918/"
  :ensure t
  :defer t
  :init (with-eval-after-load 'latex
          (auctex-latexmk-setup)))

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
                       ("\\\\citeyearpar[]*{\\([^}]+\\)}" . 1))))
          (setq bibtex-file-path nil)
          (setq bibtex-files '("~/refs.bib" "~/Dropbox/dgn/Papers/refs.bib" "~/BibFiles"))
; (setq bibtex-files  (quote
;    ("\"~/refs.bib\"" "\"~/Dropbox/dgn/Papers/refs.bib\"" " \"~/BibFiles/\"")))
          (setq bibtex-maintain-sorted-entries t)
          (setq bibtex-search-entry-globally t))
  :config (progn (add-hook 'bibtex-mode-hook (lambda () (run-hooks 'prog-mode-hook)))
                 (bibtex-set-dialect 'biblatex)))

;;    preview
(use-package preview
  :load-path "~/.emacs.d/.cask/24.5.1/elpa/auctex-11.88.6/preview.el"
  :ensure auctex
  :commands LaTeX-preview-setup
  :init
  (progn
    (setq-default preview-scale 1.4
		  preview-scale-function '(lambda () (* (/ 10.0 (preview-document-pt)) preview-scale)))))

;;    reftex
(use-package reftex
  :defer t
  :ensure auctex
  :commands turn-on-reftex
  :init (progn (add-hook 'LaTeX-mode-hook #'reftex-mode)
               (setq reftex-plug-into-AUCTeX               t)
               (setq reftex-enable-partial-scans           t)
               (setq reftex-save-parse-info                t)
               (setq reftex-use-multiple-selection-buffers t))
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


(use-package latex-pretty-symbols
  :load-path "~/.emacs.d/personal/latex-pretty-symbols.el"
  :defer t
  :mode ("\\.tex" . latex-mode)
        ("\\.bib" . bibtex-mode)
  :config (progn (latex-unicode-simplified)))

(use-package tex-buf                    ; TeX buffer management
  :ensure auctex
  :defer t
  ;; Don't ask for confirmation when saving before processing
  :config (setq TeX-save-query nil))

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
