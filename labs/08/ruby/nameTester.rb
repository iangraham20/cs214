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
