;; GNUS.EL FOR DREAMHOST EMAIL

(setq user-mail-address "dustin@dustinneuman.com"
	 user-full-name "Dustin Neuman")

	(setq gnus-select-method
		'(nnimap "dustinneuman.com"
				(nnimap-address "mail.dustinneuman.com")
				(nnimap-server-port 993)
				(nnimap-stream ssl)))

	(setq starttls-use-gnutls t
				starttlus-gnutls-program "gnutls-cli"
				starttls-extra-arguments '("--insecure"))
				
	(setq message-send-mail-function 'smtpmail-send-it
			 	smtpmail-smtp-server "mail.dustinneuman.com"
				smtpmail-default-smtp-server "mail.dustinneuman.com"
				smtpmail-smtp-service 587
			 	smtpmail-starttls-credentials '(("mail.dustinneuman.com" 587 nil nil))
				smtpmail-auth-credentials '(("mail.dustinneuman.com" 587 "dustin@dustinneuman.com" nil))
				smtpmail-local-domain "dustinneuman.com")