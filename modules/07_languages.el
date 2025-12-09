;;; 07_languages.el --- Languages Support -*- lexical-binding: t; -*-

;;; Commentary: 
;; Support for languages

;;; Code:

(use-package smartparens
  :ensure t
  :hook
  (prog-mode-hook text-mode prog-mode)
  :config
  (require 'smartparens-config))

(use-package rainbow-delimiters
  :ensure t
  :hook
  (prog-mode-hook . rainbow-delimiters-mode))

(use-package rainbow-mode
  :ensure t
  :config
  (setq rainbow-x-colors nil)
  :hook
  (emacs-lisp-mode text-mode lisp-mode))

(use-package fzf
  :ensure t)

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

(use-package go-mode 
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

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
                                        'yaml-mode . yaml-ts-mode)))
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode t)
  (yas-reload-all)
  :diminish yas-minor-mode)

(use-package yasnippet-snippets
  :ensure t)

(use-package eglot
  :ensure t
  :hook 
  (eglot-managed-mode . (lambda () (eglot-inlay-hints-mode -1)))
  ((c-mode c-ts-mode c++-mode c++-ts-mode rust-mode rust-ts-mode yaml-ts-mode) . eglot-ensure)
  ((python-ts-mode . eglot-ensure)
         (python-ts-mode . flymake-prog-mode)
         (python-ts-mode . superword-mode)
         (python-ts-mode . hs-minor-mode)
         (python-ts-mode . (lambda () (set-fill-column 88))))
  :bind (:map eglot-mode-map
              ("C-c la" . eglot-code-actions)
              ("C-c lr" . eglot-rename)
              ("C-c lf" . eglot-format)
              ("C-c lc" . eglot-reconnect)
              ("C-c ld" . eldoc))
  :custom
  (eglot-autoshutdown t)
  (eglot-events-buffer-size 0)
  (eglot-extend-to-xref nil)
  (eglot-ignored-server-capabilities
   '(:hoverProvider
     :documentHighlightProvider
     :documentFormattingProvider
     :documentRangeFormattingProvider
     :documentOnTypeFormattingProvider
     :colorProvider
     :foldingRangeProvider))
  (eglot-stay-out-of '(yasnippet)))

(use-package helpful
  :ensure t
  :commands (helpful-callable
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
  (helpful-max-buffers 7))

(use-package ansible
  :ensure t
  :hook
  (yaml-mode-hook . (lambda () (ansible-mode 1))))

(provide '07_languages)
;;; 07_languages.el ends here
