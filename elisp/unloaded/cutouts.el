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
;(setq reftex-enable-partial-scans t)
;(setq reftex-save-parse-info t)
;(setq reftex-use-multiple-selection-buffers t)
;(setq reftex-plug-into-AUCTeX t)

;'(reftex-cite-format
;  (quote
;   ((13 . "\\cite[]{%l}")
;    (99 . "\\textcite{%l}")
;    (97 . "\\autocite[]{%l}")
;    (79 . "\\parencite{%l}")
;    (102 . "\\footcite[][]{%l}")
;    (70 . "\\fullcite[]{%l}")
;    (80 . "[@%l]")
;    (84 . "@%l [p. ]")
;    (120 . "[]{%l}")
;    (88 . "{%l}")
;    (112 . "\\citep{%l}")
;    (116 . "\\citet{%l}")
    ;(121 . "\\citeyearpar{%l}"))))

;(eval-after-load "tex"
  ;'(add-to-list 'TeX-command-list '("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")))

;(eval-after-load "tex"
  ;'(add-to-list 'TeX-command-list '("latexmk" "latexmk -synctex=1 -shell-escape -pdf %s" TeX-run-TeX nil t :help "Process file with latexmk")))

;; (eval-after-load "tex"
;;    '(add-to-list 'Tex-command-list '("xelatex" "xelatex -synctex=1 -shell-escape -pdf %s" Tex-run-Tex nil t :help "Process file with xelatex")))

;; ispell
(require 'ispell)
(setq ispell-program-name "/usr/local/bin/aspell")
(setq ispell-personal-dictionary "~/.aspell.en.pws")


;;; Full Screen ESKSS-style

(defun fullscreen (&optional f)
  (interactive)
  (set-frame-parameter f 'fullscreen
                       (if (frame-parameter f 'fullscreen) nil 'fullboth)))
(global-set-key (kbd "C-c f") 'fullscreen)
(add-hook 'after-make-frame-functions 'fullscreen)
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

(use-package exec-path-from-shell :ensure t :config (exec-path-from-shell-initialize))

;(use-package auto-complete-latex :load-path "~/.emacs.d/elisp/externals/" :defer t)
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

;;; (setq ispell-program-name "aspell"
;;;       ispell-dictionary "en_US"
;;;        ispell-dictionary-alist
;;;        (let ((default '("[A-Za-z]" "[^A-Za-z]" "[']" nil
;;;                         ("-B" "-d" "english")
;;;                         nil iso-8859-1)))
;;;          `((nil ,@default)
;;;         ("english" ,@default))))
;;;  (setq ispell-extra-args '("--sug-mode=ultra"))


;;; ((font-existsp "Menlo")
;;; (set-face-attribute 'default nil :height 121 :font "Menlo"))
;;; ((font-existsp "Consolas") (set-face-attribute 'default nil :height 121 :font "Consolas"))
;;; ((font-existsp "Inconsolata")
;;; (set-face-attribute 'default nil :height 121 :font "Inconsolata"))
;;; ((font-existsp "Envy Code R")
;;; (set-face-attribute 'default nil :height 121 :font "Envy Code R"))

;; Guide-key and Guide-Key-Tip
                                        ;(add-to-list 'load-path "~/.emacs.d/el-get/guide-key")
                                        ;(add-to-list 'load-path "~/.emacs.d/el-get/guide-key-tip")
                                        ;(require 'guide-key)
                                        ;(require 'guide-key-tip)
                                        ;(setq guide-key/guide-key-sequence t)
                                        ;(setq guide-key/idle-delay 0.7)
                                        ;(setq guide-key-tip/enabled t)
                                        ;(guide-key-mode 1)


;;; Code:
; (require 'auctex)
; (require 'reftex)




;(add-hook 'pandoc-mode-hook 'turn-on-reftex)  ; with Pandoc mode
;(autoload 'reftex-mode     "reftex" "RefTeX Minor Mode" t)
;(autoload 'turn-on-reftex  "reftex" "RefTeX Minor Mode" nil)
;(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
;(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)

;(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
;(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode
;(add-hook 'LaTeX-mode-hook 'company-auctex-init)

;; Make RefTeX faster

