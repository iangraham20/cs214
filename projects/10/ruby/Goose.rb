#!/usr/bin/ruby
# Goose.rb Defines the Goose class which inherits attributes and methods from the Bird superclass.
# Begun by: Dr. Adams, for CS 214 at Calvin College
# Completed by: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

require './Flying.rb'

class Goose < Flying

	# Method: call, accessor for a Goose call
	# Precondition: Goose must exist
	# Receives: a Goose object
	# Returns: 'Honk!', a goose call
	def call
		'Honk!'
	end
end
