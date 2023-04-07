;;; awesome-icons-helm.el --- awesome-icons Helm integration -*- lexical-binding: t -*-

;; Author: Simon Johnston <johnstonskj@gmail.com>
;; Maintainer: Simon Johnston <johnstonskj@gmail.com>
;; Version: 0.0.1
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: icons fontawesome helm

;; This file is not part of GNU Emacs

;; See awesome-icons.el for license information.

;;; Commentary:

;; commentary

;;; Code:

(require 'awesome-icons)

(declare-function helm "helm")
(declare-function helm-build-sync-source "helm")

(defun awesome-icons--construct-candidates ()
  (mapcar (lambda (fontawesome)
            (cons (concat (car fontawesome)
                          " -> "
                          (fontawesome--propertize
                           (cdr fontawesome)))
                  (cdr fontawesome)))
          fontawesome-alist))

(defun awesome-icons---source (fontawesome-alist)
  (helm-build-sync-source
   "Select FontAwesome Icon: "
   :candidates (fontawesome--construct-candidates)
   :action (lambda (candidate)
             (insert (fontawesome--propertize candidate)))
   :candidate-number-limit 9999))

;;;###autoload
(defun awesome-icons-helm ()
  (interactive)
  (require 'helm)
  (helm :sources (fontawesome---source fontawesome-alist)))

(provide 'awesome-icons-helm)

;;; awesome-icons-helm.el ends here
