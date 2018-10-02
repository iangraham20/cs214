#!/usr/bin/perl
# Names.pm implements class Name
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

package Name;
use feature qw(say);

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

1;
