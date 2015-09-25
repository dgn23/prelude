;;;; DGN-ORG.EL --- Org-Mode Setup for DGN-MBP
;;; Commentary:
;;; Code:

;;; Bootstrap org-mode + contrib
;; (unless (package-installed-p 'org)  ;; Make sure the Org package is
;;  (package-install 'org))           ;; installed, install it if not

(require 'use-package)

(use-package org
  :ensure t
  :defer 15
  :mode ("\\.org" . org-mode)
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture))
  :init (setq org-directory "~/org")
        (setq org-agenda-files '("~/org/agenda/gtd.org"))
	(setq org-completion-use-ido t)
  :config (progn   (turn-on-auto-fill)
                   (turn-on-flyspell)
                   (turn-on-reftex)
                   ;(turn-on-auto-completion-mode);;SEE NOTE*
                   (turn-on-font-lock)
                   (turn-on-orgstruct)
                   (turn-on-prettify-symbols-mode)
                   (turn-on-pretty-lambda-mode)
                   (turn-on-org-cdlatex)
                   (turn-on-drag-stuff-mode)
                   (turn-on-orgstruct)
                   (turn-on-orgtbl)
                   (turn-on-pretty-mode)))

;; NOTE* => Auto-completion mode needs to be enabled separately and cannot
;;be enabled without first defining the
;;completion-at-point-function.
;; TODO ==> SET UP AUTO-COMPLETION/ACPF

(use-package org-bullets
          :load-path "~/.emacs.d/.cask/25.0.50.1/elpa/org-bullets-20140918.1137"
          :ensure t
          :init (eval-after-load "*.org" (org-bullets-mode)))

(use-package org-ac
  :load-path "~/.emacs.d/.cask/25.0.50.1/elpa/org-ac-20140302.413"
  :commands org-ac/setup-current-buffer
    :init (eval-after-load "*.org" (org-ac/setup-current-buffer)))

(use-package org-wikinodes
    :load-path "~/.emacs.d/elisp/externals/org-wikinodes.el")

;; ORG-REF
(use-package org-ref
  :load-path "~/.emacs.d/el-get/org-ref"
  :init (setq reftex-default-bibliography '("~/Dropbox/dgn/Papers/refs.bib"))
        (setq org-ref-bibliography-notes "~/org/notes/bibliography.org")
        (setq org-ref-default-bibliography '("~/Dropbox/dgn/Papers/refs.bib"))
        (setq org-ref-pdf-directory "~/Documents/bibtex-pdf"))

;;;;; ORG-SETTINGS:
 (setq org-archive-location: "/Users/dustinneuman/org/archive/archive.org::\"* From %s\"")
 (setq org-completion-use-ido t)
 (setq org-babel-load-languages (quote ((emacs-lisp . t)
                                         (latex . t)
                                         (ditaa . t)
                                         (dot . t)
                                         (haskell . t)
                                         (python . t)
                                         (ruby . t)
                                         (scheme . t)
                                         (clojure . t)
                                         (plantuml . t)
                                         (sh . t))))
 (setq org-datetree-add-timestamp (quote inactive))
 (setq org-hide-emphasis-markers t)
 (setq org-highlight-latex-and-related (quote (latex script entities)))
 (setq org-pretty-entities t)
 (setq org-src-fontify-natively t)
 (setq org-use-speed-commands t)
 (setq org-default-notes-file "~/org/notes/notes.org")
 (setq org-ditaa-jar-path "/usr/local/bin/ditaa")
 (setq org-doing-file "~/org/agenda/doing.org")
 (setq org-drawers (quote ("PROPERTIES" "CLOCK" "LOGBOOK" "RESULTS" "STUDENT_INFO")))
 (setq org-enforce-todo-checkbox-dependencies t)
 (setq org-enforce-todo-dependencies t)
 (setq org-export-backends (quote (ascii beamer html icalendar latex md org)))
 (setq org-fontify-done-headline t)
 (setq org-fontify-quote-and-verse-blocks t)
 (setq org-fontify-whole-heading-line t)


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
        ("b" "Book/Article" entry
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
            (set-face-attribute 'org-level-1 nil :height 1.3)
           (set-face-attribute 'org-level-2 nil :height 1.2)
            (set-face-attribute 'org-level-3 nil :height 1.1)
            (set-face-attribute 'org-level-4 nil :height 1.1)
           (set-face-attribute 'org-level-5 nil :height 1.1)))

(add-hook 'org-mode-hook
          (lambda()
            (local-set-key (kbd "C-c w") 'org-wc-display)
            (local-set-key (kbd "C-c C-v w") 'org-wc-remove-overlays)))
