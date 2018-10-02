#!/usr/bin/ruby
# Bird.rb Defines a Bird superclass to be extended by specific bird sub-classes
# Begun by: Dr. Adams, for CS 214 at Calvin College
# Completed by: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

class Bird

	# attributes: accessor for name attribute
	attr_reader :name

	# Method: initialize, constructor for Bird
	# Precondition: a name parameter is given
	# Receives: name, a string
	# Returns: a Bird object
	def initialize(name)
		@name = name
	end

	# Method: call, accessor for a Bird call
	# Precondition: Bird must exist
	# Receives: a Bird object
	# Returns: 'Squaaaaaaawk!', the generic bird call
	def call
		'Squaaaaaaawk!'
	end

	# Method: className, accessor for the class name
	# Precondition: Bird must exist
	# Receives: a Bird object
	# Returns: self.class.to_s, the Bird object's class
	def className
		self.class.to_s
	end

	# Method: move, gets the movement of the bird
	# Precondition: Bird must exist
	# Receives: a Bird object
	# Returns: 'moved passed', the generic movement
	def move
		'moved passed'
	end

	# Method: print, output operation for Bird object
	# Precondition: Bird must exist
	# Receives: a Bird object
	# Returns: outputs the Bird object's name, classname, and call
	def print
		puts name + ' ' + className + " just " + move + " and said " + call
	end
end
