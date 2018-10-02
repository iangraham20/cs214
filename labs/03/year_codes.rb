# !/usr/bin/ruby
# year_codes.rb translates an academic year into a numeric code
# Begun by: Dr. Nelesen, for CS 214 at Calvin College 
# Completed by: Ian Christensen, for CS 214, at Calvin College
# Date: February 13, 2018
#
# Input: The name of an academic year
# Precondition: The academic year is a string with a value of freshman, sophomore, junior or senior
# Output: The corresponding integer code for the given academic year

def yearCode year	# declare the yearCode function/method definition
	if year =~ /freshman/	# check for freshman
		1	# return the corresponding number
	elsif year =~ /sophomore/	# check for sophomore
		2	# return the corresponding number
	elsif year =~ /junior/	# check for junior
		3	# return the corresponding number
	elsif year =~ /senior/	# check for senior
		4	# return the corresponding number
	else	# catch any unexpected inputs
		0	# return 0 for all invalid inputs
	end	# end the if statment...this took me forever to figure out...
end	# end the yearCode function

if __FILE__ == $0	# if the file is being run
   print "Enter the year: "	# prompt the user for the year
   year = gets	# store the input in year
   print "Numeric code is: "	# output a message
   puts yearCode(year)	# output the corresponding year
end	# end the if statement

