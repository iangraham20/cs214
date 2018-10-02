-- kiwi_package.ads gives Kiwi-related declarations, and derives Kiwi from Bird
-- Begun by: Dr. Adams, for CS 214 at Calvin College
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

with Ada.Text_IO, Walking_Package;
use Ada.Text_IO, Walking_Package;

package Kiwi_Package is
	type Kiwi_Type is new Walking_Type with private;
	
	-- A Kiwi's Call (Over-rides Bird.Call())
	-- Receive: An_Kiwi, an Kiwi_Type
	-- Return: "Aaawhhh!!! Aaawhhh!!! Aaawhhh!!!"
	function  Call(A_Kiwi : in Kiwi_Type) return String;

	-- Determine type of a Kiwi
	-- (Over-rides Bird.Type_Name())
	-- Receive: An_Kiwi, an Kiwi_Type
	-- Return: "Kiwi"
	function  Type_Name(A_Kiwi : in Kiwi_Type) return String;

	private
		type Kiwi_Type is new Walking_Type with
			record
				null;
			end record;
end Kiwi_Package;
