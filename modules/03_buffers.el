;;; 03_buffers.el --- Bufferi and Window Management -*- lexical-binding: t; -*-

(use-package uniquify
  :ensure nil
  :custom
   (uniquify-buffer-name-style 'forward))
 
(use-package ibuffer
  :init
  (setq-default ibuffer-saved-filter-groups
                `(("Default"
                   ("rg" (name . "\*rg.*\*"))
                   ("Dired" (mode . dired-mode))
                   ("Scratch" (name . "\*scratch.*"))
                   ("Temporary" (name . "\*.*\*"))
                   )))
  (setq ibuffer-show-empty-filter-groups nil)
  :config
  (define-key ibuffer-mode-map (kbd "M-o") nil)
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  (add-hook 'ibuffer-mode-hook #'(lambda () (ibuffer-auto-mode 1))))

(use-package buffer-move
  :ensure t
  :bind (("<C-S-up>" . buf-move-up)
         ("<C-S-down>" . buf-move-down)
         ("<C-S-left>" . buf-move-left)
         ("<C-S-right>" . buf-move-right)))

(use-package avy
  :ensure t
  :bind (("C-c i" . avy-goto-char-timer)))

(use-package ace-window
  :ensure t
  :bind 
   ("C-c o" . ace-window))

(use-package golden-ratio
  :ensure t)

(provide '03_buffers)
;;; 03_buffers.el ends here
