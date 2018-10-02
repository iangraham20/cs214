Script started on Wed 25 Apr 2018 09:25:35 PM EDT
igc2@wirth:~/workspace/214/honors/03/src$ cat year_codes.pl
#!/usr/bin/perl -w
# year_codes.pl translates an academic year into a numeric code
#
# Input: The name of an academic year
# Precondition: The academic year is a string with a value of freshman, sophomore, junior or senior
# Output: The corresponding integer code for the given academic year
#
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

use strict;
use feature qw(say);

# Subroutine: yearCode, computes an academic year into a numeric value
# Parameter: year, a string
# Precondition: year is one of {freshman, sophomore, junior, or senior}
# Returns: the integer code corresponding to academic year
sub year_codes {
	my $year = shift;
	if ($year =~ /freshman/) {
		return 1;
	} elsif ($year =~ /sophomore/) {
		return 2;
	} elsif ($year =~ /junior/) {
		return 3;
	} elsif ($year =~ /senior/) {
		return 4;
	} else {
		return 0;
	}
}

if (__FILE__ eq $0) {
	print "Enter the academic year: ";
	chomp(my $year = <STDIN>);
	say "The equivelant numeric code is: ", year_codes($year);
}

igc2@wirth:~/workspace/214/honors/03/src$ lsperl year_codes.pl
Enter the academic year: freshman
The equivelant numeric code is: 1
igc2@wirth:~/workspace/214/honors/03/src$ perl year_codes.pl
Enter the academic year: sophomore
The equivelant numeric code is: 2
igc2@wirth:~/workspace/214/honors/03/src$ perl year_codes.pl
Enter the academic year: junior
The equivelant numeric code is: 3
igc2@wirth:~/workspace/214/honors/03/src$ perl year_codes.pl
Enter the academic year: senior
The equivelant numeric code is: 4
igc2@wirth:~/workspace/214/honors/03/src$ perl year_codes.pl
Enter the academic year: superfreshman
The equivelant numeric code is: 1
igc2@wirth:~/workspace/214/honors/03/src$ perl year_codes.pl
Enter the academic year: supersophomore
The equivelant numeric code is: 2
igc2@wirth:~/workspace/214/honors/03/src$ perl year_codes.pl
Enter the academic year: superjunior
The equivelant numeric code is: 3
igc2@wirth:~/workspace/214/honors/03/src$ perl year_codes.pl
Enter the academic year: supersenior
The equivelant numeric code is: 4
igc2@wirth:~/workspace/214/honors/03/src$ perl year_codes.pl
Enter the academic year: alumni
The equivelant numeric code is: 0
igc2@wirth:~/workspace/214/honors/03/src$ perl year_codes.pl
Enter the academic year: staff
The equivelant numeric code is: 0
igc2@wirth:~/workspace/214/honors/03/src$ perl year_codes.pl
Enter the academic year: middle schooler
The equivelant numeric code is: 0
igc2@wirth:~/workspace/214/honors/03/src$ perl year_codes.pl
Enter the academic year: 123@#%adgHDGF
The equivelant numeric code is: 0
igc2@wirth:~/workspace/214/honors/03/src$ exit

Script done on Wed 25 Apr 2018 09:25:44 PM EDT
