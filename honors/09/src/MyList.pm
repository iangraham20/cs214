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
sub new {
	my ($class) = @_;
	my $self = bless {myFirst => undef, myLast => undef, myLength => 0}, $class;
  	$self;
}

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
sub printList {
	my $self = shift;
	my $temp = $self->{myFirst};
	while ($temp != undef) {
		print(" ", $temp->{myValue});
		$temp = $temp->{myNext};
	}
}

# Subroutine: listMax, finds the maximum item in the List
# Precondition: the minimum List value cannot be less than -999999
# Returns: $self, a List object
# Returns: $maxValue, the maximum item in the List
sub listMax {
	my $self = shift;
	my $temp = $self->{myFirst};
	my $maxValue = -999999;
	while ($temp != undef) {
		if ($temp->{myValue} > $maxValue) {
			$maxValue = $temp->{myValue};
		}
		$temp = $temp->{myNext};
	}
	$maxValue;
}

package MyNode;
# Subroutine: new, constructor for List
# Preconditions: $item and $link are parameters
# Receives: $self, the class object; $item and $link, Strings
# Returns: $self, a List object
sub new {
	my ($class, $item, $link) = @_;
	my $self = bless {myValue => $item, myNext => $link}, $class;
  	$self;
}

1;
