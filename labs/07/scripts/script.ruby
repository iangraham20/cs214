Script started on Mon 26 Mar 2018 03:23:16 PM EDT
igc2@church:~/workspace/214/labs/07$ cat NameTester.rb
# NameTester.rb tests class Name and its operations
# Begun by: Prof. Adams, for CS 214 at Calvin College
# Student: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

require 'test/unit/assertions'
include Test::Unit::Assertions

# Class for a name object
class Name
	def initialize(first, middle, last)
		@first, @middle, @last = first, middle, last
	end

	def fullName()
		@first + ' ' + @middle + ' ' + @last
	end

	def print()
		puts fullName()
		fullName()
	end

	attr_reader :first, :middle, :last
end

# Driver for testing the name class
if __FILE__ == $0
	name = Name.new("John", "Paul", "Jones")
	assert name.first == "John", "first failed"
	assert name.middle == "Paul", "middle failed"
	assert name.last == "Jones", "last failed"
	assert name.fullName == "John Paul Jones", "fullName failed"
	assert name.print == "John Paul Jones", "print failed"
	print "All tests passed!\n"
end
igc2@church:~/workspace/214/labs/07$ ruby NameTester.rb
John Paul Jones
All tests passed!
igc2@church:~/workspace/214/labs/07$ exit

Script done on Mon 26 Mar 2018 03:23:32 PM EDT
