(use-package emacs
  :init
    (add-to-list 'default-frame-alist '(font . "JetBrains Mono-15")))

(use-package diminish
  :ensure t)

(use-package moody
  :ensure t
  :config
   (setq x-underline-at-descent-line t)
   (moody-replace-mode-line-buffer-identification)
   (moody-replace-vc-mode))

(use-package minions
  :ensure t
  :demand t
  :config
   (minions-mode 1))

(use-package solaire-mode
  :ensure t
  :demand t
  :config
   (solaire-global-mode +1))

(use-package nerd-icons 
  :ensure t)

(use-package nerd-icons-ivy-rich
  :ensure t
  :init
   (nerd-icons-ivy-rich-mode 1)
   (ivy-rich-mode 1))

(use-package treemacs-nerd-icons
  :ensure t
  :config
  (treemacs-nerd-icons-config))

(use-package ef-themes
  :ensure t
  :init
   (ef-themes-take-over-modus-themes-mode 1)
  :bind
   (("<f5>" . modus-themes-rotate)
    ("C-<f5>" . modus-themes-select)
    ("M-<f5>" . modus-themes-load-random))
  :config
   (setq modus-themes-mixed-fonts t
         modus-themes-italic-constructs t)
   (modus-themes-load-theme 'ef-maris-dark))
