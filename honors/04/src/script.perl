Script started on Wed 25 Apr 2018 09:29:07 PM EDT
igc2@wirth:~/workspace/214/honors/04/src$ cat log_table.pl
#!/usr/bin/perl -w
# log_table.pl displays a table of logarithms
#
# Input: start, stop and increment, three reals
# Precondition: start < stop and increment > 0
# Output: A table of logarithms from start to stop, with interval of increment
#
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

use strict;
use feature qw(say);

if (__FILE__ eq $0) {
	print "Enter the start value: ";
	chomp(my $start = <STDIN>);
	print "Enter the stop value: ";
	chomp(my $stop = <STDIN>);
	print "Enter the increment value: ";
	chomp(my $increment = <STDIN>);
	while ($start <= $stop) {
   		say("The logarithm of $start is: ", log($start)/log(10));
   		$start += $increment;
   	}
}
igc2@wirth:~/workspace/214/honors/04/src$ perl log_table.pl
Enter the start value: 1
Enter the stop value: 2
Enter the increment value: 0.5
The logarithm of 1 is: 0
The logarithm of 1.5 is: 0.176091259055681
The logarithm of 2 is: 0.301029995663981
igc2@wirth:~/workspace/214/honors/04/src$ perl log_table.pl
Enter the start value: .1
Enter the stop value: .2
Enter the increment value: .05
The logarithm of .1 is: -1
The logarithm of 0.15 is: -0.823908740944319
The logarithm of 0.2 is: -0.698970004336019
igc2@wirth:~/workspace/214/honors/04/src$ perl log_table.pl
Enter the start value: 1
Enter the stop value: 1
Enter the increment value: 1
The logarithm of 1 is: 0
igc2@wirth:~/workspace/214/honors/04/src$ perl log_table.pl
Enter the start value: 1
Enter the stop value: 2
Enter the increment value: .1
The logarithm of 1 is: 0
The logarithm of 1.1 is: 0.0413926851582251
The logarithm of 1.2 is: 0.0791812460476249
The logarithm of 1.3 is: 0.113943352306837
The logarithm of 1.4 is: 0.146128035678238
The logarithm of 1.5 is: 0.176091259055681
The logarithm of 1.6 is: 0.204119982655925
The logarithm of 1.7 is: 0.230448921378274
The logarithm of 1.8 is: 0.255272505103306
The logarithm of 1.9 is: 0.278753600952829
igc2@wirth:~/workspace/214/honors/04/src$ perl log_table.pl
Enter the start value: 10
Enter the stop value: 100
Enter the increment value: 1
The logarithm of 10 is: 1
The logarithm of 11 is: 1.04139268515822
The logarithm of 12 is: 1.07918124604762
The logarithm of 13 is: 1.11394335230684
The logarithm of 14 is: 1.14612803567824
The logarithm of 15 is: 1.17609125905568
The logarithm of 16 is: 1.20411998265592
The logarithm of 17 is: 1.23044892137827
The logarithm of 18 is: 1.25527250510331
The logarithm of 19 is: 1.27875360095283
The logarithm of 20 is: 1.30102999566398
The logarithm of 21 is: 1.32221929473392
The logarithm of 22 is: 1.34242268082221
The logarithm of 23 is: 1.36172783601759
The logarithm of 24 is: 1.38021124171161
The logarithm of 25 is: 1.39794000867204
The logarithm of 26 is: 1.41497334797082
The logarithm of 27 is: 1.43136376415899
The logarithm of 28 is: 1.44715803134222
The logarithm of 29 is: 1.46239799789896
The logarithm of 30 is: 1.47712125471966
The logarithm of 31 is: 1.49136169383427
The logarithm of 32 is: 1.50514997831991
The logarithm of 33 is: 1.51851393987789
The logarithm of 34 is: 1.53147891704226
The logarithm of 35 is: 1.54406804435028
The logarithm of 36 is: 1.55630250076729
The logarithm of 37 is: 1.56820172406699
The logarithm of 38 is: 1.57978359661681
The logarithm of 39 is: 1.5910646070265
The logarithm of 40 is: 1.60205999132796
The logarithm of 41 is: 1.61278385671974
The logarithm of 42 is: 1.6232492903979
The logarithm of 43 is: 1.63346845557959
The logarithm of 44 is: 1.64345267648619
The logarithm of 45 is: 1.65321251377534
The logarithm of 46 is: 1.66275783168157
The logarithm of 47 is: 1.67209785793572
The logarithm of 48 is: 1.68124123737559
The logarithm of 49 is: 1.69019608002851
The logarithm of 50 is: 1.69897000433602
The logarithm of 51 is: 1.70757017609794
The logarithm of 52 is: 1.7160033436348
The logarithm of 53 is: 1.72427586960079
The logarithm of 54 is: 1.73239375982297
The logarithm of 55 is: 1.74036268949424
The logarithm of 56 is: 1.7481880270062
The logarithm of 57 is: 1.75587485567249
The logarithm of 58 is: 1.76342799356294
The logarithm of 59 is: 1.77085201164214
The logarithm of 60 is: 1.77815125038364
The logarithm of 61 is: 1.78532983501077
The logarithm of 62 is: 1.79239168949825
The logarithm of 63 is: 1.79934054945358
The logarithm of 64 is: 1.80617997398389
The logarithm of 65 is: 1.81291335664286
The logarithm of 66 is: 1.81954393554187
The logarithm of 67 is: 1.82607480270083
The logarithm of 68 is: 1.83250891270624
The logarithm of 69 is: 1.83884909073726
The logarithm of 70 is: 1.84509804001426
The logarithm of 71 is: 1.85125834871908
The logarithm of 72 is: 1.85733249643127
The logarithm of 73 is: 1.86332286012046
The logarithm of 74 is: 1.86923171973098
The logarithm of 75 is: 1.8750612633917
The logarithm of 76 is: 1.88081359228079
The logarithm of 77 is: 1.88649072517248
The logarithm of 78 is: 1.89209460269048
The logarithm of 79 is: 1.89762709129044
The logarithm of 80 is: 1.90308998699194
The logarithm of 81 is: 1.90848501887865
The logarithm of 82 is: 1.91381385238372
The logarithm of 83 is: 1.91907809237607
The logarithm of 84 is: 1.92427928606188
The logarithm of 85 is: 1.92941892571429
The logarithm of 86 is: 1.93449845124357
The logarithm of 87 is: 1.93951925261862
The logarithm of 88 is: 1.94448267215017
The logarithm of 89 is: 1.94939000664491
The logarithm of 90 is: 1.95424250943932
The logarithm of 91 is: 1.95904139232109
The logarithm of 92 is: 1.96378782734556
The logarithm of 93 is: 1.96848294855394
The logarithm of 94 is: 1.9731278535997
The logarithm of 95 is: 1.97772360528885
The logarithm of 96 is: 1.98227123303957
The logarithm of 97 is: 1.98677173426624
The logarithm of 98 is: 1.99122607569249
The logarithm of 99 is: 1.99563519459755
The logarithm of 100 is: 2
igc2@wirth:~/workspace/214/honors/04/src$ exit

Script done on Wed 25 Apr 2018 09:31:19 PM EDT
