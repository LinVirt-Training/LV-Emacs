;;; 01_themes.el --- Themes and Icons -*- lexical-binding: t; -*-

(use-package emacs
  :ensure nil
  :custom
  (setopt inhibit-compacting-font-caches t) 
  (set-face-attribute 'default nil :family "JetBrains Mono" :height 120 
                      'fixed-pitch nil :family "JetBrains Mono" :height 120 
                      'variable-pitch nil :family "Baskerville" :height 130))

(use-package mood-line
  :ensure t
  :config 
   (mood-line-mode))
  
(use-package nerd-icons 
  :ensure t)

(use-package nerd-icons-ivy-rich
  :ensure t
  :init
   (nerd-icons-ivy-rich-mode 1)
   (ivy-rich-mode 1))
 
(use-package modus-themes
  :ensure t
  :demand
  :init
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs t
        modus-themes-variable-pitch-ui t
	modus-themes-mixed-fonts t
        modus-themes-prompts '(bold)
        modus-themes-completions nil
        modus-themes-org-blocks 'tinted-background 
        modus-themes-headings '((1 . (light variable-pitch 1.5))
                                (agenda-date . (1.3))
                                (agenda-structure . (variable-pitch light 1.8))
						        (t . (medium))))
  (customize-set-variable 'modus-themes-common-palette-overrides
                          `(
                            (bg-mode-line-active bg-inactive)
                            (fg-mode-line-active fg-main)
                            (bg-mode-line-inactive bg-inactive)
                            (fg-mode-line-active fg-dim)
                            (border-mode-line-active bg-inactive)
                            (border-mode-line-inactive bg-main)
                            (bg-region "mac:selectedTextBackgroundColor")
                            (fg-region "mac:selectedTextColor")
                            ))
  (customize-set-variable 'modus-operandi-deuteranopia-palette-overrides
                          `(
                            (bg-inactive "#efefef")))
  (customize-set-variable 'modus-vivendi-deuteranopia-palette-overrides
                          `(
                            (bg-inactive "#202020"))))

(provide '01_themes)
;;; 01_themes.el ends here
