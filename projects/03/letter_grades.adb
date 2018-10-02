-- LetterGrades.java recieves a numeric grade and calculates the equivalent letter grade
-- Author: Ian Graham Christensen, for CS 214, at Calvin College
-- Date: February 15, 2018
-- 
-- Input: a numeric grade average
-- Precondition: the grade is a positive integer value
-- Output: a letter grade

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure letter_grades is
	
	grade : Integer;
	letter : String(1..13);
	
	-- Function: letterGrade() recieves a numeric grade and calculates the equivalent letter grade
	-- Parameter: grade, an int
	-- Precondition: input is an integer more than 0 and less than 100
	-- Return: letter, a string
	function letterGrade(grade: in integer) return String is
		begin
			case grade is
				when 90..100 =>
					letter := "A            ";
				when 80..89 =>
					letter :=  "B            ";
				when 70..79 =>
					letter :=  "C            ";
				when 60..69 =>
					letter :=  "D            ";
				when 0..59 =>
					letter :=  "F            ";
				when others =>
					letter :=  "Invalid Input";
			end case;
			return letter;
		end letterGrade;

	begin
		Put("Enter a numeric grade point average: ");
		Get(grade);
		Put("The equivalent letter grade is: ");
		Put(letterGrade(grade));
end letter_grades;
