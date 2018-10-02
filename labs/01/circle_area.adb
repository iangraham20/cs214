-- circle_area.adb computes the area of a circle.
--
-- Input: The radius of the circle.
-- Precondition: The radius is a positive number.
-- Output: The area of the circle.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by:
-- Date:
----------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO;   -- importing the input/output library
use  Ada.Text_IO, Ada.Float_Text_IO;

procedure circle_area is -- unsure what this is exactly but seems a lot like a class, I looked it up and couldn't find much on it...

   radius, area : float; -- initilizes the global variables

   -- function circleArea computes a circle's area, given its radius
   -- Parameter: r, a float
   -- Precondition: r >= 0.0
   -- Return: the area of the circle whose radius is r
   ----------------------------------------------------
   function circleArea(r: in float) return float is -- This is the beginning of the function
      PI : constant := 3.1415927;   -- setting PI as a constant
   begin -- this begins the functions calculation
      return PI * r ** 2;  -- this returns the calculated radius by multiplying pi times the radius times two
   end circleArea;   -- this is the ending statement of the function, kind of like a finishing curly bracket in C++

begin    -- this begins the user's prompt
   Put_Line("To compute the area of a circle,"); -- this is the same as an endline in the sense that it starts a new line after outputting the text
   Put("enter its radius: "); -- this is a simple print statement asking for the radius
   Get(radius);   -- this is setting the radius value to the user's input

   area := circleArea(radius);   -- this is calling the circleArea function with the new raidus value

   Put("The circle's area is "); -- this is simply a print statement
   Put(area);  -- this outputs the new global variable that was set in the circleArea function
   New_Line; -- outputs a newline character
end circle_area; -- this ends the cli i/o
