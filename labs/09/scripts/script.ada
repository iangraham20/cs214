Script started on Sat 14 Apr 2018 06:50:50 PM EDT
igc2@eckert-mauchly:~/workspace/214/labs/09/ada$ ls
adaMax	list_package.adb  list_package.ads  Makefile  max.adb  script.ada
igc2@eckert-mauchly:~/workspace/214/labs/09/ada$ make    cat list_package.adb  ds list_packa ge.adb max.adb ma  Makefile
-- list_package.ads declares an Ada linked list and its operations.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ian Christensen, CS 214 at Calvin College
-- Date: Spring, 2018
------------------------------------------------------------------

package List_Package is

  -- the list-type itself (public)
  type List is private;

  -----------------------------------------------------
  -- Initialize a list                                -
  -- Receive: aList, a List.                          -
  -- Pre: aList is uninitialized.                     -
  -- Post: aList%itsFirst == aList%itsLast == NULL && -
  --        aList%itsLength == 0.                     -
  -----------------------------------------------------
  procedure Init(A_List: out List);

  ------------------------------------------------
  -- Is a list empty?                            -
  -- Receive: aList, a List.                     -
  -- Return: true, iff aList contains no values. -
  ------------------------------------------------
  function Empty(A_List: in List) return Boolean;

  -------------------------------------
  -- How many values are in a list?   -
  -- Receive: aList, a List.          -
  -- Return: aList%itsLength.         -
  -------------------------------------
  function Length(A_List : in List) return Integer;

  ----------------------------------------
  -- Append a value to a list.           -
  -- Receive: aValue, an integer,        -
  -- Passback: aList, containing aValue. -
  ----------------------------------------
  procedure Append(A_Value : in Integer; A_List: in out List);

  -------------------------------------
  -- Display the values in a list.    -
  -- Receive: aList, a List.          -
  -- Output: the values in aList.     -
  -------------------------------------
  procedure Put(A_List : in List);

  ---------------------------------------
  -- Find the maximum value in a list.  -
  -- Receive: aList, a List.            -
  -- Return: the maximum value in aList.-
  ---------------------------------------
  function Max(A_List : in List) return Integer;

 private
  type List_Node;

  type Node_Ptr is access List_Node;

  type List_Node is record
    Its_Value : Integer;
    Its_Next : Node_Ptr;
  end record;

  type List is record
    Its_First  : Node_Ptr;
    Its_Last   : Node_Ptr;
    Its_Length : Integer;
  end record;

end List_Package;

-- list_package.adb defines Ada linked list operations
--
-- Begun by: Dr. Adams, CS 214 at Calvin College
-- Completed by: Ian Christensen, CS 214 at Calvin College
-- Date: Spring, 2018

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body List_Package is
  -- Initialize a list
  -- Receive: aList, a List
  -- Pre: aList is uninitialized
  -- Post: aList%itsFirst == aList%itsLast == NULL &&
  --        aList%itsLength == 0
  procedure Init(A_List : out List) is
  begin
    A_List.Its_First := null;
    A_List.Its_Last := null;
    A_List.Its_Length := 0;
  end Init;

  -- Is a list empty?
  -- Receive: aList, a List
  -- Return: true, iff aList contains no values
  function Empty(A_List : in List) return Boolean is
  begin
    return A_List.Its_Length = 0;
  end Empty;

  -- How many values are in a list?
  -- Receive: aList, a List
  -- Return: aList%itsLength
  function Length(A_List : in List) return Integer is
  begin
    return A_List.Its_Length;
  end Length;

  -- Append a value to a list
  -- Receive: aValue, an integer
  -- Passback: aList, containing aValue
  procedure Append(A_Value : in Integer; A_List : in out List) is
    Temp_Ptr : constant Node_Ptr := new List_Node;
  begin
    Temp_Ptr.Its_Value := A_Value;
    Temp_Ptr.Its_Next := null;

    if A_List.Its_Length = 0 then
       A_List.Its_First := Temp_Ptr;
    else
       A_List.Its_Last.Its_Next := Temp_Ptr;
    end if;

    A_List.Its_Last := Temp_Ptr;

    A_List.Its_Length := A_List.Its_Length + 1;
  end Append;

  -- Display the values in a list
  -- Receive: aList, a List
  -- Output: the values in aList
  procedure Put(A_List : in List) is
    Temp_Ptr : Node_Ptr := A_List.Its_First;
  begin 
      while Temp_Ptr /= null loop
        Put(' '); Put(Temp_Ptr.Its_Value);
        Temp_Ptr := Temp_Ptr.Its_Next;
      end loop;
  end Put;

  -- Find the maximum value in a list
  -- Receive: aList, a List
  -- Return: the maximum value in aList
  function Max(A_List : in List) return Integer is
    Temp_Ptr : Node_Ptr := A_List.Its_First;
    Max_Value : Integer := -999999;
  begin
    while Temp_Ptr /= null loop
      if Temp_Ptr.Its_Value > Max_Value then
        Max_Value := Temp_Ptr.Its_Value;
      end if;
      Temp_Ptr := Temp_Ptr.Its_Next;
    end loop;
    return Max_Value;
  end Max;

end List_Package;

-- max.adb finds the max of a list of integers
-- 
-- Begun by: Dr. Adams, CS 214 at Calvin College
-- Completed by: Ian Christensen, CS 214 at Calvin College
-- Date: Spring, 2018
 
with Ada.Text_IO, Ada.Integer_Text_IO, List_Package; 
use Ada.Text_IO, Ada.Integer_Text_IO, List_Package; 
 
procedure Max is 
  List1, List2, List3 : List;
begin
  -- initialize them
  Init(List1); 
  Init(List2);
  Init(List3);
  -- max is first
  Append(99, List1);          -- 99, 88, 77, 66, 55 
  Append(88, List1);
  Append(77, List1);
  Append(66, List1);
  Append(55, List1);
  -- max is last
  Append(55, List2);          -- 55, 66, 77, 88, 99
  Append(66, List2);
  Append(77, List2);
  Append(88, List2);
  Append(99, List2);
  -- max is in the middle
  Append(55, List3);          -- 55, 77, 99, 88, 66 
  Append(77, List3);
  Append(99, List3);
  Append(88, List3);
  Append(66, List3);
  -- output the 3 lists 
  Put(List1); New_Line;
  Put(List2); New_Line;
  Put(list3); New_Line;
  -- display their maxima 
  Put("The maximum value in list 1 is ");  
  Put( Max(List1) ); New_Line; 
  Put("The maximum value in list 2 is "); 
  Put( Max(List2) ); New_Line; 
  Put("The maximum value in list 3 is ");
  Put( Max(List3) ); New_Line;
end Max;

-- procedure Expirement is
--   A_List : List;
--   Temp_Ptr : Node_Ptr := A_List.Its_First;
--   begin
--   Init(A_List); 
--   while Temp_Ptr /= null loop
--     Put(Temp_Ptr.Its_Value);
--   end loop;
-- end Expirement;

-- ERROR MESSAGE RECEIVED FROM CONSOLE:
-- max.adb:50:14: "Node_Ptr" is not visible
-- max.adb:50:14: non-visible (private) declaration at list_package.ads:60
-- max.adb:50:26: invalid prefix in selected component "A_List"
-- max.adb:53:09: warning: variable "Temp_Ptr" is not modified in loop body
-- max.adb:53:09: warning: possible infinite loop
-- max.adb:54:09: invalid prefix in selected component "Temp_Ptr"
# Makefile for GNAT (Ada) compilation
TARGET = max
PACKAGE = list_package

CC = gcc
CFLAGS = -c -Wall

$(TARGET): $(TARGET).ali $(PACKAGE).o
	gnatmake $(TARGET)
	gnatbind $(BFLAGS) $(TARGET).ali
	gnatlink $(LFLAGS) $(TARGET).ali -o adaMax

$(TARGET).ali: $(TARGET).adb $(PACKAGE).ads
	$(CC) $(CFLAGS) $(TARGET).adb

$(PACKAGE).o: $(PACKAGE).adb $(PACKAGE).ads
	$(CC) $(CFLAGS) $(PACKAGE).adb

clean:
	rm -f $(TARGET) *~ *# *.o *.ali
igc2@eckert-mauchly:~/workspace/214/labs/09/ada$ ls
adaMax	list_package.adb  list_package.ads  Makefile  max.adb  script.ada
igc2@eckert-mauchly:~/workspace/214/labs/09/ada$ make
gcc -c -Wall max.adb
gcc -c -Wall list_package.adb
gnatmake max
gnatbind-5 -x max.ali
gnatlink-5 max.ali
gnatbind  max.ali
gnatlink  max.ali -o adaMax
igc2@eckert-mauchly:~/workspace/214/labs/09/ada$ ls
adaMax		  list_package.ali  max      max.o
list_package.adb  list_package.o    max.adb  script.ada
list_package.ads  Makefile	    max.ali
igc2@eckert-mauchly:~/workspace/214/labs/09/ada$ ./max
          99          88          77          66          55
          55          66          77          88          99
          55          77          99          88          66
The maximum value in list 1 is          99
The maximum value in list 2 is          99
The maximum value in list 3 is          99
igc2@eckert-mauchly:~/workspace/214/labs/09/ada$ make clean
rm -f max *~ *# *.o *.ali
igc2@eckert-mauchly:~/workspace/214/labs/09/ada$ ls
adaMax	list_package.adb  list_package.ads  Makefile  max.adb  script.ada
igc2@eckert-mauchly:~/workspace/214/labs/09/ada$ exit

Script done on Sat 14 Apr 2018 06:51:41 PM EDT
