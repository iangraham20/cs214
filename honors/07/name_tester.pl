#!/usr/bin/perl
# name_tester.pl tests class Name and its operations
#
# Begun by: Ian Christensen, for CS 214 at Calvin College
# Completed by:
# Date:

# Replace this line with the declaration of package Name, we have to declare 
# the package above any use functions neccessary for the package itself, in 
# this case our tests and our class methods are in the same file so we can 
# include all of our use functions inside of the namespace Name

use strict;
use warnings;
use feature qw(say);
# use Test::Simple tests => 0;	# The number of test cases

# Replace this line with the class methods

if (__FILE__ eq $0) {
	my $aName = Name->new("John", "Paul", "Jones");

	# ok($aName->{myFirst} eq "John", 'myFirst');
	# ok($aName->{myMiddle} eq "Paul", 'myMiddle');
	# ok($aName->{myLast} eq "Jones", 'myLast');
	# ok($aName->fullName eq "John Paul Jones", 'fullName');
	# ok($aName->printName eq "John Paul Jones", 'printName');

	say "All Tests Passed!";
}
