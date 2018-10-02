-- average.adb averages the values of an array of doubles
--
-- Input: array, an array of doubles AND size, a double
-- Precondition: array, is an array of numbers
-- Output: the average of the values in array
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

with Ada.Text_IO; use Ada.Text_IO;             -- Put(String)
with Ada.Float_Text_IO; use Ada.Float_Text_IO; -- Put(Float)

procedure average is
	type Vector is array (Positive range <>) of Float;
	array0 : Vector := (0.0, 0.0);
	array1 : Vector := (9.0, 8.0, 7.0, 6.0);

-- Function: computes the sum of an array of doubles
-- Parameters: array, an array of doubles
-- Preconditions: array, is an array of doubles
-- Returns: the sum of the values in array
Function sum(anArray : in Vector) return Float is
	total : Float := 0.0;
	begin
		for item in anArray'range loop
			total := total + anArray(item);
		end loop;
		return total;
	end sum;

-- Function: computes the average of an array of doubles
-- Parameters: array, an array of doubles
-- Preconditions: array, is an array of doubles
-- Returns: the average of the values in array
Function average(anArray : in Vector) return Float is
	
	begin
		if anArray'Length = 2 then
			return anArray(anArray'First) + anArray(anArray'Last) / 2.0;
		else
			return sum(anArray) / Float(anArray'Length);
		end if;
	end average;

-- Statement: main driver for average.adb
-- Parameters: none
-- Precondition: average.adb is the file being run
-- Returns: formatted print statements testing sum and average
begin
   Put(" average 0 is ");
   Put( average(array0) );
   New_line;
   Put(" average 1 is ");
   Put( average(array1) );
   New_line;
end average;
