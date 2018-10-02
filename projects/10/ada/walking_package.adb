-- Walking_Package.adb gives Flying-related definitions
-- Begun by: Dr. Adams, for CS 214 at Calvin College
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

package body Walking_Package is
	-- Determine type of a Movement (for derived types)
	-- Receive: A_Bird, a Bird_Type
	-- Return: "moved passed"
	function Movement(A_Walking : in Walking_Type) return String is
	begin
		return "walked passed";
	end Movement;
end Walking_Package;
