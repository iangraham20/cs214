#!/usr/bin/perl -w
# array_sum.pl sums the values in an array
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018
# Usage: perl array_sum.pl <inFileName>

use strict;
use feature qw(say);
use threads;
use threads::shared;
use Data::Dumper qw(Dumper);
use Time::HiRes qw(gettimeofday tv_interval);

# subroutine: checkCommandLine, makes certain the input file and integer of threades was specified on the command-line
# precondition: a single argument was passed through the terminal
# receives: ARGV, the terminal argument vector
# returns: exit, terminates the program
sub checkCommandLine {
  if (scalar @ARGV != 2) {
    say "\nUsage: sum <inFileName> <numThreads>\n\n";
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

# subroutine: sumSlice, performs a summation of values from an array
# precondition: @values is not empty and contains only integer values
# receives: $id, an integer; $sliceSize, an integer; @values, an array of integers
# returns: $myTotal, the sum of the values associated with a particular thread
sub sumSlice {
  my ($id, $sliceSize, @values) = @_;
  my $start = $id * $sliceSize;
  my $stop = $start + $sliceSize - 1;
  my $myTotal = 0;
  my $i = 0;
  foreach my $i ($start..$stop) {
    $myTotal += $values[$i];
  }
  $myTotal;
}

# subroutine: sumInParallel, performs a summation of values from an array
# precondition: @values is not empty and contains only integer values
# receives: $numThreads, an integer; @values, an array of integers
# returns: $results, the sum of all the values
sub sumInParallel {
  my ($numThreads, @values) = @_;
  my $sliceSize = int(scalar @values / $numThreads);
  my @threadArray;
  $threadArray[$numThreads] = undef;
  my $result :shared = 0;
  my $mutex :shared;
  
  foreach my $i (1..$numThreads-1) {
    $threadArray[$i] = threads->create(
      sub { 
        my $myTotal = sumSlice($i, $sliceSize, @values);
        { lock($mutex); $result += $myTotal; }
      }
    );
  }

  my $myTotal = sumSlice(0, $sliceSize, @values);

  my $leftovers = scalar @values % $numThreads;
  if ($leftovers > 0) {
    foreach my $i (scalar @values - $leftovers..scalar @values - 1) {
      $myTotal += $values[$i];
    }
  }

  { lock($mutex); $result += $myTotal; }

  foreach my $i (1..$numThreads-1) {
    $threadArray[$i]->join();
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
  my $total = sumInParallel($ARGV[1], @values);
  my $endTime = [gettimeofday];
  my $interval = tv_interval($startTime, $endTime);
  say "\nThe sum is $total\n";
  printf(" and computing it took %.9f seconds.\n\n", $interval);
}

# if array_sum.pl is being run then run the main procedure
if (__FILE__ eq $0) {
  main;
}
