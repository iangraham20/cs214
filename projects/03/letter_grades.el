;;; LetterGrades.java recieves a numeric grade and calculates the equivalent letter grade
;;; Author: Ian Graham Christensen, for CS 214, at Calvin College
;;; Date: February 15, 2018
;;; 
;;; Input: a numeric grade average
;;; Precondition: the grade is a positive integer value
;;; Output: a letter grade

;;; Function: recieves a numeric grade and calculates the equivalent letter grade
;;; Parameter: grade, an int
;;; Precondition: parameter is a positive integer value
;;; Return: letter, a char
(defun letterGrades(grade)
	(cond ((>= grade 90) "A")
	      ((>= grade 80) "B")
	      ((>= grade 70) "C")
	      ((>= grade 60) "D")
	      ((>= grade 0) "F")
	      (t "Invalid Input")
	))

(defun main (grade)
	(interactive "nEnter a numeric grade point average: ")
	(setq letter (letterGrades grade))
	(message "The equivalent letter grade is: %s" letter)
	)
