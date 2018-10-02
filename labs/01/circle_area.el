;;; circle_area.el computes the area of a circle
;;;
;;; Input: The radius of the circle
;;; Precondition: The radius is a positive number
;;; Output: The area of the circle
;;;
;;; Begun by: Dr. Adams, for CS 214 at Calvin College
;;; Completed by: Ian Christensen
;;; Date: February 2, 2018
;;;
;;; function circleArea computes a circle's area, given its radius
;;; Parameters: r, a number
;;; Precondition: r >= 0
;;; Returns: the area of the circle whose radius is r

(defun circleArea (radius)     ; begins function with parameter radius
  "Compute the area of a circle, passed its radius." ; documentation...
  (defconst PI 3.1415927)      ; define the constant pi as a float
  (* PI (* radius radius)))    ; this is some funky notation that means pi*r^2...

(defun circle_area(r)          ; define the function circle area and pass in r
 "Compute the area of a circle, given its radius interactively." ; documentation...
  (interactive "nEnter a circle's radius: "); prompt the user for the circle's radius
  (setq area (circleArea r))   ;  set the output of the function to area
  (message "The circle's area is %f." area))  ; output a message with the result
