#! /usr/bin/ruby
# LetterGrades.rb recieves a numeric grade and calculates the equivalent letter grade
# Author: Ian Graham Christensen, for CS 214, at Calvin College
# Date: February 15, 2018
#
# Input: a numeric grade average
# Precondition: the grade is a positive integer value
# Output: a letter grade

# Function: letterGrade() recieves a numeric grade and calculates the equivalent letter grade
# Parameter: grade, an int
# Precondition: input is an integer more than 0 and less than 100
# Return: letter, a string
def letterGrades grade
	case grade
	when 90..100
		"A"
	when 80..89
		"B"
	when 70..79
		"C"
	when 60..69
		"D"
	when 0..60
		"F"
	else
		"Invalid input"
	end
end

if __FILE__ == $0 
	print "\nEnter a numeric grade point average: "
	grade = gets.to_i
	print "The equivalent letter grade is: "
	puts letterGrades(grade)
end
