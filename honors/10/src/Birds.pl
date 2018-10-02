#!/usr/bin/perl -w
# Birds.pl tests out the menagerie of bird classes
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

use strict;
use feature qw(say);

require Bird;
require Duck;
require Goose;
require Owl;

if (__FILE__ eq $0) {
	say "\nWelcome to the Bird Park!\n";

	my $bird0 = Bird->new("Hawkeye");
	$bird0->print;

	my $bird1 = Duck->new("Donald");
	$bird1->print;

	my $bird2 = Goose->new("Mother");
	$bird2->print;

	my $bird3 = Owl->new("Woodsey");
	$bird3->print;

	say "\n";
}
