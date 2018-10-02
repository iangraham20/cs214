-- Duck_Type_package.ads gives Duck_Type-related declarations and derives Duck_Type from Bird
-- Begun by: Dr. Adams, CS 214 at Calvin College
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

with Ada.Text_IO, Flying_Package;
use Ada.Text_IO, Flying_Package;

package Duck_Package is
	type Duck_Type is new Flying_Type with private;

	-- A Duck_Type's Call (Over-rides Bird.Call())
	-- Receive: A_Duck, a Duck_Type
	-- Return: "Quack!"
	function  Call(A_Duck : in Duck_Type) return String;

	-- Determine type of a Duck_Type (Over-rides Bird.Type_Name())
	-- Receive: A_Duck, a Duck_Type
	-- Return: "Duck_Type"
	function  Type_Name(A_Duck : in Duck_Type) return String;

	private
		type Duck_Type is new Flying_Type with
			record
				null;
			end record;
end Duck_Package;
