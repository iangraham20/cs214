-- NameTester.adb tests class Name and its operations
-- Begun by: Prof. Adams, for CS 214 at Calvin College
-- Student: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

with Ada.Text_IO;
use  Ada.Text_IO;

procedure name_tester is

NAME_SIZE : constant Integer := 8;
Type Name is record
    MyFirst, MyMiddle, MyLast : String(1..NAME_SIZE);
end record;

MyString : String(1..NAME_SIZE);
MyLength : Natural;
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

  -- setFirst(Name) sets Name.myFirst
  -- Parameters: theName, a Name
  -- Precondition: theName has been initialized
  -- Return: theName.myFirst
  function setFirst(TheName : in out Name; First : in String) return String is
  begin
    TheName.MyFirst := First;
    return TheName.MyFirst;
  end setFirst;

  -- setMiddle(Name) sets Name.myMiddle
  -- Parameters: theName, a Name
  -- Precondition: theName has been initialized
  -- Return: theName.myMiddle
  function setMiddle(TheName : in out Name; Middle : in String) return String is
  begin
    TheName.MyMiddle := Middle;
    return TheName.MyMiddle;
  end setMiddle;

  -- setLast(Name) sets Name.myLast
  -- Parameters: theName, a Name
  -- Precondition: theName has been initialized
  -- Return: theName.myLast
  function setLast(TheName : in out Name; Last : in String) return String is
  begin
    TheName.MyLast := Last;
    return TheName.MyLast;
  end setLast;

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

  -- lfmiFormat(Name) retrieves Name as a formatted String
  -- Precondition: theName has been initialized
  -- Parameters: theName, a Name
  -- Output: a String representation of theName
  function lfmiFormat(TheName : in Name) return String is
  begin
    return TheName.MyLast & ", " & TheName.MyFirst & " " & TheName.MyMiddle(TheName.MyMiddle'First) & ".";
  end lfmiFormat;

  -- readName(Name) reads Name from user
  -- Precondition: theName has been initialized
  -- Parameters: theName, a Name
  procedure readName(TheName : in out Name) is
  begin
    Put("Enter the first name: ");
    Get_Line(MyString, MyLength);
    TheName.MyFirst := MyString;

    Put("Enter the middle name: ");
    Get_Line(MyString, MyLength);
    TheName.MyMiddle := MyString;

    Put("Enter the last name: ");
    Get_Line(MyString, MyLength);
    TheName.MyLast := MyString;
  end readName;

begin

  -- test constructor and getters
  Init(aName, "John    ", "Paul    ", "Jones   ");
  pragma Assert(getFirst(aName) = "John    ", "getFirst() failed");
  pragma Assert(getMiddle(aName) = "Paul    ", "getMiddle() failed");
  pragma Assert(getLast(aName) = "Jones   ", "getLast() failed");

  -- test fullname lfmi and print
  pragma Assert(getFullName(aName) = "John     Paul     Jones   ", "getFullName() failed");
  pragma Assert(lfmiFormat(aName) = "Jones   , John     P.");
  Put(aName); New_line;

  -- test setters and getters
  pragma Assert(setFirst(aName, "Jacob   ") = "Jacob   ", "setFirst() failed");
  pragma Assert(setMiddle(aName, "Scott   ") = "Scott   ", "setMiddle() failed");
  pragma Assert(setLast(aName, "Smith   ") = "Smith   ", "setLast() failed");

  -- test setters further through fullname lfmi and print
  pragma Assert(getFullName(aName) = "Jacob    Scott    Smith   ", "getFullName() failed");
  pragma Assert(lfmiFormat(aName) = "Smith   , Jacob    S.");
  Put(aName); New_line;

  -- test readname and printname
  readName(aName);
  Put(aName); New_line;

  Put("All tests passed!"); New_line;
end name_tester;
