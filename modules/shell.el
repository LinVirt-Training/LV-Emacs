(use-package emacs
  :ensure nil
  :custom
   (setq-default explicit-shell-file-name "/bin/bash"))

(use-package vterm
  :ensure t
  :config
   (setq vterm-shell "/bin/bash"))
