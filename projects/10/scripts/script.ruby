Script started on Sat 21 Apr 2018 07:36:17 PM EDT

igc2@thompson:~/workspace/214/projects/10/ruby$ ls
Bird.rb  Birds.rb  Duck.rb  Flying.rb  Goose.rb  Kiwi.rb  Ostrich.rb  Owl.rb  Penguin.rb  script.ruby  Walking.rb
igc2@thompson:~/workspace/214/projects/10/ruby$ cat Bird.rb Birds.rb Flying.rb Duck.rb Owl.rb Bird.rb Duck.rb Owl.rb Goose.rb Walking.rb Penguin.rb Ostrich.rb Kiwi.rb
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
#!/usr/bin/ruby
# Flying.rb defines a flying superclass to be extended by specific bird sub-classes
# Begun by: Dr. Adams, for CS 214 at Calvin College
# Completed by: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

require './Bird.rb'

class Flying < Bird
	
	# Method: move, gets the movement of the bird
	# Precondition: Bird must exist
	# Receives: a Bird object
	# Returns: 'flew passed', the generic movement
	def move
		'flew passed'
	end
end
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
#!/usr/bin/ruby
# Owl.rb Defines the Owl class which inherits attributes and methods from the Bird superclass.
# Begun by: Dr. Adams, for CS 214 at Calvin College
# Completed by: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

require './Flying.rb'

class Owl < Flying

	# Method: call, accessor for a Owl call
	# Precondition: Owl must exist
	# Receives: a Owl object
	# Returns: 'Whoo-hoo', a owl call
	def call
		'Whoo-hoo'
	end
end
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
#!/usr/bin/ruby
# Penguin.rb Defines the Penguin class which inherits attributes and methods from the Bird superclass.
# Begun by: Dr. Adams, for CS 214 at Calvin College
# Completed by: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

require './Walking.rb'

class Penguin < Walking

	# Method: call, accessor for a Duck call
	# Precondition: Duck must exist
	# Receives: a Duck object
	# Returns: 'Quack!', a duck call
	def call
		'Huh-huh-huh-huuuuh'
	end
end
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
#!/usr/bin/ruby
# Kiwi.rb Defines the Kiwi class which inherits attributes and methods from the Bird superclass.
# Begun by: Dr. Adams, for CS 214 at Calvin College
# Completed by: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

require './Walking.rb'

class Kiwi < Walking

	# Method: call, accessor for a Duck call
	# Precondition: Duck must exist
	# Receives: a Duck object
	# Returns: 'Quack!', a duck call
	def call
		'Aaawhhh!!!'
	end
end
igc2@thompson:~/workspace/214/projects/10/ruby$ ls
Bird.rb  Birds.rb  Duck.rb  Flying.rb  Goose.rb  Kiwi.rb  Ostrich.rb  Owl.rb  Penguin.rb  script.ruby  Walking.rb
igc2@thompson:~/workspace/214/projects/10/ruby$ ruby Birds.rb

Welcome to the Bird Park!

Big Bird just moved passed and said Squaaaaaaawk!
Donald Duck just flew passed and said Quack!
Mother Goose just flew passed and said Honk!
Woodsey Owl just flew passed and said Whoo-hoo
Peter Penguin just walked passed and said Huh-huh-huh-huuuuh
Orville Ostrich just walked passed and said Snork
Katie Kiwi just walked passed and said Aaawhhh!!!

igc2@thompson:~/workspace/214/projects/10/ruby$ exit

Script done on Sat 21 Apr 2018 07:37:52 PM EDT
