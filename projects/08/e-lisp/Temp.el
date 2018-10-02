;;; temperature.el implements class Temperature
;;; Author: Ian Christensen, for CS 214 at Calvin College
;;; Date: Spring, 2018

"Subroutine: initialize, 
 Precondition: degrees and scale have values
 Input: degrees, a real & scale, a character
 Output: a Temperature object"
(defun Temp(myDegrees myScale)
  (if (= (validate myDegrees myScale) 1)
      (list myDegrees myScale)
    (princ "Error: Init(): invalid temperatures")))

"Function: getDegrees, accessor for degrees variable
 Parameters: Temperature object
 Preconditions: myDegrees is initialized as a double value
 Returns: myDegrees, a double"
(defun getDegrees(atemp)
  (car atemp))

"Function: getScale, accessor for degrees variable
 Parameters: Temperature object
 Preconditions: myScale is initialized as a char value
 Returns: myScale, a double"
(defun getScale(atemp)
  (car (cdr atemp)))

"Subroutine: toCelsius, mutator for scale conversion
 Precondition: @scale and @degrees are initialized
 Input: a Temperature object
 Output: new Temperature object with @scale == 'C'"
(defun toCelsius (atemp)
  (setq scale (upcase (getScale atemp)))
  (if (string= scale "F")
      (setq convertedDegrees (/ (- (getDegrees atemp) 32) 1.8))
    (if (string= scale "K")
(setq convertedDegrees (- (getDegrees atemp) 273.15))
      (setq convertedDegrees (getDegrees atemp))))
  (Temp convertedDegrees "C"))

"Subroutine: toFahrenheit, mutator for scale conversion
 Precondition: @scale and @degrees are initialized
 Input: a Temperature object
 Output: new Temperature object with @scale == 'F'"
(defun toFahrenheit (atemp)
  (setq scale (upcase (getScale atemp)))
  (if (string= scale "C")
      (setq convertedDegrees (+ 32 (* (getDegrees atemp) 1.8)))
    (if (string= scale "K")
(setq convertedDegrees (+ 32 (* (/ 9 5) (- (getDegrees atemp) 273.15))))
      (setq convertedDegrees (getDegrees atemp))))
  (Temp convertedDegrees "F"))

"Subroutine: toKelvin, mutator for scale conversion
 Precondition: @scale and @degrees are initialized
 Input: a Temperature object
 Output: new Temperature object with @scale == 'K'"
(defun toKelvin (atemp)
  (setq scale (upcase (getScale atemp)))
  (if (string= scale "F")
      (setq convertedDegrees (+ (/ (- (getDegrees atemp) 32) 1.8) 273.15))
  (if (string= scale "C")
	  (setq convertedDegrees (+ (getDegrees atemp) 273.15))
      (setq convertedDegrees (getDegrees atemp))))
  (Temp convertedDegrees "K"))

"Subroutine: fromString, input for user strings
 Precondition: temperature_string is in format 
 Input: String_Temp, a String
 Output: new Temperature object"
(defun fromString()
  (setq inputList (split-string (read-from-minibuffer "Enter Temperature: ")))
  (setq scale (getScale inputList))
  (setq degrees (string-to-number (getDegrees inputList)))
  (Temp degrees scale))

"Subroutine: toString, stringifies a Temperature object
 Precondition: @degrees and @scale are initialized
 Input: a Temperature object
 Output: String format of a Temperature object"
(defun toString (atemp buf)
  (princ (getDegrees atemp) buf)
  (princ " ")
  (princ (upcase (getScale atemp)) buf))

"Subroutine: raiseTemp, mutator that increments a temperature's degree
 Postcondition: the result cannot exceed the Planck Temperature
 Input: a Temperature object & RaiseInc, a float
 Output: new Temperature object with raised degree"
(defun raise (atemp degrees)
  (Temp (+ (getDegrees atemp) degrees) (getScale atemp)))

"Subroutine: lowerTemp, mutator that decrements a temperature's degree
 Postcondition: the result cannot deceed absolute zero
 Input: a Temperature object & LowerInc, a float
 Output: new Temperature object with lowered degree"
(defun lower (atemp degrees)
  (Temp (- (getDegrees atemp) degrees) (getScale atemp)))

"Subroutine: equalTo, equality operator for temperature regardless of scale
 Preconditions: otherTemp is a valid Temperature object
 Input: otherTemp, a Temperature object
 Output: true if equal, false if not equal"
 (defun equalTo(theTemp otherTemp)
	(cond
		((string= (getScale theTemp) "C")
			(= (getDegrees theTemp) (getDegrees (toCelsius otherTemp))))
		((string= (getScale theTemp) "F")
			(= (getDegrees theTemp) (getDegrees (toFahrenheit otherTemp))))
		((string= (getScale theTemp) "K")
			(= (getDegrees theTemp) (getDegrees (toKelvin otherTemp))))
		(t "Invalid Input")
	)
 )

"Subroutine: lessThan, less than operator for temperature regardless of scale
 Precondition: otherTemp is a valid Temperature object
 Input: otherTemp, a Temperature object
 Output: true if less than, false if not less than"
(defun lessThan(theTemp otherTemp)
	(cond
		((string= (getScale theTemp) "C")
			(if (< (getDegrees theTemp) (getDegrees (toCelsius otherTemp))) 1 0))
		((string= (getScale theTemp) "F")
			(if (< (getDegrees theTemp) (getDegrees (toFahrenheit otherTemp))) 1 0))
		((string= (getScale theTemp) "K")
			(if (< (getDegrees theTemp) (getDegrees (toKelvin otherTemp))) 1 0))
		(t "Invalid Input")
	)
)

"Subroutine: validateTemperature, assesses whether the degree and scale are valid
 Precondition: Degrees and Scale exist
 Input: degrees, a double & scale, a char
 Output: true, if a valid temperature"
(defun validate(degrees myScale)
  (setq scale (upcase myScale))

  (cond ((string= scale "F")
(if (>= degrees -351.67)
     1
   (progn
     (princ "Error: validate() F: less than absolute 0")
     0)))
((string= scale "C")
  (if (>= degrees -273.15)
      1
    (progn
      (princ "Error: validate() C: less than absolute 0")
      0)))

  ((string= scale "K")
   (if (>= degrees 0)
       1
     (progn
       (princ "Error: validate() K: less than absolute 0")
       0)))
  (t (error "Error validate(): not a valid scale"))))

(byte-compile-file "/home/igc2/workspace/214/projects/08/e-lisp/Temp.el")
