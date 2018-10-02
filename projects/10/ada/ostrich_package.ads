-- ostrich_package.ads gives Ostrich-related declarations, and derives Ostrich from Bird
-- Begun by: Dr. Adams, for CS 214 at Calvin College
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

with Ada.Text_IO, Walking_Package;
use Ada.Text_IO, Walking_Package;

package Ostrich_Package is
	type Ostrich_Type is new Walking_Type with private;
	-- A Ostrich's Call (Over-rides Bird.Call())
	-- Receive: An_Ostrich, an Ostrich_Type
	-- Return: "Whoo!"
	function  Call(An_Ostrich : in Ostrich_Type) return String;

	-- Determine type of a Ostrich
	-- (Over-rides Bird.Type_Name())
	-- Receive: An_Ostrich, an Ostrich_Type
	-- Return: "Ostrich"
	function  Type_Name(An_Ostrich : in Ostrich_Type) return String;

	private
		type Ostrich_Type is new Walking_Type with
			record
				null;
			end record;
end Ostrich_Package;
