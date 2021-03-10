pragma Ada_2012;
pragma Style_Checks (Off);

with CurlAda;
with Interfaces.C.Strings;

package CurlAda.Easy is

   function Init return CurlAda.CURL
   with Import => True,
        Convention => C,
        External_Name => "curl_easy_init";

   function Set_Opt (
      the_curl : CurlAda.CURL;
      option : CurlAda.CURLoption;
      value : Interfaces.C.Strings.chars_ptr
   ) return CurlAda.CURLcode
   with Import => True,
        Convention => C,
        External_Name => "curl_easy_setopt";

   function Perform (the_curl : CurlAda.CURL) return CurlAda.CURLcode
   with Import => True,
        Convention => C,
        External_Name => "curl_easy_perform";

   procedure Cleanup (the_curl : CurlAda.CURL)
   with Import => True,
        Convention => C,
        External_Name => "curl_easy_cleanup";

   function Get_Info (the_curl : CurlAda.CURL; info : CurlAda.CURLINFO  -- , ...      <--- TODO
      ) return CurlAda.CURLcode
   with Import => True,
        Convention => C,
        External_Name => "curl_easy_getinfo";

   function Dup_Handle (the_curl : CurlAda.CURL) return CurlAda.CURL
   with Import => True,
        Convention => C,
        External_Name => "curl_easy_duphandle";

   procedure Reset (the_curl : CurlAda.CURL)
   with Import => True,
        Convention => C,
        External_Name => "curl_easy_reset";

   function Recv
     (the_curl : CurlAda.CURL;
      buffer : System.Address;
      buflen : size_t;
      n : access size_t
   ) return CurlAda.CURLcode
   with Import => True,
        Convention => C,
        External_Name => "curl_easy_recv";

   function Send
     (the_curl : CurlAda.CURL;
      buffer : System.Address;
      buflen : size_t;
      n : access size_t) return CurlAda.CURLcode
   with Import => True,
        Convention => C,
        External_Name => "curl_easy_send";

   function Upkeep (the_curl : CurlAda.CURL) return CurlAda.CURLcode
   with Import => True,
        Convention => C,
        External_Name => "curl_easy_upkeep";

end CurlAda.Easy;
