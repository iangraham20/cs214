-- penguin_package.adb gives penguin-related definitions by over-riding Bird-related definitions.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

package body Penguin_Package is
	-- A penguin's Call (Over-rides Bird.Call())
	-- Receive: An_penguin, an penguin_Type
	-- Return: "Whoo!"
	function Call(A_Penguin : in Penguin_Type) return String is
	begin
		return "Huh-huh-huh-huuuuh";
	end Call;

	-- Determine type of a penguin
	-- (Over-rides Bird.Type_Name())
	-- Receive: An_penguin, an penguin_Type
	-- Return: "penguin"
	function Type_Name(A_Penguin : in Penguin_Type) return String is
	begin
		return "Penguin";
	end Type_Name;
end Penguin_Package;
