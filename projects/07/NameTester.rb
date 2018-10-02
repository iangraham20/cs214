# NameTester.rb tests class Name and its operations
# Begun by: Prof. Adams, for CS 214 at Calvin College
# Student: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

require 'test/unit/assertions'
include Test::Unit::Assertions

class Name
	# Constructor for Name object
	def initialize(first, middle, last)
		@first, @middle, @last = first, middle, last
	end

	# Stringifies the Name object
	def fullName()
		@first + ' ' + @middle + ' ' + @last
	end

	# Formats the Name object as a string
	def lfmiFormat()
		@last + ', ' + @first + ' ' + @middle[0] + '.'
	end

	# Prints the stringified Name object
	def printName()
		puts fullName()
		fullName()
	end

	def readName()
		print "Enter the first name: "
		@first = gets.chomp
		print "Enter the middle name: "
		@middle = gets.chomp
		print "Enter the last name: "
		@last = gets.chomp
	end

	# Accessor and mutator methods for the Name object
	attr_accessor :first, :middle, :last
end

if __FILE__ == $0
	# test constructor and getters
	name = Name.new("John", "Paul", "Jones")
	assert name.first == "John", "first failed"
	assert name.middle == "Paul", "middle failed"
	assert name.last == "Jones", "last failed"

	# test fullname lfmi and print
	assert name.fullName == "John Paul Jones", "fullName failed"
	assert name.lfmiFormat == "Jones, John P.", "lfmiFormat failed"
	assert name.printName == "John Paul Jones", "print failed"

	# test setters and getters
	name.first = "Joel";
	name.middle = "Scott";
	name.last = "Smith";
	assert name.first == "Joel", "first failed"
	assert name.middle == "Scott", "middle failed"
	assert name.last == "Smith", "last failed"

	# test setters further through fullname lfmi and print
	assert name.fullName == "Joel Scott Smith", "fullName failed"
	assert name.lfmiFormat == "Smith, Joel S.", "lfmiFormat failed"
	assert name.printName == "Joel Scott Smith", "print failed"

	# test readname and printname
	name.readName
	name.printName
	
	print "All tests passed!\n"
end
