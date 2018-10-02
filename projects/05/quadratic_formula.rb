#!/usr/bin/ruby
# QuadraticFormula.rb computes the roots of a quadratic equation
# 
# Input: a, b, c, doubles
# Precondition: a != 0, and b^2 - 4ac are nonnegative
# Output: root1, root2, doubles
# 
# Author: Ian Christensen
# Date: February 28, 2018

# Function: computes the roots of a quadratic equation
# Precondition: a != 0, and b^2 - 4ac are nonnegative
# Parameters: a, b, c, doubles
# Returns: results, a list of doubles
def quadraticFormula(a, b, c)
	if a != 0 then 
		arg = b**2.0 - 4 * a * c
		if arg >= 0
			[((-b + Math.sqrt(arg)) / (2 * a)), ((-b - Math.sqrt(arg)) / (2 * a))]
		else
			print "quadraticFormula(): b^2 - 4ac is negative!"
		end
	else
		print "quadraticFormula(): a is zero!"
	end
end

if __FILE__ == $0
	puts "\nTo compute the roots of a quadratic, "
	print "enter a: "
	a = gets.chomp.to_f
	print "enter b: "
	b = gets.chomp.to_f
	print "enter c: "
	c = gets.chomp.to_f
	results = quadraticFormula(a, b, c)
	if results.is_a? Array then
		puts "\nThe first root is: #{results[0]}"
	  	print "and the second root is: #{results[1]}\n\n"
	 else
	 	print "#{results}\n\n"
	 end
end
