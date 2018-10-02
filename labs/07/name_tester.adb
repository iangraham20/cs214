-- NameTester.adb tests class Name and its operations
-- Begun by: Prof. Adams, for CS 214 at Calvin College
-- Student: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

with Ada.Text_IO;
use Ada.Text_IO;

procedure name_tester is

NAME_SIZE : constant Integer := 8;
Type Name is record
    MyFirst, MyMiddle, MyLast : String(1..NAME_SIZE);
end record;
aName : Name;

  -- Init initializes a Name variable
  -- Parameters: theName, the Name variable
  --          First, the first name
  --          Middle, the middle name,
  --          Last, the last name
  -- Return: theName, its fields set to First,
  --               Middle, and Last
  procedure Init(TheName: out Name; First, Middle, Last : in String) is
  begin
    TheName.MyFirst := First;
    TheName.MyMiddle := Middle;
    TheName.MyLast := Last;
  end Init;

  -- getFirst(Name) retrieves Name.myFirst
  -- Parameters: theName, a Name
  -- Precondition: theName has been initialized
  -- Return: theName.myFirst
  function getFirst(TheName : in Name) return String is
  begin
    return TheName.MyFirst;
  end getFirst;

  -- getMiddle(Name) retrieves Name.myMiddle
  -- Parameters: theName, a Name
  -- Precondition: theName has been initialized
  -- Return: theName.myMiddle
  function getMiddle(TheName : in Name) return String is
  begin
    return TheName.MyMiddle;
  end getMiddle;

  -- getLast(Name) retrieves Name.myLast
  -- Parameters: theName, a Name
  -- Precondition: theName has been initialized
  -- Return: theName.myLast
  function getLast(TheName : in Name) return String is
  begin
    return TheName.MyLast;
  end getLast;

  -- getFullName(Name) retrieves Name as a String
  -- Parameters: theName, a Name
  -- Precondition: theName has been initialized
  -- Return: a String representation of theName
  function getFullName(TheName : in Name) return String is
  begin
    return TheName.MyFirst & " " & TheName.MyMiddle & " " & TheName.MyLast;
  end getFullName;

  -- Put(Name) displays a Name value
  -- Precondition: theName has been initialized
  -- Parameters: theName, a Name
  -- Output: theName, to the screen
  procedure Put(TheName : in Name) is
  begin
    Put(TheName.MyFirst);
    Put(TheName.MyMiddle);
    Put(TheName.MyLast);
  end Put;

begin
  Init(aName, "John    ", "Paul    ", "Jones   ");
  pragma Assert(getFirst(aName) = "John    ", "getFirst() failed");
  pragma Assert(getMiddle(aName) = "Paul    ", "getMiddle() failed");
  pragma Assert(getLast(aName) = "Jones   ", "getLast() failed");
  pragma Assert(getFullName(aName) = "John     Paul     Jones   ", "getFullName() failed");
  Put(aName); New_line;
  Put("All tests passed!"); New_line;
end name_tester;

