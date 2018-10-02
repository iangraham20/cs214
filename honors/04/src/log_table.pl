#!/usr/bin/perl -w
# log_table.pl displays a table of logarithms
#
# Input: start, stop and increment, three reals
# Precondition: start < stop and increment > 0
# Output: A table of logarithms from start to stop, with interval of increment
#
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

use strict;
use feature qw(say);

if (__FILE__ eq $0) {
	print "Enter the start value: ";
	chomp(my $start = <STDIN>);
	print "Enter the stop value: ";
	chomp(my $stop = <STDIN>);
	print "Enter the increment value: ";
	chomp(my $increment = <STDIN>);
	while ($start <= $stop) {
   		say("The logarithm of $start is: ", log($start)/log(10));
   		$start += $increment;
   	}
}
