# !usr/bin/ruby
# factorial.rb a program that given an integer computes its factorial
# 
# Input: n, an integer
# Precondition: n is a positive integer
# Output: n! or the factorial of n
#
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: February 22, 2018

# Function: factorial, computes the factorial of an integer
# Parameter: n, an integer
# Precondition: n is a positive integer
# Returns: answer, the factorial of n
def factorial n
	answer = 1
	for i in 2..n
		answer *= i
	end
	answer
end 

# Statement: __FILE__, the interactive driver for factorial
# Parameter: user inputs
# Precondition: factorial.rb is being run
# Returns: interactive print statements
if __FILE__ == $0
	print "Enter an integer value: "
	n = gets.chomp.to_i
	puts "Factorial of #{n} is: #{factorial(n)}"
end
