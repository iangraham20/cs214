Script started on Sat 14 Apr 2018 07:30:37 PM EDT
igc2@eckert-mauchly:~/workspace/214/projects/09/ruby$ ls
List.rb  script.ruby  search.rb
igc2@eckert-mauchly:~/workspace/214/projects/09/ruby$ cat List.rb search.rb
# List.rb implements a linked list structure in Ruby
#
# Begun by: Dr. Adams, for CS 214 at Calvin College
# Completed by: Ian Christensen, CS 214 at Calvin College
# Date: Spring, 2018

require 'test/unit/assertions'
include Test::Unit::Assertions

class List
   # Subroutine: initialize, constructor for a List object
   # Postcondition: first == nil, last == nil, length == 0
   # Returns: an initialized List object
   def initialize()
      @first = nil
      @last = nil
      @length = 0
   end

   attr_reader :length

   # Subroutine: empty?, checks if the list is empty
   # Recieves: a List object
   # Returns: @length == 0, a boolean expression
   def empty?
      @length == 0
   end

   # Subroutine: append, adds a value to a list
   # Recieves: a List object
   # Parameters: value, the item to be appended
   # Postcondition: last == value and length = length + 1
   def append(value)
      newNode = Node.new(value, nil)

      if empty?
         @first = newNode
      else
         @last.next = newNode      
      end
      @last = newNode
      @length += 1
      self
   end

   # Subroutine: print, outputs the List items to the console
   # Recieves: a List object
   # Postcondition: my items have been displayed to the scree
   def print
      temp = @first
      while !temp.nil?
         printf " #{temp.value}"
         temp = temp.next
      end
   end

   # Subroutine: max, finds the maximum item in the List
   # Recieves: a List object
   # Precondition: the minimum List value cannot be less than -999999
   # Returns: maxValue, the maximum item in the List
   def max
      temp = @first
      maxValue = -999999
      while !temp.nil?
         if temp.value > maxValue
            maxValue = temp.value
         end
         temp = temp.next
      end
      maxValue
   end

   # Subroutine: search, finds the index of an item in the List
   # Recieves: a List object, an index value
   # Precondition: aValue must be in the list
   # Returns: indexValue, the index of aValue; or -1 if not in list
   def search(aValue)
      temp = @first
      indexValue = 0
      while !temp.nil?
         if temp.value == aValue
            return indexValue
         end
         indexValue += 1
         temp = temp.next
      end
      return -1
   end

   class Node
      # Subroutine: initialize, constructor for a Node object
      # Recieves: a List object
      # Postcondition: value == item, next == link
      # Returns: an initialized Node object
      def initialize(item, link)
         @value = item
         @next = link
      end
   attr_reader :value
   attr_accessor :next
   end
end

# search.rb tests a Ruby linked list
#
# Begun by: Dr. Adams for CS 214 at Calvin College
# Completed by: Ian Christensen, CS 214 at Calvin College
# Date: Spring, 2018

require './List'

if __FILE__ == $0
	list1 = List.new
	list2 = List.new
	list3 = List.new
	list4 = List.new

	list1.append(99).append(88).append(77).append(66).append(55)
	list2.append(55).append(66).append(77).append(88).append(99)
	list3.append(55).append(77).append(99).append(88).append(66)
	list4.append(44).append(55).append(66).append(77).append(88)

	list1.print 
	puts
	puts "Maximum of list1: #{list1.max}"

	list2.print 
	puts
	puts "Maximum of list2: #{list2.max}"

	list3.print 
	puts
	puts "Maximum of list3: #{list3.max}"

	list4.print 
	puts
	puts "Maximum of list4: #{list4.max}"

	puts "Index of 99 in list1: #{list1.search(99)}"
	puts "Index of 99 in list2: #{list2.search(99)}"
	puts "Index of 99 in list3: #{list3.search(99)}"
	puts "Index of 99 in list4: #{list4.search(99)}"
end
igc2@eckert-mauchly:~/workspace/214/projects/09/ruby$ ruby sc earch.rb
 99 88 77 66 55
Maximum of list1: 99
 55 66 77 88 99
Maximum of list2: 99
 55 77 99 88 66
Maximum of list3: 99
 44 55 66 77 88
Maximum of list4: 88
Index of 99 in list1: 0
Index of 99 in list2: 4
Index of 99 in list3: 2
Index of 99 in list4: -1
igc2@eckert-mauchly:~/workspace/214/projects/09/ruby$ ls
List.rb  script.ruby  search.rb
igc2@eckert-mauchly:~/workspace/214/projects/09/ruby$ exit

Script done on Sat 14 Apr 2018 07:30:58 PM EDT
