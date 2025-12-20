;;; 05_pdf.el --- PDF Viewer -*- lexical-binding: t; -*-

;;; Commentary:
;; PDF viewer
;; Code:

(use-package pdf-tools
   :ensure t
   :defer t
   :config
       (pdf-tools-install)
       (setq-default pdf-view-display-size 'fit-page))

;;; 05_pdf.el ends here
