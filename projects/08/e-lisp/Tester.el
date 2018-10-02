;;; Tester.el simulates and tests an e-LISP Temperature type
;;; Author: Ian Christensen, CS 214 at Calvin College
;;; Date: Spring, 2018

(setq load-path (cons "." load-path))

"A simple driver for our Temperature functions"
(progn
  (load "/home/igc2/workspace/214/projects/08/e-lisp/Temp.el")
 
  (message "Enter a base Temperature: ")
  (setq baseTemp (fromString))
  (message "Enter a limit Temperature: ")
  (setq limitTemp (fromString))
  (setq increment (string-to-number
   (read-from-minibuffer "Enter an increment value: ")))


  (setq buf (get-buffer "nameTester.el"))
  (terpri buf)
  (princ "Celsius   |   Fahrenheit   |   Kelvin")
  (while (= (lessThan baseTemp limitTemp) 1)
    (toString (toFahrenheit baseTemp) buf)
    (princ "   |   ")
    (toString (toCelsius baseTemp) buf)
    (princ "   |   ")
    (toString (toKelvin baseTemp) buf)
    (terpri buf)
    (setq baseTemp (raise baseTemp increment)))
  
  (terpri buf)
  (princ "All tests passed!" buf)
  (terpri buf))