;; Library Settings

(setq inhibit-startup-screen t          ;; remove startup screen
      scroll-conservatively 101         ;; never recenter point when scrolling 
     initial-scratch-message nil       ;; start with an empty scratch buffer
      require-final-newline nil         ;; don't force new line at end of file
      help-window-select t              ;; select help buffer when opened
      debug-on-error nil                ;; show backtrace on error
      backup-directory-alist `((".*" . ,(expand-file-name
                                         "~/.emacs-backups/")))
      auto-save-file-name-transforms `((".*" ,(expand-file-name
                                               "~/.emacs-backups/") t))
      vc-make-backup-files t)

(setq-default cursor-type 'bar)

(fset 'yes-or-no-p 'y-or-n-p)

(auto-image-file-mode 1)        
(auto-compression-mode 1)       

;;; basic appearance
(line-number-mode 1)            
(column-number-mode 1)          
(display-battery-mode 1)
(display-time-mode 1)


(if (eq system-type 'darwin)    
    (menu-bar-mode 1)           
  	(menu-bar-mode -1))           

(when window-system
  	  (scroll-bar-mode -1)          
  	  (toggle-scroll-bar -1)
      (tool-bar-mode -1))         

(blink-cursor-mode 1)         
(show-paren-mode 1)         
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;;; coding system
(prefer-coding-system        'utf-8-unix)
(set-default-coding-systems  'utf-8-unix)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-language-environment    'utf-8)
(set-file-name-coding-system 'utf-8)
(set-locale-environment      "UTF-8")

(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

;; Trackpad scrolling
(global-set-key [wheel-up] 'previous-line)
(global-set-key [wheel-down] 'next-line)
(global-set-key [wheel-right] 'previous-line)
(global-set-key [double-wheel-right] 'previous-line)
(global-set-key [wheel-left] 'next-line)
(global-set-key [double-wheel-left] 'next-line)

;;; OS X Tweak - CUA-style copy region is super-c (i.e., fn-c)
(if (equal system-type 'darwin)
    (setq NS-function-modifier 'super))

;;;       DGN/TOGGLE-MAP SET-UP
;; Via: http://endlessparentheses.com/the-toggle-map-and-wizardry.html
(define-prefix-command 'dgn/toggle-map)
;; The manual recommends C-c for user keys, but C-x t is
;; always free, whereas C-c t is used by some modes.
(define-key ctl-x-map "t" 'dgn/toggle-map)
(define-key dgn/toggle-map "g" 'golden-ratio-mode)
(define-key dgn/toggle-map "d" 'toggle-debug-on-error)
(define-key dgn/toggle-map "f" 'auto-fill-mode)
(define-key dgn/toggle-map "l" 'toggle-truncate-lines)
(define-key dgn/toggle-map "q" 'toggle-debug-on-quit)
(define-key dgn/toggle-map "r" 'read-only-mode)
(define-key dgn/toggle-map "h" 'hl-line-mode)
(define-key dgn/toggle-map "w" 'whitespace-mode)
;;(define-key dgn/toggle-map "v" #'dgn/turn-on-viewing-mode)
;;(define-key dgn/toggle-map "n" #'dgn/narrow-or-widen-dwim)

;; Other and Misc
(global-set-key (kbd "C-x +") 'balance-windows-area)
(global-set-key (kbd "C-M-h") 'backward-kill-word)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c C-b") 'helm-mini)
(global-set-key (kbd "C-c C-,") 'ispell-word)
(global-set-key (kbd "C-+") `text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
