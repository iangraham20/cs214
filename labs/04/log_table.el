;;; logTable.el displays a table of logarithms.
;;;
;;; Input: start, stop and increment, three reals.
;;; Precondition: start < stop and increment > 0.
;;; Output: A table of logarithms from start to stop,
;;;          with interval of increment.
;;;
;;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;;; Completed by: Ian Christensen, for CS 214 at Calvin College.
;;; Date: February 21, 2018

;;; displayLogTable() recursively generates the actual table of logs.
;;; Input: start and stop, the limit values for the table;
;;;             increment, the step value for the table;
;;;             buf, the buffer in which to display the table.
;;; Precondition: start < stop and increment > 0.
;;; Output: The table of logs from start to stop, by increment.
(defun displayLogTable (start stop increment buffer)
	(if (<= start stop)
		(progn
			(princ "The logarithm of " buffer)
			(princ start buffer)
			(princ " is " buffer)
			(princ (log10 start) buffer)
			(terpri buffer)
			(displayLogTable (+ start increment) stop increment buffer)
		)
	)
)

;;; main is a 'driver' for displayLogTable()
;;; Input: start, stop and increment.
;;; Output: The table of logs from start to stop by increment
;;;          in a buffer named 'logTable.out'.
(defun main (start stop increment)
  "print a table of logarithms"
   (interactive "nEnter starting value: \nnEnter stopping value: \nnEnter increment value: ")
   (if (get-buffer "log_table.out")
       (kill-buffer "log_table.out"))
   (setq buffer (switch-to-buffer-other-window "log_table.out"))
   (displayLogTable start stop increment buffer))
