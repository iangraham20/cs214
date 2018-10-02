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
