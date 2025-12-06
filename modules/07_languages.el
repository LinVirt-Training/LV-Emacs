;;; 07_languages.el --- Languages Support -*- lexical-binding: t; -*-

;;; Commentary: 
;; Support for languages

;;; Code:

(use-package eglot
  :ensure nil
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
  :config
  (add-to-list 'eglot-server-programs
               '(yaml-ts-mode . ("ansible-language-server" "--stdio")))
  :custom
  (eglot-autoshutdown t)
  (eglot-report-progress nil))

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
  :custom
  (yas-verbosity 1) 
  (yas-wrap-around-region t)
  :config
  (yas-global-mode))

(use-package yasnippet-snippets     
  :ensure t)

(use-package ansible
  :ensure t
  :hook
  (yaml-mode-hook . (lambda () (ansible-mode 1))))

(provide '07_languages)
;;; 07_languages.el ends here
