
;;; 03_ibuffer.el --- LV Emacs Buffer Management -*- lexical-binding: t; -*-

;;; Commentary:
;; Use IBuffer by default

;;; Code:

(use-package nerd-icons-ibuffer 
  :ensure t
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

(use-package ibuffer 
  :ensure nil
  :config
  (setq ibuffer-expert t
        ibuffer-display-summary nil
        ibuffer-use-other-window nil
        ibuffer-show-empty-filter-groups nil
        ibuffer-default-sorting-mode 'filename/process
        ibuffer-title-face 'font-lock-doc-face
        ibuffer-use-header-line t
        ibuffer-default-shrink-to-minimum-size nil
        ibuffer-formats
        '((mark modified read-only locked " "
                (name 30 30 :left :elide)
                " "
                (size 9 -1 :right)
                " "
                (mode 16 16 :left :elide)
                " " filename-and-process)
          (mark " "
                (name 16 -1)
                " " filename))))

(provide '03_ibuffer)
;;; 03_ibuffer.el ends here
