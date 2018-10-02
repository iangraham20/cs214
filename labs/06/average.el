;;; average.el averages the values of an array of doubles
;;;
;;; Input: array, an array of doubles AND size, a double
;;; Precondition: array, is an array of numbers
;;; Output: the average of the values in array
;;;
;;; Begun by: Dr. Adams, for CS 214 at Calvin College
;;; Completed by: Ian Christensen, for CS 214 at Calvin College
;;; Date: Spring, 2018

" Function: computes the sum of an array of doubles
  Parameters: array, an array of doubles
  Preconditions: array, is an array of doubles
  Returns: the sum of the values in array "
(defun sum (array size)
  (if (vectorp array)
      (if (<= size 0)
          0.0
        (+ (aref array (- size 1)) (sum array (- size 1))))
    nil)
  )

" Function: computes the average of an array of doubles
  Parameters: array, an array of doubles
  Preconditions: array, is an array of doubles
  Returns: the average of the values in array "
(defun average (array)
	(if (vectorp array)
		(if (<= (length array) 0)
			0.0
			(/ (sum array (length array)) (length array))
		)
	)
)

" Function: main driver for average.el
  Parameters: none
  Precondition: none
  Returns: formatted print statements testing sum and average "
(defun main ()
	(setq array0 [])
	(setq array1 [9.0 8.0 7.0 6.0])
	(message "The first sum is %f and the second sum is %f\n
            The first average is %f and the second average is %f"
            (sum array0 (length array0)) (sum array1 (length array1)) 
        	(average array0) (average array1)
    )
)
