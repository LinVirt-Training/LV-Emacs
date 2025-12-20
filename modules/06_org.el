;;; 06_org.el --- ORG Support -*- lexical-binding: t; -*-

(use-package org
  :ensure nil
  :demand t
  :config
  (setq org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-src-preserve-indentation t
        org-fontify-done-headline t
        org-fontify-quote-and-verse-blocks t
        org-fontify-whole-heading-line t
        org-hide-leading-stars t
        org-hide-emphasis-markers t
        org-pretty-entities t
        org-edit-src-content-indentation 0
        org-src-tab-acts-natively t
        org-return-follows-link t
        org-auto-align-tags nil
        org-tags-column 0
        org-catch-invisible-edits 'show-and-error
        org-special-ctrl-a/e t
        org-insert-heading-respect-content t
        org-hide-emphasis-markers t
        org-highlight-latex-and-related '(native)
        org-pretty-entities t
        org-use-sub-superscripts "{}"
        org-html-postamble nil
        org-confirm-babel-evaluate nil
        org-src-window-setup 'current-window)
  :hook
  (org-mode . auto-fill-mode)
  (org-mode . (lambda() (display-line-numbers-mode 0))))

(use-package ob
  :ensure nil
  :after org
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python     . t)
     (shell      . t)
     (lilypond   . t))))

;;; Shell prompt in src block
(defun my-insert-shell-prompt (_backend)
  (org-babel-map-src-blocks nil
	(let (
		  (lang lang)
		  (beg-body beg-body)
		  (end-body (copy-marker end-body))
		  (shell-langs '("sh" "shell"))
		  (prefix "$ ")
		  (is-contd-from-prev-line nil)) 
	  (when (member lang shell-langs)
		(goto-char beg-body)
		(skip-chars-forward "\n\s" (marker-position end-body))
		(while (< (point) (marker-position end-body))
		  (if (not is-contd-from-prev-line) 
				(insert prefix))
		  (end-of-line)
		  (if (eq ?\\ (char-after (- (point) 1))) 
			  (setq is-contd-from-prev-line t)
			(setq is-contd-from-prev-line nil))
		  (skip-chars-forward "\n\s" (marker-position end-body)))))))

(add-hook 'org-export-before-parsing-hook #'my-insert-shell-prompt)

(use-package htmlize
  :ensure t)

(use-package org-side-tree
:ensure t
:defer t
:bind (:map global-map
  ("<f9>"   . org-side-tree)))


(with-eval-after-load 'ox-latex
	(add-to-list 'org-latex-classes
		'("koma-book"
		  "\\documentclass{scrbook}"
		 ("\\chapter{%s}" . "\\chapter{%s}")
		 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\paragraph{%s}" . "\\paragraph*{%s}")))
	(add-to-list 'org-latex-classes
		'("scrbook"
		  "\\documentclass{scrbook}"
		 ("\\chapter{%s}" . "\\chapter{%s}")
		 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\paragraph{%s}" . "\\paragraph*{%s}")))
	(add-to-list 'org-latex-classes
		'("memoir"
		  "\\documentclass{memoir}"
		 ("\\chapter{%s}" . "\\chapter*{%s}")
		 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		 )
	))

(with-eval-after-load 'ox-beamer
	(add-to-list 'org-latex-classes
		'("beamer"
		  "\\documentclass\[presentation\]{beamer}"
		 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		 )
		)
	(add-to-list 'org-beamer-environments-extra
		'("onlyenv" "O" "\\begin{onlyenv}%a" "\\end{onlyenv}")
	))

(use-package citeproc
  :ensure t
  :after (org)
  :defer t)

(use-package engrave-faces
  :ensure t
)

(customize-set-value 'org-latex-with-hyperref nil)
(setq org-latex-listings 'engraved)
(setq org-latex-pdf-process (list "latexmk -f -lualatex %f"))
(setq org-latex-pdf-process '("latexmk -shell-escape -f -lualatex %f"))

(setq org-export-global-macros
	'(
	  ("kbd" . "@@html:<kbd>$1</kbd>@@ @@latex:\\keystroke{$1}@@")
	  ("kbdt" . "@@html:<kbd>TAB</kbd>@@ @@latex:\\Tab@@")
	  ("kbda" . "@@html:<kbd>Alt</kbd>@@ @@latex:\\Alt@@")
	  ("kbde" . "@@html:<kbd>Enter</kbd>@@ @@latex:\\Enter@@")
	  ("kbdc" . "@@html:<kbd>Esc</kbd>@@ @@latex:\\Esc@@")
	  ("kbdr" . "@@html:<kbd>Ctrl</kbd>@@ @@latex:\\Ctrl@@")
	  ("kbdad" . "@@html:<kbd>&#8595;</kbd>@@ @@latex:\\DArrow@@")
	  ("kbdau" . "@@html:<kbd>&#8593;</kbd>@@ @@latex:\\UArrow@@")
	  ("kbdal" . "@@html:<kbd>&#8592;</kbd>@@ @@latex:\\LArrow@@")
	  ("kbdar" . "@@html:<kbd>&&#8594;</kbd>@@ @@latex:\\RArrow@@")))

(use-package org-modern
  :ensure t
  :config
  (setq org-modern-keyword
        '((t . t)
          ("bibliography" . "")
          ("cite_export" . "⮭")
          ("include" . "⇤")
          ("setupfile" . "⇚")
          ("header" . "›")
          ("caption" . "☰")
          ("name" . "⁝")
          ("results" . "∴")))
  (setq org-modern-block-name
        '((t . t)
          ("src" "»" "∥")
          ("example" "»–" "∥")
          ("quote" "❝" "❞")))
  :hook 
  (org-mode . org-modern-mode))

(use-package ox-pandoc
  :ensure t)

(use-package ox-epub
  :ensure t)

(use-package org-auto-tangle
  :ensure t
  :delight
  :config
  (add-hook 'org-mode-hook 'org-auto-tangle-mode))

(provide '06_org)
;;; 06_org.el ends here
