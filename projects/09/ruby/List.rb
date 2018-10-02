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

