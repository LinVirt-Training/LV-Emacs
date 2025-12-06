;;; 06_org.el --- ORG Support -*- lexical-binding: t; -*-

;;; Commentary:
;; Use Org for agenda, tasklist and documentation

;;; Code::
(use-package org
  :ensure t
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
        org-src-window-setup 'current-window
        org-directory (expand-file-name "~/WORK/emacs/org/")
	    org-agenda-files (list "~/WORK/emacs/org")
		org-imenu-depth 7
		org-todo-keywords
		  '((sequence "TODO(t)" "|" "CANCEL(c@)" "DONE(d!)"))
		org-use-fast-todo-selection 'expert
		org-enforce-todo-dependencies t
		org-enforce-todo-checkbox-dependencies t
		org-tag-alist nil
		org-auto-align-tags nil
		org-tags-column 0
		org-log-done 'time
		org-log-into-drawer t
		org-log-redeadline 'time
		org-log-reschedule 'time)
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

(use-package ox-pandoc
  :ensure t
  :when (executable-find "pandoc")
  :after ox
  :init
	(add-to-list 'org-export-backends 'pandoc)
	(setq org-pandoc-options
		  '((standalone . t)
			(mathjax . t)
			(variable . "revealjs-url=https://revealjs.com"))))

(use-package ox-epub
  :ensure t
  :after (org ox))

(use-package org-contrib
  :ensure t
  :after (org)
  :defer t
  :init
  (require 'ox-extra)
  (ox-extras-activate '(latex-header-blocks ignore-headlines)))

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

(use-package calendar
  :ensure nil
  :commands (calendar)
  :config
  (setq calendar-mark-diary-entries-flag nil
		calendar-mark-holidays-flag t)
		calendar-mode-line-format nil
		calendar-week-start-day 1
		calendar-date-style 'iso
		calendar-time-zone-style 'numeric)

(use-package solar
  :ensure nil
  :config
  (setq calendar-latitude 53.08
		calendar-longitude: 6.04))

(use-package cal-dst
  :ensure nil
  :config
  (setq calendar-standard-time-zone-name "+0100"
		calendar-daylight-time-zone-name "+0000"))

(use-package appt
  :ensure nil
  :commands (appt-activate)
  :config
  (setq appt-display-diary nil
		appt-display-format nil
		appt-display-mode-line t
		appt-display-interval 3
		appt-audible nil
		appt-warning-time-regexp "appt \\([0-9]+\\)"
		appt-message-warning-time 6)
  (with-eval-after-load 'org-agenda
	(appt-activate 1)))

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
  :hook (org-mode . org-modern-mode))

(provide '06_org)
;;; 06_org.el ends here
