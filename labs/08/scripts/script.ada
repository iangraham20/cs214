Script started on Fri 06 Apr 2018 09:34:52 AM EDT
igc2@taylor:~/workspace/214/labs/08/ada$ ls
Makefile  name_package.adb  name_package.ads  name_tester.adb  script.ada
igc2@taylor:~/workspace/214/labs/08/ada$ make
gcc -c -gnata name_tester.adb
gcc -c -gnata name_package.adb
gnatbind name_tester.ali
gnatlink name_tester.ali
igc2@taylor:~/workspace/214/labs/08/ada$ cat name. _tester.adb name_package.adb name_package.ads
-- name_tester.adb "test-drives" the Name type
-- Begun by: Dr. Adams, CPSC 280, October 1999
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

with Ada.Text_IO, name_package;
use  Ada.Text_IO, name_package;

procedure name_tester is
  aName : name_package.Name;
begin
  name_package.Init(aName, "John    ", "Paul    ", "Jones   ");
  pragma Assert(getFirst(aName) = "John    ", "getFirst() failed");
  pragma Assert(getMiddle(aName) = "Paul    ", "getMiddle() failed");
  pragma Assert(getLast(aName) = "Jones   ", "getLast() failed");
  pragma Assert(getFullName(aName) = "John     Paul     Jones   ", "getFullName() failed");
  Put(aName); New_line;
  Put("All tests passed!"); New_line;
end name_tester;
-- name_package.adb defines operations for the Name type
-- Begun by: Dr. Adams, CS 214 at Calvin College
-- Completed by: Ian Christensen, CS 214 at Calvin College
-- Date: Spring, 2018

with Ada.Text_IO;
use  Ada.Text_IO;

package body name_package is

  -- Procedure: Init initializes a Name variable
  -- Parameters: Nm, the Name variable; First, the first name;
  --          Middle, the middle name; Last, the last name
  -- Return: Nm, its fields set to First, Middle, and Last
  procedure Init(Nm: out Name; First, Middle, Last : in String) is
  begin
    Nm.MyFirst := First;
    Nm.MyMiddle := Middle;
    Nm.MyLast := Last;
  end Init;

  -- getFirst(Name) retrieves Name.myFirst
  -- Parameters: Nm, a Name
  -- Precondition: Nm has been initialized
  -- Return: Nm.myFirst
  function getFirst(Nm: in Name) return String is
  begin
    return Nm.MyFirst;
  end getFirst;

  -- Function: getMiddle(Name) retrieves Name as a String
  -- Parameters: Nm, a Name
  -- Precondition: Nm has been initialized
  -- Return: Nm.myMiddle
  function getMiddle(Nm: in Name) return String is
  begin
     return Nm.MyMiddle;
  end getMiddle;

  -- Function: getLast(Name) retrieves Name.myLast
  -- Parameters: Nm, a Name
  -- Precondition: Nm has been initialized
  -- Return: Nm.myLast
  function getLast(Nm: in Name) return String is
  begin
     return Nm.MyLast;
  end getLast;

  -- Function: getFullName(Name) retrieves Name as a String
  -- Parameters: Nm, a Name
  -- Precondition: Nm has been initialized
  -- Return: a String rePreconditionsentation of Nm
  function getFullName(Nm: in Name) return String is
  begin
    return Nm.MyFirst & " " & Nm.MyMiddle & " " & Nm.MyLast;
  end getFullName;

  -- Procedure: Put(Name) displays a Name value
  -- Precondition: Nm has been initialized
  -- Parameters: Nm, a Name
  -- Returns: Nm, to the screen
  procedure Put(Nm: in Name) is
  begin
    Put(getFullName(Nm) );
  end Put;

end name_package;
-- name_package.ads declares the Name type and its operations
-- Begun by: Dr. Adams, CS 214 at Calvin College
-- Completed by: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

package Name_Package is
	type Name is private;
	procedure Init(Nm: out Name; First, Middle, Last : in String);
	function getFirst(Nm: in Name) return String;
	function getMiddle(Nm: in Name) return String;
	function getLast(Nm: in Name) return String;
	function getFullName(Nm: in Name) return String;
	procedure Put(Nm: in Name);

	private
	NAME_SIZE : constant Positive := 8;
  	type Name is record
		MyFirst, MyMiddle, MyLast : String(1..NAME_SIZE);
	end record;
	aName : Name;

end Name_Package;
igc2@taylor:~/workspace/214/labs/08/ada$ ls
Makefile  name_package.adb  name_package.ads  name_package.ali	name_package.o	name_tester  name_tester.adb  name_tester.ali  name_tester.o  script.ada
igc2@taylor:~/workspace/214/labs/08/ada$ ./name_tester
John     Paul     Jones   
All tests passed!
igc2@taylor:~/workspace/214/labs/08/ada$ make clean
rm -f name_tester *~ *# *.o *.ali *.c
igc2@taylor:~/workspace/214/labs/08/ada$ ls
Makefile  name_package.adb  name_package.ads  name_tester.adb  script.ada
igc2@taylor:~/workspace/214/labs/08/ada$ exit

Script done on Fri 06 Apr 2018 09:35:45 AM EDT
