;;; dgn-usep.el --- Package configuration with J. Wiegley's use-package macro.

;;; Requires
(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(require 'diminish)


;; COMPANY
(use-package company                 
  :ensure t
  :init (global-company-mode)
  :config
  (progn
    (setq company-tooltip-align-annotations t
          ;; Easy navigation to candidates with M-<n>
          company-show-numbers t)
    (global-company-mode 1) 
  (bind-keys :map company-active-map
               ("C-n" . company-select-next)
               ("C-p" . company-select-previous)
               ("C-d" . company-show-doc-buffer)
               ("<tab>" . company-complete))))

;;  Company --- statistics
(use-package company-statistics
  :ensure t
  :defer t
  :init (company-statistics-mode))

;; Company --- Completion for Math symbols
(use-package company-math               
  :ensure t
  :defer t
  :init (with-eval-after-load 'company
          ;; Add backends for math characters
          (add-to-list 'company-backends 'company-math-symbols-unicode)
          (add-to-list 'company-backends 'company-math-symbols-latex)))

;;    HELM
(use-package helm
  :ensure t
  :diminish helm-mode
  :init (use-package helm-swoop :ensure t)
  :bind (("C-x C-f"   . helm-find-files)
        ("M-x"        . helm-M-x)
        ("C-x b"      . helm-mini)
        ("C-x C-1"    . helm-occur)
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

;;     Helm flyspell
(use-package helm-flyspell :ensure t :bind ("C-;" . helm-flyspell-correct))

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

;;    helm-descbinds
(use-package helm-descbinds
  :ensure t
  :config (helm-descbinds-mode))

;;    helm-flycheck
(use-package helm-flycheck
  :ensure t
  :commands helm-flycheck
  :init
  (eval-after-load 'flycheck
    '(bind-key "h" 'helm-flycheck flycheck-command-map)))

;;    helm-buffers
(use-package helm-buffers
  :ensure helm
  :defer t
  :config (setq helm-buffers-fuzzy-matching t))

;;     Helm flyspell
(use-package helm-flyspell :ensure t :bind ("C-;" . helm-flyspell-correct))

;; helm aux
(use-package helm-color                 ; Input colors with Helm
  :ensure helm
  :bind (("C-c b c" . helm-colors)))

(use-package helm-unicode               ; Unicode input with Helm
  :ensure t
  :bind ("C-c b 8" . helm-unicode))
(use-package helm-info                  ; Helm tools for Info
  :ensure helm
  :bind (("C-c h e" . helm-info-emacs)
         ("C-c h i" . helm-info-at-point)))

(use-package helm-man                   ; Browse manpages with Heml
  :ensure helm
  :bind (("C-c h m" . helm-man-woman)))

(use-package helm-descbinds             ; Describe key bindings with Helm
  :ensure t
  :init (helm-descbinds-mode))

  (use-package helm-elisp                 ; Helm commands for Emacs Lisp
  :ensure helm
  :bind (("C-c f l" . helm-locate-library)
         ("C-c h a" . helm-apropos)))                


;;    One-Liners
(use-package flycheck             :ensure t    :defer t)
(use-package auto-complete-auctex :ensure t    :defer t)
(use-package bug-hunter           :ensure t    :defer t)
(use-package nyan-mode            :ensure t    :config (nyan-mode))
(use-package fancy-battery        :ensure t    :init   (fancy-battery-mode))
(use-package icicles              :ensure t    :config (icicle-mode t))
(use-package golden-ratio         :ensure t    :config (golden-ratio-mode t))
(use-package pretty-mode          :ensure t    :config(progn (global-pretty-mode t)))
(use-package egg                  :ensure t    :config (egg-set-global-mode))
(use-package fancy-narrow         :ensure t    :diminish t)
(use-package visible-mark         :ensure t    :config (global-visible-mark-mode t))
(use-package pallet               :ensure t    :config (progn (pallet-mode t)))
(use-package rainbow-mode         :ensure t    :config (progn (rainbow-mode t)))
(use-package pretty-lambdada      :ensure t    :config (progn (global-pretty-lambda-mode t)))
(use-package pretty-symbols       :ensure t    :config (progn (global-prettify-symbols-mode t)))
(use-package uniquify             :ensure      :config (setq uniquify-buffer-name-style 'forward))


;;     avy-jump
(use-package avy-jump 
  :ensure avy 
  :defer t  
  :bind (("C-c j s" . avy-isearch) 
        ("C-c j j" . avy-goto-char-2)
        ("C-c j w" . avy-goto-word-1)))

;;     ibuffer
(use-package ibuffer
  :bind (([remap list-buffers] . ibuffer))
  ;; Show VC Status in ibuffer
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

;;     ibuffer-projectile
(use-package ibuffer-projectile :ensure t :defer t)

;;    ispell
(use-package ispell   
  :load-path "/usr/local/bin/aspell" :ensure t
  :init (progn (setq ispell-program-name "aspell" )
               (setq ispell-personal-dictionary "~/.aspell.en.pws")
               (setq ispell-complete-word-dict "~/dicts/dict-english-orig.word-list")
               (setq ispell-dictionary "/usr/local/Cellar/aspell/0.60.6.1/lib/aspell-0.60/en-common.rws") ;was nil in custom
               (setq ispell-extra-args (quote ("--sug-mode=ultra")) nil nil "Changed this again and again! KEEP EYE ON ME!")
               (setq ispell-local-dictionary "~/dicts/LocalDictionary")
               (setq ispell-quietly t)
               (setq ispell-silently-savep t)
               (setq ispell-use-framepop-p t)))

;;    indent guide
(use-package indent-guide  
  :ensure t 
  :defer t 
  :commands indent-guide-mode 
  :init (progn (setq indent-guide-recursive t))
  :config (progn (indent-guide-global-mode t))

;;    flycheck-pos-tip
(use-package flycheck-pos-tip
  :ensure t
  :commands flycheck-pos-tip-error-messages
  :init (eval-after-load 'flycheck
    '(setq flycheck-display-error-messages #'flycheck-pos-tip-error-messages)))

;;    visual-regexp
(use-package visual-regexp :ensure t :bind (("C-c r" . vr/query-replace) ("C-c R" . vr/replace)))

;;    hl-line mode
(use-package hl-line :ensure t :diminish t :init (global-hl-line-mode nil))

;;    paradox 
(use-package paradox :ensure t :bind (("C-c x p" . paradox-list-packages) ("C-c x P" . package-list-packages-no-fetch)))

;;    server
(use-package server  :defer t :init (server-mode) :diminish server-buffer-clients)

;;    edit-server
(use-package edit-server 
  :if window-system 
  :init (add-hook 'after-init-hook 'server-start t) (add-hook 'after-init-hook 'edit-server-start t))

;;    solarized theme
(use-package solarized
  :load-path "~/.emacs.d/elisp/solarized-emacs/"
  :ensure solarized-theme
  :init (load-theme 'solarized-dark 'no-confirm))

;;    zenburn theme
(use-package zenburn :disabled t :ensure zenburn-theme :defer t :init (load-theme 'zenburn 'no-confirm))

;;    guide-key
(use-package guide-key :ensure t :init (setq guide-key/guide-key-sequence t guide-key/idle-delay 0.7) :config (guide-key-mode 1))

;;    guide-key-tip
(use-package guide-key-tip :ensure t :config (setq guide-key-tip/enabled t))

;;    magit
(use-package magit :ensure t :defer t :init (setq magit-last-seen-setup-instructions "1.4.0"))

;;    folding
(use-package folding 
  :diminish folding-mode 
  :config (progn (setq folding-mode-prefix-key (kbd "C-:") folding-folding-on-startup nil folding-internal-margins nil)
          (folding-install) (folding-install-hooks) (add-hook 'after-revert-hook 'folding-mode-find-file t)))

;;    deft
(use-package deft 
  :ensure t 
  :bind ("C-! d" . deft) 
  :init (progn (setq deft-directory "~/Dropbox/.deft/" deft-extension "org" 
    deft-text-mode'org-mode
	  deft-use-filename-as-title t)
    (defadvice deft-auto-save (around keep-whitespace-on-deft-auto-save activate)
      (flet ((delete-trailing-whitespace)) ad-do-it))))

;;    unbound
(use-package unbound :ensure t :commands describe-unbound-keys)

;;    ace-jump (reminder: C-x C-SPC to pop-global-mark)
(use-package ace-jump-mode 
  :ensure t
  :bind (("C-;" . ace-jump-mode) ("C-x C-;" . ace-jump-mode-pop-mark))
  :init (setq ace-jump-mode-scope 'frame)
  :config (ace-jump-mode-enable-mark-sync))

;;    rainbow-mode
(use-package rainbow-mode :ensure t :commands rainbow-mode :diminish rainbow-mode)

;;    markdown-mode
(use-package markdown-mode :ensure t
 :mode (("\\.md\\'" . markdown-mode)
  	 ("\\.mdwn\\'" . markdown-mode)
  	 ("\\.markdown\\'" . markdown-mode)))

;;    yasnippets
(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :defer 15
  :config
  (progn
    ;; Snippets dir:
    ;; - make sure the local one (~/.emacs.d/snippets) comes first
    (setq yas-snippet-dirs
          (cons "~/.emacs.d/snippets/"
                (cl-remove-if (lambda (item) (string-equal "~/.emacs.d/snippets" item))
                              yas-snippet-dirs)))
    (yas-global-mode 1)))

;;    undo-tree
(use-package undo-tree
  :ensure t
  :config
  (progn
    ;; Lighter displayed in mode line
    (setq undo-tree-mode-lighter nil)
    ;; ...and enable!
    (global-undo-tree-mode)))

;;    fixmee
(use-package fixmee
  :ensure t
  :defer 10
  :config (progn (setq button-lock-mode-lighter nil)
                 (setq fixmee-mode-lighter nil)
                 (require 'button-lock)
                 (global-fixmee-mode)))

;;    drag-stuff
(use-package drag-stuff
  :ensure t
  :diminish drag-stuff-mode
  :config (progn
            (setq drag-stuff-modifier '(meta shift))
            (drag-stuff-global-mode t)))

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
  :ensure t
  :config (progn (setq unicode-fonts-skip-font-groups '(low-quality-glyphs)
                       unicode-fonts-use-prepend t)
                 (unicode-fonts-setup)))
;;    windmove
  (use-package windmove                   ; Move between windows with Shift+Arrow
  :bind (("S-<left>"  . windmove-left)
         ("S-<right>" . windmove-right)
         ("S-<up>"    . windmove-up)
         ("S-<down>"  . windmove-down)))

;; M-x is helm, M-X smex
(use-package smex
:defer t
:init (global-set-key (kbd "M-X") 'smex)
:config((defadvice smex (around space-inserts-hyphen activate compile)
  "Insert an hyphen when using space. This mimics default M-x
  behaviour."
  (let ((ido-cannot-complete-command
         `(lambda ()
            (interactive)
            (if (string= " " (this-command-keys))
                (insert ?-)
              (funcall ,ido-cannot-complete-command)))))
    ad-do-it))))  

;; ace-jump-mode
(use-package ace-jump-mode
  :defer t
  :bind (("C-c SPC" . ace-jump-mode)
         ("C-c M-SPC" . ace-jump-line-mode)))

;; smooth-scrolling
(use-package smooth-scrolling
  :defer t
  :config
  (setq smooth-scroll-margin 4)) ; check against custom, if any

;; with-editor   
  (use-package with-editor
  :init
  (progn
    (add-hook 'shell-mode-hook  'with-editor-export-editor)
    (add-hook 'eshell-mode-hook 'with-editor-export-editor)))

;;; Provides --- prelude-usep.AL
