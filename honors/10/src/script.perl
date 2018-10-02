Script started on Fri 04 May 2018 02:32:41 PM EDT
igc2@wirth:~/workspace/214/honors/10/src$ cat Birds.pl Bird.pm Duck.pm Owl.pm Goose.pm
#!/usr/bin/perl -w
# Birds.pl tests out the menagerie of bird classes
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

use strict;
use feature qw(say);

require Bird;
require Duck;
require Goose;
require Owl;

if (__FILE__ eq $0) {
	say "\nWelcome to the Bird Park!\n";

	my $bird0 = Bird->new("Hawkeye");
	$bird0->print;

	my $bird1 = Duck->new("Donald");
	$bird1->print;

	my $bird2 = Goose->new("Mother");
	$bird2->print;

	my $bird3 = Owl->new("Woodsey");
	$bird3->print;

	say "\n";
}
#!/usr/bin/perl
# Bird.pm defines a Bird superclass to be extended by specific bird sub-classes
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

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
sub call {
	'Squaaaaaaawk!';
}

# Subroutine: className, accessor for the class name
# Precondition: Bird must exist
# Receives: $self, a Bird object
# Returns: , the Bird object's class
sub className {
	my $self = shift;
	ref($self);
}

# Subroutine: print, output operation for Bird object
# Precondition: Bird must exist
# Receives: a Bird object
# Postcondition: outputs the Bird object's name, classname, and call
sub print {
	my $self = shift;
	say $self->{myName}, $self->className, " says ", $self->call;
}

1;
#!/usr/bin/perl
# Duck.pm defines the Duck class which inherits attributes and methods from the Bird superclass
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

package Duck;
use parent Bird;

# Method: call, accessor for a Duck call
# Precondition: Duck must exist
# Receives: a Duck object
# Returns: 'Quack!', a duck call
sub call {
	'Quack!'
}

1;

#!/usr/bin/perl
# Owl.pm defines the Owl class which inherits attributes and methods from the Bird superclass
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

package Owl;
use parent Bird;

# Method: call, accessor for a Owl call
# Precondition: Owl must exist
# Receives: a Owl object
# Returns: 'Whoo-hoo!', a Owl call
sub call {
	'Whoo-hoo!'
}

1;
#!/usr/bin/perl
# Goose.pm defines the Goose class which inherits attributes and methods from the Bird superclass
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

package Goose;
use parent Bird;

# Method: call, accessor for a Goose call
# Precondition: Goose must exist
# Receives: a Goose object
# Returns: 'Honk!', a Goose call
sub call {
	'Honk!'
}

1;
igc2@wirth:~/workspace/214/honors/10/src$ perl Birds.pl

Welcome to the Bird Park!

HawkeyeBird says Squaaaaaaawk!
DonaldDuck says Quack!
MotherGoose says Honk!
WoodseyOwl says Whoo-hoo!


igc2@wirth:~/workspace/214/honors/10/src$ exit

Script done on Fri 04 May 2018 02:33:20 PM EDT
