package Utils is

   procedure Increment
     (Value       : in out Integer;
      Diff        : Integer;
      Extra_Zeros : in out Integer;
      Max         : Integer := 100);

   function To_Integer (Value : String) return Integer;

end Utils;
