package body CurlAda.Easier is

   function Send(Req : Request) return Response is
      Res : constant Response := (200, To_Unbounded_String("Wololo"));
      pragma Unreferenced(Req);
    begin
       return Res;
    end Send;

end CurlAda.Easier;
