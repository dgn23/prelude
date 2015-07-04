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
(setq gnus-outgoing-message-group "[Google Mail]/Sent Mail")

(setq gnus-summary-mark-below 0)