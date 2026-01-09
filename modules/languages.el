(use-package indent-bars
  :ensure t
  :custom
   (indent-bars-no-descend-lists t) 
   (indent-bars-treesit-support t)
   (indent-bars-treesit-ignore-blank-lines-types '("module"))
   (indent-bars-treesit-scope '((python function_definition class_definition for_statement
           if_statement with_statement while_statement)))
  :hook 
   ((python-mode yaml-mode) . indent-bars-mode))

(use-package markdown-mode
  :ensure t
  :mode
   ("README\\.md\\'" . gfm-mode)
   ("\\.md\\'" . markdown-mode)
   ("\\.Rmd\\'" . markdown-mode)
   ("\\.markdown\\'" . markdown-mode)
  :init
   (setq markdown-command "multimarkdown")
  :config
    (setq markdown-enable-math t
         markdown-fontify-code-blocks-natively t)
  :bind 
   (:map markdown-mode-map
         ("C-c C-e" . markdown-do)
         ("M-p" . markdown-previous-visible-heading)
         ("M-n" . markdown-next-visible-heading)))

(use-package yaml-pro-ts-mode
  :ensure nil
  :config
   (add-to-list 'global-treesit-auto-modes '(not org-mode))
   (setq treesit-auto-install t)
   (global-treesit-auto-mode)
  :hook
   ((yaml-mode . highlight-indentation-mode)
    (yaml-ts-mode . highlight-indentation-mode)
    (yaml-mode . yaml-pro-ts-mode)))

(use-package ini-mode
  :ensure t
  :config
   (add-to-list 'auto-mode-alist '("\\.ini\\'" . ini-mode)))

(use-package treesit-auto
  :ensure t
  :custom
   (treesit-auto-install 'prompt)
  :config
   (treesit-auto-add-to-auto-mode-alist 'all)
   (global-treesit-auto-mode))

(use-package emacs
  :ensure nil
  :custom
   (add-to-list 'major-mode-remap-alist '((python-mode . python-ts-mode)
                                           yaml-mode . yaml-ts-mode)))

(use-package yasnippet
  :ensure t
  :config
   (yas-global-mode t)
   (yas-reload-all)
  :diminish
   yas-minor-mode)

(use-package yasnippet-snippets
  :ensure t)

(use-package f
  :ensure t)

(use-package lsp-mode
  :ensure t
  :init
   (setq lsp-keymap-prefix "C-c l")
  :hook ((python-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands
   lsp)

(use-package lsp-ivy
  :ensure t
  :commands
   lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :ensure t
  :commands
   lsp-treemacs-errors-list)
