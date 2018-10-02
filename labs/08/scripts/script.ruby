Script started on Thu 05 Apr 2018 02:43:22 PM EDT
igc2@kernighan:~/workspace/214/labs/08/ruby$ cat     ls
Name.rb  nameTester.rb	script.ruby
igc2@kernighan:~/workspace/214/labs/08/ruby$ cat Name.rb R NameT     nameTester.rb
#!/usr/bin/ruby
# name.rb implements class Name
# Begun by: Dr. Adams, for CS 214 at Calvin College
# Completed by: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

module Names
  class Name

    def initialize(first, middle, last)
      @first, @middle, @last = first, middle, last
    end

    attr_reader :first, :middle, :last

    def fullName
      @first + " " + @middle + " " + @last
    end

    def print
      puts fullName
      fullName
    end
  end
end
#!/usr/bin/ruby
# nameTester.rb tests class Name and its operations
# Begun by: Dr. Adams, for CS 214 at Calvin College
# Completed by: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

require 'test/unit/assertions'
include Test::Unit::Assertions

require '/home/igc2/workspace/214/labs/08/ruby/Name.rb'
# require 'Name.rb'
# load 'Name.rb'

if __FILE__ == $0
   name = Names::Name.new("John", "Paul", "Jones")

   assert name.first == "John", 
           "first failed"
   assert name.middle == "Paul",
           "middle failed"
   assert name.last == "Jones",
           "last failed"
   assert name.fullName == "John Paul Jones",
           "fullName failed"
   assert name.print == "John Paul Jones",
           "print failed"
   
   print "All tests passed!\n"
end
igc2@kernighan:~/workspace/214/labs/08/ruby$ ruby nameTester.rb
John Paul Jones
All tests passed!
igc2@kernighan:~/workspace/214/labs/08/ruby$ exit

Script done on Thu 05 Apr 2018 02:43:52 PM EDT
