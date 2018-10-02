Script started on Tue 24 Apr 2018 10:52:06 AM EDT
igc2@thompson:~/workspace/214/projects/10/ada$ ls
bird_package.adb  birds.adb	    duck_package.ads	flying_package.ads  goose_package.ads  kiwi_package.ads  ostrich_package.adb  owl_package.adb  penguin_package.adb  script.ada		 walking_package.ads
bird_package.ads  duck_package.adb  flying_package.adb	goose_package.adb   kiwi_package.adb   Makefile		 ostrich_package.ads  owl_package.ads  penguin_package.ads  walking_package.adb
igc2@thompson:~/workspace/214/projects/10/ada$ cat bird_package        s.adb bird_package.adb s p bird_package.ads d b flying_[p  package.ads flying_package.adb walking_package.ads walking_package.adb duck_package.ads duck_package.adb goose_package.ads g ooseP _package.adb owl_package.ads owl_package.adb penguin_package.ads penguin_package.adb O ostrich_package.ads ostrich  _package.adb kiwi_package.ads kiwi_package.adb
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
-- flying_package.ads gives Flying-related declarations
-- Begun by: Dr. Adams, for CS 214 at Calvin College
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

with Ada.Text_IO, Bird_Package;
use Ada.Text_IO, Bird_Package;

package Flying_Package is
	type Flying_Type is new Bird_Type with private;

	 -- Determine type of a Movement (for derived types)
	 -- Receive: A_Bird_Type, a Bird_Type
	 -- Return: "moved passed"
	 function Movement(A_Flying : in Flying_Type) return String;

 	private
	type Flying_Type is new Bird_Type with
		record
			null;
		end record;
end Flying_Package;
-- flying_package.adb gives Flying-related definitions
-- Begun by: Dr. Adams, for CS 214 at Calvin College
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

package body Flying_Package is
	-- Determine type of a Movement (for derived types)
	-- Receive: A_Bird, a Bird_Type
	-- Return: "moved passed"
	function Movement(A_Flying : in Flying_Type) return String is
	begin
		return "flew passed";
	end Movement;
end Flying_Package;
-- Walking_Type_package.ads gives Walking_Type-related declarations
-- Begun by: Dr. Adams, for CS 214 at Calvin College
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

with Ada.Text_IO, Bird_Package;
use Ada.Text_IO, Bird_Package;

package Walking_Package is
	type Walking_Type is new Bird_Type with private;

	 -- Determine type of a Movement (for derived types)
	 -- Receive: A_Bird, a Bird_Type
	 -- Return: "moved passed"
	 function Movement(A_Walking : in Walking_Type) return String;

 	private
	type Walking_Type is new Bird_Type with
		record
			null;
		end record;
end Walking_Package;
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
-- Duck_Type_package.ads gives Duck_Type-related declarations and derives Duck_Type from Bird
-- Begun by: Dr. Adams, CS 214 at Calvin College
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

with Ada.Text_IO, Flying_Package;
use Ada.Text_IO, Flying_Package;

package Duck_Package is
	type Duck_Type is new Flying_Type with private;

	-- A Duck_Type's Call (Over-rides Bird.Call())
	-- Receive: A_Duck, a Duck_Type
	-- Return: "Quack!"
	function  Call(A_Duck : in Duck_Type) return String;

	-- Determine type of a Duck_Type (Over-rides Bird.Type_Name())
	-- Receive: A_Duck, a Duck_Type
	-- Return: "Duck_Type"
	function  Type_Name(A_Duck : in Duck_Type) return String;

	private
		type Duck_Type is new Flying_Type with
			record
				null;
			end record;
end Duck_Package;
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
-- goose_package.ads gives Goose-related declarations, and derives Goose from Bird
-- Begun by: Dr. Adams, CS 214 at Calvin College
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

with Ada.Text_IO, Flying_Package;
use Ada.Text_IO, Flying_Package;

package Goose_Package is
	type Goose_Type is new Flying_Type with private;

	-- A Goose's Call (Over-rides Bird.Call())
	-- Receive: A_Goose, a Goose
	-- Return: "Honk!"
	function  Call(A_Goose : in Goose_Type) return String;

	-- Determine type of a Goose
	-- (Over-rides Bird.Type_Name())
	-- Receive: A_Goose, a Goose
	-- Return: "Goose"
	function  Type_Name(A_Goose : in Goose_Type) return String;

	private
		type Goose_Type is new Flying_Type with
			record
				null;
			end record;
end Goose_Package;
-- goose_package.adb gives Goose-related definitions by over-riding Bird-related definitions
-- Begun by: Dr. Adams, CS 214 at Calvin College
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

package body Goose_Package is
	-- A Goose's Call (Over-rides Bird.Call())
	-- Receive: A_Goose, a Goose_Type
	-- Return: "Honk!"
	function Call(A_Goose : in Goose_Type) return String is
	begin
		return "Honk!";
	end Call;

	-- Determine type of a Goose
	-- (Over-rides Bird.Type_Name())
	-- Receive: A_Goose, a Goose_Type
	-- Return: "Goose"
	function Type_Name(A_Goose : in Goose_Type) return String is
	begin
		return "Goose";
	end Type_Name;
end Goose_Package;
-- owl_package.ads gives Owl-related declarations, and derives Owl from Bird
-- Begun by: Dr. Adams, for CS 214 at Calvin College
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

with Ada.Text_IO, Flying_Package;
use Ada.Text_IO, Flying_Package;

package Owl_Package is
	type Owl_Type is new Flying_Type with private;
	
	-- A Owl's Call (Over-rides Bird.Call())
	-- Receive: An_Owl, an Owl_Type
	-- Return: "Whoo!"
	function  Call(An_Owl : in Owl_Type) return String;

	-- Determine type of a Owl
	-- (Over-rides Bird.Type_Name())
	-- Receive: An_Owl, an Owl_Type
	-- Return: "Owl"
	function  Type_Name(An_Owl : in Owl_Type) return String;

	private
		type Owl_Type is new Flying_Type with
			record
				null;
			end record;
end Owl_Package;
-- owl_package.adb gives Owl-related definitions by over-riding Bird-related definitions.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

package body Owl_Package is
	-- A Owl's Call (Over-rides Bird.Call())
	-- Receive: An_Owl, an Owl_Type
	-- Return: "Whoo!"
	function Call(An_Owl : in Owl_Type) return String is
	begin
		return "Whoo!";
	end Call;

	-- Determine type of a Owl
	-- (Over-rides Bird.Type_Name())
	-- Receive: An_Owl, an Owl_Type
	-- Return: "Owl"
	function Type_Name(An_Owl : in Owl_Type) return String is
	begin
		return "Owl";
	end Type_Name;
end Owl_Package;
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
-- ostrich_package.adb gives Ostrich-related definitions by over-riding Bird-related definitions.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

package body Ostrich_Package is
	-- A Ostrich's Call (Over-rides Bird.Call())
	-- Receive: An_Ostrich, an Ostrich_Type
	-- Return: "Whoo!"
	function Call(An_Ostrich : in Ostrich_Type) return String is
	begin
		return "Snork";
	end Call;

	-- Determine type of a Ostrich
	-- (Over-rides Bird.Type_Name())
	-- Receive: An_Ostrich, an Ostrich_Type
	-- Return: "Ostrich"
	function Type_Name(An_Ostrich : in Ostrich_Type) return String is
	begin
		return "Ostrich";
	end Type_Name;
end Ostrich_Package;
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
igc2@thompson:~/workspace/214/projects/10/ada$ cat ma  Makefile
# Makefile for GNAT (Ada) compilation
#  for a 2-level class hierarchy

TARGET = birds
SUBPACKAGES = flying_package.ali walking_package.ali duck_package.ali goose_package.ali owl_package.ali penguin_package.ali ostrich_package.ali kiwi_package.ali
PACKAGES = bird_package.ali $(SUBPACKAGES)

CC     = gcc
CFLAGS = -c 

.SUFFIXES:
.SUFFIXES: .adb .ads                  # ada package body & spec.

$(TARGET): $(TARGET).ali $(PACKAGES)  # link target & packages
	$(BIN)gnatbind $(TARGET).ali
	$(BIN)gnatlink $(TARGET).ali

$(TARGET).ali: $(TARGET).adb          # compile target (w/o .ads)
	$(CC) $(CFLAGS) $<

%.ali : %.adb %.ads                   # compile packages (w .ads)
	$(CC) $(CFLAGS) $<

$(SUBPACKAGES) : bird_package.ads     # subclasses depend on superclass

clean:
	/bin/rm -f $(TARGET) *~ *.o *.ali *.c *#


igc2@thompson:~/workspace/214/projects/10/ada$ make
gcc -c  birds.adb
birds.adb:20:09: warning: variable "Bird5" is never read and never assigned
birds.adb:21:09: warning: variable "Bird6" is never read and never assigned
gcc -c  bird_package.adb
gcc -c  flying_package.adb
gcc -c  walking_package.adb
gcc -c  duck_package.adb
gcc -c  goose_package.adb
gcc -c  owl_package.adb
gcc -c  penguin_package.adb
gcc -c  ostrich_package.adb
gcc -c  kiwi_package.adb
gnatbind birds.ali
gnatlink birds.ali
igc2@thompson:~/workspace/214/projects/10/ada$ ls
bird_package.adb  birds      duck_package.adb  flying_package.adb  goose_package.adb  kiwi_package.adb	Makefile	     ostrich_package.o	owl_package.o	     penguin_package.o	  walking_package.ali
bird_package.ads  birds.adb  duck_package.ads  flying_package.ads  goose_package.ads  kiwi_package.ads	ostrich_package.adb  owl_package.adb	penguin_package.adb  script.ada		  walking_package.o
bird_package.ali  birds.ali  duck_package.ali  flying_package.ali  goose_package.ali  kiwi_package.ali	ostrich_package.ads  owl_package.ads	penguin_package.ads  walking_package.adb
bird_package.o	  birds.o    duck_package.o    flying_package.o    goose_package.o    kiwi_package.o	ostrich_package.ali  owl_package.ali	penguin_package.ali  walking_package.ads
igc2@thompson:~/workspace/214/projects/10/ada$ ./birds

Welcome to the Bird Park!
Donald  Duck just flew passed and said Quack!
Mother  Goose just flew passed and said Honk!
Woodsy  Owl just flew passed and said Whoo!
Peter   Penguin just walked passed and said Huh-huh-huh-huuuuh
Orville Owl just flew passed and said Whoo!
Joey    Owl just flew passed and said Whoo!

igc2@thompson:~/workspace/214/projects/10/ada$ make clean
/bin/rm -f birds *~ *.o *.ali *.c *#
igc2@thompson:~/workspace/214/projects/10/ada$ ls
bird_package.adb  birds.adb	    duck_package.ads	flying_package.ads  goose_package.ads  kiwi_package.ads  ostrich_package.adb  owl_package.adb  penguin_package.adb  script.ada		 walking_package.ads
bird_package.ads  duck_package.adb  flying_package.adb	goose_package.adb   kiwi_package.adb   Makefile		 ostrich_package.ads  owl_package.ads  penguin_package.ads  walking_package.adb
igc2@thompson:~/workspace/214/projects/10/ada$ exit

Script done on Tue 24 Apr 2018 10:55:01 AM EDT
