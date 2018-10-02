#!/usr/bin/perl
# Owl.pm defines the Owl class which inherits attributes and methods from the Bird superclass
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

package Owl;
use parent Bird;

# Method: call, accessor for a Owl call
# Precondition: Owl must exist
# Receives: a Owl object
# Returns: 'Whoo-hoo!', a Owl call
sub call {
	'Whoo-hoo!'
}

1;
