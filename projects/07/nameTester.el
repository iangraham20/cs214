;;; nameTester.el simulates and tests an e-LISP Name type.
;;; Begun by: Prof. Adams, for CS 214 at Calvin College
;;; Student: Ian Christensen, for CS 214 at Calvin College
;;; Date: Spring, 2018

" Name constructs a name from three strings
  Receive: first, middle and last, three strings
  Return: the triplet (forename middle surname) "
(defun Name (forename middle surname)
  (list forename middle surname)
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

" setFirst sets the first name of a name object
  Receive: theName, a Name & forename, a string "
(defun setFirst (theName forename)
  (setcar theName forename)
)

" setMiddle extracts the middle name of a name object
  Receive: theName, a Name & middle, a string "
(defun setMiddle (theName middle)
  (setcar (cdr theName) middle)
)

" setLast extracts the last name of a name object
  Receive: theName, a Name & surname, a string "
(defun setLast (theName surname)
  (setcar (cdr (cdr theName)) surname)
)

" getFullName returns a full name in F-M-L order
  Receive: theName, a Name
  Return: myFirst, myMiddle, myLast "
(defun getFullName (theName)
  (concat (getFirst theName) " " (getMiddle theName) " " (getLast theName))
)

" lfmiFormat returns a full name in L-F-M order
  Receive: theName, a Name
  Return: myFirst, myMiddle, myLast as a single string "
(defun lfmiFormat (theName)
  (concat (getLast theName) ", " (getFirst theName) " " (substring (getMiddle theName) 0 1) ".")
)

" printName displays a name object
  Receive: theName, a Name, 
           buffer, the name of a buffer
  Output: the strings in theName to buffer "
(defun printName (theName buffer)
  (princ theName buffer)
)

"  newName receives user input to set a new name
   Receive: theName, a Name
   Output: the strings in theName to buffer "
(defun newName (theName)
  (setFirst theName (read-string "Enter the first name: "))
  (setMiddle theName (read-string "Enter the middle name: "))
  (setLast theName (read-string "Enter the last name: "))
)

;;; A simple driver for our Name functions
(progn
  (require 'cl)
  (setq aName (Name "John" "Paul" "Jones"))
  (assert (equal (getFirst aName) "John" ))
  (assert (equal (getMiddle aName) "Paul" ))
  (assert (equal (getLast aName) "Jones" ))
  (assert (equal (getFullName aName) "John Paul Jones" ))
  (assert (equal (lfmiFormat aName) "Jones, John P."))
  (setq buf (get-buffer "nameTester.el"))
  (assert (eq (printName aName buf) aName))

  (setFirst aName "Joel")
  (setMiddle aName "Scott")
  (setLast aName "James")
  (assert (equal (getFirst aName) "Joel" ))
  (assert (equal (getMiddle aName) "Scott" ))
  (assert (equal (getLast aName) "James" ))
  (assert (equal (getFullName aName) "Joel Scott James" ))
  (assert (equal (lfmiFormat aName) "James, Joel S."))
  (setq buf (get-buffer "nameTester.el"))
  (assert (eq (printName aName buf) aName))

  (newName aName)
  (setq buf (get-buffer "nameTester.el"))
  (assert (eq (printName aName buf) aName))
  (terpri buf)
  (princ "All tests passed!" buf)
  (terpri buf)
)
