;;; max.el searches a list for its maximum value.
;;;
;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;; Completed by: Ian Christensen, CS 214 at Calvin College
;;; Date: Spring 2018

(setq load-path (list "."))

(load "./workspace/214/projects/09/e-lisp/list.el")

(progn
  "test function Max"
  (let
    ((buf (get-buffer "max.el"))
    (list1 (list 99 88 77 66 55))
    (list2 (list 55 66 77 88 99))
    (list3 (list 55 77 99 88 66))
    (list4 (list 44 55 66 77 88)))

    (princ list1 buf)
    (terpri buf)

    (princ list2 buf)
    (terpri buf)

    (princ list3 buf)
    (terpri buf)

    (princ list4 buf)
    (terpri buf)

    (princ "The max in list 1 is " buf)
    (princ (Max1 list1) buf)
    (terpri buf)

    (princ "The max in list 2 is " buf)
    (princ (Max1 list2) buf)
    (terpri buf)
    
    (princ "The max in list 3 is " buf)
    (princ (Max1 list3) buf)
    (terpri buf)

    (princ "The max in list 4 is " buf)
    (princ (Max1 list4) buf)
    (terpri buf)

    (princ "The index of 99 in list 1 is " buf)
    (princ (Search1 list1 99) buf)
    (terpri buf)

    (princ "The index of 99 in list 2 is " buf)
    (princ (Search1 list2 99) buf)
    (terpri buf)

    (princ "The index of 99 in list 3 is " buf)
    (princ (Search1 list3 99) buf)
    (terpri buf)

    (princ "The index of 99 in list 4 is " buf)
    (princ (Search1 list4 99) buf)
    (terpri buf)
  )
)
