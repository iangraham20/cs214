#!/usr/bin/ruby
# average.rb averages the values of an array of doubles
#
# Input: array, an array of doubles AND size, a double
# Precondition: array, is an array of numbers
# Output: the average of the values in array
#
# Begun by: Dr. Adams, for CS 214 at Calvin College
# Completed by: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

# Function: computes the sum of an array of doubles
# Parameters: array, an array of doubles
# Preconditions: array, is an array of doubles
# Returns: the sum of the values in array
def sum(array)
	total = 0
	array.each do |item|
		total += item
	end
	total
end

# Function: computes the average of an array of doubles
# Parameters: array, an array of doubles
# Preconditions: array, is an array of doubles
# Returns: the average of the values in array
def average(array)
	if array.empty?
		return 0.0
	else
		return sum(array) / array.size()
	end
end

# Statement: main driver for average.rb
# Parameters: none
# Precondition: average.rb is the file being run
# Returns: formatted print statements testing sum and average
if __FILE__ == $0
array0 = []
array1 = [9.0, 8.0, 7.0, 6.0]
puts "sum 0 is: #{sum(array0)}\n"
puts "sum 1 is: #{sum(array1)}\n"
puts "average 0 is: #{average(array0)}\n"
puts "average 1 is: #{average(array1)}\n"
end
