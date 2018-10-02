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
