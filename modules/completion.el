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
  :init
   (ivy-mode 1)
  :config
   (setq ivy-use-virtual-buffers t
         enable-recursive-minibuffers t
         ivy-display-style 'fancy
         ivy-re-builders-alist '((ivy-bibtex . ivy--regex-ignore-order)
                                 (t . ivy--regex-fuzzy)))
  :custom
   (ivy-count-format "(%d/%d) ")
   (ivy-use-virtual-buffers t)
  :bind
   (("C-s" . 'swiper-isearch)
    ("C-c C-r" . ivy-resume)
    ("C-x B" . ivy-switch-buffer-other-window)
    ("C-r" . 'swiper-backward)))

(use-package counsel
  :ensure t
  :after ivy
  :init
   (counsel-mode t)
  :bind
   (("C-x C-r" . 'counsel-recentf)
    ("C-c i" . 'counsel-imenu)
    ("C-c c" . 'counsel-org-capture)
    ("C-x b" . 'ivy-switch-buffer))
  :config
  (setq counsel-grep-base-command "rg -S -M 120 --no-heading --line-number --color never %s %s"))

(use-package prescient
  :ensure t
  :config
   (prescient-persist-mode))

(use-package ivy-prescient
  :ensure t
  :config
   (ivy-prescient-mode))

(use-package ivy-hydra
  :ensure t)

(use-package ivy-rich
  :ensure t
  :after ivy
  :custom
   (ivy-virtual-abbreviate 'full
                           ivy-rich-switch-buffer-align-virtual-buffer t
                           ivy-rich-path-style 'abbrev)
  :config
   (ivy-rich-mode 1)
   (ivy-set-display-transformer 'ivy-switch-buffer
                               'ivy-rich-switch-buffer-transformer))

(use-package which-key
  :diminish
  :init
   (setq which-key-idle-delay 1.0)
   (which-key-mode))

(use-package swiper
  :ensure t
  :after ivy
  :bind 
   (("C-s" . swiper)
    ("C-r" . swiper)))

(use-package helpful
  :ensure t
  :commands
   (helpful-callable
    helpful-variable
    helpful-key
    helpful-command
    helpful-at-point
    helpful-function)
  :bind
   ([remap describe-command] . helpful-command)
   ([remap describe-function] . helpful-callable)
   ([remap describe-key] . helpful-key)
   ([remap describe-symbol] . helpful-symbol)
   ([remap describe-variable] . helpful-variable)
  :custom
  (helpful-max-buffers 7)
  :config
   (setq counsel-describe-function-function #'helpful-callable
         counsel-describe-variable-function #'helpful-variable))
