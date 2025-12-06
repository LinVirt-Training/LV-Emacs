;;; 04_vterm.el --- VTerm Shell -*- lexical-binding: t; -*-

;;; Commentary:
;; Terminal Emulator vterm
;; And set the default terminal to bash for all shells

;;; Code:
(use-package vterm
  :ensure t
  :config
  (setq vterm-shell "/bin/bash")
  :bind
  ("M-g t" . vterm))
  
(use-package emacs
  :ensure nil
  :custom
  (setq-default explicit-shell-file-name "/bin/bash"))

(provide '04_vterm)

;;; 04_vterm.el ends here
