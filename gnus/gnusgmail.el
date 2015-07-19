;;; add to gnus from [file://~/Documents/crowdox/gnus_gmail.html]

(setq gnus-secondary-select-method
      '(nnimap "gmail"
               (nnimap-address "imap.gmail.com") ; possibly "...googlemail"
               (nnimap-server-port "imaps")
               (nnima-stream-ssl)))

(setq smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\.\|^[0-9.]+\(\\|$\)\|^["]"[#'()")
