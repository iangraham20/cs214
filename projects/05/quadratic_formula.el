;;; QuadraticFormula.rb computes the roots of a quadratic equation
;;; 
;;; Input: a, b, c, doubles
;;; Precondition: a != 0, and b^2 - 4ac are nonnegative
;;; Output: root1, root2, doubles
;;; 
;;; Author: Ian Christensen
;;; Date: February 28, 2018

" Function: computes the roots of a quadratic equation
  Precondition: a != 0, and b^2 - 4ac are nonnegative
  Parameters: a, b, c, doubles
  Returns: results, a list of doubles "
(defun quadratic_formula (a b c)
	(if (/= a 0)
		(progn
			(setq arg (- (expt b 2) (* (* 4 a) c)))
			(if (>= arg 0)
				(list (/ (+ (* -1 b) (sqrt arg)) (* 2 a)) (/ (-  (* -1 b) (sqrt arg)) (* 2 a)))
				"quadraticRoots(): b^2 - 4ac is negative!"
			)
		)
		"QuadraticRoots(): a is zero!"
	)
)

(defun main (a b c)
  (interactive "sTo compute the roots of a quadratic, \nEnter a, b, and c: ")
  (setq result (quadratic_formula a b c))
  (if (listp result)
      (progn
		(setq root1 (elt result 0))
		(setq root2 (elt result 1))
		(message "The first root is %f and the second root is %f" root1 root2)
		)
   (message result)
   )
)
