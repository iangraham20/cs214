-- Bird_Type_package.ads gives Bird_Type-related declarations
-- Begun by: Dr. Adams, for CS 214 at Calvin College
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

with Ada.Text_IO;
use Ada.Text_IO;

package Bird_Package is
	type Bird_Type is abstract tagged private;

	 -- initialization
	 -- Receive: A_Bird, a Bird_Type; Name, a String
	 -- Return: a Bird_Type whose My_Name = Name
	 procedure Init(A_Bird : out Bird_Type; Name : in String);

	 -- Name accessor
	 -- Receive: A_Bird, a Bird_Type
	 -- Return: A_Bird.My_Name
	 function  Name(A_Bird : in Bird_Type) return String;

	 -- A Bird_Type's Call
	 -- Receive: A_Bird, a Bird_Type
	 -- Return: a default Bird_Type-call ("Squawk!")
	 function  Call(A_Bird : in Bird_Type) return String;

	 -- Determine type of a Bird_Type (for derived types)
	 -- Receive: A_Bird, a Bird_Type
	 -- Return: "Bird_Type"
	 function  Type_Name(A_Bird : in Bird_Type) return String;

	 -- Determine type of a Movement (for derived types)
	 -- Receive: A_Bird, a Bird_Type
	 -- Return: "moved passed"
	 function Movement(A_Bird : in Bird_Type) return String is abstract;

	 -- Output a Bird_Type
	 -- Receive: A_Bird, a Bird_Type or subclass of Bird_Type
	 -- Output: Everything known about A_Bird
	 procedure Put(A_Bird : in Bird_Type'Class);
	 
	private
		type Bird_Type is abstract tagged record
				My_Name : String(1..7);
			end record;
end Bird_Package;
