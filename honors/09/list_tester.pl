#!/usr/bin/perl -w
# list_tester.pl tests a Perl linked list
# Begun by: Ian Christensen, for CS 214 at Calvin College
# Completed by:
# Date:

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

	$list1->printList;
	# say "\nMaximum of list1: ", $list1->listMax;

	$list2->printList;
	# say "\nMaximum of list2: ", $list2->listMax;

	$list3->printList;
	# say "\nMaximum of list3: ", $list3->listMax;
}
