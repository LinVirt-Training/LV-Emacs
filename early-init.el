;;; -*- lexical-binding: t -*-
    
;; Disable package.el
(setq package-enable-at-startup nil)

;; Elpaca
(defvar elpaca-installer-version 0.11)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (<= emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                          "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (let ((load-source-file-function nil)) (load "./elpaca-autoloads"))))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

;; Install use-package support
(elpaca elpaca-use-package
;; Enable use-package :ensure support for Elpaca.
(elpaca-use-package-mode))

(setq gc-cons-threshold 10000000)
(add-hook 'after-init-hook
          (lambda ()
             (setq gc-cons-threshold 1000000)
             (message "gc-cons-threshold restored to %S"
                       gc-cons-threshold)))

(setq custom-file (make-temp-file "custom-init.el"))

(use-package emacs
  :ensure nil
  :config
   (setq auto-revert-interval 1            
         auto-fill-function 'do-auto-fill
         column-number-mode t
         create-lockfiles nil              
         custom-init (locate-user-emacs-file "custom-init.el")
         echo-keystrokes 0.1               
         enable-recursive-minibuffers t    
         fill-column 79                    
         frame-inhibit-implied-resize 1    
         frame-resize-pixelwise t          
         indent-tabs-mode nil              
         inhibit-startup-screen t          
         initial-scratch-message nil
	 menu-bar-mode nil
         recentf-max-saved-items 10000     
         ring-bell-function 'ignore
         scroll-bar-mode nil
         scroll-margin 1
         sentence-end-double-space nil
         show-paren-mode    1  
         split-height-threshold nil        
         split-width-threshold 160         
         tab-width 4
         tool-bar-mode nil
         truncate-lines t                  
         use-dialog-box     nil
         use-short-answers  1))
