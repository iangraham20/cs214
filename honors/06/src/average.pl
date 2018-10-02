#!/usr/bin/perl -w
# average.pl averages the values of an array of doubles
#
# Input: array, an array of doubles AND size, a double
# Precondition: array, is an array of numbers
# Output: the average of the values in array
#
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

use strict;
use feature qw(say);

# Function: computes the sum of an array of doubles
# Parameters: array, an array of doubles
# Preconditions: array, is an array of doubles
# Returns: the sum of the values in array
sub sum {
	my @anArray = @_;
	my $total = 0.0;
	foreach my $item (@anArray) {
		$total += $item;
	}
	$total;
}

# Function: computes the average of an array of doubles
# Parameters: array, an array of doubles
# Preconditions: array, is an array of doubles
# Returns: the average of the values in array
sub average {
	my @anArray = @_;
	if (!@anArray) {
		0.0;
	} else {
		sum(@anArray) / scalar @anArray;
	}
}

# Statement: main driver for average.pl
# Parameters: none
# Precondition: average.pl is the file being run
# Returns: formatted print statements testing sum and average
if (__FILE__ eq $0) {
	my @array0;
	my @array1 = (6.0, 7.0, 8.0, 9.0);
	say "\nThe sum of array0 is: ", sum(@array0);
	say "The sum of array1 is: ", sum(@array1);
	say "The average of array0 is: ", average(@array0);
	say "The average of array1 is: ", average(@array1), "\n";
}
