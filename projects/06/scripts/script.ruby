Script started on Fri 09 Mar 2018 03:45:04 PM EST
igc2@thompson:~/workspace/214/projects/06$ cat array_processing.rb
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
# Parameters: array[], an array of doubles && size, an int && keyboard, a keyboard object
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
igc2@thompson:~/workspace/214/projects/06$ ruby array_processing.rb

Enter the size of the array: 3

Enter a value to store at index 1: -16934.08927

Enter a value to store at index 2: 14987. 

Enter a value to store at index 3: .09435029

The value at index 1 is: -16934.08927

The value at index 2 is: 14987.0

The value at index 3 is: 0.09435029

igc2@thompson:~/workspace/214/projects/06$ exit

Script done on Fri 09 Mar 2018 03:46:04 PM EST
