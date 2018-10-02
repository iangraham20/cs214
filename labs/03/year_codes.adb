-- year_codes.adb converts academic year codes to corresponding years
--
-- Input: year, a string
-- Precondition: year is one of "freshman", "sophomore", "junior", "senior"
-- Output: The year code (1, 2, 3 or 4) corresponding to year.
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College
-- Completed by: Ian Christensen, for CS 214, at Calvin College
-- Date: February 13, 2018

with Ada.Text_IO, Ada.Integer_Text_IO;	-- from the ADA IO library
use  Ada.Text_IO, Ada.Integer_Text_IO;	-- use text IO operations

procedure year_codes is	-- declare the class or procedure as year_codes

   year : String(1..9) := "         ";	-- declare the global variable year as a string with a length of 9 characters long
   charsRead : Natural;	-- read the characters Naturally??? weird but okay, could not find anything online about this


-- Function: yearCode() computes a student year integer, given an academic year string
-- Parameter: year, a string
-- Precondition: year is one of {freshman, sophomore, junior, or senior}
-- Return: the integer code corresponding to year
function yearCode(y: in string) return integer is	-- declare the function/method definition with year as an input string value and the output as an integer
	begin	-- begin the function body statement
		if year = "freshman " then	-- begin the if statement and check for freshman inputs keeping in mind the string length
			return 1;	-- return the corresponding value for freshman
		elsif year = "sophomore" then	-- check for sophomore inputs keeping in mind the string length
			return 2;	-- return the corresponding value for sophomore
		elsif year = "junior   " then	-- check for junior inputs keeping in mind the string length
			return 3;	-- return the corresponding value for junior
		elsif year = "senior   " then	-- check for senior inputs keeping in mind the string length
			return 4;	-- return the corresponding value for senior
		else	-- catch any unexpected inputs
			return 0;	-- return 0 for all invalid inputs
		end if;	-- end the if statement
	end yearCode;	-- end the yearCode mehtod

begin                                         	-- begin the user prompt 
   Put("Enter your academic year: ");           -- Prompt for input
   Get_Line(year, charsRead);                   -- Input
   Put(yearCode(year));                       -- Convert and output
   New_Line;									-- output a newline char
end year_codes;									-- end the year_codes class
