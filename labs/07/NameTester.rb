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
