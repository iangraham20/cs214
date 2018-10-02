Script started on Wed 25 Apr 2018 10:37:27 PM EDT
igc2@wirth:~/workspace/214/honors/07/src$ cat name_tester.pl
#!/usr/bin/perl
# name_tester.pl tests class Name and its operations
#
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

package Name;

use strict;
use warnings;
use feature qw(say);
use Test::Simple tests => 5;	# The number of test cases

# Subroutine: new, constructor for a Name object
# Receives: $class, the class object; $myFirst, $myMiddle, $myLast, Strings
# Preconditions: $myFirst, $myMiddle, and $myLast are string values
# Returns: $closure, a Name object with private attributes
sub new {
	my ($class, $myFirst, $myMiddle, $myLast) = @_;
	my $self = bless {myFirst => $myFirst, myMiddle => $myMiddle, myLast => $myLast}, $class;
  	$self;
}

# Subroutine: fullname, concates and formats the Name attributes
# Receives: $self, the Name object
# Preconditions: accessor methods are valid subroutines of Name
# Returns: fullName, a string representation of Name
sub fullName {
	my $self = shift;
	join " ", $self->{myFirst}, $self->{myMiddle}, $self->{myLast};
}

# Subroutine: print, outputs and returns fullname
# Receives: $self, the Name object (accessed directly)
# Preconditions: fullname is a valid subroutine of Name
# Returns: fullName, a string representation of Name
sub printName {
	my $self = shift;
	say $self->fullName();
	$self->fullName();
}

if (__FILE__ eq $0) {
	my $aName = Name->new("John", "Paul", "Jones");
	ok($aName->{myFirst} eq "John", 'myFirst');
	ok($aName->{myMiddle} eq "Paul", 'myMiddle');
	ok($aName->{myLast} eq "Jones", 'myLast');
	ok($aName->fullName eq "John Paul Jones", 'fullName');
	ok($aName->printName eq "John Paul Jones", 'printName');
	say "All Tests Passed!\n";
}

igc2@wirth:~/workspace/214/honors/07/src$ perl name_tester.pl
1..5
ok 1 - myFirst
ok 2 - myMiddle
ok 3 - myLast
ok 4 - fullName
John Paul Jones
ok 5 - printName
All Tests Passed!
igc2@wirth:~/workspace/214/honors/07/src$ exit

Script done on Wed 25 Apr 2018 10:37:40 PM EDT
