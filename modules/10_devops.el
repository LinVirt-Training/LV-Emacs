;;; 11_devops.el --- DevOps tools  -*- lexical-binding: t; -*-

;;; Commentary: 
;; Terraform, Ansible etc

;;; Code:

(use-package terraform-mode
  :ensure t
  :custom 
  (terraform-indent-level 4)
  :config
  (defun my-terraform-mode-init ()
    )
  :hook
  (terraform-mode-hook . my-terraform-mode-init))

(provide '11_devops)
;;; 11_devops.el ends here
