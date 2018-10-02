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

;;; max.el searches a list for its maximum value.
;;;
;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;; Completed by: Ian Christensen, CS 214 at Calvin College
;;; Date: Spring 2018

(setq load-path (list "."))

("." "/usr/share/emacs24/site-lisp/a2ps" "/etc/emacs24" "/etc/emacs" "/usr/local/share/emacs/24.5/site-lisp" "/usr/local/share/emacs/site-lisp" "/usr/share/emacs24/site-lisp/erlang" "/usr/share/emacs24/site-lisp/dictionaries-common" "/usr/share/emacs24/site-lisp/cmake-data" "/usr/share/emacs/site-lisp/autoconf" "/usr/share/emacs/24.5/site-lisp" "/usr/share/emacs/24.5/site-lisp/a2ps" ...)

(load "/workspace/214/labs/09/lisp/mylist.el")

t

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

(99 88 77 66 55)
(55 66 77 88 99)
(55 77 99 88 66)
The max in list 1 is 99
The max in list 2 is 99
The max in list 3 is 99
t
