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
