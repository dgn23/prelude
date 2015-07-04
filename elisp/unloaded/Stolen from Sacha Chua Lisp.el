;;; Stolen from Sacha Chua Lisp.el


  (ert-deftest dgn/org-capture-prefill-template ()
    (should
     ;; It should fill things in one field at a time
     (string=
      (dgn/org-capture-prefill-template
       "* TODO %^{Task}\nSCHEDULED: %^t\n:PROPERTIES:\n:Effort: %^{effort|1:00|0:05|0:15|0:30|2:00|4:00}\n:END:\n%?\n"
       "Hello World")
      "* TODO Hello World\nSCHEDULED: %^t\n:PROPERTIES:\n:Effort: %^{effort|1:00|0:05|0:15|0:30|2:00|4:00}\n:END:\n%?\n"
      ))
    (should
     (string=
      (dgn/org-capture-prefill-template
       "* TODO %^{Task}\nSCHEDULED: %^t\n:PROPERTIES:\n:Effort: %^{effort|1:00|0:05|0:15|0:30|2:00|4:00}\n:END:\n%?\n"
       "Hello World" "<2015-01-01>")
      "* TODO Hello World\nSCHEDULED: <2015-01-01>\n:PROPERTIES:\n:Effort: %^{effort|1:00|0:05|0:15|0:30|2:00|4:00}\n:END:\n%?\n"))
    (should
     (string=
      (dgn/org-capture-prefill-template
       "* TODO %^{Task}\nSCHEDULED: %^t\n:PROPERTIES:\n:Effort: %^{effort|1:00|0:05|0:15|0:30|2:00|4:00}\n:END:\n%?\n"
       "Hello World" "<2015-01-01>" "0:05")
      "* TODO Hello World\nSCHEDULED: <2015-01-01>\n:PROPERTIES:\n:Effort: 0:05\n:END:\n%?\n")))

  (defun dgn/org-capture-prefill-template (template &rest values)
    "Pre-fill TEMPLATE with VALUES."
    (setq template (or template (org-capture-get :template)))
    (with-temp-buffer
      (insert template)
      (goto-char (point-min))
      (while (re-search-forward
              (concat "%\\("
                      "\\[\\(.+\\)\\]\\|"
                      "<\\([^>\n]+\\)>\\|"
                      "\\([tTuUaliAcxkKInfF]\\)\\|"
                      "\\(:[-a-zA-Z]+\\)\\|"
                      "\\^\\({\\([^}]*\\)}\\)"
                      "?\\([gGtTuUCLp]\\)?\\|"
                      "%\\\\\\([1-9][0-9]*\\)"
                      "\\)") nil t)
        (if (car values)
            (replace-match (car values) nil t))
        (setq values (cdr values)))
      (buffer-string)))

  (defun dgn/helm-org-create-task (candidate)
    (let ((entry (org-capture-select-template "T")))
      (org-capture-set-plist entry)
      (org-capture-get-template)
      (org-capture-set-target-location)
      (condition-case error
          (progn
            (org-capture-put
             :template
             (org-capture-fill-template
              (dgn/org-capture-prefill-template (org-capture-get :template)
                                                  candidate)))
            (org-capture-place-template
             (equal (car (org-capture-get :target)) 'function)))
        ((error quit)
         (if (get-buffer "*Capture*") (kill-buffer "*Capture*"))
         (error "Capture abort: %s" error)))) t)


(defvar my/refile-map (make-sparse-keymap))

(defmacro my/defshortcut (key file)
  `(progn
     (set-register ,key (cons 'file ,file))
     (define-key my/refile-map
       (char-to-string ,key)
       (lambda (prefix)
         (interactive "p")
         (let ((org-refile-targets '(((,file) :maxlevel . 6)))
               (current-prefix-arg (or current-prefix-arg '(4))))
           (call-interactively 'org-refile))))))

(my/defshortcut ?i "~/.emacs.d/personal/")
(my/defshortcut ?o "~/org/")
(my/defshortcut ?l "~/Dropbox/papers/Locke/")
;(my/defshortcut ?B "~/Dropbox/books")
;(my/defshortcut ?e "~/code/dev/emacs-notes/tasks.org")
;(my/defshortcut ?w "~/Dropbox/public/sharing/index.org")
;(my/defshortcut ?W "~/Dropbox/public/sharing/blog.org")
;(my/defshortcut ?j "~/personal/journal.org")
;(my/defshortcut ?I "~/Dropbox/Inbox")
;(my/defshortcut ?g "~/sachac.github.io/evil-plans/index.org")
;(my/defshortcut ?c "~/code/dev/elisp-course.org")
;(my/defshortcut ?C "~/personal/calendar.org")
;(my/defshortcut ?l "~/dropbox/public/sharing/learning.org")
;(my/defshortcut ?q "~/personal/questions.org")

