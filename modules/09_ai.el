;;; 09_ai.el --- Use Ollama AI -*- lexical-binding: t; -*-

(use-package gptel
  :ensure t
  :init
   (gptel-make-ollama "Ollama"             
    :host "localhost:11434"
    :stream t             
    :models '(qwen3:latest)))

(use-package ollama-buddy
  :ensure t
  :bind 
   ("C-c l" . ollama-buddy-menu))

(provide '09_ai)
;;; 09_ai.el ends here
