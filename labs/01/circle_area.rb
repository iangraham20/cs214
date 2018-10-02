#! /usr/bin/ruby
# circle_area.rb computes the area of a circle given its radius
# 
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: Ian Christensen
# Date: January 31, 2018
#
# Input: the radius of a circle
# Precondition: the radius is not negative
# Output: the area of the circle.
#
# function circleArea returns a circle's area, given its radius
# Parameters: r, a number
# Precondition: r > 0.
# Returns: the area of a circle whose radius is r.

PI = 3.1415927		# Set global constant of Pi to 3.14...
def circleArea(r)	# Declare a function named circleArea that takes a parameter r (the radius)
    PI * r ** 2 	# Calculate the area of the circle using the given values
end					# Indicate the end of the statement

if __FILE__ == $0							# Only begin prompts if this is the main file being run
   puts "To compute the area of a circle,"	# Outputs a statement followed by a newline
   print " enter its radius: "				# Outputs a statement without a newline
   radius = gets.chomp.to_f					# Sets a local variable named radius to an input value and converts it to a float
   print "The circle's area is: "			# Outputs a statement without a newline
   puts circleArea(radius)					# Outputs the returned value of the circleArea function using the local radius value
end											# Indicates the end of the statement
