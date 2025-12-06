;;; 08_ai.el --- Use Ollama AI -*- lexical-binding: t; -*-

;;; Commentary:
;; Query Local Ollama installation

;;; Code:
(use-package ellama
  :ensure t
  :bind ("C-c e" . ellama)
  :hook (org-ctrl-c-ctrl-c-final . ellama-chat-send-last-message)
  :init 
  (setopt ellama-auto-scroll t)
  :config
  (ellama-context-header-line-global-mode +1)
  (ellama-session-header-line-global-mode +1))

(provide '08_ai)
;;; 08_ai.el ends here
