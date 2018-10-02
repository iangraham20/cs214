-- split.adb splits an input string about a specified position.
--
-- Input: Astring, a string and Pos, an integer
-- Precondition: Pos is in Astring's Range
-- Output: The substrings of Astring split by pos
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: February 23, 2018

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings.Fixed;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings.Fixed;

procedure split is

   EMPTY_STRING : String := "                                        ";

   astring, substring1, substring2 : String  := EMPTY_STRING;
   position, Chars_read       : Natural;

   -- Function: split, splits a string according to the position specified
   -- Paramters: string, a string, position, an integer, and results, an array of strings
   -- Precondition: position is in aString's Range
   -- Passback: The substrings of astring split by position
   procedure splitter(astring: in string; position: in integer; substring1, substring2: out string) is
   begin
      Ada.Strings.Fixed.Move(astring(astring'first..position-1), substring1);
      Ada.Strings.Fixed.Move(astring(position..astring'last), substring2);
   end splitter;

begin
   New_Line;
   Put("To split a string, enter the string: ");
   Get_Line(astring, Chars_Read);
   Put("Enter the split position: ");
   Get(position);
   splitter(astring, position, substring1, substring2);
   New_Line;
   Put("The first part is: ");
   Put_Line(substring1);
   Put(" and the second part is: ");
   Put_Line(substring2);
   New_Line;
end split;
