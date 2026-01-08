(use-package pdf-tools
   :ensure t
   :defer t
   :config
       (pdf-tools-install)
       (setq-default pdf-view-display-size 'fit-page))
