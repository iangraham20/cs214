-- QuadraticFormula.rb computes the roots of a quadratic equation
-- 
-- Input: a, b, c, doubles
-- Precondition: a != 0, and b^2 - 4ac are nonnegative
-- Output: root1, root2, doubles
-- 
-- Author: Ian Christensen
-- Date: February 28, 2018

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;

procedure quadratic_formula is

   a, b, c, root1, root2, arg, result : Float;

   -- Function: computes the roots of a quadratic equation
   -- Precondition: a != 0, and b^2 - 4ac are nonnegative
   -- Parameters: a, b, c, doubles
   -- Returns: results, a list of doubles
   procedure quadraticFormula(a, b, c: in Float; root1, root2, result: out Float) is
   begin
      if a /= 0.0 then
         arg := (b**2) - (4.0 * a * c);
         if arg >= 0.0 then
            root1 := ((-b + Ada.Numerics.Elementary_Functions.Sqrt(arg)) / (2.0 * a));
            root2 := ((-b - Ada.Numerics.Elementary_Functions.Sqrt(arg)) / (2.0 * a));
            result := 0.0;
         else 
            Put("quadraticFormula(): b^2 - 4ac is negative!");
            result := 1.0;
         end if;
      else
         Put("quadraticFormula(): a is zero!");
         result := 1.0;
      end if;
   end quadraticFormula;

begin
   New_Line;
   Put_Line("To compute the roots of a quadratic, ");
   Put("Enter a: ");
   Get(a);
   Put("Enter b: ");
   Get(b);
   Put("Enter c: ");
   Get(c);
   QuadraticFormula(a, b, c, root1, root2, result);
   New_Line;
   if result = 0.0 then
      Put_Line("The first root is: " & Float'Image(root1));
      Put_Line("The second root is: " & Float'Image(root2));
   else
      Put_Line("The answer is a non-real number.");
   end if;
   New_Line;
end quadratic_formula;
