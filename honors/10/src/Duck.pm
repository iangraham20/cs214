#!/usr/bin/perl
# Duck.pm defines the Duck class which inherits attributes and methods from the Bird superclass
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

package Duck;
use parent Bird;

# Method: call, accessor for a Duck call
# Precondition: Duck must exist
# Receives: a Duck object
# Returns: 'Quack!', a duck call
sub call {
	'Quack!'
}

1;
