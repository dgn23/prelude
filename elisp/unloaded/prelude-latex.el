;;; Prelude-LaTeX Settings


;;; Code:
(add-to-list 'load-path "~/.emacs.d/.cask/24.5.1/elpa/")
(require 'use-package)
(require 'reftex)
(require 'latex-pretty-symbols)

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

(eval-after-load "tex" '(add-to-list 'TeX-command-list '("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")))
(eval-after-load "tex" '(add-to-list 'TeX-command-list '("latexmk" "latexmk -synctex=1 -shell-escape -pdf %s" TeX-run-TeX nil t :help "Process file with latexmk")))

;(use-package reftex :ensure t :defer t :init (autoload 'reftex-mode     "reftex" "RefTeX Minor Mode" t)
;  (autoload 'turn-on-reftex  "reftex" "RefTeX Minor Mode" nil)
;  (autoload 'reftex-citation "reftex-cite" "Make citation" nil)
;  (autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)
;  :config (setq reftex-enable-partial-scans t reftex-save-parse t reftex-use-multiple-selection-buffers t reftex-plug-into-AUCTeX t)
; (setq reftex-cite-format (quote ((13 . "\\cit;; e[]{%l}") (99 . "\\textcite{%l}")
; (97 . "\\autocite[]{%l}") (79 . "\\parencite{%l}") (102 . "\\footcite[][]{%l}")
;(70 . "\\fullcite[]{%l}") (80 . "[@%l]") (84 . "@%l [p. ]") (120 . "[]{%l}")
;(88 . "{%l}") (112 . "\\citep{%l}") (116 . "\\citet{%l}")
;(121 . "\\citeyearpar{%l}")))))

;(use-package auctex
;  :ensure t
;  :mode "\\.tex\\'"
;  :init (add-hook 'LaTeX-mode-hook 'turn-on-reftex) (add-hook 'LaTeX-mode-hook 'company-auctex-init)
;  :config (add-to-list 'TeX-command-list '("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber"))
;(add-to-list 'TeX-command-list '("latexmk" "latexmk -synctex=1 -shell-escape -pdf %s" TeX-run-TeX nil t :help "Process file with latexmk")))

;(use-package latex-pretty-symbols :ensure t)

;;; provides prelude-latex.el
