with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package CurlAda.Easier is

   type Method_Name is (GET, POST, PUT, PATCH, DELETE);

   type Request is record
      Method : Method_Name;
      URL : Unbounded_String;
   end record;

   type Response is record
      Status_Code : Integer;
      Content : Unbounded_String;
   end record;

   function Send (Req : Request) return Response;

end CurlAda.Easier;
