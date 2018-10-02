Script started on Sat 14 Apr 2018 07:20:25 PM EDT
igc2@eckert-mauchly:~/workspace/214/projects/09/ada$ ls
adaMax	list_package.adb  list_package.ads  Makefile  script.ada  search.adb
igc2@eckert-mauchly:~/workspace/214/projects/09/ada$ cat list_package.ads list_p 
ackage.adb search.adb Makefile
-- list_package.ads declares an Ada linked list and its operations.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ian Christensen, CS 214 at Calvin College
-- Date: Spring, 2018

package List_Package is

  -- the list-type itself (public)
  type List is private;

  -- Initialize a list
  -- Receive: aList, a List
  -- Pre: aList is uninitialized
  -- Post: aList%itsFirst == aList%itsLast == NULL &&
  --        aList%itsLength == 0
  procedure Init(A_List: out List);

  -- Is a list empty?
  -- Receive: aList, a List
  -- Return: true, iff aList contains no values
  function Empty(A_List: in List) return Boolean;

  -- How many values are in a list?
  -- Receive: aList, a List
  -- Return: aList%itsLength
  function Length(A_List : in List) return Integer;

  -- Append a value to a list
  -- Receive: aValue, an integer,
  -- Passback: aList, containing aValue
  procedure Append(A_Value : in Integer; A_List: in out List);

  -- Display the values in a list
  -- Receive: aList, a List
  -- Output: the values in aList
  procedure Put(A_List : in List);

  -- Find the maximum value in a list
  -- Receive: aList, a List
  -- Return: the maximum value in aList
  function Max(A_List : in List) return Integer;

  -- Find the index of A_Value in A_List
  -- Receive: aList, a List
  -- Return: the index of a value in aList
  function Search(A_List : in List; A_Value : in Integer) return Integer;

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

  function Search(A_List : in List; A_Value : in Integer) return Integer is
    Temp_Ptr : Node_Ptr := A_List.Its_First;
    Index_Value : Integer := 0;
  begin
    while Temp_Ptr /= null loop
      if Temp_Ptr.Its_Value = A_Value then
        return Index_Value;
      end if;
      Index_Value := Index_Value + 1;
      Temp_Ptr := Temp_Ptr.Its_Next;
    end loop;
    return -1;
  end Search;

end List_Package;
-- max.adb finds the max of a list of integers
-- 
-- Begun by: Dr. Adams, CS 214 at Calvin College
-- Completed by: Ian Christensen, CS 214 at Calvin College
-- Date: Spring, 2018
 
with Ada.Text_IO, Ada.Integer_Text_IO, List_Package; 
use Ada.Text_IO, Ada.Integer_Text_IO, List_Package; 
 
procedure Search is 
  List1, List2, List3, List4 : List;
  
begin
  -- initialize them
  Init(List1); 
  Init(List2);
  Init(List3);
  Init(List4);
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
  -- 99 not in list
  Append(88, List4);          -- 44, 55, 66, 77, 88
  Append(77, List4);
  Append(66, List4);
  Append(55, List4);
  Append(44, List4);
  -- output the 3 lists 
  Put(List1); New_Line;
  Put(List2); New_Line;
  Put(List3); New_Line;
  Put(List4); New_Line;
  -- display their maxima 
  Put("The maximum value in list 1 is ");  
  Put( Max(List1) ); New_Line; 
  Put("The maximum value in list 2 is "); 
  Put( Max(List2) ); New_Line; 
  Put("The maximum value in list 3 is ");
  Put( Max(List3) ); New_Line;
  Put("The maximum value in list 4 is ");
  Put( Max(List4) ); New_Line;

  Put("The index of 99 in list 1 is ");
  Put( Search(List1, 99) ); New_Line;
  Put("The index of 99 in list 2 is ");
  Put( Search(List2, 99) ); New_Line;
  Put("The index of 99 in list 3 is ");
  Put( Search(List3, 99) ); New_Line;
  Put("The index of 99 in list 4 is ");
  Put( Search(List4, 99) ); New_Line;
end Search;
# Makefile for GNAT (Ada) compilation
TARGET = search
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
igc2@eckert-mauchly:~/workspace/214/projects/09/ada$ make
gcc -c -Wall search.adb
gcc -c -Wall list_package.adb
gnatmake search
gnatbind-5 -x search.ali
gnatlink-5 search.ali
gnatbind  search.ali
gnatlink  search.ali -o adaMax
igc2@eckert-mauchly:~/workspace/214/projects/09/ada$ ls
adaMax		  list_package.ali  script.ada	search.ali
list_package.adb  list_package.o    search	search.o
list_package.ads  Makefile	    search.adb
igc2@eckert-mauchly:~/workspace/214/projects/09/ada$ ./search
          99          88          77          66          55
          55          66          77          88          99
          55          77          99          88          66
          88          77          66          55          44
The maximum value in list 1 is          99
The maximum value in list 2 is          99
The maximum value in list 3 is          99
The maximum value in list 4 is          88
The index of 99 in list 1 is           0
The index of 99 in list 2 is           4
The index of 99 in list 3 is           2
The index of 99 in list 4 is          -1
igc2@eckert-mauchly:~/workspace/214/projects/09/ada$ make clean
rm -f search *~ *# *.o *.ali
igc2@eckert-mauchly:~/workspace/214/projects/09/ada$ ls
adaMax	list_package.adb  list_package.ads  Makefile  script.ada  search.adb
igc2@eckert-mauchly:~/workspace/214/projects/09/ada$ exit

Script done on Sat 14 Apr 2018 07:21:14 PM EDT
