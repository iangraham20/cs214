;;; factorial.el a program that given an integer computes its factorial
;;; 
;;; Input: n, an integer
;;; Precondition: n is a positive integer
;;; Output: n! or the factorial of n
;;;
;;; Author: Ian Christensen, for CS 214 at Calvin College
;;; Date: February 22, 2018

;;; Function: factorial, computes the factorial of an integer
;;; Parameter: n, an integer
;;; Precondition: n is a positive integer
;;; Returns: answer, the factorial of n
(defun factorial(n i answer)
	(if (<= i n)
		(progn
		  (setq answer (* i answer))
		  (setq i (+ i 1))
	       	(factorial n i answer)
		) answer
	)
)

;;; Function: main, the interactive driver for factorial
;;; Parameter: n, user inputs
;;; Precondition: factorial.adb is being run
;;; Returns: interactive print statements
(defun main(n)
	(interactive "nEnter an integer value: ")
	(setq i 2)
	(setq a 1)
	(format "Factorial of %d is: %d" n (factorial n i a))
	)
