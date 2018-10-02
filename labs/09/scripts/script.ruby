Script started on Fri 13 Apr 2018 06:34:08 PM EDT
igc2@wirth:~/workspace/214/labs/09/ruby$ ls
List.rb  max.rb  script.ruby
igc2@wirth:~/workspace/214/labs/09/ruby$ ruby cat max.rb
# max.rb tests a Ruby linked list.
#
# Begun by: Dr. Adams for CS 214 at Calvin College.
# Completed by: Ian Christensen, CS 214 at Calvin College
# Date: Spring, 2018

require './List'

if __FILE__ == $0
	list1 = List.new
	list2 = List.new
	list3 = List.new

	list1.append(99).append(88).append(77).append(66).append(55)
	list2.append(55).append(66).append(77).append(88).append(99)
	list3.append(55).append(77).append(99).append(88).append(66)

	list1.print 
	puts
	puts "Maximum of list1: #{list1.max}"

	list2.print 
	puts
	puts "Maximum of list2: #{list2.max}"

	list3.print 
	puts
	puts "Maximum of list3: #{list3.max}"
end
igc2@wirth:~/workspace/214/labs/09/ruby$ ruby max.rb
 99 88 77 66 55
Maximum of list1: 99
 55 66 77 88 99
Maximum of list2: 99
 55 77 99 88 66
Maximum of list3: 99
igc2@wirth:~/workspace/214/labs/09/ruby$ exit

Script done on Fri 13 Apr 2018 06:35:26 PM EDT
