;; gnus/mail from custom to integrate
'(gnus-asynchronous t)
 '(gnus-bookmark-default-file "~/.emacs.d/gnus/bookmarks.el")
 '(gnus-default-charset (quote UTF-8))
 '(gnus-directory "~/.emacs.d/gnus/")
 '(gnus-icalendar-additional-identities
   (quote
    ("Dustin Neuman" "dustin.neuman@gmail.com" "dneuman@berkeley.edu" "dustin@dustinneuman.com")))
 '(gnus-icalendar-org-capture-file "\"~/org/agenda/ical.org\"")


(setq user-mail-address "dustin.neuman@gmail.com")
(setq user-full-name "Dustin Neuman")
(load-library "smtpmail")
(load-library "nnimap")
(load-library "starttls")
(require 'nnir)

(setq gnus-select-method '(nnimap "imap.gmail.com"
	       (nnimap-address "imap.gmail.com")
	       (nnimap-server-port 993)
	       (nnimap-authinfo-file "~/.authinfo")
	       (nnir-search-engine imap)
	       (nnimap-stream ssl)
	       ))

(setq gnus-secondary-select-methods
      '(
	(nnimap "mail.dustinneuman.com"
      	       (nnimap-address "mail.dustinneuman.com")
      	       (nnimap-server-port 993)
      	       (nnimap-authinfo-file "~/.authinfo")
      	       (nnir-search-engine imap)
      	       (nnimap-stream ssl))))

(setq smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-default-smtp-server "smtp.gmail.com"
      send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-service 587)

(add-hook 'gnus-topic-mode-hook 'gnus-topic-mode)

(setq gnus-outgoing-message-group "[Google Mail]/Sent Mail")
(setq gnus-extract-address-components
           'mail-extract-address-components)

(require 'bbdb)
(bbdb-initialize)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-message)


;; (setq gnus-invalid-group-regexp "[:`'\"]\\|^$")
(setq gnus-ignored-newsgroups  "")
(setq gnus-outgoing-message-group "[Google Mail]/Sent Mail") ; [Gmail]/... ?? TODO

(setq gnus-summary-mark-below 0)

;;; My ~/.gnus.el as it stands now

;; GNUS.EL FOR DREAMHOST EMAIL
;; TODO -- organize this bad boy a lot better. Especially split up dn.com/gmail


;;;;;;;;;;;;;;;;;;;; GENERIC SETTINGS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq user-full-name "Dustin Neuman")
(setq user-mail-address "dustin@dustinneuman.com")
(setq mail-host-address "dustinneuman.com")

(load-library "smtpmail")
(load-library "nnimap")
(load-library "starttls")
(require 'nnir)


;;;;;;;;;;;;;;;;;; DN.COM SETTINGS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    (setq gnus-select-method
        '(nnimap "dustinneuman.com"
                (nnimap-address "mail.dustinneuman.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl)))

    (setq starttls-use-gnutls t
                starttls-gnutls-program "gnutls-cli -s"
                starttls-extra-arguments '("--insecure"))

    (setq message-send-mail-function 'smtpmail-send-it
                smtpmail-smtp-server "mail.dustinneuman.com"
                smtpmail-default-smtp-server "mail.dustinneuman.com"
                smtpmail-smtp-service 587
                smtpmail-starttls-credentials '(("mail.dustinneuman.com" 587 nil nil))
                smtpmail-auth-credentials '(("mail.dustinneuman.com" 587 "dustin@dustinneuman.com" nil))
                smtpmail-local-domain "dustinneuman.com")

;;;;;;;;;;;;;;;;; DISPLAY ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; display chars
(setq gnus-score-over-mark ?\u2191          ; \u2191 \u2600
      gnus-score-below-mark ?\u2193         ; \u2193 \u2602
      gnus-ticked-mark ?\u2691
      gnus-dormant-mark ?\u2690
      gnus-expirable-mark ?\u267b
      gnus-read-mark ?\u2713
      gnus-del-mark ?\u2717
      gnus-killed-mark ?\u2620
      gnus-replied-mark ?\u27f2
      gnus-forwarded-mark ?\u2933
      gnus-cached-mark ?\u260d
      gnus-recent-mark ?\u2605
      gnus-unseen-mark ?\u2729
      gnus-unread-mark ?\u2709
      gnus-summary-line-format (concat "%{|%}"
                                       "%U%R%z"
                                       "%{|%}"
                                       "%(%-18,18f"
                                       "%{|%}"
                                       "%*%{%B%} %s%)"
                                       "\n"))

(setq message-kill-buffer-on-exit t)
(setq gnus-check-new-newsgroups t)

;;;;;;;;;;;;;;;;;; EXPERIMENTAL SETTINGS BELOW ;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;; GMAIL ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq gnus-secondary-select-method '(nnimap "imap.gmail.com"
         (nnimap-address "imap.gmail.com")
         (nnimap-server-port 993)
         (nnimap-authinfo-file "~/.authinfo")
         (nnir-search-engine imap)
         (nnimap-stream ssl)
         ))

(setq smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-default-smtp-server "smtp.gmail.com"
      send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-service 587)

(add-hook 'gnus-topic-mode-hook 'gnus-topic-mode)

(setq gnus-outgoing-message-group "[Google Mail]/Sent Mail")
(setq gnus-extract-address-components
           'mail-extract-address-components)

;;;;;;;;;;;;;;;;;;;; BBDB &c. ;;;;;;;;;;;;;;;;;;;;;;;;

(require 'bbdb)
(bbdb-initialize)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-message)
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
;;appearance
(setq gnus-group-line-format "%M%S%5y:  %(%-65,65g%)\n")
(setq gnus-topic-line-format "%i %A: %(%{%n%}%) %v\n")

;;sort groups
(setq gnus-group-sort-functions 'gnus-group-sort-by-level)


;; (setq gnus-invalid-group-regexp "[:`'\"]\\|^$")
(setq gnus-ignored-newsgroups  "")
(setq gnus-outgoing-message-group "[Google Mail]/Sent Mail")
(setq gnus-summary-mark-below 0)
(setq gnus-visible-headers
      '(
  "^Cc:"
  "^Date:"
  "^Followup-To:"
  "^From:"
  "^Keywords:"
  "^Newsgroups:"
  "^Mailing-List:"
  "^Organization:"
  "^Posted-To:"
  "^Reply-To:"
  "^Subject:"
  "^Summary:"
  "^To:"
  "^X-Newsreader:"
  "^X-Url:"
  ))

;;Activate foreign newsgroups
(setq gnus-activate-foreign-newsgroups t)

;;Automatically get new mail and news every n minutes
(gnus-demon-add-handler 'gnus-group-get-new-news 15 t)

;;Paul Fisher's Gnus Stuff! Thanks Paul!
(setq gnus-treat-date-lapsed 'head
      gnus-treat-emphasize t
      gnus-treat-strip-pgp t
      gnus-treat-strip-trailing-blank-lines t
      gnus-treat-strip-leading-blank-lines nil
      gnus-treat-overstrike t
      gnus-treat-emphasize t
      gnus-treat-highlight-signature t)

(gnus-start-date-timer)
(defun dgn/wash-ugly-html ()
  "Remove ugly HTML tags"
  (interactive)
  (toggle-read-only -1)
  (save-excursion
    (beginning-of-buffer)
    (while (re-search-forward "<[^<\\.@>]*>" nil t)
      (replace-match "" nil nil))
    (beginning-of-buffer)
    (while (re-search-forward "&gt;" nil t)
      (replace-match ">" nil nil))
    (beginning-of-buffer)
    (while (re-search-forward "&lt;" nil t)
      (replace-match "<" nil nil))
    (beginning-of-buffer)
    (while (re-search-forward "&.*;" nil t)
      (replace-match "" nil nil))))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Colors and the beautiful side of Gnus
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; These colors are used for the different citation levels
;(copy-face 'default 'gnus-cite-face-1)
(set-face-foreground 'gnus-cite-face-1 "orangered1")

;(copy-face 'default 'gnus-cite-face-2)
(set-face-foreground 'gnus-cite-face-2 "saddle brown")

;(copy-face 'default 'gnus-cite-face-3)
(set-face-foreground 'gnus-cite-face-3 "blue")

;(copy-face 'default 'gnus-cite-face-4)
(set-face-foreground 'gnus-cite-face-4 "turquoise4")

;(copy-face 'default 'gnus-cite-face-5)
(set-face-foreground 'gnus-cite-face-5 "forest green")

;(copy-face 'default 'gnus-cite-face-6)
(set-face-foreground 'gnus-cite-face-6 "magenta4")

;(copy-face 'default 'gnus-cite-face-7)
(set-face-foreground 'gnus-cite-face-7 "purple1")

;(copy-face 'default 'gnus-cite-face-8)
(set-face-foreground 'gnus-cite-face-8 "burlywood4")

;(copy-face 'default 'gnus-cite-face-9)
(set-face-foreground 'gnus-cite-face-9 "burlywood4")

;(copy-face 'default 'gnus-cite-face-10)
(set-face-foreground 'gnus-cite-face-10 "burlywood4")

;; Faces for headers in the article buffer
(setq gnus-header-face-alist
      '(
  ;; Format the more important headers as bold
 ("\\(from\\|to\\|sender\\|newsgroups\\|subject\\):" bold bold)

  ;; Underline the subject
 ("subject:" bold underline)

  ;; Warning messages are specially treated
  ("gnus-warning:" font-lock-emphasized-face bold)

  ;; Date header (at the moment not used) is formatted like a comment
 ("date:" font-lock-comment-face font-lock-comment-face)

  ;; The same is true for any x- header
 ("x-.*:" font-lock-comment-face font-lock-comment-face)
  ))

;; Face for the signature
(setq gnus-signature-face font-lock-comment-face)
