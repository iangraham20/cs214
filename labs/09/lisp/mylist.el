;;; mylist.el is a "module" of list operations
;;;
;;; Begun by: Dr. Adams, CS 214 at Calvin College
;;; Completed by: Ian Christensen, CS 214 at Calvin College
;;; Date: Spring 2018

"Subroutine: Max2, finds the maximum of two values
 Receive: val1, val2, two values
 Precondition: val1 and val2 can be compared using <
 Return: the maximum of val1 and val2"
(defun Max2 (val1 val2)
	(if (> val1 val2)
		val1
		val2
	)
)

"Subroutine: Max, finds the maximum value in a list
 Receive: aList, a list of values
 Precondition: values in aList can be compared using <
 Return: the maximum value in aList"
(defun Max(aList)
 (if (listp aList)
 	(if (null aList)
 		nil
	 	(if (eql (length aList) 1)
	 		(car aList)
	 		(Max2 (car aList) (Max (cdr aList)))
	 	)
 		nil
 	)
 )
)
