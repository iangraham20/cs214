#!/usr/bin/perl -w
# year_codes.pl translates an academic year into a numeric code
#
# Input: The name of an academic year
# Precondition: The academic year is a string with a value of freshman, sophomore, junior or senior
# Output: The corresponding integer code for the given academic year
#
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

use strict;
use feature qw(say);

# Subroutine: yearCode, computes an academic year into a numeric value
# Parameter: year, a string
# Precondition: year is one of {freshman, sophomore, junior, or senior}
# Returns: the integer code corresponding to academic year
sub year_codes {
	my $year = shift;
	if ($year =~ /freshman/) {
		return 1;
	} elsif ($year =~ /sophomore/) {
		return 2;
	} elsif ($year =~ /junior/) {
		return 3;
	} elsif ($year =~ /senior/) {
		return 4;
	} else {
		return 0;
	}
}

if (__FILE__ eq $0) {
	print "Enter the academic year: ";
	chomp(my $year = <STDIN>);
	say "The equivelant numeric code is: ", year_codes($year);
}
