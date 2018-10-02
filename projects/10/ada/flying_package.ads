-- flying_package.ads gives Flying-related declarations
-- Begun by: Dr. Adams, for CS 214 at Calvin College
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

with Ada.Text_IO, Bird_Package;
use Ada.Text_IO, Bird_Package;

package Flying_Package is
	type Flying_Type is new Bird_Type with private;

	 -- Determine type of a Movement (for derived types)
	 -- Receive: A_Bird_Type, a Bird_Type
	 -- Return: "moved passed"
	 function Movement(A_Flying : in Flying_Type) return String;

 	private
	type Flying_Type is new Bird_Type with
		record
			null;
		end record;
end Flying_Package;
