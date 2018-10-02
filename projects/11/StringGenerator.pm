#!/usr/bin/perl
# StringGenerator.pm is a module containing methods that generate random strings
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

package StringGenerator;

# Subroutine: new, constructor subroutine for a StringGenerator object
# Postcondition: $self has access to the functionality of StringGenerator
# Receives: $class, the StringGenerator class
# Returns: $self, the StringGenerator object
sub new {
	my $class = shift;
	my $self = bless { arrayUpper=>100, arrayLower=>50, paragraphLength=>50 }, $class;
  	$self;
}

# Subroutine: readTextFile, reads a text file into an array
# Precondition: $file must be a path to a '.txt' file type
# Receives: $file, a string
# Returns: @words, an array of strings
sub readTextFile {
	my ($self, $file) = @_;
	open(LINES, "<", $file);
	my @words = <LINES>;
	close(LINES);
	@words;
}

# Subroutine: createParagraph, generates a random paragraph of words
# Precondition: @wordArray is of type array-string
# Receives: @wordArray, an array of strings
# Returns: $paragraph, a string
sub createParagraph {
	my ($self, $punctuation, @wordArray) = @_;
	chomp(@wordArray);
	my $paragraph = ucfirst($wordArray[int(rand(scalar @wordArray))]);
	my $length = $self->{paragraphLength};
	for (my $i = 0; $i < $length; $i++) {
		$paragraph .= ' ' . $wordArray[int(rand(scalar @wordArray))];
		if ($i % (int(rand(15)) + 5) < 5 and $punctuation == 1) {
			$paragraph .= '. ' . ucfirst($wordArray[int(rand(scalar @wordArray))]);
		}
	}
	$paragraph .= '.';
}

# Subroutine: createArray, generates a random array of words
# Precondition: $letters is of type string
# Receives: $letters, a string
# Returns: @wordArray, an array of strings
sub createArray {
	my ($self, $letters) = @_;
	my @wordArray;
	my $length = int(rand($self->{arrayUpper})) + $self->{arrayLower};
	do {
		push @wordArray, createWord($letters);
	} while (scalar @wordArray < $length);
	@wordArray;
}

# Subroutine: createWord, generates a random string of letters
# Precondition: $letters is of type string
# Receives: $letters, a string
# Returns: $word, a string
sub createWord {
	my ($string) = @_;
	my @letters = split //, $string;
	my $word = '';
	my $length = int(rand(10)) + 1;
	while (length $word < $length) {
		$word .= @letters[int(rand(scalar @letters))];
	}
	$word;
}
1;
