;;; year_codes.el is a driver for function yearCode.
;;;
;;; Input: year, a string.
;;; Precondition: year is one of {freshman, sophomore, junior or senior
;;; Output: the integer code corresponding to year
;;;
;;; Begun by: Dr. Adams, for CS 214 at Calvin College
;;; Completed by: Ian Christensen, for CS 214 at Calvin College
;;; Date: February 14, 2018

;;; year_code returns the code for a given academic year
;;; Input: year, a string
;;; Precondition: year is one of {freshman, sophomore, junior or senior}
;;; Output: the integer code corresponding to year
(defun yearCodes (year)
  (if (string= year "freshman") 1
  (if (string= year "sophomore") 2
  (if (string= year "junior") 3
  (if (string= year "senior") 4
   0
  )))))

;;; Function
;;; Input: year, a string
;;; Precondition: year is one of {freshman, sophomore, junior or senior}
;;; Output: code corresponding to year
(defun main (year)
 (interactive "sEnter your academic year: ")  ; read year
 (message "%d" (yearCodes year)))              ; display its code
