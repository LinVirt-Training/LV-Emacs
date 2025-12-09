;;; 02_treemacs --- File Manager -*- lexical-binding: t; -*-

;;; Commentary:
;; Treemacs as file manager

;;; Code:

(use-package treemacs
  :ensure t
  :config
  (setq treemacs-follow-after-init t
        treemacs-width 35
        treemacs-indentation 1
        treemacs-follow-after-init t
        treemacs-recenter-after-file-follow nil
        treemacs-collapse-dirs (if (executable-find "python") 3 0)
        treemacs-silent-refresh t
        treemacs-silent-filewatch t
        treemacs-change-root-without-asking t
        treemacs-sorting 'alphabetic-desc
        treemacs-show-hidden-files t
        treemacs-never-persist nil
        treemacs-is-never-other-window t
        treemacs-indentation-string (propertize " ⫶ " 'face 'font-lock-comment-face))
   :bind
   ([f8] . treemacs)
   ("C-c f" . treemacs-select-window))

(provide '02_treemacs)
;;; 02_treemacs.el ends here
