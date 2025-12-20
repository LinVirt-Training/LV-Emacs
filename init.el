;;; init.el --- Init -*- lexical-binding: t; -*-

(use-package emacs
  :ensure nil
  :config
   (setq column-number-mode t
         show-paren-mode    1  
         use-short-answers  1
         custom-init (locate-user-emacs-file "custom-init.el")
         custom-file (locate-user-emacs-file "custom-config.el")
         use-dialog-box     nil))

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

;; More Configuration
(load-file (concat user-emacs-directory "modules/01_themes.el"))
(load-file (concat user-emacs-directory "modules/02_completion.el"))
(load-file (concat user-emacs-directory "modules/03_buffers.el"))
(load-file (concat user-emacs-directory "modules/04_shell.el"))
(load-file (concat user-emacs-directory "modules/05_pdf.el"))
(load-file (concat user-emacs-directory "modules/06_org.el"))
(load-file (concat user-emacs-directory "modules/07_spell.el"))
(load-file (concat user-emacs-directory "modules/08_languages.el"))
(load-file (concat user-emacs-directory "modules/09_ai.el"))
(load-file (concat user-emacs-directory "modules/10_containers.el"))
(load-file (concat user-emacs-directory "modules/11_projects.el"))
