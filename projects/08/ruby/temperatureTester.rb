#!/usr/bin/ruby
# temperature_tester.rb tests class Temperature and its operations
# Author: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018

require 'test/unit/assertions'
include Test::Unit::Assertions
require '/home/igc2/workspace/214/projects/08/ruby/Temperature.rb'

def runTests
	print "Testing Constructor... "
	aTemp = Temperatures::Temperature.new(25.0, 'C')
	assert aTemp.degrees == 25.0
	assert aTemp.scale == 'C'
	puts "Passed!"

	print "Testing toFahrenheit... "
	aTemp = aTemp.toFahrenheit
	assert aTemp.degrees == 77.0
	assert aTemp.scale == 'F'
	puts "Passed!"

	print "Testing toCelsius... "
	aTemp = aTemp.toCelsius
	assert aTemp.degrees == 25.0
	assert aTemp.scale == 'C'
	puts "Passed!"

	print "Testing toKelvin... "
	aTemp = aTemp.toKelvin
	assert aTemp.degrees == 298.15
	assert aTemp.scale == 'K'
	puts "Passed!"

	print "Testing raiseTemp... "
	aTemp = aTemp.raiseTemp(10.0)
	assert aTemp.degrees == 308.15
	assert aTemp.scale == 'K'
	puts "Passed!"

	print "Testing lowerTemp... "
	aTemp = aTemp.lowerTemp(10.0)
	assert aTemp.degrees == 298.15
	assert aTemp.scale == 'K'
	puts "Passed!"

	print "Testing equalTo... "
	aTemp1 = aTemp.toCelsius
	aTemp2 = aTemp1.raiseTemp(20.0)
	assert aTemp.equalTo(aTemp)
	assert aTemp.equalTo(aTemp1)
	assert !(aTemp.equalTo(aTemp2))
	puts "Passed!"

	print "Testing lessThan... "
	aTemp1 = aTemp1.lowerTemp(20.0)
	assert !(aTemp.lessThan(aTemp))
	assert !(aTemp.lessThan(aTemp1))
	assert aTemp.lessThan(aTemp2)
	puts "Passed!"

	print "Testing fromString and toString... \nEnter a Temperature value: "
	aTemp = aTemp.fromString
	print "Temperature value fromString: "
	print aTemp.toString
	puts "All Tests Passed!"
end

if __FILE__ == $0
	runTests
	print "Enter the base temperature: "
	base = Temperatures::Temperature.new(0, 'F')
	base = base.fromString

	print "Enter the limit temperature: "
	limit = Temperatures::Temperature.new(100, 'C')
	limit = limit.fromString

	print "Enter the step value: "
	step = gets.chomp.to_f

	puts "Celsius   |   Fahrenheit   |   Kelvin"
	while base.lessThan(limit) do
		puts base.toCelsius().toString() + "   |   " + base.toFahrenheit().toString() + "   |   " + base.toKelvin().toString()
		base = base.raiseTemp(step)
	end
end
