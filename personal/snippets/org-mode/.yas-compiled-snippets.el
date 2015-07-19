;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
                     '(("author" "#+AUTHOR: ${1:`user-full-name`}\n" "Author" nil nil nil nil nil nil)
                       ("begin" "\\begin{$1}\n  $0\n\\end{$1}\n" "\\begin{...} ... \\end{...}" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        nil nil nil)
                       ("block" "#+begin_$1 $2\n  $0\n#+end_$1\n" "#+begin_...#+end_" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        nil nil nil)
                       ("desc" "#+DESCRIPTION: ${0}\n" "DESCRIPTION" nil nil nil nil nil nil)
                       ("dita" "#+BEGIN_DITAA ${1:export-file-name} -r -S -E\n${0}\n#+END_DITAA\n" "DITAA" nil nil nil nil nil nil)
                       ("docbook" "#+BEGIN_DOCBOOK\n${0}\n#+END_DOCBOOK\n" "DOCBOOK" nil nil nil nil nil nil)
                       ("email" "#+EMAIL: ${1:`user-mail-address`}\n" "Email" nil nil nil nil nil nil)
                       ("figure" "#+attr_latex: width=$1\\textwidth\n`(org-insert-link '(4))`\n$0\n" "figure" nil nil nil nil nil nil)
                       ("html" "#+BEGIN_HTML\n${0}\n#+END_HTML\n" "HTML" nil nil nil nil nil nil)
                       ("inc" "#+INCLUDE: \"${1:file}\" ${2:src-example-quote} ${3:mode}\n\n" "Author" nil nil nil nil nil nil)
                       ("keywords" "#+KEYWORDS: ${0}\n" "KEYWORDS" nil nil nil nil nil nil)
                       ("lang" "#+LANGUAGE: ${1:en}\n" "LANGUAGE" nil nil nil nil nil nil)
                       ("latex" "#+BEGIN_LATEX\n${0}\n#+END_LATEX\n" "LATEX" nil nil nil nil nil nil)
                       ("options" "#+OPTIONS: ${0}\n\n" "OPTIONS" nil nil nil nil nil nil)
                       ("pro1" "\nThis paper addresses prompt ${} and ${}. " "prompts" nil nil nil nil "direct-keybinding" nil)
                       ("prop" " :PROPERTIES:\n :VISIBILITY:folded:\n :END:\n" "Properties Folded" nil nil nil nil nil nil)
                       ("sb" "#+source: ${1:name}\n#+begin_src ${2:language}\n  $3\n#+end_src\n" "#+srcname:..#+begin_src...#+end_src" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        nil nil nil)
                       ("seq" "#+SEQ_TODO: ${1:STATES} | ${2:FINISHED}\n" "SEQ TODO" nil nil nil nil nil nil)
                       ("src" "#+BEGIN_SRC $1$>\n$0$>\n#+END_SRC$>\n" "Source Code Block" nil nil nil nil nil nil)
                       ("startup" "#+STARTUP: ${1:options}\n" "Startup" nil nil nil nil nil nil)
                       ("text" "#+TEXT: ${1:text}\n" "Text" nil nil nil nil nil nil)
                       ("title" "#+TITLE: ${1:title}\n" "Title Block" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
                     '(("dn-prp" ":PROPERTIES:\n${}\n:END:" "dn/properties" nil nil nil nil "direct-keybinding" nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
                     '(("gr/b" "\n${The paper/it/the author} does a ${good/bad} ${job} ${of} ${longer-sentence-compliment-or-criticism-depending-on-before} \nIn particular, ${say a little more about the last thing} For the next assignment I would suggest working on ${here is where you get the complaints out}.\nIn any case, ${please feel free to come to office hours to talk about your paper. I'll make some extra time available this week.}\n\n   Grade ${}" "gr/body" nil nil nil nil "direct-keybinding" nil)
                       ("gr/wrn" "\nWhile I am not penalizing anyone (/this/ time) for things like not following the assignment's directives or for improper formatting, I do want to emphasis how important it is to follow the letter of the assignment." "gr/warning" nil nil nil nil "direct-keybinding" nil)))


;;; Do not edit! File generated at Sun May 31 17:03:11 2015
