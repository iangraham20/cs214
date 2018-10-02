#!/usr/bin/ruby
# split.rb is a class and program that splits a string into two substrings
#
# Input: string, a string, and position, an integer
# Precondition: position is in string's Range
# Output: The substrings of string split by position
#
# Begun by: Dr. Adams, for CS 214 at Calvin College
# Completed by: Ian Christensen, for CS 214 at Calvin College
# Date: February 23, 2018

# Function: split() splits a string according to the position specified
# Parameters: string is a string, position is an integer, and results is an array of strings
# Precondition: position is in string's Range
# Output: The substrings of string split by position
def split(string, position)
	[string[0, position], string[position..-1]]
end

if __FILE__ == $0
  print "\nTo split a string, enter the string: "; 
  string = gets
  print "Enter the split position: "; 
  position = gets.to_i
  results = split(string, position)
  puts "\nThe first part is: " << results[0]
  puts "and the second part is: " << results[1] << "\n"
end
