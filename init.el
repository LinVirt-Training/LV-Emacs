;;; -*- lexical-binding: t -*-

(use-package display-line-numbers
  :ensure nil
  :config
  :custom 
   ((display-line-numbers-type 1 "Relative line numbers.")))

;; File Handling
(use-package files
  :ensure nil
  :init
   (save-place-mode 1) 
   (recentf-mode 1)    
   (savehist-mode 1)   
  :custom 
   (make-backup-files nil)

   (auto-save-default nil)

   (create-lockfiles  nil)
   (require-final-newline t)
  :hook 
   (before-save . #'delete-trailing-whitespace))

;; Terminal and Shell
(load-file (concat user-emacs-directory "modules/shell.el"))

;; Buffer and Window management
(load-file (concat user-emacs-directory "modules/buffers.el"))

;; Project Management and Git
(load-file (concat user-emacs-directory "modules/projects.el"))

;; Emacs Completion Framework
(load-file (concat user-emacs-directory "modules/completion.el"))

;; Emacs Themes
(load-file (concat user-emacs-directory "modules/themes.el"))

;; Emacs Org Configuration
(load-file (concat user-emacs-directory "modules/org.el"))

;; PDF Reader
(load-file (concat user-emacs-directory "modules/pdf.el"))

;; Support  for Programming Languages
(load-file (concat user-emacs-directory "modules/languages.el"))

;; Emacs and Ollama
(load-file (concat user-emacs-directory "modules/ai.el"))

;; Spell
(load-file (concat user-emacs-directory "modules/spell.el"))
