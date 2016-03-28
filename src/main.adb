with Ada.Text_IO;
with Ada.Float_Text_IO;
with Ada.Characters.Handling;
with Ada.Characters.Latin_1;
with Ada.Strings.Maps;
with Ada.Strings.Maps.Constants;

procedure Main is

   use Ada.Text_IO;
   use Ada.Float_Text_IO;
   use Ada.Strings.Maps;
   use Ada.Strings.Maps.Constants;

   package Latin renames Ada.Characters.Latin_1;

   type Float_Array is array (Integer range <>) of Float;

   B : Boolean := Is_In ('B', To_Set ("123"));

   procedure Next_Until (F : File_Type; Set : Character_Set) is
      C : Character;
   begin
      loop
         exit when End_Of_File (F);
         Get_Immediate (F, C);
         Put_Line ("C   " &  C'Img & " : " & Character'Pos (C)'Img);
         exit when Is_In (C, Set);
         Get_Immediate (C);
      end loop;
   end;

   procedure Skip_Space (F : File_Type) is
      EOL : Boolean;
      C : Character;
   begin
      loop
         exit when End_Of_File (F);
         Look_Ahead (F, C, EOL);
         exit when EOL;
         exit when C /= ' ';
         Get_Immediate (F, C);
      end loop;
   end;


   procedure Read (Name : String; Result : out Float_Array; Last : in out Integer) is
      use Ada.Text_IO;
      use Ada.Float_Text_IO;
      F : File_Type;
      K : Character;
   begin
      Open (F, In_File, Name);
      loop
         exit when End_Of_File (F);
         exit when Last >= Result'Last;
         Get_Immediate (K);



         --Append
         Last := Last + 1;
         Get (F, Result (Last));
         Skip_Space (F);
         Put_Line ("EOL " & End_Of_Line (F)'Img);
         Put_Line ("Lin " & Line (F)'Img);
         Put_Line ("V   " & Result (Last)'Img);









--           Put_Line ("Lin " & Line (F)'Img);
--           Put_Line ("Col " & Col (F)'Img);
--           Put_Line ("C   " &  C'Img & " : " & Character'Pos (C)'Img);
--           Put_Line ("EOL " & EOL'Img);
--           Put_Line ("EO  " & End_Of_Line (F)'Img);
--           New_Line;
--
--           Get (F, C);
--
--           Look_Ahead (F, C, EOL);
--           Put_Line ("Lin " & Line (F)'Img);
--           Put_Line ("Col " & Col (F)'Img);
--           Put_Line ("C   " &  C'Img & " : " & Character'Pos (C)'Img);
--           Put_Line ("EOL " & EOL'Img);
--           Put_Line ("EO  " & End_Of_Line (F)'Img);
--           New_Line;
--
--           Get (F, C);
--
--           Look_Ahead (F, C, EOL);
--           Put_Line ("Lin " & Line (F)'Img);
--           Put_Line ("Col " & Col (F)'Img);
--           Put_Line ("C   " &  C'Img & " : " & Character'Pos (C)'Img);
--           Put_Line ("EOL " & EOL'Img);
--           Put_Line ("EO  " & End_Of_Line (F)'Img);
--           New_Line;
--
         --Look_Ahead (F, C, EOL);
--           Put_Line ("C   " &  C'Img & " : " & Character'Pos (C)'Img);
--           Put_Line ("EOL " & EOL'Img);
--           Put_Line ("Col " & Col (F)'Img);
--           Put_Line ("EO  " & End_Of_Line (F)'Img);



      end loop;
      Close (F);
   end;

   F : Float_Array (1 .. 10) := (others => 0.0);
   Last : Integer := F'First - 1;

begin

   Read ("f.csv", F, Last);

   for E of F (F'First .. Last) loop
      Put (E, 3, 3, 0);
   end loop;


   null;

end;
