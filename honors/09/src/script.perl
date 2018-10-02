Script started on Wed 25 Apr 2018 10:40:25 PM EDT
igc2@wirth:~/workspace/214/honors/09/src$ cat MyList.pm list_tester.pl
#!/usr/bin/perl
# list.pl implements a linked list structure in Perl
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

# Subroutine: print, outputs the List items to the console
# Postcondition: items have been displayed to the screen
# Returns: $self, a List object
# Returns: 1, the perl equivalent to true
sub print {
	my $self = shift;
	my $temp = $self->{myFirst};
	while ($temp != undef) {
		print(" ", $temp->{myValue});
		$temp = $temp->{myNext};
	}
	1;
}

# Subroutine: max, finds the maximum item in the List
# Precondition: the minimum List value cannot be less than -999999
# Returns: $self, a List object
# Returns: $maxValue, the maximum item in the List
sub max {
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
#!/usr/bin/perl -w
# max.pl tests a Perl linked list
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

use strict;
use feature qw(say);

require MyList;

if (__FILE__ eq $0) {
	my $list1 = MyList->new();
	my $list2 = MyList->new();
	my $list3 = MyList->new();

	$list1->append(99)->append(88)->append(77)->append(66)->append(55);
	$list2->append(55)->append(66)->append(77)->append(88)->append(99);
	$list3->append(55)->append(77)->append(99)->append(88)->append(66);

	$list1->print;
	say "\nMaximum of list1: ", $list1->max;

	$list2->print;
	say "\nMaximum of list2: ", $list2->max;

	$list3->print;
	say "\nMaximum of list3: ", $list3->max;
}

igc2@wirth:~/workspace/214/honors/09/src$ perl list_tester.pl
 99 88 77 66 55
Maximum of list1: 99
 55 66 77 88 99
Maximum of list2: 99
 55 77 99 88 66
Maximum of list3: 99
igc2@wirth:~/workspace/214/honors/09/src$ exit

Script done on Wed 25 Apr 2018 10:40:47 PM EDT
