;;; 04_shell.el --- Shell stuff-*- lexical-binding: t; -*-

(use-package emacs
  :ensure nil
  :custom
  (setq-default explicit-shell-file-name "/bin/bash"))

(use-package vterm
  :ensure t
  :config
   (setq vterm-shell "/bin/bash"))

(provide '04_shell)

;;; 04_shell.el ends here
