(use-package ibuffer
  :init
   (setq-default ibuffer-saved-filter-groups
                 `(("Default"
                   ("rg" (name . "\*rg.*\*"))
                   ("Dired" (mode . dired-mode))
                   ("Scratch" (name . "\*scratch.*"))
                   ("Temporary" (name . "\*.*\*")))))
   (setq ibuffer-show-empty-filter-groups nil)
  :config
   (define-key ibuffer-mode-map (kbd "M-o") nil)
   (global-set-key (kbd "C-x C-b") 'ibuffer)
   (add-hook 'ibuffer-mode-hook #'(lambda () (ibuffer-auto-mode 1))))

(use-package uniquify
  :ensure nil
  :custom
   (uniquify-buffer-name-style 'forward))

(use-package golden-ratio
  :ensure t)
