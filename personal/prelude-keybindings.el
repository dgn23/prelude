;;; prelude-dgn-keybindings.el --- Emacs DGN-Local-Prelude: keybindings
;;
;; Copyright © 2015 Dustin Neuman
;;
;; Author: Dustin Neuman <dustin.neuman@gmail.com>
;; URL: https://github.com/dgn23/
;; Version: 0.1
;; Keywords: keybindings, convenience, osx

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Some keybinding stuff I want to keep separate.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

;;; Remember to use prelude-require-packages in these submodules.
;;; (Or maybe not -- seems like it's trying to DL what it thinks I don't have)
;;; (prelude-require-packages '(helm flyspell helm-flyspell))
;;;;; -- Keybindings for Prelude-Emacs by Dustin Neuman

;;; Code:

;;; Small OSx Tweak
(if (equal system-type 'darwin)
     (setq NS-function-modifier 'super)) ;Hooray! I think it works.

;;; Helm flyspellcorrect
(use-package helm-flyspell
  :ensure t
  :bind ("C-;" . flyspell-mode))

(define-key flyspell-mode-map (kbd "C-;") 'helm-flyspell-correct)

;;; (provides 'prelude-keybindings)
;;; prelude-keybindings.el ends here
