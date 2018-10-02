Script started on Sat 14 Apr 2018 09:31:49 PM EDT
igc2@eckert-mauchly:~/workspace/214/labs/10/ruby$ ls
Bird.rb  Birds.rb  Duck.rb  Goose.rb  Owl.rb  script.ruby
igc2@eckert-mauchly:~/workspace/214/labs/10/ruby$ cat Bird.rb Birds.rb Duck.rb Gouse   ps  ose.rb Owl.rb
#!/usr/bin/ruby
# Bird.rb Defines a Bird superclass to be extended by specific bird sub-classes
# Begun by: Dr. Adams, for CS 214 at Calvin College
# Completed by: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

class Bird

	# Method: accessor for name attribute
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

	# Method: print, output operation for Bird object
	# Precondition: Bird must exist
	# Receives: a Bird object
	# Returns: outputs the Bird object's name, classname, and call
	def print
		puts name + className + " says " + call
	end
end
#!/usr/bin/ruby
# birds.rb Tests out the menagerie of bird classes.
# Begun by: Dr. Adams, for CS 214 at Calvin College
# Completed by: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

require './Bird.rb'
require './Duck.rb'
require './Goose.rb'
require './Owl.rb'

if __FILE__ == $0
	puts "\nWelcome to the Bird Park!\n\n"

	bird0 = Bird.new "Hawkeye"
	bird0.print

	bird1 = Duck.new "Donald"
	bird1.print

	bird2 = Goose.new "Mother"
	bird2.print

	bird3 = Owl.new "Woodsey"
	bird3.print

	puts "\n"
end
#!/usr/bin/ruby
# Owl.rb Defines the Owl class which inherits attributes and methods from the Bird superclass.
# Begun by: Dr. Adams, for CS 214 at Calvin College
# Completed by: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

require './Bird.rb'

class Duck < Bird

	# Method: call, accessor for a Duck call
	# Precondition: Duck must exist
	# Receives: a Duck object
	# Returns: 'Quack!', a duck call
	def call
		'Quack!'
	end
end
#!/usr/bin/ruby
# Owl.rb Defines the Owl class which inherits attributes and methods from the Bird superclass.
# Begun by: Dr. Adams, for CS 214 at Calvin College
# Completed by: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

require './Bird.rb'

class Goose < Bird

	# Method: call, accessor for a Goose call
	# Precondition: Goose must exist
	# Receives: a Goose object
	# Returns: 'Honk!', a goose call
	def call
		'Honk!'
	end
end
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
igc2@eckert-mauchly:~/workspace/214/labs/10/ruby$ ls
Bird.rb  Birds.rb  Duck.rb  Goose.rb  Owl.rb  script.ruby
igc2@eckert-mauchly:~/workspace/214/labs/10/ruby$ ruby Birds.rb

Welcome to the Bird Park!

HawkeyeBird says Squaaaaaaawk!
DonaldDuck says Quack!
MotherGoose says Honk!
WoodseyOwl says Whoo-hoo

igc2@eckert-mauchly:~/workspace/214/labs/10/ruby$ exit

Script done on Sat 14 Apr 2018 09:32:30 PM EDT
