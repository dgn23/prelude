(deftheme smart-mode-line-powerline
  "Created 2015-06-17.")

(custom-theme-set-variables
 'smart-mode-line-powerline
 )

(custom-theme-set-faces
 'smart-mode-line-powerline
 '(mode-line-buffer-id ((t :inherit sml/filename :foreground nil :background nil)))
 '(mode-line-inactive ((((background dark)) :foreground "gray60" :background "Black" :slant italic :box (:line-width -3 :color "black")) (((background light)) :foreground "gray60" :background "Black" :slant italic :box (:line-width -2 :color "white"))))
 '(mode-line ((t :foreground "gray60" :background "black" :box (:line-width -1 :color "Black"))))
 '(helm-candidate-number ((t :foreground nil :background nil :inherit sml/filename))))

(provide-theme 'smart-mode-line-powerline)
