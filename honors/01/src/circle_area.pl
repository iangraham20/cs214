#!/usr/bin/perl -w
# circle_area.pl computes the area of a circle given its radius
# 
# Input: the radius of a circle
# Precondition: the radius is not negative
# Output: the area of the circle.
#
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

use strict;
use feature qw(say);
use Math::Trig;

# Subroutine: circle_area, returns a circle's area given its radius
# Precondition: r > 0
# Receives: $radius, a number
# Returns: the area of a circle whose radius is $radius
sub circle_area {
	my $radius = shift;
	pi * $radius ** 2;
}

if (__FILE__ eq $0) {
	say "To compute the area of a circle,";
	print " enter its $radius: ";
	chomp(my $radius = <STDIN>);
	say "The area is: ", circle_area($radius);
}
