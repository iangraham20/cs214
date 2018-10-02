#!/usr/bin/perl
# Goose.pm defines the Goose class which inherits attributes and methods from the Bird superclass
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

package Goose;
use parent Bird;

# Method: call, accessor for a Goose call
# Precondition: Goose must exist
# Receives: a Goose object
# Returns: 'Honk!', a Goose call
sub call {
	'Honk!'
}

1;
