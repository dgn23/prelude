;;; DGN-lib.el
;;; Summary: A collection of small helper functions and defs for emacs.
;;; The goal is to keep init times as short as possible. 

;;;      Narrow-widen DWIM
(defun my/narrow-or-widen-dwim (p)
  "If the buffer is narrowed, it widens. Otherwise, it narrows intelligently.
Intelligently means: region, org-src-block, org-subtree, or defun,
whichever applies first.
Narrowing to org-src-block actually calls `org-edit-src-code'.

With prefix P, don't widen, just narrow even if buffer is already
narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p)) (widen))
        ((region-active-p)
         (narrow-to-region (region-beginning) (region-end)))
        ((derived-mode-p 'org-mode)
         ;; `org-edit-src-code' is not a real narrowing command.
         ;; Remove this first conditional if you don't want it.
         (cond ((org-in-src-block-p)
                (org-edit-src-code)
                (delete-other-windows))
               ((org-at-block-p)
                (org-narrow-to-block))
               (t (org-narrow-to-subtree))))
        (t (narrow-to-defun))))


;; ;;;     handy path helper
;; (defun add-to-path (path-element)
;;   "Add the specified path element to the Emacs PATH"
;;   (interactive "DEnter directory to be added to path: ")
;;   (if (file-directory-p path-element)
;;       (setenv "PATH"
;;               (concat (expand-file-name path-element)
;;                       path-separator (getenv "PATH")))))



