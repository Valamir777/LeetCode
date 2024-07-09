with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Containers.Hashed_Maps;

procedure Two_Sum is
   type Integer_Array is array (Integer range <>) of Integer;
   type Index_Map is new Ada.Containers.Hashed_Maps
     (Key_Type        => Integer,
      Element_Type    => Integer,
      Hash            => Ada.Containers.Hash_Type'Identity,
      Equivalent_Keys => "=");

   function Find_Two_Sum (Nums : Integer_Array; Target : Integer) return Integer_Array is
      Indices : Index_Map.Map;
      Result  : Integer_Array (1 .. 2) := (others => 0);
   begin
      for I in Nums'Range loop
         declare
            Complement : constant Integer := Target - Nums(I);
         begin
            if Indices.Contains(Complement) then
               Result := (Indices.Element(Complement), I);
               return Result;
            else
               Indices.Insert(Nums(I), I);
            end if;
         end;
      end loop;
      return (others => -1); -- Return an invalid index if no solution is found
   end Find_Two_Sum;

   Nums   : Integer_Array := (2, 7, 11, 15);
   Target : Integer := 9;
   Result : Integer_Array;
begin
   Result := Find_Two_Sum(Nums, Target);
   Put("Index 1: "); Put(Result(1)); New_Line;
   Put("Index 2: "); Put(Result(2)); New_Line;
end Two_Sum;
