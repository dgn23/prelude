;;; Prelude-Personal-Packages -- configuration and functionality.

;;; Summary:
;;; The idea is to have these settings available in modular form
;;; TODO: See about using (use-package)


;;; Code:
;;(add-to-list `load-path "~/.emacs.d/elpa/use-package-20150325.1614/")
;;(require 'use-package)



;; external load-paths
(add-to-list 'load-path "~/.emacs.d/el-get/direx-grep/")

;; direx-grep direx-grep adds keybindings to the local map when
;; reading a directory buffer in direx mode. To exit from a grep search,
;; toggle the key-type (i.e., "a" or "s") you used to get into it.

(require 'direx-grep)
(define-key direx:direx-mode-map (kbd "s") 'direx-grep:grep-item)
(define-key direx:direx-mode-map (kbd "S") 'direx-grep:grep-item-from-root)
(define-key-direx:direx-mode-map (kbd "a") 'direx-grep:show-all-item-at-point)
(define-key-drex:direx-mode-map (kbd "A") 'direx-grep:show-all-item)


;;; provide 'more-prelude
