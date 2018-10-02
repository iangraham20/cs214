#!/usr/bin/ruby
# temperature.rb implements class Temperature
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

module Temperatures
	class Temperature
		# Subroutine: initialize, 
		# Precondition: degrees and scale have values
		# Input: degrees, a real; scale, a character
		# Output: a Temperature object
		def initialize(degrees, scale)
			if validTemp(degrees, scale)
				@degrees = degrees
				@scale = scale.capitalize
			end
		end

		# Subroutine: attr_reader, all accessors and mutators for degrees and scale
		# Precondition: @scale and @degrees are initialized
		# Input: a Temperature object
		# Output: @scale and @degrees values are mutations
		attr_reader :degrees, :scale

		# Subroutine: toCelsius, mutator for scale conversion
		# Precondition: @scale and @degrees are initialized
		# Input: a Temperature object
		# Output: new Temperature object with @scale == 'C'
		def toCelsius
			case @scale
				when 'C'
					Temperature.new(@degrees, 'C')
				when 'F'
					Temperature.new((@degrees - 32.0) * 5.0 / 9.0, 'C')
				when 'K'
					Temperature.new(@degrees - 273.15, 'C')
			end
		end

		# Subroutine: toFahrenheit, mutator for scale conversion
		# Precondition: @scale and @degrees are initialized
		# Input: a Temperature object
		# Output: new Temperature object with @scale == 'F'
		def toFahrenheit
			case @scale
				when 'C'
					Temperature.new(@degrees * 1.8 + 32.0, 'F')
				when 'F'
					Temperature.new(@degrees, 'F')
				when 'K'
					Temperature.new((@degrees - 273.15) * 1.8 + 32.0, 'F')
			end
		end

		# Subroutine: toKelvin, mutator for scale conversion
		# Precondition: @scale and @degrees are initialized
		# Input: a Temperature object
		# Output: new Temperature object with @scale == 'K'
		def toKelvin
		 	case @scale
				when 'C'
					Temperature.new(@degrees + 273.15, 'K')
				when 'F'
					Temperature.new((@degrees + 459.67) * 5.0 / 9.0, 'K')
				when 'K'
					Temperature.new(@degrees, 'K')
			end
		end

		# Subroutine: fromString, input for user strings
		# Precondition: temperature_string is in format 
		# Input: String_Temp, a String
		# Output: new Temperature object
		def fromString
			input = gets
			temp = input.split(' ', 2)
			return Temperature.new(temp[0].chomp.to_f, temp[1].chomp)
		end

		# Subroutine: toString, stringifies a Temperature object
		# Precondition: @degrees and @scale are initialized
		# Input: a Temperature object
		# Output: String format of a Temperature object
		def toString
			"#{@degrees.round(2)} #{@scale}"
		end

		# Subroutine: raiseTemp, mutator that increments a temperature's degree
		# Postcondition: the result cannot exceed the Planck Temperature
		# Input: a Temperature object; RaiseInc, a float
		# Output: new Temperature object with raised degree
		def raiseTemp incr
			Temperature.new(@degrees + incr, @scale)
		end

		# Subroutine: lowerTemp, mutator that decrements a temperature's degree
		# Postcondition: the result cannot deceed absolute zero
		# Input: a Temperature object; LowerInc, a float
		# Output: new Temperature object with lowered degree
		def lowerTemp incr
			Temperature.new(@degrees - incr, @scale)
		end

		# Subroutine: equalTo, equality operator for temperature regardless of scale
		# Preconditions: otherTemp is a valid Temperature object
		# Input: otherTemp, a Temperature object
		# Output: true if equal, false if not equal
		def equalTo otherTemp
		 	case @scale
				when 'C'
					@degrees == otherTemp.toCelsius().degrees
				when 'F'
					@degrees == otherTemp.toFahrenheit().degrees
				when 'K'
					@degrees == otherTemp.toKelvin().degrees
			end
		end

		# Subroutine: lessThan, less than operator for temperature regardless of scale
		# Precondition: otherTemp is a valid Temperature object
		# Input: otherTemp, a Temperature object
		# Output: true if less than, false if not less than
		def lessThan otherTemp
		 	case @scale
				when 'C'
					@degrees < otherTemp.toCelsius().degrees
				when 'F'
					@degrees < otherTemp.toFahrenheit().degrees
				when 'K'
					@degrees < otherTemp.toKelvin().degrees
			end
		end

		# Subroutine: validateTemperature, assesses whether the degree and scale are valid
		# Precondition: Degrees and Scale exist
		# Input: degrees, a double; scale, a char
		# Output: true, if a valid temperature
		def validTemp degrees, scale
			case scale
				when 'C'
					if degrees >= -273.15 && degrees <= 141683385000000005000000000000273.15
						return true
					else
						print "Degree must be between absolute zero and the Planck temperature"
						return false
					end
				when 'F'
					if degrees >= -459.67 && degrees <= 255030093000000008999999999999540.33
						return true
					else
						print "Degree must be between absolute zero and the Planck temperature"
						return false
					end
				when 'K'
					if degrees >= 0.0 && degrees <= 141683385000000005000000000000000.0
						return true
					else
						print "Degree must be between absolute zero and the Planck temperature"
						return false
					end
			else
				print "Scale must be Celsius, Fahrenheit, or Kelvin (i.e. C, F, K)"
				return false
			end
		end
	end
end
