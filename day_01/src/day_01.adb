with Ada.Text_IO; use Ada.Text_IO;
with Utils;

procedure Day_01 is
   use Utils;

   F           : File_Type;
   Zeros       : Integer := 0;
   Extra_Zeros : Integer := 0;
   Current     : Integer := 50;
   File_Name   : constant String := "input.txt";
begin
   Open (F, In_File, File_Name);
   while not End_Of_File (F) loop
      Increment (Current, To_Integer (Get_Line (F)), Extra_Zeros);
      if Current = 0 then
         Zeros := Zeros + 1;
      end if;
   end loop;
   Close (F);
   Put_Line ("Direct Zero hits" & Integer'Image (Zeros));
   Put_Line ("Extra Zeros" & Integer'Image (Extra_Zeros));
   Put_Line ("Total Zeros" & Integer'Image (Zeros + Extra_Zeros));
end Day_01;
