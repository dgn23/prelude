;;; DGN-keybindings

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

(global-set-key (kbd "C-x +") 'balance-windows-area)
(global-set-key (kbd "C-M-h") 'backward-kill-word)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c b") 'helm-mini)
