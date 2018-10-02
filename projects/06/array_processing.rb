#!/usr/bin/ruby
# ArrayProcessing.rb allows a user to store and print values in an array
#
# Input: the array size and the individual values
# Precondition: the input values are doubles
# Output: prints out the values contained in array
#
# Author: Ian Christensen, CS 214 at Calvin College
# Date: Spring, 2018

# Function: prompts the user to specify the array values
# Parameters: array[], an array of doubles && size, an int
# Preconditions: user inputs are doubles
# Returns: values within array
def readArray(array, size)
	for i in 1..size
		print "\nEnter a value to store at index #{i}: "
		array[i] = gets.chomp.to_f
	end
end

# Function: prints an arrays values
# Parameters: array[], an array of doubles && size, an int
# Preconditions: array contains values
# Returns: prints out the values contained in array
def printArray(array, size)
	for i in 1..size
		puts "\nThe value at index #{i} is: #{array[i]}"
	end
	puts "\n"
end

if __FILE__ == $0
	print "\nEnter the size of the array: "
	size = gets.chomp.to_i
	array = Array.new(size)
	readArray(array, size)
	printArray(array, size)
end
