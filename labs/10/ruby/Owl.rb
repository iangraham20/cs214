#!/usr/bin/ruby
# Owl.rb Defines the Owl class which inherits attributes and methods from the Bird superclass.
# Begun by: Dr. Adams, for CS 214 at Calvin College
# Completed by: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

require './Bird.rb'

class Owl < Bird

	# Method: call, accessor for a Owl call
	# Precondition: Owl must exist
	# Receives: a Owl object
	# Returns: 'Whoo-hoo', a owl call
	def call
		'Whoo-hoo'
	end
end
