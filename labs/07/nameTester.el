;;; nameTester.el simulates and tests an e-LISP Name type.
;;; Begun by: Prof. Adams, for CS 214 at Calvin College
;;; Student: Ian Christensen, for CS 214 at Calvin College
;;; Date: Spring, 2018

" Name constructs a name from three strings
  Receive: first, middle and last, three strings
  Return: the triplet (given middle family) "
(defun Name (given middle family)
  (list given middle family)
)

" getFirst extracts the first name of a name object
  Receive: theName, a Name
  Return: the first string in theName "
(defun getFirst (theName)
  (car theName)
)

" getMiddle extracts the middle name of a name object
  Receive: theName, a Name
  Return: the second string in theName "
(defun getMiddle (theName)
  (car (cdr theName))
)

" getLast extracts the last name of a name object
  Receive: theName, a Name
  Return: the third string in theName "
(defun getLast (theName)
  (car (cdr (cdr theName)))
)

" getFullName returns a full name in F-M-L order
  Receive: theName, a Name
  Return: myFirst, myMiddle, myLast "
(defun getFullName (theName)
  (concat (getFirst theName) " " (getMiddle theName) " " (getLast theName))
)

" printName displays a name object
  Receive: theName, a Name, 
           buffer, the name of a buffer
  Output: the strings in theName to buffer "
(defun printName (theName buffer)
  (princ theName buffer)
)

;;; A simple driver for our Name functions
(progn
  (require 'cl)                              ; assert
  (setq aName (Name "John" "Paul" "Jones"))  ; build a Name
  (assert (equal (getFirst aName) "John" ))  ; test it
  (assert (equal (getMiddle aName) "Paul" ))
  (assert (equal (getLast aName) "Jones" ))
  (assert (equal (getFullName aName) "John Paul Jones" ))
  (setq buf (get-buffer "nameTester.el"))    ; buf = this buffer
  (assert (eq (printName aName buf) aName) ) ; output
  (terpri buf)                               ; newline
  (princ "All tests passed!" buf)            ; feedback
  (terpri buf)                               ; newline
)
