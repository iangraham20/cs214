#!/usr/bin/perl -w
# typingTutor.pl is a personal typing tutorial
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

#
require StringGenerator;
use strict;
use Time::HiRes qw(gettimeofday tv_interval);
use Switch;
use Tk;
use Tk::Font;

# GLOBAL OBJECTS
our $self = StringGenerator->new();
our $window = MainWindow->new();
our $canvas = $window->Canvas(-width => 1200, -height => 400, -background => "light grey", -relief => "sunken")->grid(-column => 0, -row => 0, -columnspan => 10, -rowspan => 9);
$window->title("Typing tutor");
$window->configure(-background => "white");

# GLOBAL VARIABLES
our ($mistakes, $endTime, $startTime, $asdfg, $hjklS, $qwert, $yuiop, $zxcvb, $PCmnd, $l2345, $b7890) = 0;
our $shiftPressed = 0;
our $genType1 = 1;
our $genType0 = undef;
our $validSymbols = "";

# GLOBAL WIDGETS
our $buttonFont = $window->fontCreate(-family => 'Arial Rounded MT Bold', -size => '12');
our $font = $window->fontCreate(-family => 'Helvetica Rounded', -size => '10', -weight => 'bold');
our $textFont = $window->fontCreate(-family => 'Helvetica Rounded', -size => '15', -weight => 'bold');
our $buttonBegin = $window->Button(-text => "Begin Practice", -font => $buttonFont, -command => \&begin, -background => "#717ECD", -activebackground => "#4EB1CB", -relief => "flat")->grid(-column => 2, -row => 12);
our $buttonEnd = $window->Button(-text => "End Practice", -font => $buttonFont, -command => [\&end, $self], -background => "#717ECD", -activebackground => "#4EB1CB", -relief => "flat", -padx => '8')->grid(-column => 2, -row => 13);
our $mistakesLabel = $window->Label(-text => "Number of mistyped letters: $mistakes", -foreground => 'black', -background => 'white', -font => $font)->grid(-column => 2, -row => 14);
our $right = $window->Label(-text => "right hand: ", -font => $font, -background => "white")->grid(-column => 0, -row => 10);
our $left = $window->Label(-text => "left hand: ", -font => $font, -background => "white")->grid(-column => 1, -row => 10);
our $cb0 = $window->Checkbutton(-text => "asdfg", -font => $font, -command => [\&changeAlphabet, $self, 0], -variable => \$asdfg, -background => "white")->grid(-column => 0, -row => 11);
our $cb1 = $window->Checkbutton(-text => "hjkl;", -font => $font, -command => [\&changeAlphabet, $self, 1], -variable => \$hjklS, -background => "white")->grid(-column => 1, -row => 11);
our $cb2 = $window->Checkbutton(-text => "qwert", -font => $font, -command => [\&changeAlphabet, $self, 2], -variable => \$qwert, -background => "white")->grid(-column => 0, -row => 12);
our $cb3 = $window->Checkbutton(-text => "yuiop", -font => $font, -command => [\&changeAlphabet, $self, 3], -variable => \$yuiop, -background => "white")->grid(-column => 1, -row => 12);
our $cb4 = $window->Checkbutton(-text => "zxcvb", -font => $font, -command => [\&changeAlphabet, $self, 4], -variable => \$zxcvb, -background => "white")->grid(-column => 0, -row => 13);
our $cb5 = $window->Checkbutton(-text => ".,mnb", -font => $font, -command => [\&changeAlphabet, $self, 5], -variable => \$PCmnd, -background => "white")->grid(-column => 1, -row => 13);
our $cb6 = $window->Checkbutton(-text => "12345", -font => $font, -command => [\&changeAlphabet, $self, 6], -variable => \$l2345, -background => "white")->grid(-column => 0, -row => 14);
our $cb7 = $window->Checkbutton(-text => "67890", -font => $font, -command => [\&changeAlphabet, $self, 7], -variable => \$b7890, -background => "white")->grid(-column => 1, -row => 14);
our $rb0 = $window->Radiobutton(-text => "selected letters", -font => $font, -command => [\&toggleRB, $self, 0], -variable => \$genType0, -background => "white")->grid(-column => 2, -row => 10);
our $rb1 = $window->Radiobutton(-text => "english dictionary", -font => $font, -command => [\&toggleRB, $self, 1], -variable => \$genType1, -background => "white")->grid(-column => 2, -row => 11);
our $instructions = $window->Label(-text => 
"	Welcome to your personal typing tutorial! To begin learning to type sit up straight with 
	your feet on the floor and place your left and right pointer fingers on the 'f' and 'j' 
	keys (the ones with raised bumps on them at the center of the keyboard). Now the rest of 
	your fingers should naturally be placed on the keys directly adjacent to your pointer 
	fingers so the fingers of your left hand are on the 'asdf' keys and the fingers of your 
	right hand are on the 'jkl;' keys. Now place your thumbs on the space bar and your all 
	set! In between each typed letter your fingers should return to this resting position, 
	and the finger closest to any surrounding key is responsible for that specific letter. 
	Finally, when using the shift key remember that the shift opposite of the letter you are 
	typing should always be the one being pressed. For example, if I wanted to capitalize 
	the letter 'q', I should use my right pinkie finger to press the shift on the right side 
	of the keyboard.", -font => $font, -foreground => '#4054cd', -background => "#f2f2f2", -relief => "flat", -padx => '10', -pady => '10')->grid(-column => 3, -row => 10, -rowspan => 5, -columnspan => 7);

# Subroutine: begin, prints words to the canvas and binds key presses to subroutines
# Precondition: $validSymbols is not an empty string
# Receives: $beginButton, a widget
# Postcondition: a string was printed to the canvas and key presses have been bound to subroutines 
sub begin {
	$canvas->delete('all');
	$buttonBegin->configure(-state => 'disabled');
	my $output = "";
	if (index($validSymbols, '.txt') != -1) {
		my @validWords = $self->readTextFile($validSymbols);
		$output = $self->createParagraph(1, @validWords);
	} elsif (length $validSymbols > 1) {
		my @validWords = $self->createArray($validSymbols);
		$output = $self->createParagraph(0, @validWords);
	} else {
		$output = "Something went wrong! No options have been selected!";
		$buttonBegin->configure(-state => 'normal');
	}
	$canvas->createText(600,250, -text => $output, -anchor => 'center', -fill => 'black', -font => $textFont, -justify => 'left', -tags => 'TextObject', -width => 1100);
	$window->bind("<KeyPress>" => [\&userInput]);
	$window->bind("<KeyPress-Shift_L>" => [\&caps, 1]);
	$window->bind("<KeyPress-Shift_R>" => [\&caps, 1]);
	$window->bind("<KeyRelease-Shift_L>" => [\&caps, 0]);
	$window->bind("<KeyRelease-Shift_R>" => [\&caps, 0]);
	timer("start");
}

# Subroutine: end, terminates the current tutor session
# Precondition: the session was in progress
# Receives: $endButton, a widget
# Postcondition: the canvas is cleared and the begin button enabled 
sub end {
	$canvas->delete('all');
	$buttonBegin->configure(-state => 'normal');
	$mistakes = 0;
	$mistakesLabel->configure(-text => "Number of mistyped letters: $mistakes");
}

# Subroutine: caps, toggles the $shiftPressed variable between 0 and 1
# Precondition: $toggle is an integer value of 1 or 0
# Receives: $toggle, an integer
# Returns: $shiftPressed, an integer
sub caps {
	my $toggle = $_[1];
	if ($toggle == 1) {
		$shiftPressed = 1;
	} elsif ($toggle == 0) {
		$shiftPressed = 0;
	} else {
		exit(1);
	}
}

# Subroutine: timer, acts as a stopwatch for calculating WPM
# Precondition: $toggle is either "start" or "end"
# Receives: $toggle, a string
# Returns: tv_interval, a float value
sub timer {
	my $toggle = shift;
	if ($toggle eq "start") {
		$startTime = [gettimeofday];
	} elsif ($toggle eq "end") {
		$endTime = [gettimeofday];
		return tv_interval($startTime, $endTime);
	} else {
		exit(1);
	}
}

# Subroutine: userInput, compares the user's input to the current canvas string
# Precondition: a KeyPress event has occurred
# Receives: $widget, a widget
# Postcondition: either the canvas string is shortten or the mistakes counter goes up
sub userInput {
	my $widget = shift;
	my $event = $widget->XEvent->K;
	if ($event =~ /space/) {
		$event = ' ';
	} elsif ($event =~ /period/) {
		$event = '.';
	} elsif ($event =~ /comma/) {
		$event = ',';
	} elsif ($event =~ /semicolon/) {
		$event = ';';
	} 
	if ($shiftPressed == 1) {
		$event = uc($event);
	}
	my $canvasText = $canvas->itemcget('TextObject', -text);
	if ($event eq substr($canvasText, 0, 1)) {
		$canvasText = substr($canvasText, 1);
		$canvas->delete('TextObject');
		if ($canvasText ne "") {
			$canvas->createText(600,250, -text => $canvasText, -anchor => 'center', -fill => 'black', -font => $textFont, -justify => 'left', -tags => 'TextObject', -width => 1100);
		} else {
			end;
			my $output = "Your total words per minute was: ";
			my $interval = timer("end");
			my $wpm = $interval * 1.2;
			$output .= $interval;
			$canvas->createText(600,250, -text => $output, -anchor => 'center', -fill => 'black', -font => $textFont, -justify => 'left', -tags => 'TextObject', -width => 1100);
		}
	} else {
		$mistakes += 1;
		$mistakesLabel->configure(-text => "Number of mistyped letters: $mistakes");
	}
}

# Subroutine: changeAlphabet, concats or removes part of the $validSymbol's string
# Precondition: $settingNumber is between 0 and 7
# Receives: $settingNumber, an integer
# Postcondition: $validSymbol has been added to or removed from
sub changeAlphabet {
	my ($self, $settingNumber) = @_;
	my $settingState = undef;
	switch ($settingNumber) {
		case 0 { $settingState = $asdfg; }
		case 1 { $settingState = $hjklS; }
		case 2 { $settingState = $qwert; }
		case 3 { $settingState = $yuiop; }
		case 4 { $settingState = $zxcvb; }
		case 5 { $settingState = $PCmnd; }
		case 6 { $settingState = $l2345; }
		case 7 { $settingState = $b7890; }
	}
	if ($settingState == 1) {
		switch ($settingNumber) {
			case 0 { $validSymbols .= "asdfg"; }
			case 1 { $validSymbols .= "hjkl;"; }
			case 2 { $validSymbols .= "qwert"; }
			case 3 { $validSymbols .= "yuiop"; }
			case 4 { $validSymbols .= "zxcvb"; }
			case 5 { $validSymbols .= ".,mnb"; }
			case 6 { $validSymbols .= "12345"; }
			case 7 { $validSymbols .= "67890"; }
		}
	} elsif ($settingState == 0) {
		switch ($settingNumber) {
			case 0 { $validSymbols =~ s/asdfg//; }
			case 1 { $validSymbols =~ s/hjkl;//; }
			case 2 { $validSymbols =~ s/qwert//; }
			case 3 { $validSymbols =~ s/yuiop//; }
			case 4 { $validSymbols =~ s/zxcvb//; }
			case 5 { $validSymbols =~ s/.,mnb//; }
			case 6 { $validSymbols =~ s/12345//; }
			case 7 { $validSymbols =~ s/67890//; }
		}
	} else {
		exit(1);
	}
}

# Subroutine: toggleRB, toggles the state of the radio buttons
# Precondition: $toggle is either a 1 or 0
# Receives: $toggle, an integer
# Postcondition: the radio buttons have been toggled
sub toggleRB {
	my ($self, $toggle) = @_;
	if ($toggle == 1) {
		$genType0 = 1;
		$validSymbols = "english.txt";
		toggleCB('disabled');
		($asdfg, $hjklS, $qwert, $yuiop, $zxcvb, $PCmnd, $l2345, $b7890) = 0;
	} else {
		$genType1 = 1;
		$validSymbols = "";
		toggleCB('normal');
	}
}

# Subroutine: toggleCB, toggles the state of every check button
# Precondition: $state is either 'normal', 'disabled', or other valid options
# Receives: $state, a string
# Postcondition: cb0-cb7 have been toggled to the inputted state
sub toggleCB {
	my $state = shift;
	$cb0->configure(-state => $state);
	$cb1->configure(-state => $state);
	$cb2->configure(-state => $state);
	$cb3->configure(-state => $state);
	$cb4->configure(-state => $state);
	$cb5->configure(-state => $state);
	$cb6->configure(-state => $state);
	$cb7->configure(-state => $state);
}

if (__FILE__ eq $0) {
	MainLoop;
}
