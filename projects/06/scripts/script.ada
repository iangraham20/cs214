Script started on Wed 14 Mar 2018 04:06:05 PM EDT
igc2@church:~/workspace/214/projects/06$ cat array_processing.adb
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
igc2@church:~/workspace/214/projects/06$ make
gcc -c array_processing.adb
gnatbind -x array_processing.ali
gnatlink array_processing.ali
igc2@church:~/workspace/214/projects/06$ ./array_processing

Enter the size of the array: 0

Your array is empty!

igc2@church:~/workspace/214/projects/06$ ./array_processing

Enter the size of the array: 5

Enter a value to store at index 1: 0

Enter a value to store at index 2: -5

Enter a value to store at index 3: .000005

Enter a value to store at index 4: 12345

Enter a value to store at index 5: 23.456

The value at input # 1 is:  0.00000E+00

The value at input # 2 is: -5.00000E+00

The value at input # 3 is:  5.00000E-06

The value at input # 4 is:  1.23450E+04

The value at input # 5 is:  2.34560E+01

igc2@church:~/workspace/214/projects/06$ exit

Script done on Wed 14 Mar 2018 04:06:58 PM EDT
