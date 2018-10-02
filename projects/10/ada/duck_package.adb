-- Duck_Type_package.adb gives Duck_Type-related definitions by over-riding Bird-related definitions
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

package body Duck_Package is
	-- A Duck_Type's Call (Over-rides Bird.Call())
	-- Receive: A_Duck, a Duck_Type
	-- Return: "Quack!"
	function Call(A_Duck : in Duck_Type) return String is
	begin
		return "Quack!";
	end Call;

	-- Determine type of a Duck_Type (Over-rides Bird.Type_Name())
	-- Receive: A_Duck, a Duck_Type
	-- Return: "Duck"
	function Type_Name(A_Duck : in Duck_Type) return String is
	begin
		return "Duck";
	end Type_Name;
end Duck_Package;
