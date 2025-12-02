package body Utils is

   procedure Increment
     (Value       : in out Integer;
      Diff        : Integer;
      Extra_Zeros : in out Integer;
      Max         : Integer := 100)
   is
      Value_Init : Integer;
   begin
      Value_Init := Value;
      Value := (Value + Diff) rem Max;

      --  Normalize to the 0..Max range
      if Value < 0 then
         Value := Max + Value;
      end if;

      --  These are full revolutions
      Extra_Zeros := Extra_Zeros + (abs Diff) / Max;
      --  These are partial revolutions that cross zero
      --  Only count if the start or end points are not zero
      if Value /= 0 and then Value_Init /= 0 then
         if Value - Value_Init < 0 and then Diff > 0 then
            Extra_Zeros := Extra_Zeros + 1;
         elsif Value - Value_Init > 0 and then Diff < 0 then
            Extra_Zeros := Extra_Zeros + 1;
         end if;
      end if;

   end Increment;

   function To_Integer (Value : String) return Integer is
      sign : Integer;
   begin
      if Value (Value'First) = 'L' then
         sign := -1;
      else
         sign := 1;
      end if;
      return sign * Integer'Value (Value (Value'First + 1 .. Value'Last));
   end To_Integer;

end Utils;
