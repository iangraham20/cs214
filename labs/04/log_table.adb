-- log_table.adb computes a table of logarithms.
--
-- Input: start, stop, increment, three reals.
-- Precondition: increment is positive.
-- Output: A table of logarithms beginning with log(start),
--         ending with log(stop), with intervals of increment.
--
-- Begun by: Prof. Adams, for CS 214 at Calvin College.
-- Completed by: Ian Christensen, for CS 214 at Calvin College.
-- Date: February 21, 2018

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;

-- Function: computes a table of logarithms.
-- Input: start, stop, increment, three reals.
-- Precondition: increment is positive.
-- Output: A table of logarithms beginning with log(start),
--         ending with log(stop), with intervals of increment.
procedure log_table is

   Start, Stop, Increment : Float;

begin -- Prompt for input
   Put_Line("To print a table of logarithms,");
   Put("Enter the start value: ");
   Get(Start);
   Put("Enter the stop value: ");
   Get(Stop);
   Put("Enter the increment value: ");
   Get(Increment);

   while Start <= Stop loop
   	Put("The logarithm of ");
   	Put(Start);
   	Put(" is ");
   	Ada.Float_Text_IO.Put(Ada.Numerics.Elementary_Functions.Log(Start, 10.0));
   	New_Line;
   	start := Start + Increment;
   end loop;
end log_table;
