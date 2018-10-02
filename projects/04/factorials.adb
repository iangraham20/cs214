-- factorial.adb a program that given an integer computes its factorial
-- 
-- Input: n, an integer
-- Precondition: n is a positive integer
-- Output: n! or the factorial of n
--
-- Author: Ian Christensen, for CS 214 at Calvin College
-- Date: February 22, 2018

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure factorials is
	n : Integer;

	-- Function: factorial, computes the factorial of an integer
	-- Parameter: n, an integer
	-- Precondition: n is a positive integer
	-- Returns: answer, the factorial of n
	function factorial(n : in integer) return integer is
		answer : Integer := 1;
	begin
		for i in 2..n loop
			answer := answer * i;
		end loop;
	return answer;
	end factorial;

-- Statement: the interactive driver for factorial
-- Parameter: user inputs
-- Precondition: factorial.adb is being run
-- Returns: interactive print statements
begin
	Put("Enter an integer value: ");
	Get(n);
	Put("Factorial of" & Integer'Image(n) & " is:" & Integer'Image(factorial(n)));
end;
