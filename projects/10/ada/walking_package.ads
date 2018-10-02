-- Walking_Type_package.ads gives Walking_Type-related declarations
-- Begun by: Dr. Adams, for CS 214 at Calvin College
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

with Ada.Text_IO, Bird_Package;
use Ada.Text_IO, Bird_Package;

package Walking_Package is
	type Walking_Type is new Bird_Type with private;

	 -- Determine type of a Movement (for derived types)
	 -- Receive: A_Bird, a Bird_Type
	 -- Return: "moved passed"
	 function Movement(A_Walking : in Walking_Type) return String;

 	private
	type Walking_Type is new Bird_Type with
		record
			null;
		end record;
end Walking_Package;
