-- penguin_package.ads gives penguin-related declarations, and derives penguin from Bird
-- Begun by: Dr. Adams, for CS 214 at Calvin College
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

with Ada.Text_IO, Walking_Package;
use Ada.Text_IO, Walking_Package;

package Penguin_Package is
	type Penguin_Type is new Walking_Type with private;
	-- A penguin's Call (Over-rides Bird.Call())
	-- Receive: An_penguin, an penguin_Type
	-- Return: "Whoo!"
	function  Call(A_Penguin : in Penguin_Type) return String;

	-- Determine type of a penguin
	-- (Over-rides Bird.Type_Name())
	-- Receive: An_penguin, an penguin_Type
	-- Return: "penguin"
	function  Type_Name(A_Penguin : in Penguin_Type) return String;

	private
		type Penguin_Type is new Walking_Type with
			record
				null;
			end record;
end Penguin_Package;
