;;; 04_shell.el --- Shell stuff-*- lexical-binding: t; -*-

;;; Commentary:
;; Terminal Emulator 
;; And set the default terminal to bash for all shells

;;; Code:
  
(use-package emacs
  :ensure nil
  :custom
  (setq-default explicit-shell-file-name "/bin/bash"))

(use-package eat
 :ensure t)

(provide '04_shell)

;;; 04_shell.el ends here
