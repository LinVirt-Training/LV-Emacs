
;;; 01_themes.el --- Themes and Icons -*- lexical-binding: t; -*-

;;; Commentary:
;; Themes, Icons, and Fonts

;;; Code:

(use-package ef-themes
  :ensure t)

(use-package doric-themes
  :ensure t)

(use-package standard-themes
  :ensure t)

(use-package modus-themes
  :ensure t
  :config
  (modus-themes-load-theme 'ef-deuteranopia-light))

(use-package lin
  :ensure t
  :hook
  (after-init . lin-global-mode))

(use-package emacs
  :ensure nil
  :custom
  (setopt inhibit-compacting-font-caches t) 
  (set-face-attribute 'default nil :family "JetBrains Mono" :height 120 
                      'fixed-pitch nil :family "JetBrains Mono" :height 120 
                      'variable-pitch nil :family "Baskerville" :height 130))
   
(use-package minions
  :ensure t
  :init
  (minions-mode)
  :custom
  (minions-mode-line-lighter "#")
  (minions-direct '(flymake mode cider-mode)))

(use-package moody
  :ensure t
  :config
  (moody-replace-mode-line-front-space)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))

(provide '01_themes)
;;; 01_themes.el ends here
