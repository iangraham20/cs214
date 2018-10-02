;;; lambda.el explores the lambda, apply, and funcall functions
;;; Author: Ian Christensen, for CS 214 at Calvin College
;;; Date: Spring, 2018

; PART 1:

(lambda (x) (+ x x))
; output: (lambda (x) (+ x x))
; returned itself because lambda creates a function from the given values

((lambda (x) (+ x x)) 17)
; output: 34
; returned the output that results from inputting 17 as the parameter x and then adding x to itself in the term "(+ x x)"

; EXERCISE 1A:

((lambda (w x y z) (max (abs w) (abs x) (abs y) (abs z))) -0.5 1 -10 -5.3)

10.0

; EXERCISE 1B:

((lambda (x y z) (+ x y z)) 1 2 3)
6

((lambda (x) (null x)) nil)
t

((lambda () 17.2))
17.2

; PART 2:

; (setq double (function (lambda (x) (+ x x))))
; first example before abbreviating

(setq double '(lambda (x) (+ x x)))
(lambda (x) (+ x x))

; (double 11) this failed because double is not the definition of the function

(funcall double 11)      ; should produce 22
22 ; good it returned 22

(setq triple '(lambda (x) (* x 3))) ; define triple
(lambda (x) (* x 3)) ; registering the function worked

(funcall triple 11) ; calling triple should produce 33
33 ;good it returned 33

(apply '+ '(1 2 3))    ; should return 6
6

(apply '+ 1 2 '(3 4 5)) ;valid
15

(apply '+ 1 '(3 4 5) 2) ;invalid
; eval: Wrong type argument: listp, 2

(funcall '+ 1 2 3 4)
10

(funcall 'cons 'a '(b))
(a b)

(mapcar 'evenp '(1 2 3 4))
(mapcar 'oddp '(1 2 3 4))
(mapcar 'abs '(-1 2 -3 4 -5))
(1 2 3 4 5)

(defun subtract-n (n list)
    (mapcar '(lambda (x) (- x n)) list))
subtract-n

(subtract-n 2 '(2 4 6))
(0 2 4)

; EXERCISE 2:

(defun sum-squares (alist)
  (apply '+ (mapcar '(lambda (x) (* x x)) alist)))

sum-squares


(sum-squares '(1 2 3))          ; should return 14
14

(sum-squares '(1 2 3 4 5))      ; should return 55
55

(sum-squares '(-1 -2 -3 0 1))   ; should return 15 
15
