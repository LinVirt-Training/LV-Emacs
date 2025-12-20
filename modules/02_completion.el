;;; 02-completion.el --- Completion Frameworks -*- lexical-binding: t; -*-

(use-package company
  :ensure t
  :config
   (add-hook 'after-init-hook 'global-company-mode))

(use-package company-box
  :ensure t
  :diminish t
  :hook 
   (company-mode . company-box-mode))`
 
(use-package ivy
  :ensure t
  :defer 0.1
  :diminish
  :bind (("C-c C-r" . ivy-resume)
         ("C-x B" . ivy-switch-buffer-other-window))
  :custom
   (ivy-count-format "(%d/%d) ")
   (ivy-use-virtual-buffers t)
  :config 
   '((ivy-mode 1)
    (t . ivy--regex-fuzzy)))

(use-package ivy-prescient
  :ensure t
  :init
  (ivy-prescient-mode 1))

(use-package ivy-rich
  :ensure t
  :after ivy
  :custom
   (ivy-virtual-abbreviate 'full
                           ivy-rich-switch-buffer-align-virtual-buffer t
                           ivy-rich-path-style 'abbrev)
  :config
   (ivy-set-display-transformer 'ivy-switch-buffer
                               'ivy-rich-switch-buffer-transformer))

(use-package counsel
  :ensure t
  :after ivy
  :config 
   (counsel-mode))

(use-package swiper
  :ensure t
  :after ivy
  :bind 
   (("C-s" . swiper)
    ("C-r" . swiper)))

(provide '02_completion)
;;; 02_completion.el ends here
