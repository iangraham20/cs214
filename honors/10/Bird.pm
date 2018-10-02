#!/usr/bin/perl
# Bird.pm defines a Bird superclass to be extended by specific bird sub-classes
# Begun by: Ian Christensen, for CS 214 at Calvin College
# Completed by: 
# Date: 

package Bird;
use feature qw(say);

# Subroutine: new, constructor for Bird
# Preconditions: Bird module was required
# Receives: $class, the class object; $name, a string
# Returns: $self, a Bird object
sub new {
  my ($class, $name) = @_;
  my $self = bless {myName => $name}, $class;
  $self;
}

# Subroutine: call, 
# Precondition: Bird object must exist
# Receives: a Bird object
# Returns: 'Squaaaaaaawk!', the generic bird call

# replace this line with the call subroutine

# Subroutine: className, accessor for the class name
# Precondition: Bird must exist
# Receives: $self, a Bird object
# Returns: , the Bird object's class

# replace this line with the className subroutine

# Subroutine: print, output operation for Bird object
# Precondition: Bird must exist
# Receives: a Bird object
# Postcondition: outputs the Bird object's name, classname, and call

# replace this line with the print subroutine

1;