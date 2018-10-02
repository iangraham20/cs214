#!/usr/bin/ruby
# Walking.rb defines a walking superclass to be extended by specific bird sub-classes
# Begun by: Dr. Adams, for CS 214 at Calvin College
# Completed by: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

require './Bird.rb'

class Walking < Bird
	
	# Method: move, gets the movement of the bird
	# Precondition: Bird must exist
	# Receives: a Bird object
	# Returns: 'walked passed', the walking movement
	def move
		'walked passed'
	end
end
