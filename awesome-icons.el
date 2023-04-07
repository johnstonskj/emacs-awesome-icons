;;; awesome-icons.el --- fontawesome code point lookup  -*- lexical-binding: t; -*-

;; Copyright (C) 2023 Simon Johnston

;; Author: Simon Johnston <johnstonskj@gmail.com>
;; Maintainer: Simon Johnston <johnstonskj@gmail.com>
;; Version: 0.0.1
;; Package-Requires: ((emacs "24.4"))
;; Homepage: homepage
;; Keywords: icons fontawesome

;; This file is not part of GNU Emacs.

;; Permission is hereby granted, free of charge, to any person obtaining a
;; copy of this software and associated documentation files (the "Software"),
;; to deal in the Software without restriction, including without limitation
;; the rights to use, copy, modify, merge, publish, distribute, sublicense,
;; and/or sell copies of the Software, and to permit persons to whom the
;; Software is furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
;; FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
;; DEALINGS IN THE SOFTWARE.

;;; Commentary:

;; Use Glyph-based icons from the fontawesome font.

;;; Code:

(require 'awesome-icons-data)

(defsubst awesome-icons--code-point-names ()
  (mapcar 'car fontawesome-alist))

(defun awesome-icons--completing-read ()
  (let ((comp-func (if ido-mode 'ido-completing-read 'completing-read)))
    (funcall comp-func "Font name: " (fontawesome--code-point-names) nil t)))

;;;###autoload
(defun awesome-icons-named (name)
  "Return fontawesome code point with NAME."
  (interactive
   (list (fontawesome--completing-read)))
  (assoc-default name fontawesome-alist))

(defun awesome-icons--propertize (glyph)
  (propertize glyph
              'face '(:family "FontAwesome" :height 1.5)))

(provide 'awesome-icons)

;;; awesome-icons.el ends here
