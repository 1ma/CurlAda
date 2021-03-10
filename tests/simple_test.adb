with Ada.Text_IO;
with CurlAda;
with CurlAda.Easy;
with Interfaces.C.Strings;

procedure Simple_Test is
   Handle : constant CurlAda.CURL := CurlAda.Easy.Init;
   Code1, Code2 : CurlAda.CURLcode;
begin
   Code1 := CurlAda.Easy.Set_Opt (Handle, CurlAda.CURLOPT_URL, Interfaces.C.Strings.New_String ("https://www.example.com/"));
   Code2 := CurlAda.Easy.Perform (Handle);
   CurlAda.Easy.Cleanup (Handle);

   Ada.Text_IO.New_Line;
   Ada.Text_IO.Put_Line (Code1'Image);
   Ada.Text_IO.Put_Line (Code2'Image);
end Simple_Test;
