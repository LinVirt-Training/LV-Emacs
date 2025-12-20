;;; early-init.el --- Early Init File -*- lexical-binding: t; no-byte-compile: t -*-

;; Disable package.el
(setq package-enable-at-startup nil)

;; Minimal UI
(menu-bar-mode -1) 
(tool-bar-mode -1) 
(scroll-bar-mode -1) 

;; Straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

;;; early-init.el ends here 
