;;; dgn-usep.el --- Package configuration with J. Wiegley's use-package macro.

;;; Requires
(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(require 'diminish)

;; yasnippets
(use-package yasnippet
  :ensure t
  :disabled t
  :config(yas-snippet-dirs
          (quote
           ("Users/dustinneuman/.emacs.d/snippets" "/Users/dustinneuman/.emacs.d/.cask/24.5.1/elpa/yasnippet-20150415.244/snippets"))))

;;   Auto-Complete
;;  /* remember to use :variables and :functions to smooth things over/*

(use-package auto-complete
  :load-path "/Users/dustinneuman/.emacs.d/.cask/24.5.1/elpa/"
  :ensure t
  :defer 5
  :diminish "AC"
  :commands  (auto-complete global-auto-complete-mode)
  :bind ("M-TAB" . auto-complete)
  :init
        (ac-config-default)
        (global-auto-complete-mode t)
        (bind-keys :map ac-menu-map
           ("C-n" . ac-next)
          ("C-p"  . ac-previous))
        (bind-keys :map ac-completing-map
          ("t"    . ac-expand)
          ("r"    . ac-complete)
          ("C-."  . ac-stop))
  :config (progn
(use-package auto-complete-config :ensure auto-complete :load-path "~/.emacs.d/elisp/externals")
(use-package auto-complete-auctex :ensure auto-complete :load-path "~/.emacs.d/elisp/externals")
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
            '("/Users/dustinneuman/dicts/LocalDictionary"
              "/Users/dustinneuman/dicts/dict-latex-preamble.word-list"
              "/Users/dustinneuman/dicts/dgn-dict.txt"
              "/Users/dustinneuman/dicts/dict-ams-latex-env.word-list"
              "/Users/dustinneuman/dicts/dicts-ams-latex-math.word-list"
              "/Users/dustinneuman/dicts/dicts-ams-latex.word-list"
              "/Users/dustinneuman/dicts/dict-latex-env.word-list"
              "/Users/dustinneuman/dicts/dict-english-new.word-list"
              "/Users/dustinneuman/dicts/dict-english-org.word-list"
              "/Users/dustinneuman/dicts/dict-english.word-list"))
        (add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")))



(use-package predictive
  :load-path "~/.emacs.d/elisp/predictive"
  :init (setq predictive-auto-learn t)
  (setq predictive-use-buffer-local-dict t)
  (setq predictive-fuzzy-completion t)
  :defer 25
  :config (predictive-mode t))

;; Company mode is pissing me off. I'm going to try to set up AC to my liking. It should have a spot here anyway.
;;;  company
(use-package company
  :defer t
  :diminish "Comp."
  :bind ("C-=" . company-complete)
  :init (global-company-mode)
  :config
  (progn
    (setq company-idle-delay 0.5
          company-minimum-prefix-length 4
          company-tooltip-align-annotations t
          company-selection-wrap-around t
          company-show-numbers t
          company-auto-complete t
          company-auto-complete-chars (quote (40 41 119 47))
          company-abort-manual-when-too-short t
          company-backends (quote ((company-ispell company-files company-capf company-dabbrev-code company-dabbrev company-elisp company-abbrev)
     company-dabbrev company-ispell company-files company-dabbrev-code company-abbrev company-keywords company-capf company-dabbrev-code company-gtags company-semantic
     (company-etags company-gtags company-etags company-keywords)
     company-oddmuse company-files company-dabbrev company-dabbrev))
          company-transformers '(company-sort-by-occurrence)
          company-bbdb-modes (quote (message-mode gnus org-mode mew notmuch nm))
          company-dabbrev-code-ignore-case t
          company-dabbrev-code-other-buffers (quote code)
          company-dabbrev-minimum-length 4
          company-etags-ignore-case t
          company-frontends (quote (company-preview-frontend company-pseudo-tooltip-unless-just-one-frontend))
          company-gtags-modes (quote (prog-mode jde-mode org-mode))
          company-idle-delay 0.5
          company-math-allow-latex-symbols-in-faces t
          company-math-allow-unicode-symbols-in-faces t
          company-occurrence-weight-function (quote company-occurrence-prefer-any-closest)
          company-quickhelp-mode t
          company-require-match (quote (quote company-explicit-action-p))
          company-show-numbers t
          company-tooltip-minimum 4)
    (global-company-mode nil)
    (bind-keys :map company-active-map
               ("C-n" . company-select-next)
               ("C-p" . company-select-previous)
               ("C-d" . company-show-doc-buffer)
               ("<tab>" . company-complete))))

;;;  Company --- statistics
(use-package company-statistics :ensure t :defer t :init (company-statistics-mode))

;; Company --- Completion for Math symbols
(use-package company-math        :ensure t :defer t :init (with-eval-after-load 'company
          (add-to-list 'company-backends 'company-math-symbols-unicode)
          (add-to-list 'company-backends 'company-math-symbols-latex)))

;;   Helm
(use-package helm
  :ensure t
  :diminish helm-mode
  :init (use-package helm-swoop :ensure t)
  :bind (("C-x C-f"   . helm-find-files)
        ("M-x"        . helm-M-x)
        ("C-x b"      . helm-mini)
        ("C-x C-3"    . helm-occur)
        ("C-x C-2"    . helm-swoop)
        ("C-c C-d"    . helm-descbinds))
  :config
   (progn
    (require 'helm-config)
    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
    (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
    (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
    (when (executable-find "curl")
      (setq helm-google-suggest-use-curl-p              t))
    (when (executable-find "ack")
      (setq helm-grep-default-command "ack -Hn --no-group --no-color %e %p %f"
            helm-grep-default-recurse-command "ack -H --no-group --no-color %e %p %f"))
      (setq helm-split-window-in-side-p                 t)
      (setq helm-move-to-line-cycle-in-source           t)
      (setq helm-ff-search-library-in-sexp              t)
      (setq helm-ff-skip-boring-files                   t)
      (setq helm-ff-file-name-history-use-recentf       t)
      (setq helm-scroll-amount                          8)
      (setq helm-quick-update                           t)
      (setq helm-M-x-fuzzy-match                        t)
      (setq helm-apropos-fuzzy-match                    t)
      (setq helm-buffers-fuzzy-matching                 t)
      (setq helm-imenu-fuzzy-match                      t)
      (setq helm-locate-fuzzy-match                     t)
      (setq helm-recentf-fuzzy-match                    t)
      (setq helm-semantic-fuzzy-match                   t)
      (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)
      (helm-mode)))

;;    flycheck-pos-tip
(use-package flycheck-pos-tip
  :ensure t
  :commands flycheck-pos-tip-error-messages
  :init (eval-after-load 'flycheck
          '(setq flycheck-display-error-messages #'flycheck-pos-tip-error-messages)))

;;    helm-company
(use-package helm-company
  :ensure t
  :defer t
  :init (with-eval-after-load 'company
          ;; Use Company for completion
          (bind-key [remap completion-at-point] #'helm-company company-mode-map)
          (bind-key "C-:" #'helm-company company-mode-map)
          (bind-key "C-:" #'helm-company company-active-map)))

;;     avy-jump
(use-package avy-jump
  :ensure avy
  :defer t
  :bind (("C-c C-v s" . avy-isearch)
        ("C-c C-v S" . avy-goto-char-2)
        ("C-c C-v w" . avy-goto-word-1)))

;;     ibuffer
(use-package ibuffer
  :bind (([remap list-buffers] . ibuffer))
  ;; Show VC Status in ibuffer
  :init (setq ibuffer-expert t)
  :config (setq ibuffer-formats
                '((mark modified read-only vc-status-mini " "
                        (name 18 18 :left :elide)
                        " "
                        (size 9 -1 :right)
                        " "
                        (mode 16 16 :left :elide)
                        " "
                        (vc-status 16 16 :left)
                        " "
                        filename-and-process)
                  (mark modified read-only " "
                        (name 18 18 :left :elide)
                        " "
                        (size 9 -1 :right)
                        " "
                        (mode 16 16 :left :elide)
                        " " filename-and-process)
                  (mark " "
                        (name 16 -1)
                        " " filename))))

;;     ibuffer-vc
(use-package ibuffer-vc :ensure t :defer t
  :init (add-hook 'ibuffer-hook
                    (lambda ()
                      (ibuffer-vc-set-filter-groups-by-vc-root)
                      (unless (eq ibuffer-sorting-mode 'alphabetic)
                        (ibuffer-do-sort-by-alphabetic)))))

;;    ispell
(use-package ispell
  :init (progn (setq ispell-program-name "aspell" )
               (setq ispell-personal-dictionary "~/.aspell.en.pws")
               (setq ispell-silently-savep t)))

;;    indent-guide
(use-package indent-guide
  :ensure t
  :defer t
  :commands indent-guide-mode
  :init (progn (setq indent-guide-recursive t))
  :config (progn (indent-guide-global-mode t)))

;;    flycheck-pos-tip
(use-package flycheck-pos-tip
  :ensure t
  :commands flycheck-pos-tip-error-messages
  :init (eval-after-load 'flycheck
    '(setq flycheck-display-error-messages #'flycheck-pos-tip-error-messages)))

;;    edit-server <-- redundant in this prelude setup
;(use-package edit-server
;  :if window-system
;  :init (add-hook 'after-init-hook 'server-start t) (add-hook 'after-init-hook 'edit-server-start t))

;;    solarized theme
(use-package solarized
  :load-path "~/.emacs.d/elisp/solarized-emacs/"
  :defer t)

;;    deft
(use-package deft
  :ensure t
  :bind ("C-! d" . deft)
  :init (progn
    (setq deft-directory "~/Dropbox/.deft/"
          deft-extension "org"
          deft-text-mode'org-mode
	        deft-use-filename-as-title t))
  :config (defadvice
            deft-auto-save (around keep-whitespace-on-deft-auto-save activate)
                                  (let ((delete-trailing-whitespace)) ad-do-it)))

;;    ace-jump (reminder: C-x C-SPC to pop-global-mark)
(use-package ace-jump-mode
  :ensure t
  :bind (("C-c SPC" . ace-jump-mode)
         ("C-c M-SPC" . ace-jump-line-mode)
         ("C-x C-;" . ace-jump-mode-pop-mark))
  :init (setq ace-jump-mode-scope 'frame)
  :config (ace-jump-mode-enable-mark-sync))

;;    hippie-exp
(use-package hippie-exp
  :bind (([remap dabbrev-expand] . hippie-expand))
  :config
  (progn
    (setq hippie-expand-try-functions-list
          '(try-expand-dabbrev
            try-expand-dabbrev-all-buffers
            try-expand-dabbrev-from-kill
            try-complete-file-name-partially
            try-complete-file-name
            try-expand-all-abbrevs
            try-expand-list
            try-complete-lisp-symbol-partially
            try-complete-lisp-symbol))))

;;     Unicode fonts
(use-package unicode-fonts
  :load-path "~/emacs.d/.cask/"
  :ensure t
  :init (unicode-fonts-setup))

;;    windmove
  (use-package windmove :ensure t
    :bind (("S-<left>"  . windmove-left)
          ("S-<right>" . windmove-right)
          ("S-<up>"    . windmove-up)
          ("S-<down>"  . windmove-down)))

;; M-x is helm, M-X smex
(use-package smex                 :defer t     :init (global-set-key (kbd "M-X") 'smex))
(use-package helm-flyspell        :ensure helm :bind ("C-;" . helm-flyspell-correct))
(use-package helm-descbinds       :ensure helm :config (helm-descbinds-mode))
(use-package helm-flycheck        :ensure helm :commands helm-flycheck :init (eval-after-load 'flycheck '(bind-key "h" 'helm-flycheck flycheck-command-map)))
(use-package helm-buffers         :ensure helm :defer t :config (setq helm-buffers-fuzzy-matching t))
(use-package helm-descbinds       :ensure helm :init (helm-descbinds-mode))
(use-package helm-color           :ensure helm :bind (("C-c h c" . helm-colors)))
(use-package helm-unicode         :ensure helm :bind ("C-c h 8" . helm-unicode))
(use-package helm-info            :ensure helm :bind (("C-c h e" . helm-info-emacs) ("C-c h i" . helm-info-at-point)))
(use-package helm-man             :ensure helm :bind (("C-c h m" . helm-man-woman)))
(use-package helm-elisp           :ensure helm :bind (("C-c f l" . helm-locate-library) ("C-c h a" . helm-apropos)))
(use-package flycheck             :ensure t    :defer t)
(use-package auto-complete-auctex :ensure t    :defer t)
(use-package bug-hunter           :ensure t    :defer t)
(use-package fancy-narrow         :ensure t    :defer t)
(use-package ibuffer-projectile   :ensure t    :defer t)
(use-package zenburn :disabled t  :ensure t    :defer t :init (load-theme 'zenburn 'no-confirm))
;(use-package server                            :init (server-mode) :diminish server-buffer-clients)
(use-package fancy-battery        :ensure t    :init   (fancy-battery-mode))
(use-package guide-key            :ensure t    :init (setq guide-key/guide-key-sequence t guide-key/idle-delay 0.7) :config (guide-key-mode 1))
(use-package nyan-mode            :ensure t    :config (nyan-mode))
(use-package icicles              :ensure t    :config (icicle-mode t))
(use-package golden-ratio         :ensure t    :config (golden-ratio-mode t))
(use-package pretty-mode          :ensure t    :config (progn (global-pretty-mode t)))
(use-package egg                  :ensure t    :config (egg-set-global-mode))
(use-package visible-mark         :ensure t    :config (global-visible-mark-mode t))
(use-package pallet               :ensure t    :config (progn (pallet-mode t)))
(use-package rainbow-mode         :ensure t    :config (progn (rainbow-mode t)))
(use-package pretty-lambdada      :ensure t    :config (progn (global-pretty-lambda-mode t)))
(use-package pretty-symbols       :ensure t    :config (progn (global-prettify-symbols-mode t)))
(use-package uniquify                          :config (setq uniquify-buffer-name-style 'forward))
(use-package guide-key-tip        :ensure t    :config (setq guide-key-tip/enabled t))
(use-package magit                :ensure t    :defer t :init (setq magit-last-seen-setup-instructions "1.4.0") (setq magit-use-overlays nil))
(use-package visual-regexp        :ensure t    :bind (("C-c r" . vr/query-replace) ("C-c R" . vr/replace)))
(use-package hl-line              :ensure t    :init (global-hl-line-mode nil))
(use-package paradox              :ensure t    :init (progn (setq paradox-github-token  "05f357727e2b27c83410fcc63fc9b1a9a4afc651"))  :bind (("C-c x p" . paradox-list-packages) ("C-c x P" . package-list-packages-no-fetch)))
(use-package unbound              :ensure t    :commands describe-unbound-keys)
(use-package rainbow-mode         :ensure t    :commands rainbow-mode :config (progn (rainbow-mode)))
(use-package smooth-scrolling     :ensure t    :config (setq smooth-scroll-margin 4))
(use-package markdown-mode        :ensure t :mode (("\\.md\\'" . markdown-mode) ("\\.mmd\\'" . markdown-mode) ("\\.markdown\\'" . markdown-mode)))
(use-package undo-tree            :ensure t :config (progn (setq undo-tree-mode-lighter nil) (setq global-undo-tree-mode nil)))
(use-package fixmee               :ensure t :defer 10 :config (progn (setq button-lock-mode-lighter nil) (setq fixmee-mode-lighter nil) (require 'button-lock) (global-fixmee-mode)))
(use-package drag-stuff           :ensure t :config (progn (setq drag-stuff-modifier '(meta shift)) (drag-stuff-global-mode t)))
(use-package smart-tab            :ensure t :config (progn(smart-tab-mode 1)))
(use-package unicode-mode         :load-path "~/.emacs.d/elisp/externals" :defer t  :diminish "Uni-Mode")

(use-package sunshine
  :load-path "~/.emacs.d/elisp/externals"
  :defer t
  ;:variables (sunshine-location sunshine-cache-ttl sunshine-show-icons)
  :commands  (sunshine-show-icons sunshine-forecast)
  :init (setq sunshine-location "Berkeley, California")
        (setq sunshine-cache-ttl 3600)
  :config (progn (setq sunshine-show-icons (not sunshine-show-icons)) (sunshine-forecast)))


;;    auctex
(use-package tex-site
  :load-path "/Users/dustinneuman/.emacs.d/.cask/24.5.1/elpa/auctex-11.88.6/"
  :ensure auctex
  :defer t
                                        ;:commands (latex-mode LaTeX-mode plain-tex-mode)
  :config  (progn
             (add-hook 'LaTeX-mode-hook #'LaTeX-math-mode)
             (add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)
             (add-hook 'LaTeX-mode-hook #'flyspell-mode)
             (add-hook 'LaTeX-mode-hook #'turn-on-reftex)
             (add-hook 'LaTeX-mode-hook #'company-auctex-init)
             (setq TeX-auto-save t
                   TeX-parse-self t
                   TeX-save-query nil
                   TeX-PDF-mode t)
             (setq-default TeX-master nil)))
;;; Provides --- prelude-usep.AL
