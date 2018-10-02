-- kiwi_package.adb gives Kiwi-related definitions by over-riding Bird-related definitions.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

package body Kiwi_Package is
	-- A Kiwi's Call (Over-rides Bird.Call())
	-- Receive: An_Kiwi, an Kiwi_Type
	-- Return: "Whoo!"
	function Call(A_Kiwi : in Kiwi_Type) return String is
	begin
		return "Aaawhhh!!! Aaawhhh!!! Aaawhhh!!!";
	end Call;

	-- Determine type of a Kiwi
	-- (Over-rides Bird.Type_Name())
	-- Receive: An_Kiwi, an Kiwi_Type
	-- Return: "Kiwi"
	function Type_Name(A_Kiwi : in Kiwi_Type) return String is
	begin
		return "Kiwi";
	end Type_Name;
end Kiwi_Package;
