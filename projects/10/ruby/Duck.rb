#!/usr/bin/ruby
# Duck.rb Defines the Duck class which inherits attributes and methods from the Bird superclass.
# Begun by: Dr. Adams, for CS 214 at Calvin College
# Completed by: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

require './Flying.rb'

class Duck < Flying

	# Method: call, accessor for a Duck call
	# Precondition: Duck must exist
	# Receives: a Duck object
	# Returns: 'Quack!', a duck call
	def call
		'Quack!'
	end
end
