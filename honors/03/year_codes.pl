#!/usr/bin/perl -w
# year_codes.pl translates an academic year into a numeric code
#
# Input: The name of an academic year
# Precondition: The academic year is a string with a value of freshman, sophomore, junior or senior
# Output: The corresponding integer code for the given academic year
#
# Begun by: Ian Christensen, for CS 214 at Calvin College
# Completed by:
# Date:

use strict;
use feature qw(say);

# Subroutine: yearCode, computes an academic year into a numeric value
# Parameter: year, a string
# Precondition: year is one of {freshman, sophomore, junior, or senior}
# Returns: the integer code corresponding to academic year

# Replace this line with the definition of the function year_codes()

if (__FILE__ eq $0) {
	print "Enter the academic year: ";
	chomp(my $year = <STDIN>);
	say "The equivelant numeric code is: ", year_codes($year);
}
