;;;; Provides ORG-SETUP.EL for DGN-MBP

(add-to-list 'load-path "~/.emacs.d/el-get/")
(add-to-list 'load-path "~/emacs.d/elisp/externals/")
(require 'org-ac)
(require 'org-bullets)

(defun my/org-mode-hook ()
  (interactive)
  (turn-on-auto-fill)
  (turn-on-flyspell)
  (turn-on-reftex)
  (turn-on-cdlatex)
  (yas-minor-mode-on)
  (when (fboundp 'my/enable-abbrev-mode)
    (my/enable-abbrev-mode)))


(use-package org
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture)))

;; quick access to common tags
(setq org-tag-alist
      '(("Berkeley" . ?b)
        ("grading" . ?g)
        ("notes" . ?n)
        ("writing" . ?w)
        ("tasks" . ?t)
        ("dev" . ?d)
        ("export" . ?e)
        ("noexport" . ?n)))
;; capture templates
(setq org-capture-templates
      (quote
       (("t" "Todo" entry (file "~/org/agenda/gtd.org")
         "* TODO %?\n%U\n")
        ("n" "Notes" entry (file+headline "~/org/notes/notes.org" "Notes")
         "* %? :NOTE:\n%U\n")
        ("j" "Journal" entry (file+datetree "~/org/agenda/journal.org")
         "* %?\n%U\n")
        ("b" "Book/Bibliography" entry
         (file+headline "~/org/notes/bibliography.org" "Refile")
         "* %?%^{TITLE}p%^{AUTHOR}p%^{TYPE}p"))))

;; Custom agenda command definitions
    (setq org-agenda-custom-commands
          (quote
           (("N" "Notes" tags "NOTE"
             ((org-agenda-overriding-header "Notes")
              (org-tags-match-list-sublevels t)))
            (" " "Agenda"
             ((agenda "" nil)
              ;; All items with the "REFILE" tag, everything in refile.org
              ;; automatically gets that applied
              (tags "REFILE"
                    ((org-agenda-overriding-header "Tasks to Refile")
                     (org-tags-match-list-sublevels nil)))
              ;; All "INPROGRESS" todo items
              (todo "INPROGRESS"
                    ((org-agenda-overriding-header "Current work")))
              ;; All headings with the "support" tag
              (tags "SCHOOL/!"
                    ((org-agenda-overriding-header "School Stuff")))
              ;; All "NEESREVIEW" todo items
              (todo "WRITING"
                    ((org-agenda-overriding-header "Writing")))
              ;; All "WAITING" items without a "support" tag
              ;;(tags "WAITING-support"
                ;;;    ((org-agenda-overriding-header "Waiting for feedback")))
              ;; All TODO items
              (todo "TODO"
                    ((org-agenda-overriding-header "Task list")
                     (org-agenda-sorting-strategy
                      '(time-up priority-down category-keep))))
              ;; Everything on hold
              (todo "HOLD"
                    ((org-agenda-overriding-header "On-hold")))
              ;; Everything that's done and archivable
              ;; (todo "DONE"
              ;;       ((org-agenda-overriding-header "Tasks for archive")
              ;;        (org-agenda-skip-function 'my/skip-non-archivable-tasks)))
              )
             nil))))

'(org-todo-keywords
  (quote
   ((sequence "TODO(t!)" "WAITING(@)" "INPROGRESS(i!/@)" "DONE(d!/@)")
    (type "WRITE(w!/@)" "READ(r!/@)" "CALL(c!/@)" "EMAIL(e!/@)" "GO(g!/@)"
          "DO(d!/@)" "MAKE(m!/@)")
    (sequence "GRADE (k!)" "GRADED (l!/@)" "SENT (s!/@)"))))


(add-hook 'org-mode-hook
          (lambda ()
            (set-face-attribute 'org-level-1 nil :height 1.5)
           (set-face-attribute 'org-level-2 nil :height 1.2)
            (set-face-attribute 'org-level-3 nil :height 1.1)
            (set-face-attribute 'org-level-4 nil :height 1.1)
           (set-face-attribute 'org-level-5 nil :height 1.1)))

(add-hook 'org-mode-hook
          (lambda()
            (local-set-key (kbd "C-c w") 'org-wc-display)
            (local-set-key (kbd "C-c C-v w") 'org-wc-remove-overlays)))

;(add-hook 'org-mode-hook
;          (lambda ()
;            (set-face-attribute 'org-level-1 t :Inherit  :foreground "DarkOliveGreen4" :weight normal :height 1.5)
;            (set-face-attribute 'org-level-2 t :Inherit outline-2 :foreground "IndianRed4" :weight semi-light :height 1.4)
;            (set-face-attribute 'org-level-3 t :Inherit outline-3 :foreground "MediumPurple4" :weight normal :height 1.3)
;            (set-face-attribute 'org-level-4 t :Inherit outline-4 :foreground "OliveDrab3" :weight semi-light :height 1.2)
;            (set-face-attribute 'org-level-5 t :Inherit outline-5 :foreground "aquamarine3" :slant italic :weight normal :height 1.1)
;            (set-face-attribute 'org-level-6 t :Inherit outline-6 :foreground "#9a08ff")
;            (set-face-attribute 'org-level 7 t :Inherit outline-7 :foreground "#ff4ea3")
;            (set-face-attribute 'org-level 8 t :Inherit outline-8 :foreground "#ffd700")))


;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")
;; Set to the files (or directory of files) you want sync'd
(setq org-agenda-files (quote ("~/org/agenda/agenda.org")))
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/org/from-mobile.org")
