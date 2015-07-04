;;    auctex
(use-package tex-site
  :load-path "~/.emacs.d/.cask/24.5.1/elpa/auctex-11.88.6/"
  :ensure auctex
  :defer t
  :mode ("\\.tex\\'" . tex-mode)
  :commands (latex-mode LaTeX-mode plain-tex-mode)
  :init  (progn
           (add-hook 'LaTeX-mode-hook #'LaTeX-math-mode)
           (add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)
           (add-hook 'LaTeX-mode-hook #'flyspell-mode)
           (add-hook 'LaTeX-mode-hook #'turn-on-reftex)
           (add-hook 'LaTeX-mode-hook #'company-auctex-init)
           (setq TeX-auto-save t
                 TeX-parse-self t
                 TeX-save-query nil
                 TeX-PDF-mode t)
           (setq-default TeX-master nil)(setq TeX-outline-extra `((,(rx (0+ space) "\\section*{") 2)
                              (,(rx (0+ space) "\\subsection*{") 3)
                              (,(rx (0+ space) "\\subsubsection*{") 4)
                              (,(rx (0+ space) "\\minisec{") 5))
          ;; No language-specific hyphens please
          LaTeX-babel-hyphen nil)))

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
    (add-hook 'LaTeX-mode-hook #'LaTeX-math-mode)))    ; Easy math input

(use-package auctex-latexmk
  :load-path "~/.emacs.d/.cask/24.5.1/elpa/auctex-latexmk-20140904.1918/"
  :ensure t
  :defer t
  :init (with-eval-after-load 'latex
          (auctex-latexmk-setup)))

(use-package auctex-skim                ; Skim as viewer for AUCTeX
  :load-path "~/.emacs.d/personal/dgn-auctex-skim.el"
  :commands (auctex-skim-select)
  :init (with-eval-after-load 'tex
          (auctex-skim-select)))

(use-package bibtex                     ; BibTeX editing
  :defer t
  :mode ("\\.bib" . bibtex-mode)
  :init (progn   (setq bibtex-align-at-equal-sign t)
                 (add-hook 'bibtex-mode-hook (lambda () (set-fill-column 120))))
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
