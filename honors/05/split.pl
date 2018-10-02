#!/usr/bin/perl -w
# split.pl is a class and program that splits a string into two substrings
#
# Input: string, a string, and position, an integer
# Precondition: position is in string's Range
# Output: The substrings of string split by position
#
# Begun By: Ian Christensen, for CS 214 at Calvin College
# Completed By:
# Date:

use strict;
use feature qw(say);

# Function: splitter() splits a string according to the position specified
# Parameters: string is a string, position is an integer, and results is an array of strings
# Precondition: position is in string's Range
# Output: The substrings of string split by position

# Replace this line with the definition of splitter()

if (__FILE__ eq $0) {
	print "\nTo split a string, enter the string: "; 
	chomp(my $string = <STDIN>);
	print "Enter the split position: ";
	chomp(my $position = <STDIN>);
	my @results = splitter($string, $position);
	say "\nThe first part is: $results[0]";
	say "and the second part is: $results[1]\n";
}
