(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config 
   (projectile-mode)
  :custom 
   ((projectile-completion-system 'ivy))
  :bind-keymap
   ("C-c p" . projectile-command-map)
  :init
  (setq projectile-switch-project-action #'projectile-dired))

(use-package find-file-in-project
  :ensure t
  :init
   (ivy-mode 1))

(use-package transient 
  :ensure t)

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

(use-package treemacs
  :ensure t
  :defer t
  :init
   (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
   (progn
     (setq treemacs-buffer-name-function            #'treemacs-default-buffer-name
           treemacs-buffer-name-prefix              " *Treemacs-Buffer-"
           treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
           treemacs-deferred-git-apply-delay        0.5
           treemacs-directory-name-transformer      #'identity
           treemacs-display-in-side-window          t
           treemacs-eldoc-display                   'simple
           treemacs-file-event-delay                2000
           treemacs-file-extension-regex            treemacs-last-period-regex-value
           treemacs-file-follow-delay               0.2
           treemacs-file-name-transformer           #'identity
           treemacs-follow-after-init               t
           treemacs-expand-after-init               t
           treemacs-find-workspace-method           'find-for-file-or-pick-first
           treemacs-git-command-pipe                ""
           treemacs-goto-tag-strategy               'refetch-index
           treemacs-header-scroll-indicators        '(nil . "^^^^^^")
           treemacs-hide-dot-git-directory          t
           treemacs-hide-dot-jj-directory           t
           treemacs-indentation                     2
           treemacs-indentation-string              " "
           treemacs-is-never-other-window           nil
           treemacs-max-git-entries                 5000
           treemacs-missing-project-action          'ask
           treemacs-move-files-by-mouse-dragging    t
           treemacs-move-forward-on-expand          nil
           treemacs-no-png-images                   nil
           treemacs-no-delete-other-windows         t
           treemacs-project-follow-cleanup          nil
           treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
           treemacs-position                        'left
           treemacs-read-string-input               'from-child-frame
           treemacs-recenter-distance               0.1
           treemacs-recenter-after-file-follow      nil
           treemacs-recenter-after-tag-follow       nil
           treemacs-recenter-after-project-jump     'always
           treemacs-recenter-after-project-expand   'on-distance
           treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
           treemacs-project-follow-into-home        nil
           treemacs-show-cursor                     nil
           treemacs-show-hidden-files               t
           treemacs-silent-filewatch                nil
           treemacs-silent-refresh                  nil
           treemacs-sorting                         'alphabetic-asc
           treemacs-select-when-already-in-treemacs 'move-back
           treemacs-space-between-root-nodes        t
           treemacs-tag-follow-cleanup              t
           treemacs-tag-follow-delay                1.5
           treemacs-text-scale                      nil
           treemacs-user-mode-line-format           nil
           treemacs-user-header-line-format         nil
           treemacs-wide-toggle-width               70
           treemacs-width                           35
           treemacs-width-increment                 1
           treemacs-width-is-initially-locked       t
           treemacs-workspace-switch-cleanup        nil))
     (treemacs-follow-mode t)
     (treemacs-filewatch-mode t)
     (treemacs-fringe-indicator-mode 'always)
     (autoload 'treemacs-define-doubleclick-action "treemacs-mouse-interface" nil nil)
  :bind
       (("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

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
