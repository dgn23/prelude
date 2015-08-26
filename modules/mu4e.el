;; mu4emacs.el

;;;;_ , mu4e

(setq smtpmail-default-smtp-server "smtp.gmail.com")
(require 'smtpmail)
(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'message-send-mail-with-sendmail
      message-signature nil
      smtpmail-stream-type 'starttls
      ;; smtpmail-local-domain "gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-debug-info t
      smptmail-debug-verb t
      smtpmail-warn-about-unknown-extensions t
      smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg")
      starttls-use-gnutls t
      starttls-extra-arguments '("--no-ca-verification")
      sendmail-program "/usr/local/bin/msmtp")

(use-package mu4e
  :load-path "/Users/dustinneuman/.emacs.d/el-get/mu4e"
  :commands mu4e
  :config
  (progn
    (require 'org-mu4e)
    (setq org-auto-fill-function nil)
    (setq mu4e-attachment-dir (expand-file-name "~/Downloads")
          mu4e-confirm-quit nil

          mu4e-user-mail-address-list '("dustin.neuman@gmail.com"
          								"dustin@dustinneuman.com"
          								"dneuman@berkeley.edu")
          mu4e-use-fancy-chars t
          mu4e-compose-signature t
          org-mu4e-convert-to-html t

          mu4e-get-mail-command "offlineimap -u ttyui"
          ;; mu4e-get-mail-command "~/bin/mailrun.sh"
          ;; mu4e-get-mail-command "true"
          mu4e-maildir (expand-file-name "~/Maildir")
          mu4e-mu-binary "/usr/local/bin/mu"
;          mu4e-mu-home nil ;; default dir
          mu4e-my-email-addresses user-mail-addresses ;; defined in .emacs
          mu4e-update-interval 180
          mu4e-headers-results-limit 1000)

    ;;_ folders === FIX MEE!
    (setq mu4e-drafts-folder "/[Gmail].Drafts"
          mu4e-sent-folder "/[Gmail].Sent Mail"
          mu4e-trash-folder "/[Gmail].Trash")


    (defun dgn-mu4e-archive-gmail (msg)
      "Remove label '\\Inbox' to archive MSG." ;;'\Inbox' to '\\Inbox'
      (mu4e-action-retag-message msg "\"-\\\\Inbox\""))

    (defun dgn-mu4e-delete-gmail (msg)
      "Add label '\\Trash' to delete MSG."
      (mu4e-action-retag-message msg "\"+\\\\Trash\"")) ;;'\Trash' to '\\Trash'

    (defun dgn-mu4e-delete-marked-message ()
      (interactive)
      (mu4e-headers-for-each
       (lambda (msg)
         (when (mu4e-mark-docid-marked-p (mu4e-message-field msg :docid))
           (dgn-mu4e-delete-gmail msg)
           (dgn-mu4e-archive-gmail msg)
           (mu4e-mark-set 'unmark)))))

    (defun dgn-mu4e-archive-marked-message ()
      (interactive)
      (mu4e-headers-for-each
       (lambda (msg)
         (when (mu4e-mark-docid-marked-p (mu4e-message-field msg :docid))
           (dgn-mu4e-archive-gmail msg)
           (mu4e-mark-set 'unmark)))))

    (setq mu4e-view-actions '(("archive message" . dgn-mu4e-archive-gmail)
                              ("delete message" . dgn-mu4e-delete-gmail)
                              ("view in browser" . mu4e-action-view-in-browser)
                              ("retag message" . mu4e-action-retag-message)
                              ("capture message" . mu4e-action-capture-message)))

    (setq mu4e-headers-actions '(("archive message" . dgn-mu4e-archive-gmail)
                                 ("delete message" . dgn-mu4e-delete-gmail)
                                 ("retag message" . mu4e-action-retag-message)
                                 ("capture message" . mu4e-action-capture-message)))

    (defvar my-mu4e-account-alist
      '(("gmail"
         (user-mail-address "dustin.neuman@gmail.com")
         (message-signature-file nil))
        ("dn"
         (user-mail-address "dustin@dustinneuman.com")
         (smtpmail-default-smtp-server "mail.dustinneuman.com")
         (smtpmail-smtp-server "mail.dustinneuman.com")
         (smtpmail-smtp-user "dustin@dustinneuman")
         (message-signature-file nil))
        ("berkeley"
         (user-mail-address "dneuman@berkeley.edu")
         (smtpmail-default-smtp-server "mail.berkeley.edu")
         (smtpmail-smtp-server "mail.berkeley.edu")
         (smtpmail-smtp-user "dneuman@berkeley")
         (message-signature-file nil)

    (add-hook 'mu4e-index-updated-hook
              (lambda ()
                (shell-command (concat "terminal-notifier"
                                       " -title mu4e"
                                       " -message 'Mail-Index update.'"
                                       ;" -sound Ping"
                                       ))))

    (defun my-mu4e-set-account ()
      "Set the account for composing a message."
      (let* ((account
              (if mu4e-compose-parent-message
                  (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                    (string-match "/\\(.*?\\)/" maildir)
                    (match-string 1 maildir))
                (completing-read (format "Compose with account: (%s) "
                                         (mapconcat #'(lambda (var) (car var)) my-mu4e-account-alist "/"))
                                 (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                                 nil t nil nil (car my-mu4e-account-alist)))) ;Changed 'caar' to 'car'
             (account-vars (cdr (assoc account my-mu4e-account-alist))))
        (if account-vars
            (mapc #'(lambda (var)
                      (set (car var) (cadr var)))
                  account-vars)
          (error "No email account found"))))

    (add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)

    (setq mu4e-bookmarks '(("tag:\\\\Inbox" "Inbox" ?i)
                           ;("maildir:/ming/all and (tag:\\\\Inbox or tag:\\\\Sent)" "MING Inbox" ?m)
                           ("flag:flagged" "Todos" ?b)
                           ("flag:unread AND NOT flag:trashed" "Unread messages" ?u)
                           ("date:today..now" "Today's messages" ?t)
                           ("date:7d..now" "Last 7 days" ?w)
                           ("mime:image/*" "Messages with images" ?p)))

    ;;_ headers
    (setq mu4e-headers-date-format "%Y-%m-%d [%H:%M]"
          mu4e-headers-fields '((:date . 20) (:flags . 6) (:from . 22) (:subject))
          ;; mu4e-headers-fields '((:from . 22) (:subject))
          mu4e-headers-leave-behavior 'ask
          mu4e-headers-visible-columns 60
          mu4e-headers-visible-lines 15
          mu4e-split-view 'horizontal
          mu4e-headers-skip-duplicates t)

    (add-hook 'mu4e-headers-mode-hook
              (lambda ()
                (setq cursor-type nil)) ;; hide cursor in headers view
              t)

    ;;_ message view
    (setq ;; mu4e-html2text-command "html2text -utf8 -nobs -style compact -width 72"
     mu4e-html2text-command "w3m -dump -cols 80 -T text/html"
     ;; mu4e-html2text-command "pandoc -f html -t latex"
     mu4e-show-images t
     mu4e-view-image-max-width 800
     mu4e-view-date-format "%c" ;; locale's date and time format
     mu4e-view-fields '(:from :to :cc :subject :tags :flags :date :maildir :attachments :signature)
     mu4e-view-hide-cited nil
     mu4e-view-prefer-html nil
     mu4e-view-show-addresses t)


    ;; ;; don't keep message buffers around
    (setq message-kill-buffer-on-exit t)))