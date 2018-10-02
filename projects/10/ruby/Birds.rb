#!/usr/bin/ruby
# birds.rb Tests out the menagerie of bird classes.
# Begun by: Dr. Adams, for CS 214 at Calvin College
# Completed by: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

require './Bird.rb'
require './Duck.rb'
require './Goose.rb'
require './Owl.rb'
require './Penguin.rb'
require './Ostrich.rb'
require './Kiwi'

if __FILE__ == $0
	puts "\nWelcome to the Bird Park!\n\n"

	bird0 = Bird.new "Big"
	bird0.print

	bird1 = Duck.new "Donald"
	bird1.print

	bird2 = Goose.new "Mother"
	bird2.print

	bird3 = Owl.new "Woodsey"
	bird3.print

	bird4 = Penguin.new "Peter"
	bird4.print

	bird5 = Ostrich.new "Orville"
	bird5.print

	bird6 = Kiwi.new "Katie"
	bird6.print

	puts "\n"
end
