;;; rectangle_area.el computes the area of a rectangle
;;;
;;; Input: The length and width of a rectangle
;;; Precondition: The length and width are positive numbers
;;; Output: The area of a rectangle
;;;
;;; Author: Ian Christensen
;;; Date: February 2, 2018

;;; Function rectangleArea computes the area of a rectangle, given its length and width
;;; Parameters: l, w
(defun rectangleArea (l w)	; define the function and pass in a length and width
  (* l w))				; multiply length and width to calculate area

rectangleArea

(defun rectangle_area(l w)	; define the function that prompts the user
  (interactive "nEnter a rectangle's length:\nnEnter a rectangle's width: ")	; prompt the user for the length and width
  (setq area (rectangleArea l w))	; set area to the functions output using the users input
  (message "The rectangle's area is %f." area))	; output a message and the resulting area
