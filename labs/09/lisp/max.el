;;; max.el searches a list for its maximum value.
;;;
;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;; Completed by: Ian Christensen, CS 214 at Calvin College
;;; Date: Spring 2018

(setq load-path (list "."))

(load "/home/igc2/workspace/214/labs/09/lisp/mylist.el")

(progn
  "test function Max"
  (let
    ((buf (get-buffer "max.el"))
    (list1 (list 99 88 77 66 55))
    (list2 (list 55 66 77 88 99))
    (list3 (list 55 77 99 88 66)))

    (princ list1 buf)
    (terpri buf)

    (princ list2 buf)
    (terpri buf)

    (princ list3 buf)
    (terpri buf)

    (princ "The max in list 1 is " buf)
    (princ (Max list1) buf)
    (terpri buf)

    (princ "The max in list 2 is " buf)
    (princ (Max list2) buf)
    (terpri buf)
    
    (princ "The max in list 3 is " buf)
    (princ (Max list3) buf)
    (terpri buf)
  )
)
