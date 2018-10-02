;;; split.el splits a string into two substrings
;;;
;;; Input: aString, a string and pos, an integer
;;; Precondition: pos is in aString's Range
;;; Output: The substrings of Astring split by pos
;;;
;;; Begun by: Dr. Adams, for CS 214 at Calvin College
;;; Completed by: Ian Christensen, for CS 214 at Calvin College
;;; Date: February 23, 2018
;;;

"Function: split, splits a string according to the position specified
 Paramters: string, a string, position, an integer, and results, an array of strings
 Precondition: position is in aString's Range
 Passback: The substrings of astring split by position"
(defun split (astring pos)
	(list (substring astring 0 pos) (substring astring pos))
	)

(defun main (aString pos)
  (interactive "sEnter the string to be split: \nnEnter the split position")
  (setq result (split aString pos))
  (setq part1 (elt result 0))
  (setq part2 (elt result 1))
  (message "The first part is %s and the second part is %s" part1 part2))
