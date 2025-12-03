with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Day_03 is
   F         : File_Type;
   Total_1   : Long_Integer := 0;
   Total_2   : Long_Integer := 0;
   Line      : Unbounded_String;
   dig       : constant Integer := 12;
   File_Name : constant String := "input.txt";

   function Get_Largest
     (Bank : String; dig : Integer := 2; Current_Str : String := "")
      return String
   is
      Largest     : Integer := 0;
      Idx_Largest : Integer := 0;
   begin
      for idx in Bank'First .. Bank'Last + 1 - dig loop
         if Integer'Value ((1 => Bank (idx))) > Largest then
            Largest := Integer'Value ((1 => Bank (idx)));
            Idx_Largest := idx;
         end if;
      end loop;

      if dig > 1 then
         return
           Get_Largest
             (Bank (Idx_Largest + 1 .. Bank'Last),
              dig - 1,
              Current_Str & Bank (Idx_Largest));
      else
         return Current_Str & Bank (Idx_Largest);
      end if;
   end Get_Largest;

begin

   Open (F, In_File, File_Name);
   while not End_Of_File (F) loop
      Line := To_Unbounded_String (Get_Line (F));
      Total_1 := Total_1 + Long_Integer'Value (Get_Largest (To_String (Line)));
      Total_2 :=
        Total_2 + Long_Integer'Value (Get_Largest (To_String (Line), dig));
   end loop;
   Close (F);
   Put_Line ("Total battery power (part 1)" & Long_Integer'Image (Total_1));
   Put_Line ("Total battery power (part 2)" & Long_Integer'Image (Total_2));
end Day_03;
