(deftheme dgn-theme-moeish
  "Created 2015-08-03.")

(custom-theme-set-variables
 'dgn-theme-moeish)

(custom-theme-set-faces
 'dgn-theme-moeish
 '(default ((t (:inherit nil :stipple nil :background "#292929" :foreground "#c6c6c6" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Myriad Pro"))))
 '(cursor ((((class color) (min-colors 89)) (:background "#c6c6c6"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((t (:family "Sans Serif"))))
 '(escape-glyph ((((class color) (min-colors 89)) (:foreground "#c4a000"))))
 '(minibuffer-prompt ((t (:background "#4e4e4e" :foreground "azure" :box (:line-width 2 :color "grey75" :style released-button) :weight bold :height 1.2 :family "Symbola Regular"))))
 '(highlight ((t (:foreground "gray99" :background "#4e4e4e"))))
 '(region ((t (:background "#303130" :foreground "Magenta"))))
 '(shadow ((((class color grayscale) (min-colors 88) (background light)) (:foreground "grey50")) (((class color grayscale) (min-colors 88) (background dark)) (:foreground "grey70")) (((class color) (min-colors 8) (background light)) (:foreground "green")) (((class color) (min-colors 8) (background dark)) (:foreground "yellow"))))
 '(secondary-selection ((((class color) (min-colors 89)) (:foreground "#ffffff" :background "#005f87"))))
 '(trailing-whitespace ((t (:background "#a40000"))))
 '(font-lock-builtin-face ((((class color) (min-colors 89)) (:foreground "#d18aff"))))
 '(font-lock-comment-delimiter-face ((((class color) (min-colors 89)) (:slant italic :foreground "#6c6c6c"))))
 '(font-lock-comment-face ((((class color) (min-colors 89)) (:slant italic :foreground "#6c6c6c"))))
 '(font-lock-constant-face ((((class color) (min-colors 89)) (:foreground "#5fafd7"))))
 '(font-lock-doc-face ((((class color) (min-colors 89)) (:foreground "#ff4b4b"))))
 '(font-lock-function-name-face ((((class color) (min-colors 89)) (:foreground "#ffd700"))))
 '(font-lock-keyword-face ((((class color) (min-colors 89)) (:foreground "#a1db00"))))
 '(font-lock-negation-char-face ((((class color) (min-colors 89)) (:foreground "#ff4b4b"))))
 '(font-lock-preprocessor-face ((((class color) (min-colors 89)) (:foreground "#d18aff"))))
 '(font-lock-regexp-grouping-backslash ((((class color) (min-colors 89)) (:foreground "#fce94f"))))
 '(font-lock-regexp-grouping-construct ((((class color) (min-colors 89)) (:foreground "#d18aff"))))
 '(font-lock-string-face ((((class color) (min-colors 89)) (:foreground "#ff4ea3"))))
 '(font-lock-type-face ((((class color) (min-colors 89)) (:foreground "#00d7af"))))
 '(font-lock-variable-name-face ((((class color) (min-colors 89)) (:foreground "#ff8700"))))
 '(font-lock-warning-face ((t (:foreground "#dd0000" :weight bold))))
 '(button ((t (:inherit (link)))))
 '(link ((((class color) (min-colors 89)) (:foreground "#5fafd7" :underline (:color foreground-color :style line)))))
 '(link-visited ((((class color) (min-colors 89)) (:foreground "#1f5bff" :underline (:color foreground-color :style line)))))
 '(fringe ((((class color) (min-colors 89)) (:background "#4e4e4e" :foreground "#a8a8a8"))))
 '(header-line ((((class color) (min-colors 89)) (:foreground "#ffffff" :background "#005f87"))))
 '(tooltip ((((class color)) (:inherit (variable-pitch) :foreground "black" :background "lightyellow")) (t (:inherit (variable-pitch)))))
 '(mode-line ((t (:background "#4e4e4e" :foreground "#9e9e9e" :box (:line-width 1 :color "blue4" :style released-button)))))
 '(mode-line-buffer-id ((t (:weight bold :box nil :foreground "#080808"))))
 '(mode-line-emphasis ((t (:weight bold))))
 '(mode-line-highlight ((((class color) (min-colors 88)) (:box (:line-width 2 :color "grey40" :style released-button))) (t (:inherit (highlight)))))
 '(mode-line-inactive ((t (:background "#3d3d3d" :foreground "#7d7d7d" :box nil))))
 '(isearch ((t (:background "dodger blue" :foreground "#c6c6c6"))))
 '(isearch-fail ((((class color) (min-colors 88) (background light)) (:background "RosyBrown1")) (((class color) (min-colors 88) (background dark)) (:background "red4")) (((class color) (min-colors 16)) (:background "red")) (((class color) (min-colors 8)) (:background "red")) (((class color grayscale)) (:foreground "grey")) (t (:inverse-video t))))
 '(lazy-highlight ((((class color) (min-colors 89)) (:foreground "#c6c6c6" :background "#ff1f8b"))))
 '(match ((((class color) (min-colors 88) (background light)) (:background "yellow1")) (((class color) (min-colors 88) (background dark)) (:background "RoyalBlue3")) (((class color) (min-colors 8) (background light)) (:foreground "black" :background "yellow")) (((class color) (min-colors 8) (background dark)) (:foreground "white" :background "blue")) (((type tty) (class mono)) (:inverse-video t)) (t (:background "gray"))))
 '(next-error ((t (:inherit (region)))))
 '(query-replace ((t (:inherit (isearch))))))

(provide-theme 'dgn-theme-moeish)