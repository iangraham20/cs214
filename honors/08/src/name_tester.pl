#!/usr/bin/perl -w
# NameTester.pl tests class Name and its operations
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

use strict;
use feature qw(say);
use Test::Simple tests => 5;

require Names;

if (__FILE__ eq $0) {
	my $aName = Name->new("John", "Paul", "Jones");
	ok($aName->{myFirst} eq "John", 'myFirst');
	ok($aName->{myMiddle} eq "Paul", 'myMiddle');
	ok($aName->{myLast} eq "Jones", 'myLast');
	ok($aName->fullName eq "John Paul Jones", 'fullName');
	ok($aName->printName eq "John Paul Jones", 'printName');
	say "All Tests Passed!\n";
}
