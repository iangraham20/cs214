#! /usr/bin/ruby
# rectangle_area.rb computes the area of a rectangle given its length and width
#
# Input: the length and width of a rectangle
# Precondition: the length and width are not negative
# Output: the area of the rectangle
#
# Author: Ian Christensen
# Date: February 1, 2018

# function rectangleArea returns a rectangle's area, given its length and width
# Parameters: l, a number && w, a number
# Precondition: l > 0 && w > 0
# Returns: the area of a rectangle whose length is l and whose width is w
def rectangleArea(l, w)	# Declare the definition of the area function passing in the length and width
	l * w				# Compute the area by multiplying the length and width
end						# End the function

if __FILE__ == $0								# If the main file is being run than procede
	puts "To compute the are of a rectangle,"	# Output a message followed by a newline char
	print " enter its length: "					# Prompt the user for the length
	l = gets.chomp.to_f							# Store the length as a float
	print " enter its width: "					# Prompt the user for the width
	w = gets.chomp.to_f							# Store the width as a float
	print "The rectangle's area is: "			# Output a message without a newline char
	puts rectangleArea(l, w)					# Output the final result
end												# End the if statement
