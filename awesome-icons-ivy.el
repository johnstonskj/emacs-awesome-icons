;;; awesome-icons-ivy.el --- awesome-icons Ivy integration -*- lexical-binding: t -*-

;; Author: Simon Johnston <johnstonskj@gmail.com>
;; Maintainer: Simon Johnston <johnstonskj@gmail.com>
;; Version: 0.0.1
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: icons fontawesome ivy

;; This file is not part of GNU Emacs

;; See awesome-icons.el for license information.

;;; Commentary:

;; commentary

;;; Code:

(require 'awesome-icons)

(declare-function ivy-read "ivy")

;;;###autoload
(defun awesome-icons-ivy ()
  "Perform completion using Ivy."
  (interactive)
  (require 'ivy)
  (ivy-read "Font awesome> " (awesome-icons--construct-candidates)
            :action (lambda (font)
                      (insert (cdr font)))))

(provide 'awesome-icons-ivy)

;;; awesome-icons-ivy.el ends here
