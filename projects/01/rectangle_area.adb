-- rectangle_area.adb computes the area of a rectangle
--
-- Input: the length and width of a rectangle
-- Precondition: the length and width are not negative
-- Output: the area of the rectangle
--
-- Author: Ian Christensen
-- Date: February 1, 2018

with Ada.Text_IO, Ada.Float_Text_IO;   -- from the IO and text-to-float library
use  Ada.Text_IO, Ada.Float_Text_IO;   -- import the IO and text-to-float operations

procedure rectangle_area is -- declare the method procedure (like the class I guess)
   l, w, area : float;     -- declare and set the variables as type float
   -- Function rectangleArea computes a rectangle's area, given its length and width
   -- Parameter: l, a float && w, a float
   -- Precondition: l >= 0.0 && w >= 0.0
   -- Return: the area of the rectangle whose length is l and whose width is w
   function rectangleArea(l: in float; w: in float) return float is   -- declare the method definition passing in the length and width
      begin                                                            -- begin the function operations
         return l * w;                                                 -- return the calculated area by multiplying the length and width
      end rectangleArea;                                               -- end the function operations

begin                                              -- begin the statement
   Put_Line("To compute the area of a rectangle,");-- output a message with a newline
   Put("enter its length: ");                      -- prompt the user for the length
   Get(l);                                         -- save the input to a variable
   Put("enter its width: ");                       -- prompt the user for the width
   Get(w);                                         -- save the input to a variable
   area := rectangleArea(l, w);                    -- call the function using to new variables as the parameters and store in a variable
   Put("The rectanle's area is ");                 -- output a message without a newline
   Put(area);                                      -- output the resulting area
   New_Line;                                       -- output a newline character
end rectangle_area;                                -- end the 
