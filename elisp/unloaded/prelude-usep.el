;;; DGN-Prelude-Use-Package Declarations:

;; Requirements
(use-package flyspell)
(use-package helm :ensure t )
(use-package exec-path-from-shell :ensure t :config (exec-path-from-shell-initialize))
(use-package org-notify :defer t)
(use-package company :ensure t :bind ("C-x p" .   company-complete) :config (global-company-mode t))
;(use-package auto-complete-latex :load-path "~/.emacs.d/elisp/externals/" :defer t)
(use-package auto-complete-auctex :load-path"~/.emacs.d/elisp/externals/" :defer t)
(use-package guide-key :load-path "~/.emacs.d/el-get/guide-key/"
  :init (setq guide-key/guide-key-sequence t) (setq guide-key/idle-delay 0.7) :config (guide-key-mode 1))
(use-package guide-key-tip :load-path "~/.emacs.d/el-get/guide-key-tip" :config (setq guide-key-tip/enabled t))
(use-package deft :defer t  :config (setq deft-extension "md") (setq deft-directory "~/Dropbox/.deft")
  (setq deft-text-mode 'markdown-mode) (setq deft-use-filename-as-title t))
(use-package icicle :defer t  :config (icicle-mode t))
(use-package golden-ratio :ensure t :config (golden-ratio-mode t))
(use-package pretty-mode :ensure t :config (pretty-mode t))
(use-package edit-server :if window-system :init (add-hook 'after-init-hook 'server-start t) (add-hook 'after-init-hook 'edit-server-start t))
;;; Gets rid of that annoying magit 1.4.0 message re: buffer reversion
(setq magit-last-seen-setup-instructions "1.4.0")
(use-package flycheck :ensure t)

(use-package flycheck-pos-tip
  :ensure t
  :commands flycheck-pos-tip-error-messages
  :init (eval-after-load 'flycheck
          '(setq flycheck-display-error-messages #'flycheck-pos-tip-error-messages)))

(use-package folding
  :diminish folding-mode
  :config
  (progn
    (setq folding-mode-prefix-key (kbd "C-:")
          folding-folding-on-startup nil
          folding-internal-margins nil)
    (folding-install)
    (folding-install-hooks)
    (add-hook 'after-revert-hook 'folding-mode-find-file t)))

(use-package company
  :ensure t
  :diminish company-mode
  :config
  (progn (global-company-mode 1)))


(use-package flycheck :ensure t)

(use-package flycheck-pos-tip
  :ensure t
  :commands flycheck-pos-tip-error-messages
  :init (eval-after-load 'flycheck
          '(setq flycheck-display-error-messages #'flycheck-pos-tip-error-messages)))

(use-package folding
  :diminish folding-mode
  :config
  (progn
    (setq folding-mode-prefix-key (kbd "C-:")
          folding-folding-on-startup nil
          folding-internal-margins nil)
    (folding-install)
    (folding-install-hooks)
    (add-hook 'after-revert-hook 'folding-mode-find-file t)))

(use-package company
  :ensure t
  :diminish company-mode
  :config
  (progn (global-company-mode 1)))

;; Copy current line with M-k
;; http://www.emacsblog.org/2009/05/18/copying-lines-not-killing/#comment-27462
(defun dgn/copy-line ()
  "Copy the current line to the kill-ring."
  (interactive)
  (kill-ring-save (line-beginning-position) (+ 1 (line-end-position))))
(bind-key "M-k" 'dgn/copy-line)

;; bind-key
(use-package bind-key
  :ensure t)

;; Deft -- INTEGRATE ME!
(use-package deft
  :ensure t
  :bind ("C-! d" . deft)
  :init
  (progn
    (setq deft-directory "~/Dropbox/.deft/"
	  deft-extension "org"
	  deft-text-mode 'org-mode
	  deft-use-filename-as-title t)
    (defadvice deft-auto-save (around keep-whitespace-on-deft-auto-save activate)
      (flet ((delete-trailing-whitespace))
	ad-do-it))))

;; Find unbound keys

(use-package unbound
  :ensure t
  :commands describe-unbound-keys)

;; ace-jump (reminder: C-x C-SPC to pop-global-mark)
(use-package ace-jump-mode
  :ensure t
  :bind (("C-;" . ace-jump-mode)
	 ("C-x C-;" . ace-jump-mode-pop-mark))
  :init
  (setq ace-jump-mode-scope 'frame)
  :config
  (ace-jump-mode-enable-mark-sync))


;; Colorize strings that represent colors
(use-package rainbow-mode
  :ensure t
  :commands rainbow-mode
  :diminish rainbow-mode)

(use-package markdown-mode
 :ensure t
 :mode (("\\.md\\'" . markdown-mode)
  	 ("\\.mdwn\\'" . markdown-mode)
  	 ("\\.markdown\\'" . markdown-mode)))


(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :defer 15
  :config
  (progn
    ;; Snippets dir:
    ;; - make sure the local one (~/.emacs.d/snippets) comes first
    (setq yas-snippet-dirs
          (cons "~/.emacs.d/snippets"
                (cl-remove-if (lambda (item) (string-equal "~/.emacs.d/snippets" item))
                              yas-snippet-dirs)))
    (yas-global-mode 1)))

(use-package helm
:ensure t
:diminish helm-mode
:init (use-package helm-swoop :ensure t)
:bind (("C-x C-f" . helm-find-files)
		("M-x"        . helm-M-x)
		("C-x b"      . helm-mini)
		("C-x 1"      . helm-occur)
		("C-x 2"      . helm-swoop)
		("C-c C-d   . helm-descbinds"))
:config
	(progn
		(require 'helm-config)
		(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
		(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
		(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
    (when (executable-find "curl")
      (setq helm-google-suggest-use-curl-p t))
    (when (executable-find "ack")
      (setq helm-grep-default-command "ack -Hn --no-group --no-color %e %p %f"
            helm-grep-default-recurse-command "ack -H --no-group --no-color %e %p %f"))
(setq helm-split-window-in-side-p                    t)
(setq helm-move-to-line-cycle-in-source        t)
(setq helm-ff-search-library-in-sexp                 t)
(setq helm-ff-skip-boring-files                            t)
(setq helm-ff-file-name-history-use-recentf  t)
(setq helm-scroll-amount                                      8)
(setq helm-quick-update                                       t)
(setq helm-M-x-fuzzy-match                                t)
(setq helm-apropos-fuzzy-match                       t)
(setq helm-buffers-fuzzy-matching                  t)
(setq helm-imenu-fuzzy-match                          t)
(setq helm-locate-fuzzy-match                           t)
(setq helm-recentf-fuzzy-match                        t)
(setq helm-semantic-fuzzy-match                    t)
(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)
(helm-mode)))

(use-package helm-company
  :ensure t
  :commands helm-company
  :init
  (eval-after-load 'company
    '(progn
       (define-key company-mode-map (kbd "C-:") 'helm-company)
       (define-key company-active-map (kbd "C-:") 'helm-company))))


(use-package helm-descbinds
  :ensure t
  :config (helm-descbinds-mode))

(use-package helm-flycheck
  :ensure t
  :commands helm-flycheck
  :init
  (eval-after-load 'flycheck
    '(bind-key "h" 'helm-flycheck flycheck-command-map)))

;; Fixmee
(use-package fixmee
  :ensure t
  :defer 10
  :config (progn (setq button-lock-mode-lighter nil)
                 (setq fixmee-mode-lighter nil)
                 (require 'button-lock)
                 (global-fixmee-mode)))

(use-package drag-stuff
  :ensure t
  :diminish drag-stuff-mode
  :config (progn
            (setq drag-stuff-modifier '(meta shift))
            (drag-stuff-global-mode t)))

(use-package auctex
  :ensure t
  :mode ("\\.tex\\'" . latex-mode)
  :commands (latex-mode LaTeX-mode plain-tex-mode)
  :init  (progn
           (add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)
           (add-hook 'LaTeX-mode-hook #'flyspell-mode)
           (add-hook 'LaTeX-mode-hook #'turn-on-reftex)
           (setq TeX-auto-save t
                 TeX-parse-self t
                 TeX-save-query nil
                 TeX-PDF-mode t)
           (setq-default TeX-master nil)))

(use-package preview
  :commands LaTeX-preview-setup
  :init
  (progn
    (setq-default preview-scale 1.4
		  preview-scale-function '(lambda () (* (/ 10.0 (preview-document-pt)) preview-scale)))))

(use-package reftex
  :commands turn-on-reftex
  :init
  (progn
    (setq reftex-plug-into-AUCTeX t)))

(use-package bibtex
  :mode ("\\.bib" . bibtex-mode)
  :init
  (progn
    (setq bibtex-align-at-equal-sign t)
    (add-hook 'bibtex-mode-hook (lambda () (set-fill-column 120)))))

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

(setq ispell-tex-skip-alists
      (list
       (append (car ispell-tex-skip-alists)
       (mapcar #'(lambda (cmd) (list (concat "\\\\" cmd) 'ispell-tex-arg-end)) dgn/ispell-tex-skip-alists))
       (cadr ispell-tex-skip-alists)))

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

;;; Provides --- prelude-usep.el
