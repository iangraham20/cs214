-- ArrayProcessing.adb allows a user to store and print values in an array
--
-- Input: the array size and the individual values
-- Precondition: the input values are doubles
-- Output: prints out the values contained in array
--
-- Author: Ian Christensen, CS 214 at Calvin College
-- Date: Spring, 2018

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;

procedure array_processing is
	type Vector is array (Positive range <>) of Float;
	size : Integer;
	input : Float;

begin
	New_Line;
	Put("Enter the size of the array: ");
	Get(size);
	declare
	anArray : Vector(1..size);

	-- Function: prompts the user to specify the array values
	-- Parameters: array[], an array of doubles && size, an integer
	-- Preconditions: user inputs are doubles
	-- Returns: values within array
	procedure readArray(anArray : in out Vector) is
		begin
			for I in anArray'Range loop
				New_Line;
				Put("Enter a value to store at index" & Integer'Image(I) & ": ");
				Get(input);
				anArray(I) := input;
			end loop;
		end readArray;

	-- Function: prints an arrays values
	-- Parameters: array[], an array of doubles && size, an int
	-- Preconditions: array contains values
	-- Returns: prints out the values contained in array
	procedure printArray(anArray : in Vector) is
		begin
			if anArray'Length = 0 then
				New_Line;
				Put("Your array is empty!");
				New_Line;
			end if;
			for I in anArray'Range loop
				New_Line;
				Put("The value at input #" & Integer'Image(I) & " is: " & Float'Image(anArray(I)));
				New_Line;
			end loop;
		end printArray;

begin
	readArray(anArray);
	printArray(anArray);
	New_Line;
end;
end array_processing;
