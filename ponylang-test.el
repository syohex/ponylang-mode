;;; ponylang-test.el --- Tests for ponylang-mode
;;
;; Author: Austin Bingham <austin.bingham@gmail.com>
;; Version: 1
;; URL: https://github.com/abingham/ponylang-mode.el
;; Keywords: programming
;; Package-Requires: ()
;;
;; This file is not part of GNU Emacs.
;;
;; Copyright (c) 2015 Austin Bingham
;;
;;; Commentary:
;;
;; Description:
;;
;; Tests for ponylang-mode
;;
;; The tests are built using the standard `ert' module, so you can run
;; them using a number of techniques. For example:
;;
;;     (require 'ponylang-test)
;;     (ert-run-tests-interactively "ponylang-test")
;;
;;; License:
;;
;; Permission is hereby granted, free of charge, to any person
;; obtaining a copy of this software and associated documentation
;; files (the "Software"), to deal in the Software without
;; restriction, including without limitation the rights to use, copy,
;; modify, merge, publish, distribute, sublicense, and/or sell copies
;; of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
;; BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
;; ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
;; CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

;;; Code:

(require 'ert)
(require 'ponylang-mode)

;; NB: These don't really work right now, but hopefully someday. I've
;; kept them around as a reminder.

(defconst ponylang-test-indenting-keywords
  '("repeat" "until" "while" "for" "be" "new" "use" "try" "else" "if" "ref" "then" "fun" "tag"))

(defconst ponylang-test-non-indenting-keywords
  '("let" "end" "var"))

(ert-deftest ponyland-test-keyword-based-indentation ()
  "Test that some keywords start new indentation."
  (dolist (k ponylang-test-indenting-keywords)
    (with-temp-buffer
      (ponylang-mode)
      (insert k)
      (newline)
      (ponylang-indent-line)
      (should (= (current-indentation) tab-width)))))

(ert-deftest ponyland-test-end-maintains-indentation ()
  "Test that the end keyword sets indentation correctly.."
  (dolist (k ponylang-test-non-indenting-keywords)
    (with-temp-buffer
      (ponylang-mode)
      (insert "end")
      (newline)
      (ponylang-indent-line)
      (should (= (current-indentation) 0)))))

;;; ponylang-test.el ends here
