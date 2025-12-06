;;; 05_pdf.el --- PDF Viewer -*- lexical-binding: t; -*-

;;; Commentary:
;; PDF viewer

;;; Code:
(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install :no-query)
  (custom-set-variables
  '(pdf-tools-handle-upgrades t))
  (setq-default pdf-view-display-size 'fit-page)
  (setq pdf-annot-active-created-annotations t
        pdf-view-resize-factor 1.1))

(provide '05_pdf)
;;; 05_pdf.el ends here
