#!/usr/bin/perl
# MyList.pm implements a linked list structure in Perl
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

package MyList;
use feature qw(say);

# Subroutine: new, constructor for List
# Preconditions: List module was required
# Receives: $class, the class object
# Returns: $self, a List object

# Replace this line with MyList constructor definition


# Subroutine: empty, checks if the list is empty
# Preconditions: length is an integer
# Receives: $self, a list object
# Returns: true if empty, false if not empty
sub empty { shift->{myLength} == 0; }

# Subroutine: append, adds a value to a list
# Receives: $self, a list object; $value, an integer
# Returns: $self, a List object
# Postcondition: last == value and length = length + 1
sub append {
	my ($self, $value) = @_;
	my $newNode = MyNode->new($value, undef);
	if ($self->empty) {
		$self->{myFirst} = $newNode;
	} else {
		$self->{myLast}->{myNext} = $newNode;
	}
	$self->{myLast} = $newNode;
	$self->{myLength} += 1;
	$self;
}

# Subroutine: printList, outputs the List items to the console
# Postcondition: items have been displayed to the screen
# Returns: $self, a List object
# Returns: 1, the perl equivalent to true

# Replace this line with a definition for method 'printList'


# Subroutine: listMax, finds the maximum item in the List
# Precondition: the minimum List value cannot be less than -999999
# Returns: $self, a List object
# Returns: $maxValue, the maximum item in the List

# Replace this line with a definition for method 'listMax'


# Replace this line with a declaration for class Node
#  (and its methods)

1;
