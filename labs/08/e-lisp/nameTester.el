;;; nameTester.el simulates and tests an e-LISP Name type
;;; Begun by: Dr. Adams, CS 214 at Calvin College
;;; Completed by: Ian Christensen, CS 214 at Calvin College
;;; Date: Spring, 2018

(setq load-path (cons "." load-path))

(load "/home/igc2/workspace/214/labs/08/e-lisp/Name.el")

"A simple driver for our Name functions"
(progn
  (require 'cl)
  (setq aName (Name "John" "Paul" "Jones"))
  (assert (equal (getFirst aName) "John"))
  (assert (equal (getMiddle aName) "Paul"))
  (assert (equal (getLast aName) "Jones"))
  (assert (equal (getFullName aName) "John Paul Jones"))
  (setq buf (get-buffer "nameTester.el"))
  (assert (eq (printName aName buf) aName) )
  (terpri buf)
  (princ "All tests passed!" buf)
  (terpri buf)
)
