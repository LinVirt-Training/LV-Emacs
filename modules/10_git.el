;;; 10_git.el --- Git Magic  -*- lexical-binding: t; -*-

;;; Commentary: 
;; Git and Magit configuration

;;; Code:

(use-package ediff
  :ensure nil
  :commands (ediff-buffers ediff-files ediff-buffers3 ediff-files3)
  :init
  (setq ediff-split-window-function 'split-window-horizontally
        ediff-window-setup-function 'ediff-setup-windows-plain)
  :config
  (setq ediff-keep-variants nil
        ediff-make-buffers-readonly-at-startup nil
        ediff-merge-revisions-with-ancestor t
        ediff-show-clashes-only t))

(use-package diff-mode
  :ensure nil
  :defer t
  :config
  (setq diff-default-read-only t
        diff-advance-after-apply-hunk t
        diff-update-on-the-fly t
        diff-refine t
        diff-font-lock-prettify t 
        diff-font-lock-syntax nil))

(use-package vc
  :ensure nil
  :bind
  (
   :map global-map
   ("C-x v B" . vc-annotate) 
   ("C-x v e" . vc-ediff)
   ("C-x v k" . vc-delete-file) 
   ("C-x v G" . vc-log-search)  
   ("C-x v t" . vc-create-tag)
   ("C-x v c" . vc-clone) 
   ("C-x v d" . vc-diff)
   ("C-x v ." . vc-dir-root) 
   ("C-x v <return>" . vc-dir-root)
   :map vc-dir-mode-map
   ("t" . vc-create-tag)
   ("O" . vc-log-outgoing)
   ("o" . vc-dir-find-file-other-window)
   ("d" . vc-diff)         
   ("k" . vc-dir-delete-file)
   ("G" . vc-revert)
   :map vc-git-stash-shared-map
   ("a" . vc-git-stash-apply-at-point)
   ("c" . vc-git-stash) 
   ("k" . vc-git-stash-delete-at-point) 
   ("p" . vc-git-stash-pop-at-point)
   ("s" . vc-git-stash-snapshot)
   :map vc-annotate-mode-map
   ("M-q" . vc-annotate-toggle-annotation-visibility)
   ("C-c C-c" . vc-annotate-goto-line)
   ("<return>" . vc-annotate-find-revision-at-line)
   :map log-edit-mode-map
   ("M-s" . nil) 
   ("M-r" . nil) 
   :map log-view-mode-map
   ("<tab>" . log-view-toggle-entry-display)
   ("<return>" . log-view-find-revision)
   ("s" . vc-log-search)
   ("o" . vc-log-outgoing)
   ("f" . vc-log-incoming)
   ("F" . vc-update)
   ("P" . vc-push))
  :init
  (setq vc-follow-symlinks t)
  :config
  (require 'vc-annotate)
  (require 'vc-dir)
  (require 'vc-git)
  (require 'add-log)
  (require 'log-view)
  (setq vc-handled-backends '(Git)
        vc-dir-save-some-buffers-on-revert t
        log-edit-confirm 'changed
  	log-edit-keep-buffer nil
  	log-edit-require-final-newline t
  	log-edit-setup-add-author nil
        vc-annotate-display-mode 'scale 
        vc-git-log-edit-summary-target-len 50
        vc-git-log-edit-summary-max-len 70)
        add-log-mailing-address "frederik.vos@linvirt.com"
        add-log-keep-changes-together t
        vc-find-revision-no-save t
        vc-git-diff-switches '("--patch-with-stat" "--histogram")
        vc-git-log-switches '("--stat")
        vc-git-print-log-follow t
        vc-git-revision-complete-only-branches nil 
        vc-git-root-log-format
               `("%d %h %ai %an: %s"
                 ,(concat "^\\(?:[*/\\|]+\\)\\(?:[*/\\| ]+\\)?"
                          "\\(?2: ([^)]+) \\)?\\(?1:[0-9a-z]+\\) "
                          "\\(?4:[0-9]\\{4\\}-[0-9-]\\{4\\}[0-9\s+:-]\\{16\\}\\) "
                          "\\(?3:.*?\\):")
                 ((1 'log-view-message)
                  (2 'change-log-list nil lax)
                  (3 'change-log-name)
                  (4 'change-log-date)))
  (require 'log-edit)
  (remove-hook 'log-edit-hook #'log-edit-show-files))

(use-package project
  :ensure nil
  :bind
  (("C-x p ." . project-dired)
   ("C-x p C-g" . keyboard-quit)
   ("C-x p <return>" . project-dired)
   ("C-x p <delete>" . project-forget-project))
  :config
  (setopt project-switch-commands
          '((project-find-file "Find file")
            (project-find-regexp "Find regexp")
            (project-find-dir "Find directory")
            (project-dired "Root dired")
            (project-vc-dir "VC-Dir")
            (project-shell "Shell")
            (keyboard-quit "Quit")))
  (setq project-vc-extra-root-markers '(".project")
        project-key-prompt-style t)) 

(use-package magit
  :ensure t
  :bind 
  (("C-x g" . magit-status)))

(use-package magit-repos
  :ensure nil 
  :commands (magit-list-repositories)
  :init
  (setq magit-repository-directories
        '(("~/NextCloud/Documents/Training" . 1))))

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(provide '10_git)
;;; 10_git.el ends here
