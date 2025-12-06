;;; 09_containers.el --- Container Support -*- lexical-binding: t; -*-

;;; Commentary: 
;; Manage Docker & Kubernetes

;;; Code:
(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

(use-package kubed
  :ensure t
  :bind
  ("C-c k" . 'kubed-prefix-map)
  ("C-c C-k" . 'kubed-transient))

(use-package k8s-mode
  :ensure t
  :config
  (setq k8s-site-docs-url "https://kubernetes.io/docs/reference/generated/kubernetes-api/"
        k8s-site-docs-version "v1.3"))

(provide '09_containers)
;;; 09_containers.el ends here
