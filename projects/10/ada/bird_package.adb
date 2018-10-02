--Bird_Type_package.adb givesBird_Type-related definitions
-- Begun by: Dr. Adams, for CS 214 at Calvin College
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

package body Bird_Package is
	-- initialization
	-- Receive: A_Bird, a Bird_Type; Name, a String
	-- Return: a Bird_Type in which My_Name = Name
	procedure Init(A_Bird : out Bird_Type; Name : in String) is
	begin
		A_Bird.My_Name := Name;
	end Init;

	-- Name accessor
	-- Receive: A_Bird, a Bird_Type
	-- Return: A_Bird.My_Name
	function Name(A_Bird : in Bird_Type) return String is
	begin
		return A_Bird.My_Name;
	end Name;

	-- a Bird_Type's Call
	-- Receive: A_Bird, a Bird_Type
	-- Return: a defaultBird_Type-call ("Squawk!")
	function Call(A_Bird : in Bird_Type) return String is
	begin
		return "Squawwwwwwk!";
	end Call;

	-- Determine type of a Bird_Type (for derived types)
	-- Receive: A_Bird, a Bird_Type
	-- Return: "Bird"
	function Type_Name(A_Bird : in Bird_Type) return String is
	begin
		return "Bird";
	end Type_Name;

	-- Output a Bird_Type
	-- Receive: A_Bird, a Bird_Type or subclass ofBird_Type
	-- Output: Everything known about A_Bird
	procedure Put(A_Bird : in Bird_Type'Class) is
	begin
		Put( Name(A_Bird) );
		Put( ' ' );
		Put( Type_Name(A_Bird) );
		Put( " just " );
		Put( Movement(A_Bird) );
		Put( " and said ");
		Put( Call(A_Bird) );
	end Put; 
end Bird_Package;
