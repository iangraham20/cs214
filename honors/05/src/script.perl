Script started on Wed 25 Apr 2018 09:32:57 PM EDT
igc2@wirth:~/workspace/214/honors/05/src$ cat split.pl
#!/usr/bin/perl -w
# split.pl is a class and program that splits a string into two substrings
#
# Input: $string, a string and $position, an integer and $results, an array of strings
# Precondition: position is in string's Range
# Output: The substrings of string split by position
#
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

use strict;
use feature qw(say);

# Subroutine: splitter, splits a string according to the position specified
# Receives: $string, a string and $position
# Precondition: position is in string's Range
# Output: The substrings of string split by position
sub splitter {
	my ($string, $position) = @_;
	(substr($string, 0, $position), substr($string, $position));
}

if (__FILE__ eq $0) {
	print "\nTo split a string, enter the string: "; 
	chomp(my $string = <STDIN>);
	print "Enter the split position: ";
	chomp(my $position = <STDIN>);
	my @results = splitter($string, $position);
	say "\nThe first part is: $results[0]";
	say "and the second part is: $results[1]\n";
}
igc2@wirth:~/workspace/214/honors/05/src$ perl split.pl

To split a string, enter the string: hello
Enter the split position: 3

The first part is: hel
and the second part is: lo

igc2@wirth:~/workspace/214/honors/05/src$ perl split.pl

To split a string, enter the string: hello
Enter the split position: 0

The first part is: 
and the second part is: hello

igc2@wirth:~/workspace/214/honors/05/src$ perl split.pl

To split a string, enter the string: hello
Enter the split position: 5

The first part is: hello
and the second part is: 

igc2@wirth:~/workspace/214/honors/05/src$ exit

Script done on Wed 25 Apr 2018 09:33:28 PM EDT
