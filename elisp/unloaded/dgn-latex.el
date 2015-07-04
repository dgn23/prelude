;;; Prelude-LaTeX Settings


(eval-after-load "tex" '(add-to-list 'TeX-command-list '("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")))
(eval-after-load "tex" '(add-to-list 'TeX-command-list '("latexmk" "latexmk -synctex=1 -shell-escape -pdf %s" TeX-run-TeX nil t :help "Process file with latexmk")))

;; Prevent ispell from verifying some LaTeX commands
;; http://stat.genopole.cnrs.fr/dw/~jchiquet/fr/latex/emacslatex
(setq ispell-tex-skip-alists
      (list
       (append (car ispell-tex-skip-alists)
       (mapcar #'(lambda (cmd) (list (concat "\\\\" cmd) 'ispell-tex-arg-end)) dgn/ispell-tex-skip-alists))
       (cadr ispell-tex-skip-alists)))

;;; Auto-fill for LaTeX
(defun dgn/latex-auto-fill ()
  "Turn on auto-fill for LaTeX mode."
  (turn-on-auto-fill)
  (set-fill-column 80)
  (setq default-justification 'left))
(add-hook 'LaTeX-mode-hook #'dgn/latex-auto-fill)
(add-hook 'LaTeX-mode-hook (lambda () (setq compile-command "latexmk -pdf")))

;; Prevent ispell from verifying some LaTeX commands
;; http://stat.genopole.cnrs.fr/dw/~jchiquet/fr/latex/emacslatex
(defvar dgn/ispell-tex-skip-alists
  '("cite" "nocite" "includegraphics" "author" "affil" "ref" "eqref" "pageref" "label"))

;; Use dvipdfmx to convert DVI files to PDF in AUCTeX
(eval-after-load 'tex
  '(add-to-list 'TeX-command-list
                '("DVI to PDF" "dvipdfmx %d" TeX-run-command t t) t))

;; SyncTeX (http://www.emacswiki.org/emacs/AUCTeX#toc19)
(defun synctex/un-urlify (fname-or-url)
  "A trivial function that replaces a prefix of file:/// with just /."
  (if (string= (substring fname-or-url 0 8) "file:///")
      (substring fname-or-url 7)
    fname-or-url))



;;; provides prelude-latex.el
