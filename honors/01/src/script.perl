Script started on Thu 12 Apr 2018 08:34:11 PM EDT
igc2@thompson:~/workspace/214/honors/01$ cat circle_area.pl
#!/usr/bin/perl -w
# circle_area.pl computes the area of a circle given its radius
# 
# Input: the radius of a circle
# Precondition: the radius is not negative
# Output: the area of the circle.
#
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

use strict;
use feature qw(say);
use Math::Trig;

# Subroutine: circle_area, returns a circle's area, given its radius
# Precondition: r > 0
# Receives: r, a number
# Returns: the area of a circle whose radius is r
sub circle_area {
	my $radius = shift;
	pi * $radius ** 2;
}

if (__FILE__ eq $0) {
	say "To compute the area of a circle,";
	print " enter its radius: ";
	chomp(my $radius = <STDIN>);
	say "The area is: ", circle_area($radius);
}
igc2@thompson:~/workspace/214/honors/01$ perl circle_area.pl
To compute the area of a circle,
 enter its radius: 1
The area is: 3.14159265358979
igc2@thompson:~/workspace/214/honors/01$ perl circle_area.pl
To compute the area of a circle,
 enter its radius: 2
The area is: 12.5663706143592
igc2@thompson:~/workspace/214/honors/01$ perl circle_area.pl
To compute the area of a circle,
 enter its radius: 2.5
The area is: 19.6349540849362
igc2@thompson:~/workspace/214/honors/01$ perl circle_area.pl
To compute the area of a circle,
 enter its radius: 4.99999
The area is: 78.5395021807936
igc2@thompson:~/workspace/214/honors/01$ exit

Script done on Thu 12 Apr 2018 08:34:58 PM EDT
