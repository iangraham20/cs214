#!/usr/bin/ruby
# Ostrich.rb Defines the Ostrich class which inherits attributes and methods from the Bird superclass.
# Begun by: Dr. Adams, for CS 214 at Calvin College
# Completed by: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

require './Walking.rb'

class Ostrich < Walking

	# Method: call, accessor for a Duck call
	# Precondition: Duck must exist
	# Receives: a Duck object
	# Returns: 'Quack!', a duck call
	def call
		'Snork'
	end
end
