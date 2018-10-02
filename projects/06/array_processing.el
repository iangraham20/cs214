;;; ArrayProcessing.java allows a user to store and print values in an array
;;;
;;; Input: the array size and the individual values
;;; Precondition: the input values are doubles
;;; Output: prints out the values contained in array
;;;
;;; Author: Ian Christensen, CS 214 at Calvin College
;;; Date: Spring, 2018

  "Function: prompts the user to specify the array values
   Parameters: array[], an array of doubles, size, an int
   Preconditions: user inputs are doubles
   Returns: values within array "
(defun readArray (array size)
  (setq i 0)
  (while (> size i)
    (aset array i (string-to-number (read-string "Enter a value to store: ")))
    (setq i (+ i 1))
  )
)

  "Function: prints an arrays values
   Parameters: array[], an array of doubles, size, an int
   Preconditions: array contains values
   Returns: prints out the values contained in array"
(defun printArray(array)
  (eval array)
)

(defun main (size)
  (interactive "\nnEnter the size of the array: ")
  (setq array (make-vector size 0))
  (readArray array size)
  (printArray array)
)