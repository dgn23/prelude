;;;;; -- Keybindings for Prelude-Emacs by Dustin Neuman

;;;; -- CODE

;;; Helm flyspellcorrect
(require 'helm)
(require 'flyspell)
(require 'helm-flyspell)
(define-key flyspell-mode-map (kbd "C-;") 'helm-flyspell-correct)
