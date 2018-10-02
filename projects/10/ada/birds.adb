-- birds.adb tests our Birds type hierarchy.
-- Begun by: Dr. Adams, CS 214 at Calvin College
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

with Bird_Package, Flying_Package, Walking_Package, 
	 Duck_Package, Goose_Package, Owl_Package, 
	 Penguin_Package, Ostrich_Package, Kiwi_Package, 
	 Ada.Text_IO;
use  Bird_Package, Flying_Package, Walking_Package,
	 Duck_Package, Goose_Package, Owl_Package, 
	 Penguin_Package, Ostrich_Package, Kiwi_Package,
	 Ada.Text_IO;

procedure Birds is
	Bird1 : Duck_Type;  	-- derived class 0
	Bird2 : Goose_Type; 	-- derived class 1
	Bird3 : Owl_Type;   	-- derived class 2
	Bird4 : Penguin_Type;	-- derived class 3
	Bird5 : Ostrich_Type;	-- derived class 4
	Bird6 : Kiwi_Type;		-- derived class 5
begin
	New_Line; Put("Welcome to the Bird Park!"); New_Line;

	Init(Bird1, "Donald ");
	Put(Bird1); New_Line;

	Init(Bird2, "Mother ");
	Put(Bird2); New_Line;

	Init(Bird3, "Woodsy ");
	Put(Bird3); New_Line;

	Init(Bird4, "Peter  ");
	Put(Bird4); New_Line;

	Init(Bird3, "Orville");
	Put(Bird3); New_Line;

	Init(Bird3, "Joey   ");
	Put(Bird3); New_Line;

	New_Line;
end Birds;
