#!/usr/bin/perl -w
# array_sum.pl sums the values in an array
# Begun by: Ian Christensen, for CS 214 at Calvin College
# Completed by:
# Date:
# Usage: ruby array_sum.rb <inFileName>

use strict;
use feature qw(say);
use Data::Dumper qw(Dumper);
use Time::HiRes qw(gettimeofday tv_interval);

# subroutine: checkCommandLine, makes certain the input file was specified on the command-line
# precondition: a single argument was passed through the terminal
# receives: ARGV, the terminal argument vector
# returns: exit, terminates the program
sub checkCommandLine {
  if (scalar @ARGV != 1) {
    say "\nUsage: sum <fileName>\n\n";
    exit(1);
  }
}

# subroutine: readFile, takes a file name and reads its values
# precondition: a valid text document was passed through the terminal
# receives: ARGV, the terminal argument vector
# returns: @intArray, an array containing the values from the file whose name was specified on the command-line
sub readFile {
  my $arg = $ARGV[0];
  open(LINES, "<", $arg);
  my @strArray = <LINES>;
  close(LINES);
  my @intArray;
  $intArray[int($strArray[0])] = 0;
  foreach my $i (2..scalar @strArray) {
    if ($strArray[$i]) {
      $intArray[$i-2] = int($strArray[$i]);
    }
  }
  @intArray;
}

# subroutine: sum, performs a summation of values from an array
# precondition: @values is not empty and contains only number values
# receives: @values, an array of numbers
# returns: $result, the sum of the values
sub sum {
  my @values = @_;
  my $result = 0;
  foreach my $number (@values) {
    $result += $number;
  }
  $result;
}

# subroutine: main, acts as the driver for array_sum.pl
# precondition: the time library is in use
# postcondition: outputs time and sums of arrays 
sub main {
  checkCommandLine;
  my @values = readFile;
  my $startTime = [gettimeofday];
  my $total = sum(@values);
  my $endTime = [gettimeofday];
  my $interval = tv_interval($startTime, $endTime);
  say "\nThe sum is $total\n";
  printf(" and computing it took %.9f seconds.\n\n", $interval);
}

# if array_sum.pl is being run then run the main procedure
if (__FILE__ eq $0) {
  main;
}
