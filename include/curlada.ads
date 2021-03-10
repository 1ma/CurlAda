pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;

package CurlAda is
   pragma Link_With("-lcurl");

   CURL_SOCKET_BAD : constant := -1;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:138
   --  unsupported macro: CURLSSLBACKEND_LIBRESSL CURLSSLBACKEND_OPENSSL
   --  unsupported macro: CURLSSLBACKEND_BORINGSSL CURLSSLBACKEND_OPENSSL
   --  unsupported macro: CURLSSLBACKEND_CYASSL CURLSSLBACKEND_WOLFSSL
   --  unsupported macro: CURLSSLBACKEND_DARWINSSL CURLSSLBACKEND_SECURETRANSPORT

   CURL_HTTPPOST_FILENAME : constant := (2**0);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:186

   CURL_HTTPPOST_READFILE : constant := (2**1);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:188

   CURL_HTTPPOST_PTRNAME : constant := (2**2);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:190

   CURL_HTTPPOST_PTRCONTENTS : constant := (2**3);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:192

   CURL_HTTPPOST_BUFFER : constant := (2**4);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:194

   CURL_HTTPPOST_PTRBUFFER : constant := (2**5);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:196

   CURL_HTTPPOST_CALLBACK : constant := (2**6);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:199

   CURL_HTTPPOST_LARGE : constant := (2**7);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:201

   CURL_PROGRESSFUNC_CONTINUE : constant := 16#10000001#;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:216

   CURL_MAX_READ_SIZE : constant := 524288;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:237

   CURL_MAX_WRITE_SIZE : constant := 16384;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:247

   CURL_MAX_HTTP_HEADER : constant := (100*1024);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:254

   CURL_WRITEFUNC_PAUSE : constant := 16#10000001#;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:259

   CURLFINFOFLAG_KNOWN_FILENAME : constant := (2**0);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:284
   CURLFINFOFLAG_KNOWN_FILETYPE : constant := (2**1);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:285
   CURLFINFOFLAG_KNOWN_TIME : constant := (2**2);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:286
   CURLFINFOFLAG_KNOWN_PERM : constant := (2**3);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:287
   CURLFINFOFLAG_KNOWN_UID : constant := (2**4);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:288
   CURLFINFOFLAG_KNOWN_GID : constant := (2**5);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:289
   CURLFINFOFLAG_KNOWN_SIZE : constant := (2**6);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:290
   CURLFINFOFLAG_KNOWN_HLINKCOUNT : constant := (2**7);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:291

   CURL_CHUNK_BGN_FUNC_OK : constant := 0;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:322
   CURL_CHUNK_BGN_FUNC_FAIL : constant := 1;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:323
   CURL_CHUNK_BGN_FUNC_SKIP : constant := 2;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:324

   CURL_CHUNK_END_FUNC_OK : constant := 0;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:334
   CURL_CHUNK_END_FUNC_FAIL : constant := 1;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:335

   CURL_FNMATCHFUNC_MATCH : constant := 0;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:346
   CURL_FNMATCHFUNC_NOMATCH : constant := 1;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:347
   CURL_FNMATCHFUNC_FAIL : constant := 2;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:348

   CURL_SEEKFUNC_OK : constant := 0;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:357
   CURL_SEEKFUNC_FAIL : constant := 1;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:358
   CURL_SEEKFUNC_CANTSEEK : constant := 2;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:359

   CURL_READFUNC_ABORT : constant := 16#10000000#;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:367

   CURL_READFUNC_PAUSE : constant := 16#10000001#;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:370

   CURL_TRAILERFUNC_OK : constant := 0;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:374

   CURL_TRAILERFUNC_ABORT : constant := 1;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:377

   CURL_SOCKOPT_OK : constant := 0;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:395
   CURL_SOCKOPT_ERROR : constant := 1;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:396

   CURL_SOCKOPT_ALREADY_CONNECTED : constant := 2;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:398
   --  unsupported macro: CURLE_OBSOLETE16 CURLE_HTTP2
   --  unsupported macro: CURLE_OBSOLETE10 CURLE_FTP_ACCEPT_FAILED
   --  unsupported macro: CURLE_OBSOLETE12 CURLE_FTP_ACCEPT_TIMEOUT
   --  unsupported macro: CURLOPT_ENCODING CURLOPT_ACCEPT_ENCODING
   --  unsupported macro: CURLE_FTP_WEIRD_SERVER_REPLY CURLE_WEIRD_SERVER_REPLY
   --  unsupported macro: CURLE_SSL_CACERT CURLE_PEER_FAILED_VERIFICATION
   --  unsupported macro: CURLE_UNKNOWN_TELNET_OPTION CURLE_UNKNOWN_OPTION
   --  unsupported macro: CURLE_SSL_PEER_CERTIFICATE CURLE_PEER_FAILED_VERIFICATION
   --  unsupported macro: CURLE_OBSOLETE CURLE_OBSOLETE50
   --  unsupported macro: CURLE_BAD_PASSWORD_ENTERED CURLE_OBSOLETE46
   --  unsupported macro: CURLE_BAD_CALLING_ORDER CURLE_OBSOLETE44
   --  unsupported macro: CURLE_FTP_USER_PASSWORD_INCORRECT CURLE_OBSOLETE10
   --  unsupported macro: CURLE_FTP_CANT_RECONNECT CURLE_OBSOLETE16
   --  unsupported macro: CURLE_FTP_COULDNT_GET_SIZE CURLE_OBSOLETE32
   --  unsupported macro: CURLE_FTP_COULDNT_SET_ASCII CURLE_OBSOLETE29
   --  unsupported macro: CURLE_FTP_WEIRD_USER_REPLY CURLE_OBSOLETE12
   --  unsupported macro: CURLE_FTP_WRITE_ERROR CURLE_OBSOLETE20
   --  unsupported macro: CURLE_LIBRARY_NOT_FOUND CURLE_OBSOLETE40
   --  unsupported macro: CURLE_MALFORMAT_USER CURLE_OBSOLETE24
   --  unsupported macro: CURLE_SHARE_IN_USE CURLE_OBSOLETE57
   --  unsupported macro: CURLE_URL_MALFORMAT_USER CURLE_NOT_BUILT_IN
   --  unsupported macro: CURLE_FTP_ACCESS_DENIED CURLE_REMOTE_ACCESS_DENIED
   --  unsupported macro: CURLE_FTP_COULDNT_SET_BINARY CURLE_FTP_COULDNT_SET_TYPE
   --  unsupported macro: CURLE_FTP_QUOTE_ERROR CURLE_QUOTE_ERROR
   --  unsupported macro: CURLE_TFTP_DISKFULL CURLE_REMOTE_DISK_FULL
   --  unsupported macro: CURLE_TFTP_EXISTS CURLE_REMOTE_FILE_EXISTS
   --  unsupported macro: CURLE_HTTP_RANGE_ERROR CURLE_RANGE_ERROR
   --  unsupported macro: CURLE_FTP_SSL_FAILED CURLE_USE_SSL_FAILED
   --  unsupported macro: CURLE_OPERATION_TIMEOUTED CURLE_OPERATION_TIMEDOUT
   --  unsupported macro: CURLE_HTTP_NOT_FOUND CURLE_HTTP_RETURNED_ERROR
   --  unsupported macro: CURLE_HTTP_PORT_FAILED CURLE_INTERFACE_FAILED
   --  unsupported macro: CURLE_FTP_COULDNT_STOR_FILE CURLE_UPLOAD_FAILED
   --  unsupported macro: CURLE_FTP_PARTIAL_FILE CURLE_PARTIAL_FILE
   --  unsupported macro: CURLE_FTP_BAD_DOWNLOAD_RESUME CURLE_BAD_DOWNLOAD_RESUME

   CURLE_ALREADY_COMPLETE : constant := 99999;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:677
   --  unsupported macro: CURLOPT_FILE CURLOPT_WRITEDATA
   --  unsupported macro: CURLOPT_INFILE CURLOPT_READDATA
   --  unsupported macro: CURLOPT_WRITEHEADER CURLOPT_HEADERDATA
   --  unsupported macro: CURLOPT_WRITEINFO CURLOPT_OBSOLETE40
   --  unsupported macro: CURLOPT_CLOSEPOLICY CURLOPT_OBSOLETE72
   --  unsupported macro: CURLAUTH_NONE ((unsigned long)0)
   --  unsupported macro: CURLAUTH_BASIC (((unsigned long)1)<<0)
   --  unsupported macro: CURLAUTH_DIGEST (((unsigned long)1)<<1)
   --  unsupported macro: CURLAUTH_NEGOTIATE (((unsigned long)1)<<2)
   --  unsupported macro: CURLAUTH_GSSNEGOTIATE CURLAUTH_NEGOTIATE
   --  unsupported macro: CURLAUTH_GSSAPI CURLAUTH_NEGOTIATE
   --  unsupported macro: CURLAUTH_NTLM (((unsigned long)1)<<3)
   --  unsupported macro: CURLAUTH_DIGEST_IE (((unsigned long)1)<<4)
   --  unsupported macro: CURLAUTH_NTLM_WB (((unsigned long)1)<<5)
   --  unsupported macro: CURLAUTH_BEARER (((unsigned long)1)<<6)
   --  unsupported macro: CURLAUTH_ONLY (((unsigned long)1)<<31)
   --  unsupported macro: CURLAUTH_ANY (~CURLAUTH_DIGEST_IE)
   --  unsupported macro: CURLAUTH_ANYSAFE (~(CURLAUTH_BASIC|CURLAUTH_DIGEST_IE))
   --  unsupported macro: CURLSSH_AUTH_ANY ~0

   CURLSSH_AUTH_NONE : constant := 0;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:751
   CURLSSH_AUTH_PUBLICKEY : constant := (2**0);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:752
   CURLSSH_AUTH_PASSWORD : constant := (2**1);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:753
   CURLSSH_AUTH_HOST : constant := (2**2);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:754
   CURLSSH_AUTH_KEYBOARD : constant := (2**3);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:755
   CURLSSH_AUTH_AGENT : constant := (2**4);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:756
   CURLSSH_AUTH_GSSAPI : constant := (2**5);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:757
   --  unsupported macro: CURLSSH_AUTH_DEFAULT CURLSSH_AUTH_ANY

   CURLGSSAPI_DELEGATION_NONE : constant := 0;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:760
   CURLGSSAPI_DELEGATION_POLICY_FLAG : constant := (2**0);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:761
   CURLGSSAPI_DELEGATION_FLAG : constant := (2**1);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:762

   CURL_ERROR_SIZE : constant := 256;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:764

   CURLSSLOPT_ALLOW_BEAST : constant := (2**0);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:825

   CURLSSLOPT_NO_REVOKE : constant := (2**1);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:829

   CURLSSLOPT_NO_PARTIALCHAIN : constant := (2**2);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:833

   CURL_HET_DEFAULT : constant := 200;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:838

   CURL_UPKEEP_INTERVAL_DEFAULT : constant := 60000;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:841
   --  unsupported macro: CURLFTPSSL_NONE CURLUSESSL_NONE
   --  unsupported macro: CURLFTPSSL_TRY CURLUSESSL_TRY
   --  unsupported macro: CURLFTPSSL_CONTROL CURLUSESSL_CONTROL
   --  unsupported macro: CURLFTPSSL_ALL CURLUSESSL_ALL
   --  unsupported macro: CURLFTPSSL_LAST CURLUSESSL_LAST
   --  unsupported macro: curl_ftpssl curl_usessl

   CURLHEADER_UNIFIED : constant := 0;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:894
   CURLHEADER_SEPARATE : constant := (2**0);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:895

   CURLALTSVC_IMMEDIATELY : constant := (2**0);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:898

   CURLALTSVC_READONLYFILE : constant := (2**2);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:900
   CURLALTSVC_H1 : constant := (2**3);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:901
   CURLALTSVC_H2 : constant := (2**4);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:902
   CURLALTSVC_H3 : constant := (2**5);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:903

   CURLPROTO_HTTP : constant := (2**0);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:906
   CURLPROTO_HTTPS : constant := (2**1);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:907
   CURLPROTO_FTP : constant := (2**2);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:908
   CURLPROTO_FTPS : constant := (2**3);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:909
   CURLPROTO_SCP : constant := (2**4);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:910
   CURLPROTO_SFTP : constant := (2**5);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:911
   CURLPROTO_TELNET : constant := (2**6);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:912
   CURLPROTO_LDAP : constant := (2**7);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:913
   CURLPROTO_LDAPS : constant := (2**8);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:914
   CURLPROTO_DICT : constant := (2**9);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:915
   CURLPROTO_FILE : constant := (2**10);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:916
   CURLPROTO_TFTP : constant := (2**11);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:917
   CURLPROTO_IMAP : constant := (2**12);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:918
   CURLPROTO_IMAPS : constant := (2**13);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:919
   CURLPROTO_POP3 : constant := (2**14);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:920
   CURLPROTO_POP3S : constant := (2**15);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:921
   CURLPROTO_SMTP : constant := (2**16);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:922
   CURLPROTO_SMTPS : constant := (2**17);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:923
   CURLPROTO_RTSP : constant := (2**18);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:924
   CURLPROTO_RTMP : constant := (2**19);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:925
   CURLPROTO_RTMPT : constant := (2**20);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:926
   CURLPROTO_RTMPE : constant := (2**21);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:927
   CURLPROTO_RTMPTE : constant := (2**22);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:928
   CURLPROTO_RTMPS : constant := (2**23);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:929
   CURLPROTO_RTMPTS : constant := (2**24);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:930
   CURLPROTO_GOPHER : constant := (2**25);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:931
   CURLPROTO_SMB : constant := (2**26);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:932
   CURLPROTO_SMBS : constant := (2**27);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:933
   --  unsupported macro: CURLPROTO_ALL (~0)

   CURLOPTTYPE_LONG : constant := 0;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:938
   CURLOPTTYPE_OBJECTPOINT : constant := 10000;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:939
   CURLOPTTYPE_FUNCTIONPOINT : constant := 20000;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:940
   CURLOPTTYPE_OFF_T : constant := 30000;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:941
   --  unsupported macro: CURLOPTTYPE_STRINGPOINT CURLOPTTYPE_OBJECTPOINT
   --  unsupported macro: CURLOPTTYPE_SLISTPOINT CURLOPTTYPE_OBJECTPOINT
   --  unsupported macro: CURLOPT_XFERINFODATA CURLOPT_PROGRESSDATA
   --  unsupported macro: CURLOPT_SERVER_RESPONSE_TIMEOUT CURLOPT_FTP_RESPONSE_TIMEOUT
   --  unsupported macro: CURLOPT_POST301 CURLOPT_POSTREDIR
   --  unsupported macro: CURLOPT_SSLKEYPASSWD CURLOPT_KEYPASSWD
   --  unsupported macro: CURLOPT_FTPAPPEND CURLOPT_APPEND
   --  unsupported macro: CURLOPT_FTPLISTONLY CURLOPT_DIRLISTONLY
   --  unsupported macro: CURLOPT_FTP_SSL CURLOPT_USE_SSL
   --  unsupported macro: CURLOPT_SSLCERTPASSWD CURLOPT_KEYPASSWD
   --  unsupported macro: CURLOPT_KRB4LEVEL CURLOPT_KRBLEVEL

   CURL_IPRESOLVE_WHATEVER : constant := 0;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:1977

   CURL_IPRESOLVE_V4 : constant := 1;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:1979
   CURL_IPRESOLVE_V6 : constant := 2;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:1980
   --  unsupported macro: CURLOPT_RTSPHEADER CURLOPT_HTTPHEADER
   --  unsupported macro: CURL_HTTP_VERSION_2 CURL_HTTP_VERSION_2_0

   CURL_REDIR_GET_ALL : constant := 0;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2073
   CURL_REDIR_POST_301 : constant := 1;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2074
   CURL_REDIR_POST_302 : constant := 2;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2075
   CURL_REDIR_POST_303 : constant := 4;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2076
   --  unsupported macro: CURL_REDIR_POST_ALL (CURL_REDIR_POST_301|CURL_REDIR_POST_302|CURL_REDIR_POST_303)
   --  unsupported macro: CURL_ZERO_TERMINATED ((size_t) -1)

   CURLINFO_STRING : constant := 16#100000#;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2554
   CURLINFO_LONG : constant := 16#200000#;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2555
   CURLINFO_DOUBLE : constant := 16#300000#;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2556
   CURLINFO_SLIST : constant := 16#400000#;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2557
   CURLINFO_PTR : constant := 16#400000#;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2558
   CURLINFO_SOCKET : constant := 16#500000#;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2559
   CURLINFO_OFF_T : constant := 16#600000#;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2560
   CURLINFO_MASK : constant := 16#0fffff#;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2561
   CURLINFO_TYPEMASK : constant := 16#f00000#;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2562
   --  unsupported macro: CURLINFO_HTTP_CODE CURLINFO_RESPONSE_CODE

   CURL_GLOBAL_SSL : constant := (2**0);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2654
   CURL_GLOBAL_WIN32 : constant := (2**1);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2655
   --  unsupported macro: CURL_GLOBAL_ALL (CURL_GLOBAL_SSL|CURL_GLOBAL_WIN32)

   CURL_GLOBAL_NOTHING : constant := 0;  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2657
   --  unsupported macro: CURL_GLOBAL_DEFAULT CURL_GLOBAL_ALL

   CURL_GLOBAL_ACK_EINTR : constant := (2**2);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2659
   --  unsupported macro: CURLVERSION_NOW CURLVERSION_SIXTH

   CURL_VERSION_IPV6 : constant := (2**0);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2784
   CURL_VERSION_KERBEROS4 : constant := (2**1);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2785

   CURL_VERSION_SSL : constant := (2**2);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2787
   CURL_VERSION_LIBZ : constant := (2**3);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2788
   CURL_VERSION_NTLM : constant := (2**4);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2789
   CURL_VERSION_GSSNEGOTIATE : constant := (2**5);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2790

   CURL_VERSION_DEBUG : constant := (2**6);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2792
   CURL_VERSION_ASYNCHDNS : constant := (2**7);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2793
   CURL_VERSION_SPNEGO : constant := (2**8);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2794
   CURL_VERSION_LARGEFILE : constant := (2**9);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2795
   CURL_VERSION_IDN : constant := (2**10);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2796

   CURL_VERSION_SSPI : constant := (2**11);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2798
   CURL_VERSION_CONV : constant := (2**12);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2799
   CURL_VERSION_CURLDEBUG : constant := (2**13);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2800
   CURL_VERSION_TLSAUTH_SRP : constant := (2**14);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2801
   CURL_VERSION_NTLM_WB : constant := (2**15);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2802

   CURL_VERSION_HTTP2 : constant := (2**16);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2804
   CURL_VERSION_GSSAPI : constant := (2**17);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2805
   CURL_VERSION_KERBEROS5 : constant := (2**18);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2806
   CURL_VERSION_UNIX_SOCKETS : constant := (2**19);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2807
   CURL_VERSION_PSL : constant := (2**20);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2808

   CURL_VERSION_HTTPS_PROXY : constant := (2**21);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2810
   CURL_VERSION_MULTI_SSL : constant := (2**22);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2811
   CURL_VERSION_BROTLI : constant := (2**23);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2812
   CURL_VERSION_ALTSVC : constant := (2**24);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2813
   CURL_VERSION_HTTP3 : constant := (2**25);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2814

   CURL_VERSION_ESNI : constant := (2**26);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2816

   CURLPAUSE_RECV : constant := (2**0);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2861
   CURLPAUSE_RECV_CONT : constant := (0);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2862

   CURLPAUSE_SEND : constant := (2**2);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2864
   CURLPAUSE_SEND_CONT : constant := (0);  --  /usr/include/x86_64-linux-gnu/curl/curl.h:2865
   --  unsupported macro: CURLPAUSE_ALL (CURLPAUSE_RECV|CURLPAUSE_SEND)
   --  unsupported macro: CURLPAUSE_CONT (CURLPAUSE_RECV_CONT|CURLPAUSE_SEND_CONT)

  --**************************************************************************
  -- *                                  _   _ ____  _
  -- *  Project                     ___| | | |  _ \| |
  -- *                             / __| | | | |_) | |
  -- *                            | (__| |_| |  _ <| |___
  -- *                             \___|\___/|_| \_\_____|
  -- *
  -- * Copyright (C) 1998 - 2019, Daniel Stenberg, <daniel@haxx.se>, et al.
  -- *
  -- * This software is licensed as described in the file COPYING, which
  -- * you should have received as part of this distribution. The terms
  -- * are also available at https://curl.haxx.se/docs/copyright.html.
  -- *
  -- * You may opt to use, copy, modify, merge, publish, distribute and/or sell
  -- * copies of the Software, and permit persons to whom the Software is
  -- * furnished to do so, under the terms of the COPYING file.
  -- *
  -- * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
  -- * KIND, either express or implied.
  -- *
  -- **************************************************************************

  -- * If you have libcurl problems, all docs and details are found here:
  -- *   https://curl.haxx.se/libcurl/
  -- *
  -- * curl-library mailing list subscription and unsubscription web interface:
  -- *   https://cool.haxx.se/mailman/listinfo/curl-library/
  --

  -- libcurl version defines
  -- determine things run-time
  -- * Define WIN32 when build target is Win32 API
  --

  -- Needed for __FreeBSD_version symbol definition
  -- The include stuff here below is mainly for time_t!
  -- The check above prevents the winsock2 inclusion if winsock.h already was
  --   included, since they can't co-exist without problems

  -- HP-UX systems version 9, 10 and 11 lack sys/select.h and so does oldish
  --   libc5-based Linux systems. Only include it on systems that are known to
  --   require it!


   subtype Time_T is Long;
   -- type Time_T_Pointer is access all Time_T;

  -- Compatibility for non-Clang compilers
   subtype CURL is System.Address;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:107

   subtype CURLSH is System.Address;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:108

  -- * libcurl external API function linkage decorations.
  --

  -- socket typedef
   subtype curl_socket_t is int;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:137

  -- enum for the different supported SSL backends
  -- Was QSOSSL.
  -- never used since 7.63.0
   type curl_sslbackend is
     (CURLSSLBACKEND_NONE,
      CURLSSLBACKEND_OPENSSL,
      CURLSSLBACKEND_GNUTLS,
      CURLSSLBACKEND_NSS,
      CURLSSLBACKEND_OBSOLETE4,
      CURLSSLBACKEND_GSKIT,
      CURLSSLBACKEND_POLARSSL,
      CURLSSLBACKEND_WOLFSSL,
      CURLSSLBACKEND_SCHANNEL,
      CURLSSLBACKEND_SECURETRANSPORT,
      CURLSSLBACKEND_AXTLS,
      CURLSSLBACKEND_MBEDTLS,
      CURLSSLBACKEND_MESALINK,
      CURLSSLBACKEND_BEARSSL)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:159

  -- aliases for library clones and renames
  -- deprecated names:
  -- next entry in the list
   -- type curl_httppost;
   type curl_slist;
   -- type curl_httppost is record
   --    next : access curl_httppost;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:170
   --    name : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:171
   --    namelength : aliased long;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:172
   --    contents : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:173
   --    contentslength : aliased long;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:174
   --    buffer : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:176
   --    bufferlength : aliased long;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:177
   --    contenttype : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:178
   --    contentheader : access curl_slist;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:179
   --    more : access curl_httppost;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:180
   --    flags : aliased long;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:183
   --    showfilename : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:203
   --    userp : System.Address;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:206
   --    contentlen : aliased CurlAda.x86_64_linux_gnu_curl_system_h.curl_off_t;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:208
   -- end record
   -- with Convention => C_Pass_By_Copy;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:169

  -- pointer to allocated name
  -- length of name length
  -- pointer to allocated data contents
  -- length of contents field, see also
  --                                       CURL_HTTPPOST_LARGE

  -- pointer to allocated buffer contents
  -- length of buffer field
  -- Content-Type
  -- list of extra headers for this form
  -- if one field name has more than one
  --                                       file, this link should link to following
  --                                       files

  -- as defined below
  -- specified content is a file name
  -- specified content is a file name
  -- name is only stored pointer do not free in formfree
  -- contents is only stored pointer do not free in formfree
  -- upload file from buffer
  -- upload file from pointer contents
  -- upload file contents by using the regular read callback to get the data and
  --   pass the given pointer as custom pointer

  -- use size in 'contentlen', added in 7.46.0
  -- The file name to show. If not set, the
  --                                       actual file name will be used (if this
  --                                       is a file part)

  -- custom pointer used for
  --                                       HTTPPOST_CALLBACK posts

  -- alternative length of contents
  --                                       field. Used if CURL_HTTPPOST_LARGE is
  --                                       set. Added in 7.46.0

  -- This is a return code for the progress callback that, when returned, will
  --   signal libcurl to continue executing the default progress function

  -- This is the CURLOPT_PROGRESSFUNCTION callback prototype. It is now
  --   considered deprecated but was the only choice up until 7.31.0

   type curl_progress_callback is access function
        (arg1 : System.Address;
         arg2 : double;
         arg3 : double;
         arg4 : double;
         arg5 : double) return int
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:220

  -- This is the CURLOPT_XFERINFOFUNCTION callback prototype. It was introduced
  --   in 7.32.0, avoids the use of floating point numbers and provides more
  --   detailed information.

   -- type curl_xferinfo_callback is access function
   --      (arg1 : System.Address;
   --       arg2 : CurlAda.x86_64_linux_gnu_curl_system_h.curl_off_t;
   --       arg3 : CurlAda.x86_64_linux_gnu_curl_system_h.curl_off_t;
   --       arg4 : CurlAda.x86_64_linux_gnu_curl_system_h.curl_off_t;
   --       arg5 : CurlAda.x86_64_linux_gnu_curl_system_h.curl_off_t) return int
   -- with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:229

  -- The maximum receive buffer size configurable via CURLOPT_BUFFERSIZE.
  -- Tests have proven that 20K is a very bad buffer size for uploads on
  --     Windows, while 16K for some odd reason performed a lot better.
  --     We do the ifndef check to allow this value to easier be changed at build
  --     time for those who feel adventurous. The practical minimum is about
  --     400 bytes since libcurl uses a buffer of this size as a scratch area
  --     (unrelated to network send operations).

  -- The only reason to have a max limit for this is to avoid the risk of a bad
  --   server feeding libcurl with a never-ending header that will cause reallocs
  --   infinitely

  -- This is a magic return code for the write callback that, when returned,
  --   will signal libcurl to pause receiving on the current transfer.

   type curl_write_callback is access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : size_t;
         arg3 : size_t;
         arg4 : System.Address) return size_t
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:261

  -- This callback will be called when a new resolver request is made
   type curl_resolver_start_callback is access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address) return int
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:267

  -- enumeration of file types
  -- is possible only on Sun Solaris now
  -- should never occur
   type curlfiletype is
     (CURLFILETYPE_FILE,
      CURLFILETYPE_DIRECTORY,
      CURLFILETYPE_SYMLINK,
      CURLFILETYPE_DEVICE_BLOCK,
      CURLFILETYPE_DEVICE_CHAR,
      CURLFILETYPE_NAMEDPIPE,
      CURLFILETYPE_SOCKET,
      CURLFILETYPE_DOOR,
      CURLFILETYPE_UNKNOWN)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:282

  -- Information about a single file, used when doing FTP wildcard matching
  -- always zero!
  -- If some of these fields is not NULL, it is a pointer to b_data.
   type anon1377_struct1378 is record
      time : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:306
      perm : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:307
      user : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:308
      group : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:309
      target : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:310
   end record
   with Convention => C_Pass_By_Copy;
   -- type curl_fileinfo is record
   --    filename : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:295
   --    filetype : aliased curlfiletype;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:296
   --    time : aliased Time_T;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:297
   --    perm : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:298
   --    uid : aliased int;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:299
   --    gid : aliased int;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:300
   --    size : aliased CurlAda.x86_64_linux_gnu_curl_system_h.curl_off_t;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:301
   --    hardlinks : aliased long;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:302
   --    strings : aliased anon1377_struct1378;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:311
   --    flags : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:313
   --    b_data : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:316
   --    b_size : aliased size_t;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:317
   --    b_used : aliased size_t;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:318
   -- end record
   -- with Convention => C_Pass_By_Copy;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:294

  -- pointer to the target filename of a symlink
  -- used internally
  -- return codes for CURLOPT_CHUNK_BGN_FUNCTION
  -- if splitting of data transfer is enabled, this callback is called before
  --   download of an individual chunk started. Note that parameter "remains" works
  --   only for FTP wildcard downloading (for now), otherwise is not used

   type curl_chunk_bgn_callback is access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : int) return long
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:329

  -- return codes for CURLOPT_CHUNK_END_FUNCTION
  -- If splitting of data transfer is enabled this callback is called after
  --   download of an individual chunk finished.
  --   Note! After this callback was set then it have to be called FOR ALL chunks.
  --   Even if downloading of this chunk was skipped in CHUNK_BGN_FUNC.
  --   This is the reason why we don't need "transfer_info" parameter in this
  --   callback and we are not interested in "remains" parameter too.

   type curl_chunk_end_callback is access function (arg1 : System.Address) return long
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:343

  -- return codes for FNMATCHFUNCTION
  -- callback type for wildcard downloading pattern matching. If the
  --   string matches the pattern, return CURL_FNMATCHFUNC_MATCH value, etc.

   type curl_fnmatch_callback is access function
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : Interfaces.C.Strings.chars_ptr) return int
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:352

  -- These are the return codes for the seek callbacks
   -- type curl_seek_callback is access function
   --      (arg1 : System.Address;
   --       arg2 : CurlAda.x86_64_linux_gnu_curl_system_h.curl_off_t;
   --       arg3 : int) return int
   -- with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:361

  -- 'whence'
  -- This is a return code for the read callback that, when returned, will
  --   signal libcurl to immediately abort the current transfer.

  -- This is a return code for the read callback that, when returned, will
  --   signal libcurl to pause sending data on the current transfer.

  -- Return code for when the trailing headers' callback has terminated
  --   without any errors

  -- Return code for when was an error in the trailing header's list and we
  --  want to abort the request

   type curl_read_callback is access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : size_t;
         arg3 : size_t;
         arg4 : System.Address) return size_t
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:379

   type curl_trailer_callback is access function (arg1 : System.Address; arg2 : System.Address) return int
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:384

  -- socket created for a specific IP connection
  -- socket created by accept() call
  -- never use
   type curlsocktype is
     (CURLSOCKTYPE_IPCXN,
      CURLSOCKTYPE_ACCEPT,
      CURLSOCKTYPE_LAST)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:391

  -- The return code from the sockopt_callback can signal information back
  --   to libcurl:

   type curl_sockopt_callback is access function
        (arg1 : System.Address;
         arg2 : curl_socket_t;
         arg3 : curlsocktype) return int
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:400

   -- type curl_sockaddr is record
   --    family : aliased int;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:405
   --    socktype : aliased int;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:406
   --    protocol : aliased int;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:407
   --    addrlen : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:408
   --    addr : aliased CurlAda.x86_64_linux_gnu_bits_socket_h.sockaddr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:411
   -- end record
   -- with Convention => C_Pass_By_Copy;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:404

  -- addrlen was a socklen_t type before 7.18.0 but it
  --                           turned really ugly and painful on the systems that
  --                           lack this type

   -- type curl_opensocket_callback is access function
   --      (arg1 : System.Address;
   --       arg2 : curlsocktype;
   --       arg3 : access curl_sockaddr) return curl_socket_t
   -- with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:415

   type curl_closesocket_callback is access function (arg1 : System.Address; arg2 : curl_socket_t) return int
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:420

  -- I/O operation successful
  -- command was unknown to callback
  -- failed to restart the read
  -- never use
   type curlioerr is
     (CURLIOE_OK,
      CURLIOE_UNKNOWNCMD,
      CURLIOE_FAILRESTART,
      CURLIOE_LAST)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:427

  -- no operation
  -- restart the read stream from start
  -- never use
   type curliocmd is
     (CURLIOCMD_NOP,
      CURLIOCMD_RESTARTREAD,
      CURLIOCMD_LAST)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:433

   type curl_ioctl_callback is access function
        (arg1 : System.Address;
         arg2 : int;
         arg3 : System.Address) return curlioerr
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:435

  -- * The following typedef's are signatures of malloc, free, realloc, strdup and
  -- * calloc respectively.  Function pointers of these types can be passed to the
  -- * curl_global_init_mem() function to set user defined memory management
  -- * callback routines.
  --

   type curl_malloc_callback is access function (arg1 : size_t) return System.Address
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:446

   type curl_free_callback is access procedure (arg1 : System.Address)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:447

   type curl_realloc_callback is access function (arg1 : System.Address; arg2 : size_t) return System.Address
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:448

   type curl_strdup_callback is access function (arg1 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:449

   type curl_calloc_callback is access function (arg1 : size_t; arg2 : size_t) return System.Address
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:450

  -- the kind of data that is passed to information_callback
  -- 1
  -- 2
  -- 3
  -- 4
  -- 5
  -- 6
   type curl_infotype is
     (CURLINFO_TEXT,
      CURLINFO_HEADER_IN,
      CURLINFO_HEADER_OUT,
      CURLINFO_DATA_IN,
      CURLINFO_DATA_OUT,
      CURLINFO_SSL_DATA_IN,
      CURLINFO_SSL_DATA_OUT,
      CURLINFO_END)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:465

   type curl_debug_callback is access function
        (arg1 : System.Address;
         arg2 : curl_infotype;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : size_t;
         arg5 : System.Address) return int
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:467

  -- the handle/transfer this concerns
  -- what kind of data
  -- points to the data
  -- size of the data pointed to
  -- whatever the user please
  -- All possible error codes from all sorts of curl functions. Future versions
  --   may return other values, stay prepared.
  --   Always add new return codes last. Never *EVER* remove any. The return
  --   codes must remain the same!
  --

  -- 1
  -- 2
  -- 3
  -- 4 - [was obsoleted in August 2007 for
  --                                    7.17.0, reused in April 2011 for 7.21.5]

  -- 5
  -- 6
  -- 7
  -- 8
  -- 9 a service was denied by the server
  --                                    due to lack of access - when login fails
  --                                    this is not returned.

  -- 10 - [was obsoleted in April 2006 for
  --                                    7.15.4, reused in Dec 2011 for 7.24.0]

  -- 11
  -- 12 - timeout occurred accepting server
  --                                    [was obsoleted in August 2007 for 7.17.0,
  --                                    reused in Dec 2011 for 7.24.0]

  -- 13
  -- 14
  -- 15
  -- 16 - A problem in the http2 framing layer.
  --                                    [was obsoleted in August 2007 for 7.17.0,
  --                                    reused in July 2014 for 7.38.0]

  -- 17
  -- 18
  -- 19
  -- 20 - NOT USED
  -- 21 - quote command failure
  -- 22
  -- 23
  -- 24 - NOT USED
  -- 25 - failed upload "command"
  -- 26 - couldn't open/read from file
  -- 27
  -- Note: CURLE_OUT_OF_MEMORY may sometimes indicate a conversion error
  --           instead of a memory allocation error if CURL_DOES_CONVERSIONS
  --           is defined
  --

  -- 28 - the timeout time was reached
  -- 29 - NOT USED
  -- 30 - FTP PORT operation failed
  -- 31 - the REST command failed
  -- 32 - NOT USED
  -- 33 - RANGE "command" didn't work
  -- 34
  -- 35 - wrong when connecting with SSL
  -- 36 - couldn't resume download
  -- 37
  -- 38
  -- 39
  -- 40 - NOT USED
  -- 41 - NOT USED starting with 7.53.0
  -- 42
  -- 43
  -- 44 - NOT USED
  -- 45 - CURLOPT_INTERFACE failed
  -- 46 - NOT USED
  -- 47 - catch endless re-direct loops
  -- 48 - User specified an unknown option
  -- 49 - Malformed telnet option
  -- 50 - NOT USED
  -- 51 - NOT USED
  -- 52 - when this is a specific error
  -- 53 - SSL crypto engine not found
  -- 54 - can not set SSL crypto engine as
  --                                    default

  -- 55 - failed sending network data
  -- 56 - failure in receiving network data
  -- 57 - NOT IN USE
  -- 58 - problem with the local certificate
  -- 59 - couldn't use specified cipher
  -- 60 - peer's certificate or fingerprint
  --                                     wasn't verified fine

  -- 61 - Unrecognized/bad encoding
  -- 62 - Invalid LDAP URL
  -- 63 - Maximum file size exceeded
  -- 64 - Requested FTP SSL level failed
  -- 65 - Sending the data requires a rewind
  --                                    that failed

  -- 66 - failed to initialise ENGINE
  -- 67 - user, password or similar was not
  --                                    accepted and we failed to login

  -- 68 - file not found on server
  -- 69 - permission problem on server
  -- 70 - out of disk space on server
  -- 71 - Illegal TFTP operation
  -- 72 - Unknown transfer ID
  -- 73 - File already exists
  -- 74 - No such user
  -- 75 - conversion failed
  -- 76 - caller must register conversion
  --                                    callbacks using curl_easy_setopt options
  --                                    CURLOPT_CONV_FROM_NETWORK_FUNCTION,
  --                                    CURLOPT_CONV_TO_NETWORK_FUNCTION, and
  --                                    CURLOPT_CONV_FROM_UTF8_FUNCTION

  -- 77 - could not load CACERT file, missing
  --                                    or wrong format

  -- 78 - remote file not found
  -- 79 - error from the SSH layer, somewhat
  --                                    generic so the error message will be of
  --                                    interest when this has happened

  -- 80 - Failed to shut down the SSL
  --                                    connection

  -- 81 - socket is not ready for send/recv,
  --                                    wait till it's ready and try again (Added
  --                                    in 7.18.2)

  -- 82 - could not load CRL file, missing or
  --                                    wrong format (Added in 7.19.0)

  -- 83 - Issuer check failed.  (Added in
  --                                    7.19.0)

  -- 84 - a PRET command failed
  -- 85 - mismatch of RTSP CSeq numbers
  -- 86 - mismatch of RTSP Session Ids
  -- 87 - unable to parse FTP file list
  -- 88 - chunk callback reported error
  -- 89 - No connection available, the
  --                                    session will be queued

  -- 90 - specified pinned public key did not
  --                                     match

  -- 91 - invalid certificate status
  -- 92 - stream error in HTTP/2 framing layer
  --

  -- 93 - an api function was called from
  --                                    inside a callback

  -- 94 - an authentication function returned an
  --                                    error

  -- 95 - An HTTP/3 layer problem
  -- never use!
   type CURLcode is
     (CURLE_OK,
      CURLE_UNSUPPORTED_PROTOCOL,
      CURLE_FAILED_INIT,
      CURLE_URL_MALFORMAT,
      CURLE_NOT_BUILT_IN,
      CURLE_COULDNT_RESOLVE_PROXY,
      CURLE_COULDNT_RESOLVE_HOST,
      CURLE_COULDNT_CONNECT,
      CURLE_WEIRD_SERVER_REPLY,
      CURLE_REMOTE_ACCESS_DENIED,
      CURLE_FTP_ACCEPT_FAILED,
      CURLE_FTP_WEIRD_PASS_REPLY,
      CURLE_FTP_ACCEPT_TIMEOUT,
      CURLE_FTP_WEIRD_PASV_REPLY,
      CURLE_FTP_WEIRD_227_FORMAT,
      CURLE_FTP_CANT_GET_HOST,
      CURLE_HTTP2,
      CURLE_FTP_COULDNT_SET_TYPE,
      CURLE_PARTIAL_FILE,
      CURLE_FTP_COULDNT_RETR_FILE,
      CURLE_OBSOLETE20,
      CURLE_QUOTE_ERROR,
      CURLE_HTTP_RETURNED_ERROR,
      CURLE_WRITE_ERROR,
      CURLE_OBSOLETE24,
      CURLE_UPLOAD_FAILED,
      CURLE_READ_ERROR,
      CURLE_OUT_OF_MEMORY,
      CURLE_OPERATION_TIMEDOUT,
      CURLE_OBSOLETE29,
      CURLE_FTP_PORT_FAILED,
      CURLE_FTP_COULDNT_USE_REST,
      CURLE_OBSOLETE32,
      CURLE_RANGE_ERROR,
      CURLE_HTTP_POST_ERROR,
      CURLE_SSL_CONNECT_ERROR,
      CURLE_BAD_DOWNLOAD_RESUME,
      CURLE_FILE_COULDNT_READ_FILE,
      CURLE_LDAP_CANNOT_BIND,
      CURLE_LDAP_SEARCH_FAILED,
      CURLE_OBSOLETE40,
      CURLE_FUNCTION_NOT_FOUND,
      CURLE_ABORTED_BY_CALLBACK,
      CURLE_BAD_FUNCTION_ARGUMENT,
      CURLE_OBSOLETE44,
      CURLE_INTERFACE_FAILED,
      CURLE_OBSOLETE46,
      CURLE_TOO_MANY_REDIRECTS,
      CURLE_UNKNOWN_OPTION,
      CURLE_TELNET_OPTION_SYNTAX,
      CURLE_OBSOLETE50,
      CURLE_OBSOLETE51,
      CURLE_GOT_NOTHING,
      CURLE_SSL_ENGINE_NOTFOUND,
      CURLE_SSL_ENGINE_SETFAILED,
      CURLE_SEND_ERROR,
      CURLE_RECV_ERROR,
      CURLE_OBSOLETE57,
      CURLE_SSL_CERTPROBLEM,
      CURLE_SSL_CIPHER,
      CURLE_PEER_FAILED_VERIFICATION,
      CURLE_BAD_CONTENT_ENCODING,
      CURLE_LDAP_INVALID_URL,
      CURLE_FILESIZE_EXCEEDED,
      CURLE_USE_SSL_FAILED,
      CURLE_SEND_FAIL_REWIND,
      CURLE_SSL_ENGINE_INITFAILED,
      CURLE_LOGIN_DENIED,
      CURLE_TFTP_NOTFOUND,
      CURLE_TFTP_PERM,
      CURLE_REMOTE_DISK_FULL,
      CURLE_TFTP_ILLEGAL,
      CURLE_TFTP_UNKNOWNID,
      CURLE_REMOTE_FILE_EXISTS,
      CURLE_TFTP_NOSUCHUSER,
      CURLE_CONV_FAILED,
      CURLE_CONV_REQD,
      CURLE_SSL_CACERT_BADFILE,
      CURLE_REMOTE_FILE_NOT_FOUND,
      CURLE_SSH,
      CURLE_SSL_SHUTDOWN_FAILED,
      CURLE_AGAIN,
      CURLE_SSL_CRL_BADFILE,
      CURLE_SSL_ISSUER_ERROR,
      CURLE_FTP_PRET_FAILED,
      CURLE_RTSP_CSEQ_ERROR,
      CURLE_RTSP_SESSION_ERROR,
      CURLE_FTP_BAD_FILE_LIST,
      CURLE_CHUNK_FAILED,
      CURLE_NO_CONNECTION_AVAILABLE,
      CURLE_SSL_PINNEDPUBKEYNOTMATCH,
      CURLE_SSL_INVALIDCERTSTATUS,
      CURLE_HTTP2_STREAM,
      CURLE_RECURSIVE_API_CALL,
      CURLE_AUTH_ERROR,
      CURLE_HTTP3,
      CURL_LAST)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:613

  -- Previously obsolete error code re-used in 7.38.0
  -- Previously obsolete error codes re-used in 7.24.0
  --  compatibility with older names
  -- The following were added in 7.62.0
  -- The following were added in 7.21.5, April 2011
  -- The following were added in 7.17.1
  -- These are scheduled to disappear by 2009
  -- The following were added in 7.17.0
  -- These are scheduled to disappear by 2009
  -- The following were added earlier
  -- This was the error code 50 in 7.7.3 and a few earlier versions, this
  --   is no longer used by libcurl but is instead #defined here only to not
  --   make programs break

  -- Provide defines for really old option names
  -- Since long deprecated options with no code in the lib that does anything
  --   with them.

  -- This prototype applies to all conversion callbacks
   type curl_conv_callback is access function (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : size_t) return CURLcode
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:692

  -- easy handle
   type curl_ssl_ctx_callback is access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address) return CURLcode
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:694

  -- actually an OpenSSL
  --                                                            or WolfSSL SSL_CTX,
  --                                                            or an mbedTLS
  --                                                          mbedtls_ssl_config

  -- added in 7.10, new in 7.19.4 default is to use
  --                           CONNECT HTTP/1.1

  -- added in 7.19.4, force to use CONNECT
  --                               HTTP/1.0

  -- added in 7.52.0
  -- support added in 7.15.2, enum existed already
  --                           in 7.10

  -- added in 7.10
  -- added in 7.18.0
  -- Use the SOCKS5 protocol but pass along the
  --                                   host name rather than the IP address. added
  --                                   in 7.18.0

  -- this enum was added in 7.10
   subtype curl_proxytype is unsigned;
   CURLPROXY_HTTP : constant unsigned := 0;
   CURLPROXY_HTTP_1_0 : constant unsigned := 1;
   CURLPROXY_HTTPS : constant unsigned := 2;
   CURLPROXY_SOCKS4 : constant unsigned := 4;
   CURLPROXY_SOCKS5 : constant unsigned := 5;
   CURLPROXY_SOCKS4A : constant unsigned := 6;
   CURLPROXY_SOCKS5_HOSTNAME : constant unsigned := 7;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:714

  -- * Bitmasks for CURLOPT_HTTPAUTH and CURLOPT_PROXYAUTH options:
  -- *
  -- * CURLAUTH_NONE         - No HTTP authentication
  -- * CURLAUTH_BASIC        - HTTP Basic authentication (default)
  -- * CURLAUTH_DIGEST       - HTTP Digest authentication
  -- * CURLAUTH_NEGOTIATE    - HTTP Negotiate (SPNEGO) authentication
  -- * CURLAUTH_GSSNEGOTIATE - Alias for CURLAUTH_NEGOTIATE (deprecated)
  -- * CURLAUTH_NTLM         - HTTP NTLM authentication
  -- * CURLAUTH_DIGEST_IE    - HTTP Digest authentication with IE flavour
  -- * CURLAUTH_NTLM_WB      - HTTP NTLM authentication delegated to winbind helper
  -- * CURLAUTH_BEARER       - HTTP Bearer token authentication
  -- * CURLAUTH_ONLY         - Use together with a single other type to force no
  -- *                         authentication or just that single type
  -- * CURLAUTH_ANY          - All fine types set
  -- * CURLAUTH_ANYSAFE      - All fine types except Basic
  --

  -- Deprecated since the advent of CURLAUTH_NEGOTIATE
  -- Used for CURLOPT_SOCKS5_AUTH to stay terminologically correct
   type curl_khtype is
     (CURLKHTYPE_UNKNOWN,
      CURLKHTYPE_RSA1,
      CURLKHTYPE_RSA,
      CURLKHTYPE_DSS,
      CURLKHTYPE_ECDSA,
      CURLKHTYPE_ED25519)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:766

  -- points to a zero-terminated string encoded with base64
  --                      if len is zero, otherwise to the "raw" data

   type curl_khkey is record
      key : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:776
      len : aliased size_t;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:778
      keytype : aliased curl_khtype;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:779
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:775

  -- this is the set of return values expected from the curl_sshkeycallback
  --   callback

   type curl_khstat is
     (CURLKHSTAT_FINE_ADD_TO_FILE,
      CURLKHSTAT_FINE,
      CURLKHSTAT_REJECT,
      CURLKHSTAT_DEFER,
      CURLKHSTAT_LAST)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:784

  -- reject the connection, return an error
  -- do not accept it, but we can't answer right now so
  --                        this causes a CURLE_DEFER error but otherwise the
  --                        connection will be left intact etc

  -- not for use, only a marker for last-in-list
  -- this is the set of status codes pass in to the callback
   type curl_khmatch is
     (CURLKHMATCH_OK,
      CURLKHMATCH_MISMATCH,
      CURLKHMATCH_MISSING,
      CURLKHMATCH_LAST)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:795

  -- match
  -- host found, key mismatch!
  -- no matching host/key found
  -- not for use, only a marker for last-in-list
  -- easy handle
   type curl_sshkeycallback is access function
        (arg1 : System.Address;
         arg2 : access constant curl_khkey;
         arg3 : access constant curl_khkey;
         arg4 : curl_khmatch;
         arg5 : System.Address) return int
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:803

  -- known
  -- found
  -- libcurl's view on the keys
  -- custom pointer passed from app
  -- parameter for the CURLOPT_USE_SSL option
  -- do not attempt to use SSL
  -- try using SSL, proceed anyway otherwise
  -- SSL for the control connection or fail
  -- SSL for all communication or fail
  -- not an option, never use
   type curl_usessl is
     (CURLUSESSL_NONE,
      CURLUSESSL_TRY,
      CURLUSESSL_CONTROL,
      CURLUSESSL_ALL,
      CURLUSESSL_LAST)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:816

  -- Definition of bits for the CURLOPT_SSL_OPTIONS argument:
  -- - ALLOW_BEAST tells libcurl to allow the BEAST SSL vulnerability in the
  --   name of improving interoperability with older servers. Some SSL libraries
  --   have introduced work-arounds for this flaw but those work-arounds sometimes
  --   make the SSL communication fail. To regain functionality with those broken
  --   servers, a user can this way allow the vulnerability back.

  -- - NO_REVOKE tells libcurl to disable certificate revocation checks for those
  --   SSL backends where such behavior is present.

  -- - NO_PARTIALCHAIN tells libcurl to *NOT* accept a partial certificate chain
  --   if possible. The OpenSSL backend has this ability.

  -- The default connection attempt delay in milliseconds for happy eyeballs.
  --   CURLOPT_HAPPY_EYEBALLS_TIMEOUT_MS.3 and happy-eyeballs-timeout-ms.d document
  --   this value, keep them in sync.

  -- The default connection upkeep interval in milliseconds.
  -- Backwards compatibility with older names
  -- These are scheduled to disappear by 2009
  -- parameter for the CURLOPT_FTP_SSL_CCC option
  -- do not send CCC
  -- Let the server initiate the shutdown
  -- Initiate the shutdown
  -- not an option, never use
   type curl_ftpccc is
     (CURLFTPSSL_CCC_NONE,
      CURLFTPSSL_CCC_PASSIVE,
      CURLFTPSSL_CCC_ACTIVE,
      CURLFTPSSL_CCC_LAST)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:863

  -- parameter for the CURLOPT_FTPSSLAUTH option
  -- let libcurl decide
  -- use "AUTH SSL"
  -- use "AUTH TLS"
  -- not an option, never use
   type curl_ftpauth is
     (CURLFTPAUTH_DEFAULT,
      CURLFTPAUTH_SSL,
      CURLFTPAUTH_TLS,
      CURLFTPAUTH_LAST)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:871

  -- parameter for the CURLOPT_FTP_CREATE_MISSING_DIRS option
  -- do NOT create missing dirs!
  -- (FTP/SFTP) if CWD fails, try MKD and then CWD
  --                               again if MKD succeeded, for SFTP this does
  --                               similar magic

  -- (FTP only) if CWD fails, try MKD and then CWD
  --                               again even if MKD failed!

  -- not an option, never use
   type curl_ftpcreatedir is
     (CURLFTP_CREATE_DIR_NONE,
      CURLFTP_CREATE_DIR,
      CURLFTP_CREATE_DIR_RETRY,
      CURLFTP_CREATE_DIR_LAST)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:882

  -- parameter for the CURLOPT_FTP_FILEMETHOD option
  -- let libcurl pick
  -- single CWD operation for each path part
  -- no CWD at all
  -- one CWD to full dir, then work on file
  -- not an option, never use
   type curl_ftpmethod is
     (CURLFTPMETHOD_DEFAULT,
      CURLFTPMETHOD_MULTICWD,
      CURLFTPMETHOD_NOCWD,
      CURLFTPMETHOD_SINGLECWD,
      CURLFTPMETHOD_LAST)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:891

  -- bitmask defines for CURLOPT_HEADEROPT
  -- CURLALTSVC_* are bits for the CURLOPT_ALTSVC_CTRL option
  -- CURLPROTO_ defines are for the CURLOPT_*PROTOCOLS options
  -- long may be 32 or 64 bits, but we should never depend on anything else
  --   but 32

  -- *STRINGPOINT is an alias for OBJECTPOINT to allow tools to extract the
  --   string options from the header file

  -- name is uppercase CURLOPT_<name>,
  --   type is one of the defined CURLOPTTYPE_<type>
  --   number is unique identifier

  -- The macro "##" is ISO C, we assume pre-ISO C doesn't support it.
  -- handy aliases that make no run-time difference
  -- * This macro-mania below setups the CURLOPT_[what] enum, to be used with
  -- * curl_easy_setopt(). The first argument in the CINIT() macro is the [what]
  -- * word.
  --

  -- This is the FILE * or void * the regular output should be written to.
  -- The full URL to get/put
  -- Port number to connect to, if other than default.
  -- Name of proxy to use.
  -- "user:password;options" to use when fetching.
  -- "user:password" to use with proxy.
  -- Range to get, specified as an ASCII string.
  -- not used
  -- Specified file stream to upload from (use as input):
  -- Buffer to receive error messages in, must be at least CURL_ERROR_SIZE
  --   * bytes big.

  -- Function that will be called to store the output (instead of fwrite). The
  --   * parameters will use fwrite() syntax, make sure to follow them.

  -- Function that will be called to read the input (instead of fread). The
  --   * parameters will use fread() syntax, make sure to follow them.

  -- Time-out the read operation after this amount of seconds
  -- If the CURLOPT_INFILE is used, this can be used to inform libcurl about
  --   * how large the file being sent really is. That allows better error
  --   * checking and better verifies that the upload was successful. -1 means
  --   * unknown size.
  --   *
  --   * For large file support, there is also a _LARGE version of the key
  --   * which takes an off_t type, allowing platforms with larger off_t
  --   * sizes to handle larger files.  See below for INFILESIZE_LARGE.
  --

  -- POST static input fields.
  -- Set the referrer page (needed by some CGIs)
  -- Set the FTP PORT string (interface name, named or numerical IP address)
  --     Use i.e '-' to use default address.

  -- Set the User-Agent string (examined by some CGIs)
  -- If the download receives less than "low speed limit" bytes/second
  --   * during "low speed time" seconds, the operations is aborted.
  --   * You could i.e if you have a pretty high speed connection, abort if
  --   * it is less than 2000 bytes/sec during 20 seconds.
  --

  -- Set the "low speed limit"
  -- Set the "low speed time"
  -- Set the continuation offset.
  --   *
  --   * Note there is also a _LARGE version of this key which uses
  --   * off_t types, allowing for large file offsets on platforms which
  --   * use larger-than-32-bit off_t's.  Look below for RESUME_FROM_LARGE.
  --

  -- Set cookie in request:
  -- This points to a linked list of headers, struct curl_slist kind. This
  --     list is also used for RTSP (in spite of its name)

  -- This points to a linked list of post entries, struct curl_httppost
  -- name of the file keeping your private SSL-certificate
  -- password for the SSL or SSH private key
  -- send TYPE parameter?
  -- send linked-list of QUOTE commands
  -- send FILE * or void * to store headers to, if you use a callback it
  --     is simply passed to the callback unmodified

  -- point to a file to read the initial cookies from, also enables
  --     "cookie awareness"

  -- What version to specifically try to use.
  --     See CURL_SSLVERSION defines below.

  -- What kind of HTTP time condition to use, see defines
  -- Time to use with the above condition. Specified in number of seconds
  --     since 1 Jan 1970

  -- 35 = OBSOLETE
  -- Custom request, for customizing the get command like
  --     HTTP: DELETE, TRACE and others
  --     FTP: to use a different list command
  --

  -- FILE handle to use instead of stderr
  -- 38 is not used
  -- send linked-list of post-transfer QUOTE commands
  -- OBSOLETE, do not use!
  -- talk a lot
  -- throw the header out too
  -- shut off the progress meter
  -- use HEAD to get http document
  -- no output on http error codes >= 400
  -- this is an upload
  -- HTTP POST method
  -- bare names when listing directories
  -- Append instead of overwrite on upload!
  -- Specify whether to read the user+password from the .netrc or the URL.
  --   * This must be one of the CURL_NETRC_* enums below.

  -- use Location: Luke!
  -- transfer data in text/ASCII format
  -- HTTP PUT
  -- 55 = OBSOLETE
  -- DEPRECATED
  --   * Function that will be called instead of the internal progress display
  --   * function. This function should be defined as the curl_progress_callback
  --   * prototype defines.

  -- Data passed to the CURLOPT_PROGRESSFUNCTION and CURLOPT_XFERINFOFUNCTION
  --     callbacks

  -- We want the referrer field set automatically when following locations
  -- Port of the proxy, can be set in the proxy string as well with:
  --     "[host]:[port]"

  -- size of the POST input data, if strlen() is not good to use
  -- tunnel non-http operations through a HTTP proxy
  -- Set the interface string to use as outgoing network interface
  -- Set the krb4/5 security level, this also enables krb4/5 awareness.  This
  --   * is a string, 'clear', 'safe', 'confidential' or 'private'.  If the string
  --   * is set but doesn't match one of these, 'private' will be used.

  -- Set if we should verify the peer in ssl handshake, set 1 to verify.
  -- The CApath or CAfile used to validate the peer certificate
  --     this option is used only if SSL_VERIFYPEER is true

  -- 66 = OBSOLETE
  -- 67 = OBSOLETE
  -- Maximum number of http redirects to follow
  -- Pass a long set to 1 to get the date of the requested document (if
  --     possible)! Pass a zero to shut it off.

  -- This points to a linked list of telnet options
  -- Max amount of cached alive connections
  -- OBSOLETE, do not use!
  -- 73 = OBSOLETE
  -- Set to explicitly use a new connection for the upcoming transfer.
  --     Do not use this unless you're absolutely sure of this, as it makes the
  --     operation slower and is less friendly for the network.

  -- Set to explicitly forbid the upcoming transfer's connection to be re-used
  --     when done. Do not use this unless you're absolutely sure of this, as it
  --     makes the operation slower and is less friendly for the network.

  -- Set to a file name that contains random data for libcurl to use to
  --     seed the random engine when doing SSL connects.

  -- Set to the Entropy Gathering Daemon socket pathname
  -- Time-out connect operations after this amount of seconds, if connects are
  --     OK within this time, then fine... This only aborts the connect phase.

  -- Function that will be called to store headers (instead of fwrite). The
  --   * parameters will use fwrite() syntax, make sure to follow them.

  -- Set this to force the HTTP request to get back to GET. Only really usable
  --     if POST, PUT or a custom request have been used first.
  --

  -- Set if we should verify the Common name from the peer certificate in ssl
  --   * handshake, set 1 to check existence, 2 to ensure that it matches the
  --   * provided hostname.

  -- Specify which file name to write all known cookies in after completed
  --     operation. Set file name to "-" (dash) to make it go to stdout.

  -- Specify which SSL ciphers to use
  -- Specify which HTTP version to use! This must be set to one of the
  --     CURL_HTTP_VERSION* enums set below.

  -- Specifically switch on or off the FTP engine's use of the EPSV command. By
  --     default, that one will always be attempted before the more traditional
  --     PASV command.

  -- type of the file keeping your SSL-certificate ("DER", "PEM", "ENG")
  -- name of the file keeping your private SSL-key
  -- type of the file keeping your private SSL-key ("DER", "PEM", "ENG")
  -- crypto engine for the SSL-sub system
  -- set the crypto engine for the SSL-sub system as default
  --     the param has no meaning...
  --

  -- Non-zero value means to use the global dns cache
  -- DEPRECATED, do not use!
  -- DNS cache timeout
  -- send linked-list of pre-transfer QUOTE commands
  -- set the debug function
  -- set the data for the debug function
  -- mark this as start of a cookie session
  -- The CApath directory used to validate the peer certificate
  --     this option is used only if SSL_VERIFYPEER is true

  -- Instruct libcurl to use a smaller receive buffer
  -- Instruct libcurl to not use any signal/alarm handlers, even when using
  --     timeouts. This option is useful for multi-threaded applications.
  --     See libcurl-the-guide for more background information.

  -- Provide a CURLShare for mutexing non-ts data
  -- indicates type of proxy. accepted values are CURLPROXY_HTTP (default),
  --     CURLPROXY_HTTPS, CURLPROXY_SOCKS4, CURLPROXY_SOCKS4A and
  --     CURLPROXY_SOCKS5.

  -- Set the Accept-Encoding string. Use this to tell a server you would like
  --     the response to be compressed. Before 7.21.6, this was known as
  --     CURLOPT_ENCODING

  -- Set pointer to private data
  -- Set aliases for HTTP 200 in the HTTP Response header
  -- Continue to send authentication (user+password) when following locations,
  --     even when hostname changed. This can potentially send off the name
  --     and password to whatever host the server decides.

  -- Specifically switch on or off the FTP engine's use of the EPRT command (
  --     it also disables the LPRT attempt). By default, those ones will always be
  --     attempted before the good old traditional PORT command.

  -- Set this to a bitmask value to enable the particular authentications
  --     methods you like. Use this in combination with CURLOPT_USERPWD.
  --     Note that setting multiple bits may cause extra network round-trips.

  -- Set the ssl context callback function, currently only for OpenSSL or
  --     WolfSSL ssl_ctx, or mbedTLS mbedtls_ssl_config in the second argument.
  --     The function must match the curl_ssl_ctx_callback prototype.

  -- Set the userdata for the ssl context callback function's third
  --     argument

  -- FTP Option that causes missing dirs to be created on the remote server.
  --     In 7.19.4 we introduced the convenience enums for this option using the
  --     CURLFTP_CREATE_DIR prefix.
  --

  -- Set this to a bitmask value to enable the particular authentications
  --     methods you like. Use this in combination with CURLOPT_PROXYUSERPWD.
  --     Note that setting multiple bits may cause extra network round-trips.

  -- FTP option that changes the timeout, in seconds, associated with
  --     getting a response.  This is different from transfer timeout time and
  --     essentially places a demand on the FTP server to acknowledge commands
  --     in a timely manner.

  -- Set this option to one of the CURL_IPRESOLVE_* defines (see below) to
  --     tell libcurl to resolve names to those IP versions only. This only has
  --     affect on systems with support for more than one, i.e IPv4 _and_ IPv6.

  -- Set this option to limit the size of a file that will be downloaded from
  --     an HTTP or FTP server.
  --     Note there is also _LARGE version which adds large file support for
  --     platforms which have larger off_t sizes.  See MAXFILESIZE_LARGE below.

  -- See the comment for INFILESIZE above, but in short, specifies
  --   * the size of the file being uploaded.  -1 means unknown.
  --

  -- Sets the continuation offset.  There is also a LONG version of this;
  --   * look above for RESUME_FROM.
  --

  -- Sets the maximum size of data that will be downloaded from
  --   * an HTTP or FTP server.  See MAXFILESIZE above for the LONG version.
  --

  -- Set this option to the file name of your .netrc file you want libcurl
  --     to parse (using the CURLOPT_NETRC option). If not set, libcurl will do
  --     a poor attempt to find the user's home directory and check for a .netrc
  --     file in there.

  -- Enable SSL/TLS for FTP, pick one of:
  --     CURLUSESSL_TRY     - try using SSL, proceed anyway otherwise
  --     CURLUSESSL_CONTROL - SSL for the control connection or fail
  --     CURLUSESSL_ALL     - SSL for all communication or fail
  --

  -- The _LARGE version of the standard POSTFIELDSIZE option
  -- Enable/disable the TCP Nagle algorithm
  -- 122 OBSOLETE, used in 7.12.3. Gone in 7.13.0
  -- 123 OBSOLETE. Gone in 7.16.0
  -- 124 OBSOLETE, used in 7.12.3. Gone in 7.13.0
  -- 125 OBSOLETE, used in 7.12.3. Gone in 7.13.0
  -- 126 OBSOLETE, used in 7.12.3. Gone in 7.13.0
  -- 127 OBSOLETE. Gone in 7.16.0
  -- 128 OBSOLETE. Gone in 7.16.0
  -- When FTP over SSL/TLS is selected (with CURLOPT_USE_SSL), this option
  --     can be used to change libcurl's default action which is to first try
  --     "AUTH SSL" and then "AUTH TLS" in this order, and proceed when a OK
  --     response has been received.
  --     Available parameters are:
  --     CURLFTPAUTH_DEFAULT - let libcurl decide
  --     CURLFTPAUTH_SSL     - try "AUTH SSL" first, then TLS
  --     CURLFTPAUTH_TLS     - try "AUTH TLS" first, then SSL
  --

  -- 132 OBSOLETE. Gone in 7.16.0
  -- 133 OBSOLETE. Gone in 7.16.0
  -- zero terminated string for pass on to the FTP server when asked for
  --     "account" info

  -- feed cookie into cookie engine
  -- ignore Content-Length
  -- Set to non-zero to skip the IP address received in a 227 PASV FTP server
  --     response. Typically used for FTP-SSL purposes but is not restricted to
  --     that. libcurl will then instead use the same IP address it used for the
  --     control connection.

  -- Select "file method" to use when doing FTP, see the curl_ftpmethod
  --     above.

  -- Local port number to bind the socket to
  -- Number of ports to try, including the first one set with LOCALPORT.
  --     Thus, setting it to 1 will make no additional attempts but the first.
  --

  -- no transfer, set up connection and let application use the socket by
  --     extracting it with CURLINFO_LASTSOCKET

  -- Function that will be called to convert from the
  --     network encoding (instead of using the iconv calls in libcurl)

  -- Function that will be called to convert to the
  --     network encoding (instead of using the iconv calls in libcurl)

  -- Function that will be called to convert from UTF8
  --     (instead of using the iconv calls in libcurl)
  --     Note that this is used only for SSL certificate processing

  -- if the connection proceeds too quickly then need to slow it down
  -- limit-rate: maximum number of bytes per second to send or receive
  -- Pointer to command string to send if USER/PASS fails.
  -- callback function for setting socket options
  -- set to 0 to disable session ID re-use for this transfer, default is
  --     enabled (== 1)

  -- allowed SSH authentication methods
  -- Used by scp/sftp to do public/private key authentication
  -- Send CCC (Clear Command Channel) after authentication
  -- Same as TIMEOUT and CONNECTTIMEOUT, but with ms resolution
  -- set to zero to disable the libcurl's decoding and thus pass the raw body
  --     data to the application even when it is encoded/compressed

  -- Permission used when creating new files and directories on the remote
  --     server for protocols that support it, SFTP/SCP/FILE

  -- Set the behaviour of POST when redirecting. Values must be set to one
  --     of CURL_REDIR* defines below. This used to be called CURLOPT_POST301

  -- used by scp/sftp to verify the host's public key
  -- Callback function for opening socket (instead of socket(2)). Optionally,
  --     callback is able change the address or refuse to connect returning
  --     CURL_SOCKET_BAD.  The callback should have type
  --     curl_opensocket_callback

  -- POST volatile input fields.
  -- set transfer mode (;type=<a|i>) when doing FTP via an HTTP proxy
  -- Callback function for seeking in the input stream
  -- CRL file
  -- Issuer certificate
  -- (IPv6) Address scope
  -- Collect certificate chain info and allow it to get retrievable with
  --     CURLINFO_CERTINFO after the transfer is complete.

  -- "name" and "pwd" to use when fetching.
  -- "name" and "pwd" to use with Proxy when fetching.
  -- Comma separated list of hostnames defining no-proxy zones. These should
  --     match both hostnames directly, and hostnames within a domain. For
  --     example, local.com will match local.com and www.local.com, but NOT
  --     notlocal.com or www.notlocal.com. For compatibility with other
  --     implementations of this, .local.com will be considered to be the same as
  --     local.com. A single * is the only valid wildcard, and effectively
  --     disables the use of proxy.

  -- block size for TFTP transfers
  -- Socks Service
  -- DEPRECATED, do not use!
  -- Socks Service
  -- set the bitmask for the protocols that are allowed to be used for the
  --     transfer, which thus helps the app which takes URLs from users or other
  --     external inputs and want to restrict what protocol(s) to deal
  --     with. Defaults to CURLPROTO_ALL.

  -- set the bitmask for the protocols that libcurl is allowed to follow to,
  --     as a subset of the CURLOPT_PROTOCOLS ones. That means the protocol needs
  --     to be set in both bitmasks to be allowed to get redirected to.

  -- set the SSH knownhost file name to use
  -- set the SSH host key callback, must point to a curl_sshkeycallback
  --     function

  -- set the SSH host key callback custom pointer
  -- set the SMTP mail originator
  -- set the list of SMTP mail receiver(s)
  -- FTP: send PRET before PASV
  -- RTSP request method (OPTIONS, SETUP, PLAY, etc...)
  -- The RTSP session identifier
  -- The RTSP stream URI
  -- The Transport: header to use in RTSP requests
  -- Manually initialize the client RTSP CSeq for this handle
  -- Manually initialize the server RTSP CSeq for this handle
  -- The stream to pass to INTERLEAVEFUNCTION.
  -- Let the application define a custom write method for RTP data
  -- Turn on wildcard matching
  -- Directory matching callback called before downloading of an
  --     individual file (chunk) started

  -- Directory matching callback called after the file (chunk)
  --     was downloaded, or skipped

  -- Change match (fnmatch-like) callback for wildcard matching
  -- Let the application define custom chunk data pointer
  -- FNMATCH_FUNCTION user pointer
  -- send linked-list of name:port:address sets
  -- Set a username for authenticated TLS
  -- Set a password for authenticated TLS
  -- Set authentication type for authenticated TLS
  -- Set to 1 to enable the "TE:" header in HTTP requests to ask for
  --     compressed transfer-encoded responses. Set to 0 to disable the use of TE:
  --     in outgoing requests. The current default is 0, but it might change in a
  --     future libcurl release.
  --     libcurl will ask for the compressed methods it knows of, and if that
  --     isn't any, it will not ask for transfer-encoding at all even if this
  --     option is set to 1.
  --

  -- Callback function for closing socket (instead of close(2)). The callback
  --     should have type curl_closesocket_callback

  -- allow GSSAPI credential delegation
  -- Set the name servers to use for DNS resolution
  -- Time-out accept operations (currently for FTP only) after this amount
  --     of milliseconds.

  -- Set TCP keepalive
  -- non-universal keepalive knobs (Linux, AIX, HP-UX, more)
  -- Enable/disable specific SSL features with a bitmask, see CURLSSLOPT_*
  -- Set the SMTP auth originator
  -- Enable/disable SASL initial response
  -- Function that will be called instead of the internal progress display
  --   * function. This function should be defined as the curl_xferinfo_callback
  --   * prototype defines. (Deprecates CURLOPT_PROGRESSFUNCTION)

  -- The XOAUTH2 bearer token
  -- Set the interface string to use as outgoing network
  --   * interface for DNS requests.
  --   * Only supported by the c-ares DNS backend

  -- Set the local IPv4 address to use for outgoing DNS requests.
  --   * Only supported by the c-ares DNS backend

  -- Set the local IPv6 address to use for outgoing DNS requests.
  --   * Only supported by the c-ares DNS backend

  -- Set authentication options directly
  -- Enable/disable TLS NPN extension (http2 over ssl might fail without)
  -- Enable/disable TLS ALPN extension (http2 over ssl might fail without)
  -- Time to wait for a response to a HTTP request containing an
  --   * Expect: 100-continue header before sending the data anyway.

  -- This points to a linked list of headers used for proxy requests only,
  --     struct curl_slist kind

  -- Pass in a bitmask of "header options"
  -- The public key in DER form used to validate the peer public key
  --     this option is used only if SSL_VERIFYPEER is true

  -- Path to Unix domain socket
  -- Set if we should verify the certificate status.
  -- Set if we should enable TLS false start.
  -- Do not squash dot-dot sequences
  -- Proxy Service Name
  -- Service Name
  -- Wait/don't wait for pipe/mutex to clarify
  -- Set the protocol used when curl is given a URL without a protocol
  -- Set stream weight, 1 - 256 (default is 16)
  -- Set stream dependency on another CURL handle
  -- Set E-xclusive stream dependency on another CURL handle
  -- Do not send any tftp option requests to the server
  -- Linked-list of host:port:connect-to-host:connect-to-port,
  --     overrides the URL's host:port (only for the network layer)

  -- Set TCP Fast Open
  -- Continue to send data if the server responds early with an
  --   * HTTP status code >= 300

  -- The CApath or CAfile used to validate the proxy certificate
  --     this option is used only if PROXY_SSL_VERIFYPEER is true

  -- The CApath directory used to validate the proxy certificate
  --     this option is used only if PROXY_SSL_VERIFYPEER is true

  -- Set if we should verify the proxy in ssl handshake,
  --     set 1 to verify.

  -- Set if we should verify the Common name from the proxy certificate in ssl
  --   * handshake, set 1 to check existence, 2 to ensure that it matches
  --   * the provided hostname.

  -- What version to specifically try to use for proxy.
  --     See CURL_SSLVERSION defines below.

  -- Set a username for authenticated TLS for proxy
  -- Set a password for authenticated TLS for proxy
  -- Set authentication type for authenticated TLS for proxy
  -- name of the file keeping your private SSL-certificate for proxy
  -- type of the file keeping your SSL-certificate ("DER", "PEM", "ENG") for
  --     proxy

  -- name of the file keeping your private SSL-key for proxy
  -- type of the file keeping your private SSL-key ("DER", "PEM", "ENG") for
  --     proxy

  -- password for the SSL private key for proxy
  -- Specify which SSL ciphers to use for proxy
  -- CRL file for proxy
  -- Enable/disable specific SSL features with a bitmask for proxy, see
  --     CURLSSLOPT_*

  -- Name of pre proxy to use.
  -- The public key in DER form used to validate the proxy public key
  --     this option is used only if PROXY_SSL_VERIFYPEER is true

  -- Path to an abstract Unix domain socket
  -- Suppress proxy CONNECT response headers from user callbacks
  -- The request target, instead of extracted from the URL
  -- bitmask of allowed auth methods for connections to SOCKS5 proxies
  -- Enable/disable SSH compression
  -- Post MIME data.
  -- Time to use with the CURLOPT_TIMECONDITION. Specified in number of
  --     seconds since 1 Jan 1970.

  -- Head start in milliseconds to give happy eyeballs.
  -- Function that will be called before a resolver request is made
  -- User data to pass to the resolver start callback.
  -- send HAProxy PROXY protocol header?
  -- shuffle addresses before use when DNS returns multiple
  -- Specify which TLS 1.3 ciphers suites to use
  -- Disallow specifying username/login in URL.
  -- DNS-over-HTTPS URL
  -- Preferred buffer size to use for uploads
  -- Time in ms between connection upkeep calls for long-lived connections.
  -- Specify URL using CURL URL API.
  -- add trailing data just after no more data is available
  -- pointer to be passed to HTTP_TRAILER_FUNCTION
  -- set this to 1L to allow HTTP/0.9 responses or 0L to disallow
  -- alt-svc control bitmask
  -- alt-svc cache file name to possibly read from/write to
  -- maximum age of a connection to consider it for reuse (in seconds)
  -- SASL authorisation identity
  -- the last unused
   subtype CURLoption is unsigned;
   CURLOPT_WRITEDATA : constant unsigned := 10001;
   CURLOPT_URL : constant unsigned := 10002;
   CURLOPT_PORT : constant unsigned := 3;
   CURLOPT_PROXY : constant unsigned := 10004;
   CURLOPT_USERPWD : constant unsigned := 10005;
   CURLOPT_PROXYUSERPWD : constant unsigned := 10006;
   CURLOPT_RANGE : constant unsigned := 10007;
   CURLOPT_READDATA : constant unsigned := 10009;
   CURLOPT_ERRORBUFFER : constant unsigned := 10010;
   CURLOPT_WRITEFUNCTION : constant unsigned := 20011;
   CURLOPT_READFUNCTION : constant unsigned := 20012;
   CURLOPT_TIMEOUT : constant unsigned := 13;
   CURLOPT_INFILESIZE : constant unsigned := 14;
   CURLOPT_POSTFIELDS : constant unsigned := 10015;
   CURLOPT_REFERER : constant unsigned := 10016;
   CURLOPT_FTPPORT : constant unsigned := 10017;
   CURLOPT_USERAGENT : constant unsigned := 10018;
   CURLOPT_LOW_SPEED_LIMIT : constant unsigned := 19;
   CURLOPT_LOW_SPEED_TIME : constant unsigned := 20;
   CURLOPT_RESUME_FROM : constant unsigned := 21;
   CURLOPT_COOKIE : constant unsigned := 10022;
   CURLOPT_HTTPHEADER : constant unsigned := 10023;
   CURLOPT_HTTPPOST : constant unsigned := 10024;
   CURLOPT_SSLCERT : constant unsigned := 10025;
   CURLOPT_KEYPASSWD : constant unsigned := 10026;
   CURLOPT_CRLF : constant unsigned := 27;
   CURLOPT_QUOTE : constant unsigned := 10028;
   CURLOPT_HEADERDATA : constant unsigned := 10029;
   CURLOPT_COOKIEFILE : constant unsigned := 10031;
   CURLOPT_SSLVERSION : constant unsigned := 32;
   CURLOPT_TIMECONDITION : constant unsigned := 33;
   CURLOPT_TIMEVALUE : constant unsigned := 34;
   CURLOPT_CUSTOMREQUEST : constant unsigned := 10036;
   CURLOPT_STDERR : constant unsigned := 10037;
   CURLOPT_POSTQUOTE : constant unsigned := 10039;
   CURLOPT_OBSOLETE40 : constant unsigned := 10040;
   CURLOPT_VERBOSE : constant unsigned := 41;
   CURLOPT_HEADER : constant unsigned := 42;
   CURLOPT_NOPROGRESS : constant unsigned := 43;
   CURLOPT_NOBODY : constant unsigned := 44;
   CURLOPT_FAILONERROR : constant unsigned := 45;
   CURLOPT_UPLOAD : constant unsigned := 46;
   CURLOPT_POST : constant unsigned := 47;
   CURLOPT_DIRLISTONLY : constant unsigned := 48;
   CURLOPT_APPEND : constant unsigned := 50;
   CURLOPT_NETRC : constant unsigned := 51;
   CURLOPT_FOLLOWLOCATION : constant unsigned := 52;
   CURLOPT_TRANSFERTEXT : constant unsigned := 53;
   CURLOPT_PUT : constant unsigned := 54;
   CURLOPT_PROGRESSFUNCTION : constant unsigned := 20056;
   CURLOPT_PROGRESSDATA : constant unsigned := 10057;
   CURLOPT_AUTOREFERER : constant unsigned := 58;
   CURLOPT_PROXYPORT : constant unsigned := 59;
   CURLOPT_POSTFIELDSIZE : constant unsigned := 60;
   CURLOPT_HTTPPROXYTUNNEL : constant unsigned := 61;
   CURLOPT_INTERFACE : constant unsigned := 10062;
   CURLOPT_KRBLEVEL : constant unsigned := 10063;
   CURLOPT_SSL_VERIFYPEER : constant unsigned := 64;
   CURLOPT_CAINFO : constant unsigned := 10065;
   CURLOPT_MAXREDIRS : constant unsigned := 68;
   CURLOPT_FILETIME : constant unsigned := 69;
   CURLOPT_TELNETOPTIONS : constant unsigned := 10070;
   CURLOPT_MAXCONNECTS : constant unsigned := 71;
   CURLOPT_OBSOLETE72 : constant unsigned := 72;
   CURLOPT_FRESH_CONNECT : constant unsigned := 74;
   CURLOPT_FORBID_REUSE : constant unsigned := 75;
   CURLOPT_RANDOM_FILE : constant unsigned := 10076;
   CURLOPT_EGDSOCKET : constant unsigned := 10077;
   CURLOPT_CONNECTTIMEOUT : constant unsigned := 78;
   CURLOPT_HEADERFUNCTION : constant unsigned := 20079;
   CURLOPT_HTTPGET : constant unsigned := 80;
   CURLOPT_SSL_VERIFYHOST : constant unsigned := 81;
   CURLOPT_COOKIEJAR : constant unsigned := 10082;
   CURLOPT_SSL_CIPHER_LIST : constant unsigned := 10083;
   CURLOPT_HTTP_VERSION : constant unsigned := 84;
   CURLOPT_FTP_USE_EPSV : constant unsigned := 85;
   CURLOPT_SSLCERTTYPE : constant unsigned := 10086;
   CURLOPT_SSLKEY : constant unsigned := 10087;
   CURLOPT_SSLKEYTYPE : constant unsigned := 10088;
   CURLOPT_SSLENGINE : constant unsigned := 10089;
   CURLOPT_SSLENGINE_DEFAULT : constant unsigned := 90;
   CURLOPT_DNS_USE_GLOBAL_CACHE : constant unsigned := 91;
   CURLOPT_DNS_CACHE_TIMEOUT : constant unsigned := 92;
   CURLOPT_PREQUOTE : constant unsigned := 10093;
   CURLOPT_DEBUGFUNCTION : constant unsigned := 20094;
   CURLOPT_DEBUGDATA : constant unsigned := 10095;
   CURLOPT_COOKIESESSION : constant unsigned := 96;
   CURLOPT_CAPATH : constant unsigned := 10097;
   CURLOPT_BUFFERSIZE : constant unsigned := 98;
   CURLOPT_NOSIGNAL : constant unsigned := 99;
   CURLOPT_SHARE : constant unsigned := 10100;
   CURLOPT_PROXYTYPE : constant unsigned := 101;
   CURLOPT_ACCEPT_ENCODING : constant unsigned := 10102;
   CURLOPT_PRIVATE : constant unsigned := 10103;
   CURLOPT_HTTP200ALIASES : constant unsigned := 10104;
   CURLOPT_UNRESTRICTED_AUTH : constant unsigned := 105;
   CURLOPT_FTP_USE_EPRT : constant unsigned := 106;
   CURLOPT_HTTPAUTH : constant unsigned := 107;
   CURLOPT_SSL_CTX_FUNCTION : constant unsigned := 20108;
   CURLOPT_SSL_CTX_DATA : constant unsigned := 10109;
   CURLOPT_FTP_CREATE_MISSING_DIRS : constant unsigned := 110;
   CURLOPT_PROXYAUTH : constant unsigned := 111;
   CURLOPT_FTP_RESPONSE_TIMEOUT : constant unsigned := 112;
   CURLOPT_IPRESOLVE : constant unsigned := 113;
   CURLOPT_MAXFILESIZE : constant unsigned := 114;
   CURLOPT_INFILESIZE_LARGE : constant unsigned := 30115;
   CURLOPT_RESUME_FROM_LARGE : constant unsigned := 30116;
   CURLOPT_MAXFILESIZE_LARGE : constant unsigned := 30117;
   CURLOPT_NETRC_FILE : constant unsigned := 10118;
   CURLOPT_USE_SSL : constant unsigned := 119;
   CURLOPT_POSTFIELDSIZE_LARGE : constant unsigned := 30120;
   CURLOPT_TCP_NODELAY : constant unsigned := 121;
   CURLOPT_FTPSSLAUTH : constant unsigned := 129;
   CURLOPT_IOCTLFUNCTION : constant unsigned := 20130;
   CURLOPT_IOCTLDATA : constant unsigned := 10131;
   CURLOPT_FTP_ACCOUNT : constant unsigned := 10134;
   CURLOPT_COOKIELIST : constant unsigned := 10135;
   CURLOPT_IGNORE_CONTENT_LENGTH : constant unsigned := 136;
   CURLOPT_FTP_SKIP_PASV_IP : constant unsigned := 137;
   CURLOPT_FTP_FILEMETHOD : constant unsigned := 138;
   CURLOPT_LOCALPORT : constant unsigned := 139;
   CURLOPT_LOCALPORTRANGE : constant unsigned := 140;
   CURLOPT_CONNECT_ONLY : constant unsigned := 141;
   CURLOPT_CONV_FROM_NETWORK_FUNCTION : constant unsigned := 20142;
   CURLOPT_CONV_TO_NETWORK_FUNCTION : constant unsigned := 20143;
   CURLOPT_CONV_FROM_UTF8_FUNCTION : constant unsigned := 20144;
   CURLOPT_MAX_SEND_SPEED_LARGE : constant unsigned := 30145;
   CURLOPT_MAX_RECV_SPEED_LARGE : constant unsigned := 30146;
   CURLOPT_FTP_ALTERNATIVE_TO_USER : constant unsigned := 10147;
   CURLOPT_SOCKOPTFUNCTION : constant unsigned := 20148;
   CURLOPT_SOCKOPTDATA : constant unsigned := 10149;
   CURLOPT_SSL_SESSIONID_CACHE : constant unsigned := 150;
   CURLOPT_SSH_AUTH_TYPES : constant unsigned := 151;
   CURLOPT_SSH_PUBLIC_KEYFILE : constant unsigned := 10152;
   CURLOPT_SSH_PRIVATE_KEYFILE : constant unsigned := 10153;
   CURLOPT_FTP_SSL_CCC : constant unsigned := 154;
   CURLOPT_TIMEOUT_MS : constant unsigned := 155;
   CURLOPT_CONNECTTIMEOUT_MS : constant unsigned := 156;
   CURLOPT_HTTP_TRANSFER_DECODING : constant unsigned := 157;
   CURLOPT_HTTP_CONTENT_DECODING : constant unsigned := 158;
   CURLOPT_NEW_FILE_PERMS : constant unsigned := 159;
   CURLOPT_NEW_DIRECTORY_PERMS : constant unsigned := 160;
   CURLOPT_POSTREDIR : constant unsigned := 161;
   CURLOPT_SSH_HOST_PUBLIC_KEY_MD5 : constant unsigned := 10162;
   CURLOPT_OPENSOCKETFUNCTION : constant unsigned := 20163;
   CURLOPT_OPENSOCKETDATA : constant unsigned := 10164;
   CURLOPT_COPYPOSTFIELDS : constant unsigned := 10165;
   CURLOPT_PROXY_TRANSFER_MODE : constant unsigned := 166;
   CURLOPT_SEEKFUNCTION : constant unsigned := 20167;
   CURLOPT_SEEKDATA : constant unsigned := 10168;
   CURLOPT_CRLFILE : constant unsigned := 10169;
   CURLOPT_ISSUERCERT : constant unsigned := 10170;
   CURLOPT_ADDRESS_SCOPE : constant unsigned := 171;
   CURLOPT_CERTINFO : constant unsigned := 172;
   CURLOPT_USERNAME : constant unsigned := 10173;
   CURLOPT_PASSWORD : constant unsigned := 10174;
   CURLOPT_PROXYUSERNAME : constant unsigned := 10175;
   CURLOPT_PROXYPASSWORD : constant unsigned := 10176;
   CURLOPT_NOPROXY : constant unsigned := 10177;
   CURLOPT_TFTP_BLKSIZE : constant unsigned := 178;
   CURLOPT_SOCKS5_GSSAPI_SERVICE : constant unsigned := 10179;
   CURLOPT_SOCKS5_GSSAPI_NEC : constant unsigned := 180;
   CURLOPT_PROTOCOLS : constant unsigned := 181;
   CURLOPT_REDIR_PROTOCOLS : constant unsigned := 182;
   CURLOPT_SSH_KNOWNHOSTS : constant unsigned := 10183;
   CURLOPT_SSH_KEYFUNCTION : constant unsigned := 20184;
   CURLOPT_SSH_KEYDATA : constant unsigned := 10185;
   CURLOPT_MAIL_FROM : constant unsigned := 10186;
   CURLOPT_MAIL_RCPT : constant unsigned := 10187;
   CURLOPT_FTP_USE_PRET : constant unsigned := 188;
   CURLOPT_RTSP_REQUEST : constant unsigned := 189;
   CURLOPT_RTSP_SESSION_ID : constant unsigned := 10190;
   CURLOPT_RTSP_STREAM_URI : constant unsigned := 10191;
   CURLOPT_RTSP_TRANSPORT : constant unsigned := 10192;
   CURLOPT_RTSP_CLIENT_CSEQ : constant unsigned := 193;
   CURLOPT_RTSP_SERVER_CSEQ : constant unsigned := 194;
   CURLOPT_INTERLEAVEDATA : constant unsigned := 10195;
   CURLOPT_INTERLEAVEFUNCTION : constant unsigned := 20196;
   CURLOPT_WILDCARDMATCH : constant unsigned := 197;
   CURLOPT_CHUNK_BGN_FUNCTION : constant unsigned := 20198;
   CURLOPT_CHUNK_END_FUNCTION : constant unsigned := 20199;
   CURLOPT_FNMATCH_FUNCTION : constant unsigned := 20200;
   CURLOPT_CHUNK_DATA : constant unsigned := 10201;
   CURLOPT_FNMATCH_DATA : constant unsigned := 10202;
   CURLOPT_RESOLVE : constant unsigned := 10203;
   CURLOPT_TLSAUTH_USERNAME : constant unsigned := 10204;
   CURLOPT_TLSAUTH_PASSWORD : constant unsigned := 10205;
   CURLOPT_TLSAUTH_TYPE : constant unsigned := 10206;
   CURLOPT_TRANSFER_ENCODING : constant unsigned := 207;
   CURLOPT_CLOSESOCKETFUNCTION : constant unsigned := 20208;
   CURLOPT_CLOSESOCKETDATA : constant unsigned := 10209;
   CURLOPT_GSSAPI_DELEGATION : constant unsigned := 210;
   CURLOPT_DNS_SERVERS : constant unsigned := 10211;
   CURLOPT_ACCEPTTIMEOUT_MS : constant unsigned := 212;
   CURLOPT_TCP_KEEPALIVE : constant unsigned := 213;
   CURLOPT_TCP_KEEPIDLE : constant unsigned := 214;
   CURLOPT_TCP_KEEPINTVL : constant unsigned := 215;
   CURLOPT_SSL_OPTIONS : constant unsigned := 216;
   CURLOPT_MAIL_AUTH : constant unsigned := 10217;
   CURLOPT_SASL_IR : constant unsigned := 218;
   CURLOPT_XFERINFOFUNCTION : constant unsigned := 20219;
   CURLOPT_XOAUTH2_BEARER : constant unsigned := 10220;
   CURLOPT_DNS_INTERFACE : constant unsigned := 10221;
   CURLOPT_DNS_LOCAL_IP4 : constant unsigned := 10222;
   CURLOPT_DNS_LOCAL_IP6 : constant unsigned := 10223;
   CURLOPT_LOGIN_OPTIONS : constant unsigned := 10224;
   CURLOPT_SSL_ENABLE_NPN : constant unsigned := 225;
   CURLOPT_SSL_ENABLE_ALPN : constant unsigned := 226;
   CURLOPT_EXPECT_100_TIMEOUT_MS : constant unsigned := 227;
   CURLOPT_PROXYHEADER : constant unsigned := 10228;
   CURLOPT_HEADEROPT : constant unsigned := 229;
   CURLOPT_PINNEDPUBLICKEY : constant unsigned := 10230;
   CURLOPT_UNIX_SOCKET_PATH : constant unsigned := 10231;
   CURLOPT_SSL_VERIFYSTATUS : constant unsigned := 232;
   CURLOPT_SSL_FALSESTART : constant unsigned := 233;
   CURLOPT_PATH_AS_IS : constant unsigned := 234;
   CURLOPT_PROXY_SERVICE_NAME : constant unsigned := 10235;
   CURLOPT_SERVICE_NAME : constant unsigned := 10236;
   CURLOPT_PIPEWAIT : constant unsigned := 237;
   CURLOPT_DEFAULT_PROTOCOL : constant unsigned := 10238;
   CURLOPT_STREAM_WEIGHT : constant unsigned := 239;
   CURLOPT_STREAM_DEPENDS : constant unsigned := 10240;
   CURLOPT_STREAM_DEPENDS_E : constant unsigned := 10241;
   CURLOPT_TFTP_NO_OPTIONS : constant unsigned := 242;
   CURLOPT_CONNECT_TO : constant unsigned := 10243;
   CURLOPT_TCP_FASTOPEN : constant unsigned := 244;
   CURLOPT_KEEP_SENDING_ON_ERROR : constant unsigned := 245;
   CURLOPT_PROXY_CAINFO : constant unsigned := 10246;
   CURLOPT_PROXY_CAPATH : constant unsigned := 10247;
   CURLOPT_PROXY_SSL_VERIFYPEER : constant unsigned := 248;
   CURLOPT_PROXY_SSL_VERIFYHOST : constant unsigned := 249;
   CURLOPT_PROXY_SSLVERSION : constant unsigned := 250;
   CURLOPT_PROXY_TLSAUTH_USERNAME : constant unsigned := 10251;
   CURLOPT_PROXY_TLSAUTH_PASSWORD : constant unsigned := 10252;
   CURLOPT_PROXY_TLSAUTH_TYPE : constant unsigned := 10253;
   CURLOPT_PROXY_SSLCERT : constant unsigned := 10254;
   CURLOPT_PROXY_SSLCERTTYPE : constant unsigned := 10255;
   CURLOPT_PROXY_SSLKEY : constant unsigned := 10256;
   CURLOPT_PROXY_SSLKEYTYPE : constant unsigned := 10257;
   CURLOPT_PROXY_KEYPASSWD : constant unsigned := 10258;
   CURLOPT_PROXY_SSL_CIPHER_LIST : constant unsigned := 10259;
   CURLOPT_PROXY_CRLFILE : constant unsigned := 10260;
   CURLOPT_PROXY_SSL_OPTIONS : constant unsigned := 261;
   CURLOPT_PRE_PROXY : constant unsigned := 10262;
   CURLOPT_PROXY_PINNEDPUBLICKEY : constant unsigned := 10263;
   CURLOPT_ABSTRACT_UNIX_SOCKET : constant unsigned := 10264;
   CURLOPT_SUPPRESS_CONNECT_HEADERS : constant unsigned := 265;
   CURLOPT_REQUEST_TARGET : constant unsigned := 10266;
   CURLOPT_SOCKS5_AUTH : constant unsigned := 267;
   CURLOPT_SSH_COMPRESSION : constant unsigned := 268;
   CURLOPT_MIMEPOST : constant unsigned := 10269;
   CURLOPT_TIMEVALUE_LARGE : constant unsigned := 30270;
   CURLOPT_HAPPY_EYEBALLS_TIMEOUT_MS : constant unsigned := 271;
   CURLOPT_RESOLVER_START_FUNCTION : constant unsigned := 20272;
   CURLOPT_RESOLVER_START_DATA : constant unsigned := 10273;
   CURLOPT_HAPROXYPROTOCOL : constant unsigned := 274;
   CURLOPT_DNS_SHUFFLE_ADDRESSES : constant unsigned := 275;
   CURLOPT_TLS13_CIPHERS : constant unsigned := 10276;
   CURLOPT_PROXY_TLS13_CIPHERS : constant unsigned := 10277;
   CURLOPT_DISALLOW_USERNAME_IN_URL : constant unsigned := 278;
   CURLOPT_DOH_URL : constant unsigned := 10279;
   CURLOPT_UPLOAD_BUFFERSIZE : constant unsigned := 280;
   CURLOPT_UPKEEP_INTERVAL_MS : constant unsigned := 281;
   CURLOPT_CURLU : constant unsigned := 10282;
   CURLOPT_TRAILERFUNCTION : constant unsigned := 20283;
   CURLOPT_TRAILERDATA : constant unsigned := 10284;
   CURLOPT_HTTP09_ALLOWED : constant unsigned := 285;
   CURLOPT_ALTSVC_CTRL : constant unsigned := 286;
   CURLOPT_ALTSVC : constant unsigned := 10287;
   CURLOPT_MAXAGE_CONN : constant unsigned := 288;
   CURLOPT_SASL_AUTHZID : constant unsigned := 10289;
   CURLOPT_LASTENTRY : constant unsigned := 10290;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:1944

  -- Backwards compatibility with older names
  -- These are scheduled to disappear by 2011
  -- This was added in version 7.19.1
  -- These are scheduled to disappear by 2009
  -- The following were added in 7.17.0
  -- The following were added earlier
  -- This is set if CURL_NO_OLDIES is defined at compile-time
  -- Below here follows defines for the CURLOPT_IPRESOLVE option. If a host
  --     name resolves addresses using more than one IP protocol version, this
  --     option might be handy to force libcurl to use a specific IP version.

  -- three convenient "aliases" that follow the name scheme better
  -- These enums are for use with the CURLOPT_HTTP_VERSION option.
  -- setting this means we don't care, and that we'd
  --                             like the library to choose the best possible
  --                             for us!

  -- please use HTTP 1.0 in the request
  -- please use HTTP 1.1 in the request
  -- please use HTTP 2 in the request
  -- use version 2 for HTTPS, version 1.1 for HTTP
  -- please use HTTP 2 without HTTP/1.1
  --                                           Upgrade

  -- Makes use of explicit HTTP/3 without fallback.
  --                               Use CURLOPT_ALTSVC to enable HTTP/3 upgrade

  -- *ILLEGAL* http version
  -- Convenience definition simple because the name of the version is HTTP/2 and
  --   not 2.0. The 2_0 version of the enum name was set while the version was
  --   still planned to be 2.0 and we stick to it for compatibility.

  -- * Public API enums for RTSP requests
  --

  -- first in list
  -- last in list
  -- These enums are for use with the CURLOPT_NETRC option.
   type CURL_NETRC_OPTION is
     (CURL_NETRC_IGNORED,
      CURL_NETRC_OPTIONAL,
      CURL_NETRC_REQUIRED,
      CURL_NETRC_LAST)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2026

  -- The .netrc will never be read.
  --                           * This is the default.

  -- A user:password in the URL will be preferred
  --                           * to one in the .netrc.

  -- A user:password in the URL will be ignored.
  --                           * Unless one is set programmatically, the .netrc
  --                           * will be queried.

  -- TLS 1.x
  -- never use, keep last
  -- never use, keep last
   type CURL_TLSAUTH is
     (CURL_TLSAUTH_NONE,
      CURL_TLSAUTH_SRP,
      CURL_TLSAUTH_LAST)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2062

  -- never use, keep last
  -- symbols to use with CURLOPT_POSTREDIR.
  --   CURL_REDIR_POST_301, CURL_REDIR_POST_302 and CURL_REDIR_POST_303
  --   can be bitwise ORed so that CURL_REDIR_POST_301 | CURL_REDIR_POST_302
  --   | CURL_REDIR_POST_303 == CURL_REDIR_POST_ALL

   type curl_TimeCond is
     (CURL_TIMECOND_NONE,
      CURL_TIMECOND_IFMODSINCE,
      CURL_TIMECOND_IFUNMODSINCE,
      CURL_TIMECOND_LASTMOD,
      CURL_TIMECOND_LAST)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2088

  -- Special size_t value signaling a zero-terminated string.
  -- curl_strequal() and curl_strnequal() are subject for removal in a future
  --   release

   function curl_strequal (s1 : Interfaces.C.Strings.chars_ptr; s2 : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2095
   with Import => True,
        Convention => C,
        External_Name => "curl_strequal";

   function curl_strnequal
     (s1 : Interfaces.C.Strings.chars_ptr;
      s2 : Interfaces.C.Strings.chars_ptr;
      n : size_t) return int  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2096
   with Import => True,
        Convention => C,
        External_Name => "curl_strnequal";

  -- Mime/form handling support.
  -- Mime context.
   type curl_mime_s is null record;   -- incomplete struct

   subtype curl_mime is curl_mime_s;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2099

  -- Mime part context.
   type curl_mimepart_s is null record;   -- incomplete struct

   subtype curl_mimepart is curl_mimepart_s;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2100

  -- * NAME curl_mime_init()
  -- *
  -- * DESCRIPTION
  -- *
  -- * Create a mime context and return its handle. The easy parameter is the
  -- * target handle.
  --

   function curl_mime_init (easy : System.Address) return access curl_mime  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2110
   with Import => True,
        Convention => C,
        External_Name => "curl_mime_init";

  -- * NAME curl_mime_free()
  -- *
  -- * DESCRIPTION
  -- *
  -- * release a mime handle and its substructures.
  --

   procedure curl_mime_free (mime : access curl_mime)  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2119
   with Import => True,
        Convention => C,
        External_Name => "curl_mime_free";

  -- * NAME curl_mime_addpart()
  -- *
  -- * DESCRIPTION
  -- *
  -- * Append a new empty part to the given mime context and return a handle to
  -- * the created part.
  --

   function curl_mime_addpart (mime : access curl_mime) return access curl_mimepart  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2129
   with Import => True,
        Convention => C,
        External_Name => "curl_mime_addpart";

  -- * NAME curl_mime_name()
  -- *
  -- * DESCRIPTION
  -- *
  -- * Set mime/form part name.
  --

   function curl_mime_name (part : access curl_mimepart; name : Interfaces.C.Strings.chars_ptr) return CURLcode  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2138
   with Import => True,
        Convention => C,
        External_Name => "curl_mime_name";

  -- * NAME curl_mime_filename()
  -- *
  -- * DESCRIPTION
  -- *
  -- * Set mime part remote file name.
  --

   function curl_mime_filename (part : access curl_mimepart; filename : Interfaces.C.Strings.chars_ptr) return CURLcode  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2147
   with Import => True,
        Convention => C,
        External_Name => "curl_mime_filename";

  -- * NAME curl_mime_type()
  -- *
  -- * DESCRIPTION
  -- *
  -- * Set mime part type.
  --

   function curl_mime_type (part : access curl_mimepart; mimetype : Interfaces.C.Strings.chars_ptr) return CURLcode  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2157
   with Import => True,
        Convention => C,
        External_Name => "curl_mime_type";

  -- * NAME curl_mime_encoder()
  -- *
  -- * DESCRIPTION
  -- *
  -- * Set mime data transfer encoder.
  --

   function curl_mime_encoder (part : access curl_mimepart; encoding : Interfaces.C.Strings.chars_ptr) return CURLcode  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2166
   with Import => True,
        Convention => C,
        External_Name => "curl_mime_encoder";

  -- * NAME curl_mime_data()
  -- *
  -- * DESCRIPTION
  -- *
  -- * Set mime part data source from memory data,
  --

   function curl_mime_data
     (part : access curl_mimepart;
      data : Interfaces.C.Strings.chars_ptr;
      datasize : size_t) return CURLcode  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2176
   with Import => True,
        Convention => C,
        External_Name => "curl_mime_data";

  -- * NAME curl_mime_filedata()
  -- *
  -- * DESCRIPTION
  -- *
  -- * Set mime part data source from named file.
  --

   function curl_mime_filedata (part : access curl_mimepart; filename : Interfaces.C.Strings.chars_ptr) return CURLcode  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2186
   with Import => True,
        Convention => C,
        External_Name => "curl_mime_filedata";

  -- * NAME curl_mime_data_cb()
  -- *
  -- * DESCRIPTION
  -- *
  -- * Set mime part data source from callback function.
  --

   -- function curl_mime_data_cb
   --   (part : access curl_mimepart;
   --    datasize : CurlAda.x86_64_linux_gnu_curl_system_h.curl_off_t;
   --    readfunc : curl_read_callback;
   --    seekfunc : curl_seek_callback;
   --    freefunc : curl_free_callback;
   --    arg : System.Address) return CURLcode  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2196
   -- with Import => True,
   --      Convention => C,
   --      External_Name => "curl_mime_data_cb";

  -- * NAME curl_mime_subparts()
  -- *
  -- * DESCRIPTION
  -- *
  -- * Set mime part data source from subparts.
  --

   function curl_mime_subparts (part : access curl_mimepart; subparts : access curl_mime) return CURLcode  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2210
   with Import => True,
        Convention => C,
        External_Name => "curl_mime_subparts";

  -- * NAME curl_mime_headers()
  -- *
  -- * DESCRIPTION
  -- *
  -- * Set mime part headers.
  --

   function curl_mime_headers
     (part : access curl_mimepart;
      headers : access curl_slist;
      take_ownership : int) return CURLcode  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2219
   with Import => True,
        Convention => C,
        External_Name => "curl_mime_headers";

  -- Old form API.
  -- name is uppercase CURLFORM_<name>
  -- The macro "##" is ISO C, we assume pre-ISO C doesn't support it.
  --******** the first one is unused ***********
  --
  -- added in 7.46.0, provide a curl_off_t length
  -- the last unused
   type CURLformoption is
     (CURLFORM_NOTHING,
      CURLFORM_COPYNAME,
      CURLFORM_PTRNAME,
      CURLFORM_NAMELENGTH,
      CURLFORM_COPYCONTENTS,
      CURLFORM_PTRCONTENTS,
      CURLFORM_CONTENTSLENGTH,
      CURLFORM_FILECONTENT,
      CURLFORM_ARRAY,
      CURLFORM_OBSOLETE,
      CURLFORM_FILE,
      CURLFORM_BUFFER,
      CURLFORM_BUFFERPTR,
      CURLFORM_BUFFERLENGTH,
      CURLFORM_CONTENTTYPE,
      CURLFORM_CONTENTHEADER,
      CURLFORM_FILENAME,
      CURLFORM_END,
      CURLFORM_OBSOLETE2,
      CURLFORM_STREAM,
      CURLFORM_CONTENTLEN,
      CURLFORM_LASTENTRY)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2265

  -- structure to be used as parameter for CURLFORM_ARRAY
   type curl_forms is record
      option : aliased CURLformoption;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2271
      value : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2272
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2270

  -- use this for multipart formpost building
  -- Returns code for curl_formadd()
  -- *
  -- * Returns:
  -- * CURL_FORMADD_OK             on success
  -- * CURL_FORMADD_MEMORY         if the FormInfo allocation fails
  -- * CURL_FORMADD_OPTION_TWICE   if one option is given twice for one Form
  -- * CURL_FORMADD_NULL           if a null pointer was given for a char
  -- * CURL_FORMADD_MEMORY         if the allocation of a FormInfo struct failed
  -- * CURL_FORMADD_UNKNOWN_OPTION if an unknown option was used
  -- * CURL_FORMADD_INCOMPLETE     if the some FormInfo is not complete (or error)
  -- * CURL_FORMADD_MEMORY         if a curl_httppost struct cannot be allocated
  -- * CURL_FORMADD_MEMORY         if some allocation for string copying failed.
  -- * CURL_FORMADD_ILLEGAL_ARRAY  if an illegal option is used in an array
  -- *
  -- **************************************************************************

  -- first, no error
  -- libcurl was built with this disabled
  -- last
   type CURLFORMcode is
     (CURL_FORMADD_OK,
      CURL_FORMADD_MEMORY,
      CURL_FORMADD_OPTION_TWICE,
      CURL_FORMADD_NULL,
      CURL_FORMADD_UNKNOWN_OPTION,
      CURL_FORMADD_INCOMPLETE,
      CURL_FORMADD_ILLEGAL_ARRAY,
      CURL_FORMADD_DISABLED,
      CURL_FORMADD_LAST)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2303

  -- * NAME curl_formadd()
  -- *
  -- * DESCRIPTION
  -- *
  -- * Pretty advanced function for building multi-part formposts. Each invoke
  -- * adds one part that together construct a full post. Then use
  -- * CURLOPT_HTTPPOST to send it off to libcurl.
  --

   function curl_formadd (httppost : System.Address; last_post : System.Address  -- , ...
      ) return CURLFORMcode  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2314
   with Import => True,
        Convention => C,
        External_Name => "curl_formadd";

  -- * callback function for curl_formget()
  -- * The void *arg pointer will be the one passed as second argument to
  -- *   curl_formget().
  -- * The character buffer passed to it must not be freed.
  -- * Should return the buffer length passed to it as the argument "len" on
  -- *   success.
  --

   type curl_formget_callback is access function
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : size_t) return size_t
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2326

  -- * NAME curl_formget()
  -- *
  -- * DESCRIPTION
  -- *
  -- * Serialize a curl_httppost struct built with curl_formadd().
  -- * Accepts a void pointer as second argument which will be passed to
  -- * the curl_formget_callback function.
  -- * Returns 0 on success.
  --

   -- function curl_formget
   --   (form : access curl_httppost;
   --    arg : System.Address;
   --    append : curl_formget_callback) return int  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2339
   -- with Import => True,
   --      Convention => C,
   --      External_Name => "curl_formget";

  -- * NAME curl_formfree()
  -- *
  -- * DESCRIPTION
  -- *
  -- * Free a multipart formpost previously built with curl_formadd().
  --

   -- procedure curl_formfree (form : access curl_httppost)  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2348
   -- with Import => True,
   --      Convention => C,
   --      External_Name => "curl_formfree";

  -- * NAME curl_getenv()
  -- *
  -- * DESCRIPTION
  -- *
  -- * Returns a malloc()'ed string that MUST be curl_free()ed after usage is
  -- * complete. DEPRECATED - see lib/README.curlx
  --

   function curl_getenv (variable : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2358
   with Import => True,
        Convention => C,
        External_Name => "curl_getenv";

  -- * NAME curl_version()
  -- *
  -- * DESCRIPTION
  -- *
  -- * Returns a static ascii string of the libcurl version.
  --

   function curl_version return Interfaces.C.Strings.chars_ptr  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2367
   with Import => True,
        Convention => C,
        External_Name => "curl_version";

  -- * NAME curl_easy_escape()
  -- *
  -- * DESCRIPTION
  -- *
  -- * Escapes URL strings (converts all letters consider illegal in URLs to their
  -- * %XX versions). This function returns a new allocated string or NULL if an
  -- * error occurred.
  --

   function curl_easy_escape
     (handle : System.Address;
      string : Interfaces.C.Strings.chars_ptr;
      length : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2378
   with Import => True,
        Convention => C,
        External_Name => "curl_easy_escape";

  -- the previous version:
   function curl_escape (string : Interfaces.C.Strings.chars_ptr; length : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2383
   with Import => True,
        Convention => C,
        External_Name => "curl_escape";

  -- * NAME curl_easy_unescape()
  -- *
  -- * DESCRIPTION
  -- *
  -- * Unescapes URL encoding in strings (converts all %XX codes to their 8bit
  -- * versions). This function returns a new allocated string or NULL if an error
  -- * occurred.
  -- * Conversion Note: On non-ASCII platforms the ASCII %XX codes are
  -- * converted into the host encoding.
  --

   function curl_easy_unescape
     (handle : System.Address;
      string : Interfaces.C.Strings.chars_ptr;
      length : int;
      outlength : access int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2398
   with Import => True,
        Convention => C,
        External_Name => "curl_easy_unescape";

  -- the previous version
   function curl_unescape (string : Interfaces.C.Strings.chars_ptr; length : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2404
   with Import => True,
        Convention => C,
        External_Name => "curl_unescape";

  -- * NAME curl_free()
  -- *
  -- * DESCRIPTION
  -- *
  -- * Provided for de-allocation in the same translation unit that did the
  -- * allocation. Added in libcurl 7.10
  --

   procedure curl_free (p : System.Address)  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2415
   with Import => True,
        Convention => C,
        External_Name => "curl_free";

  -- * NAME curl_global_init()
  -- *
  -- * DESCRIPTION
  -- *
  -- * curl_global_init() should be invoked exactly once for each application that
  -- * uses libcurl and before any call of other libcurl functions.
  -- *
  -- * This function is not thread-safe!
  --

   function curl_global_init (flags : long) return CURLcode  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2427
   with Import => True,
        Convention => C,
        External_Name => "curl_global_init";

  -- * NAME curl_global_init_mem()
  -- *
  -- * DESCRIPTION
  -- *
  -- * curl_global_init() or curl_global_init_mem() should be invoked exactly once
  -- * for each application that uses libcurl.  This function can be used to
  -- * initialize libcurl and set user defined memory management callback
  -- * functions.  Users can implement memory management routines to check for
  -- * memory leaks, check for mis-use of the curl library etc.  User registered
  -- * callback routines with be invoked by this library instead of the system
  -- * memory management routines like malloc, free etc.
  --

   function curl_global_init_mem
     (flags : long;
      m : curl_malloc_callback;
      f : curl_free_callback;
      r : curl_realloc_callback;
      s : curl_strdup_callback;
      c : curl_calloc_callback) return CURLcode  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2442
   with Import => True,
        Convention => C,
        External_Name => "curl_global_init_mem";

  -- * NAME curl_global_cleanup()
  -- *
  -- * DESCRIPTION
  -- *
  -- * curl_global_cleanup() should be invoked exactly once for each application
  -- * that uses libcurl
  --

   procedure curl_global_cleanup  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2457
   with Import => True,
        Convention => C,
        External_Name => "curl_global_cleanup";

  -- linked-list structure for the CURLOPT_QUOTE option (and other)
   type curl_slist is record
      data : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2461
      next : access curl_slist;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2462
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2460

  -- * NAME curl_global_sslset()
  -- *
  -- * DESCRIPTION
  -- *
  -- * When built with multiple SSL backends, curl_global_sslset() allows to
  -- * choose one. This function can only be called once, and it must be called
  -- * *before* curl_global_init().
  -- *
  -- * The backend can be identified by the id (e.g. CURLSSLBACKEND_OPENSSL). The
  -- * backend can also be specified via the name parameter (passing -1 as id).
  -- * If both id and name are specified, the name will be ignored. If neither id
  -- * nor name are specified, the function will fail with
  -- * CURLSSLSET_UNKNOWN_BACKEND and set the "avail" pointer to the
  -- * NULL-terminated list of available backends.
  -- *
  -- * Upon success, the function returns CURLSSLSET_OK.
  -- *
  -- * If the specified SSL backend is not available, the function returns
  -- * CURLSSLSET_UNKNOWN_BACKEND and sets the "avail" pointer to a NULL-terminated
  -- * list of available SSL backends.
  -- *
  -- * The SSL backend can be set only once. If it has already been set, a
  -- * subsequent attempt to change it will result in a CURLSSLSET_TOO_LATE.
  --

   type curl_ssl_backend is record
      id : aliased curl_sslbackend;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2492
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2493
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2494

  -- libcurl was built without any SSL support
   type CURLsslset is
     (CURLSSLSET_OK,
      CURLSSLSET_UNKNOWN_BACKEND,
      CURLSSLSET_TOO_LATE,
      CURLSSLSET_NO_BACKENDS)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2501

   function curl_global_sslset
     (id : curl_sslbackend;
      name : Interfaces.C.Strings.chars_ptr;
      avail : System.Address) return CURLsslset  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2503
   with Import => True,
        Convention => C,
        External_Name => "curl_global_sslset";

  -- * NAME curl_slist_append()
  -- *
  -- * DESCRIPTION
  -- *
  -- * Appends a string to a linked list. If no list exists, it will be created
  -- * first. Returns the new list, after appending.
  --

   function curl_slist_append (arg1 : access curl_slist; arg2 : Interfaces.C.Strings.chars_ptr) return access curl_slist  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2514
   with Import => True,
        Convention => C,
        External_Name => "curl_slist_append";

  -- * NAME curl_slist_free_all()
  -- *
  -- * DESCRIPTION
  -- *
  -- * free a previously built curl_slist.
  --

   procedure curl_slist_free_all (arg1 : access curl_slist)  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2524
   with Import => True,
        Convention => C,
        External_Name => "curl_slist_free_all";

  -- * NAME curl_getdate()
  -- *
  -- * DESCRIPTION
  -- *
  -- * Returns the time, in seconds since 1 Jan 1970 of the time string given in
  -- * the first argument. The time argument in the second parameter is unused
  -- * and should be set to NULL.
  --

   function curl_getdate (p : Interfaces.C.Strings.chars_ptr; unused : access Time_T) return Time_T  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2535
   with Import => True,
        Convention => C,
        External_Name => "curl_getdate";

  -- info about the certificate chain, only for OpenSSL, GnuTLS, Schannel, NSS
  --   and GSKit builds. Asked for with CURLOPT_CERTINFO / CURLINFO_CERTINFO

  -- number of certificates with information
   type curl_certinfo is record
      num_of_certs : aliased int;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2540
      certinfo : System.Address;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2541
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2539

  -- for each index in this array, there's a
  --                                   linked list with textual information in the
  --                                   format "name: value"

  -- Information about the SSL library used and the respective internal SSL
  --   handle, which can be used to obtain further information regarding the
  --   connection. Asked for with CURLINFO_TLS_SSL_PTR or CURLINFO_TLS_SESSION.

   type curl_tlssessioninfo is record
      backend : aliased curl_sslbackend;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2550
      internals : System.Address;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2551
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2549

  -- first, never use this
  -- Fill in new entries below here!
  -- Preferably these would be defined conditionally based on the
  --     sizeof curl_off_t being 64-bits

   subtype CURLINFO is unsigned;
   CURLINFO_NONE : constant unsigned := 0;
   CURLINFO_EFFECTIVE_URL : constant unsigned := 1048577;
   CURLINFO_RESPONSE_CODE : constant unsigned := 2097154;
   CURLINFO_TOTAL_TIME : constant unsigned := 3145731;
   CURLINFO_NAMELOOKUP_TIME : constant unsigned := 3145732;
   CURLINFO_CONNECT_TIME : constant unsigned := 3145733;
   CURLINFO_PRETRANSFER_TIME : constant unsigned := 3145734;
   CURLINFO_SIZE_UPLOAD : constant unsigned := 3145735;
   CURLINFO_SIZE_UPLOAD_T : constant unsigned := 6291463;
   CURLINFO_SIZE_DOWNLOAD : constant unsigned := 3145736;
   CURLINFO_SIZE_DOWNLOAD_T : constant unsigned := 6291464;
   CURLINFO_SPEED_DOWNLOAD : constant unsigned := 3145737;
   CURLINFO_SPEED_DOWNLOAD_T : constant unsigned := 6291465;
   CURLINFO_SPEED_UPLOAD : constant unsigned := 3145738;
   CURLINFO_SPEED_UPLOAD_T : constant unsigned := 6291466;
   CURLINFO_HEADER_SIZE : constant unsigned := 2097163;
   CURLINFO_REQUEST_SIZE : constant unsigned := 2097164;
   CURLINFO_SSL_VERIFYRESULT : constant unsigned := 2097165;
   CURLINFO_FILETIME : constant unsigned := 2097166;
   CURLINFO_FILETIME_T : constant unsigned := 6291470;
   CURLINFO_CONTENT_LENGTH_DOWNLOAD : constant unsigned := 3145743;
   CURLINFO_CONTENT_LENGTH_DOWNLOAD_T : constant unsigned := 6291471;
   CURLINFO_CONTENT_LENGTH_UPLOAD : constant unsigned := 3145744;
   CURLINFO_CONTENT_LENGTH_UPLOAD_T : constant unsigned := 6291472;
   CURLINFO_STARTTRANSFER_TIME : constant unsigned := 3145745;
   CURLINFO_CONTENT_TYPE : constant unsigned := 1048594;
   CURLINFO_REDIRECT_TIME : constant unsigned := 3145747;
   CURLINFO_REDIRECT_COUNT : constant unsigned := 2097172;
   CURLINFO_PRIVATE : constant unsigned := 1048597;
   CURLINFO_HTTP_CONNECTCODE : constant unsigned := 2097174;
   CURLINFO_HTTPAUTH_AVAIL : constant unsigned := 2097175;
   CURLINFO_PROXYAUTH_AVAIL : constant unsigned := 2097176;
   CURLINFO_OS_ERRNO : constant unsigned := 2097177;
   CURLINFO_NUM_CONNECTS : constant unsigned := 2097178;
   CURLINFO_SSL_ENGINES : constant unsigned := 4194331;
   CURLINFO_COOKIELIST : constant unsigned := 4194332;
   CURLINFO_LASTSOCKET : constant unsigned := 2097181;
   CURLINFO_FTP_ENTRY_PATH : constant unsigned := 1048606;
   CURLINFO_REDIRECT_URL : constant unsigned := 1048607;
   CURLINFO_PRIMARY_IP : constant unsigned := 1048608;
   CURLINFO_APPCONNECT_TIME : constant unsigned := 3145761;
   CURLINFO_CERTINFO : constant unsigned := 4194338;
   CURLINFO_CONDITION_UNMET : constant unsigned := 2097187;
   CURLINFO_RTSP_SESSION_ID : constant unsigned := 1048612;
   CURLINFO_RTSP_CLIENT_CSEQ : constant unsigned := 2097189;
   CURLINFO_RTSP_SERVER_CSEQ : constant unsigned := 2097190;
   CURLINFO_RTSP_CSEQ_RECV : constant unsigned := 2097191;
   CURLINFO_PRIMARY_PORT : constant unsigned := 2097192;
   CURLINFO_LOCAL_IP : constant unsigned := 1048617;
   CURLINFO_LOCAL_PORT : constant unsigned := 2097194;
   CURLINFO_TLS_SESSION : constant unsigned := 4194347;
   CURLINFO_ACTIVESOCKET : constant unsigned := 5242924;
   CURLINFO_TLS_SSL_PTR : constant unsigned := 4194349;
   CURLINFO_HTTP_VERSION : constant unsigned := 2097198;
   CURLINFO_PROXY_SSL_VERIFYRESULT : constant unsigned := 2097199;
   CURLINFO_PROTOCOL : constant unsigned := 2097200;
   CURLINFO_SCHEME : constant unsigned := 1048625;
   CURLINFO_TOTAL_TIME_T : constant unsigned := 6291506;
   CURLINFO_NAMELOOKUP_TIME_T : constant unsigned := 6291507;
   CURLINFO_CONNECT_TIME_T : constant unsigned := 6291508;
   CURLINFO_PRETRANSFER_TIME_T : constant unsigned := 6291509;
   CURLINFO_STARTTRANSFER_TIME_T : constant unsigned := 6291510;
   CURLINFO_REDIRECT_TIME_T : constant unsigned := 6291511;
   CURLINFO_APPCONNECT_TIME_T : constant unsigned := 6291512;
   CURLINFO_RETRY_AFTER : constant unsigned := 6291513;
   CURLINFO_LASTONE : constant unsigned := 57;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2636

  -- CURLINFO_RESPONSE_CODE is the new name for the option previously known as
  --   CURLINFO_HTTP_CODE

  -- first, never use this
  -- last, never use this
   type curl_closepolicy is
     (CURLCLOSEPOLICY_NONE,
      CURLCLOSEPOLICY_OLDEST,
      CURLCLOSEPOLICY_LEAST_RECENTLY_USED,
      CURLCLOSEPOLICY_LEAST_TRAFFIC,
      CURLCLOSEPOLICY_SLOWEST,
      CURLCLOSEPOLICY_CALLBACK,
      CURLCLOSEPOLICY_LAST)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2652

  --****************************************************************************
  -- * Setup defines, protos etc for the sharing stuff.
  --

  -- Different data locks for a single share
  --  CURL_LOCK_DATA_SHARE is used internally to say that
  --   *  the locking is just made to change the internal state of the share
  --   *  itself.
  --

   type curl_lock_data is
     (CURL_LOCK_DATA_NONE,
      CURL_LOCK_DATA_SHARE,
      CURL_LOCK_DATA_COOKIE,
      CURL_LOCK_DATA_DNS,
      CURL_LOCK_DATA_SSL_SESSION,
      CURL_LOCK_DATA_CONNECT,
      CURL_LOCK_DATA_PSL,
      CURL_LOCK_DATA_LAST)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2680

  -- Different lock access types
  -- unspecified action
  -- for read perhaps
  -- for write perhaps
  -- never use
   type curl_lock_access is
     (CURL_LOCK_ACCESS_NONE,
      CURL_LOCK_ACCESS_SHARED,
      CURL_LOCK_ACCESS_SINGLE,
      CURL_LOCK_ACCESS_LAST)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2688

   type curl_lock_function is access procedure
        (arg1 : System.Address;
         arg2 : curl_lock_data;
         arg3 : curl_lock_access;
         arg4 : System.Address)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2690

   type curl_unlock_function is access procedure
        (arg1 : System.Address;
         arg2 : curl_lock_data;
         arg3 : System.Address)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2694

  -- all is fine
  -- 1
  -- 2
  -- 3
  -- 4 out of memory
  -- 5 feature not present in lib
  -- never use
   type CURLSHcode is
     (CURLSHE_OK,
      CURLSHE_BAD_OPTION,
      CURLSHE_IN_USE,
      CURLSHE_INVALID,
      CURLSHE_NOMEM,
      CURLSHE_NOT_BUILT_IN,
      CURLSHE_LAST)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2707

  -- don't use
  -- specify a data type to share
  -- specify which data type to stop sharing
  -- pass in a 'curl_lock_function' pointer
  -- pass in a 'curl_unlock_function' pointer
  -- pass in a user data pointer used in the lock/unlock
  --                           callback functions

  -- never use
   type CURLSHoption is
     (CURLSHOPT_NONE,
      CURLSHOPT_SHARE,
      CURLSHOPT_UNSHARE,
      CURLSHOPT_LOCKFUNC,
      CURLSHOPT_UNLOCKFUNC,
      CURLSHOPT_USERDATA,
      CURLSHOPT_LAST)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2718

   function curl_share_init return System.Address  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2720
   with Import => True,
        Convention => C,
        External_Name => "curl_share_init";

   function curl_share_setopt (arg1 : System.Address; option : CURLSHoption  -- , ...
      ) return CURLSHcode  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2721
   with Import => True,
        Convention => C,
        External_Name => "curl_share_setopt";

   function curl_share_cleanup (arg1 : System.Address) return CURLSHcode  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2722
   with Import => True,
        Convention => C,
        External_Name => "curl_share_cleanup";

  --***************************************************************************
  -- * Structures for querying information about the curl library at runtime.
  --

  -- never actually use this
   type CURLversion is
     (CURLVERSION_FIRST,
      CURLVERSION_SECOND,
      CURLVERSION_THIRD,
      CURLVERSION_FOURTH,
      CURLVERSION_FIFTH,
      CURLVERSION_SIXTH,
      CURLVERSION_LAST)
   with Convention => C;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2736

  -- The 'CURLVERSION_NOW' is the symbolic name meant to be used by
  --   basically all programs ever that want to get version information. It is
  --   meant to be a built-in version number for what kind of struct the caller
  --   expects. If the struct ever changes, we redefine the NOW to another enum
  --   from above.

  -- age of the returned struct
  -- LIBCURL_VERSION
  -- LIBCURL_VERSION_NUM
  -- OS/host/cpu/machine when configured
  -- bitmask, see defines below
  -- human readable string
  -- not used anymore, always 0
  -- human readable string
  -- protocols is terminated by an entry with a NULL protoname
  -- The fields below this were added in CURLVERSION_SECOND
  -- This field was added in CURLVERSION_THIRD
  -- These field were added in CURLVERSION_FOURTH
  -- Same as '_libiconv_version' if built with HAVE_ICONV
  -- human readable string
  -- These fields were added in CURLVERSION_FIFTH
  -- Numeric Brotli version
  --                                  (MAJOR << 24) | (MINOR << 12) | PATCH

  -- human readable string.
  -- These fields were added in CURLVERSION_SIXTH
  -- Numeric nghttp2 version
  --                                   (MAJOR << 16) | (MINOR << 8) | PATCH

  -- human readable string.
  -- human readable quic (+ HTTP/3) library +
  --                                  version or NULL

   type curl_version_info_data is record
      age : aliased CURLversion;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2746
      version : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2747
      version_num : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2748
      host : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2749
      features : aliased int;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2750
      ssl_version : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2751
      ssl_version_num : aliased long;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2752
      libz_version : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2753
      protocols : System.Address;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2755
      ares : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2758
      ares_num : aliased int;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2759
      libidn : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2762
      iconv_ver_num : aliased int;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2767
      libssh_version : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2769
      brotli_ver_num : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2772
      brotli_version : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2774
      nghttp2_ver_num : aliased unsigned;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2777
      nghttp2_version : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2779
      quic_version : Interfaces.C.Strings.chars_ptr;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2780
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2782

  -- * NAME curl_version_info()
  -- *
  -- * DESCRIPTION
  -- *
  -- * This function returns a pointer to a static copy of the version info
  -- * struct. See above.
  --

   function curl_version_info (arg1 : CURLversion) return access curl_version_info_data  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2826
   with Import => True,
        Convention => C,
        External_Name => "curl_version_info";

  -- * NAME curl_easy_strerror()
  -- *
  -- * DESCRIPTION
  -- *
  -- * The curl_easy_strerror function may be used to turn a CURLcode value
  -- * into the equivalent human readable error string.  This is useful
  -- * for printing meaningful error messages.
  --

   function curl_easy_strerror (arg1 : CURLcode) return Interfaces.C.Strings.chars_ptr  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2837
   with Import => True,
        Convention => C,
        External_Name => "curl_easy_strerror";

  -- * NAME curl_share_strerror()
  -- *
  -- * DESCRIPTION
  -- *
  -- * The curl_share_strerror function may be used to turn a CURLSHcode value
  -- * into the equivalent human readable error string.  This is useful
  -- * for printing meaningful error messages.
  --

   function curl_share_strerror (arg1 : CURLSHcode) return Interfaces.C.Strings.chars_ptr  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2848
   with Import => True,
        Convention => C,
        External_Name => "curl_share_strerror";

  -- * NAME curl_easy_pause()
  -- *
  -- * DESCRIPTION
  -- *
  -- * The curl_easy_pause function pauses or unpauses transfers. Select the new
  -- * state by setting the bitmask, use the convenience defines below.
  -- *
  --

   function curl_easy_pause (handle : System.Address; bitmask : int) return CURLcode  -- /usr/include/x86_64-linux-gnu/curl/curl.h:2859
   with Import => True,
        Convention => C,
        External_Name => "curl_easy_pause";

  -- unfortunately, the easy.h and multi.h include files need options and info
  --  stuff before they can be included!

  --**************************************************************************
  -- *                                  _   _ ____  _
  -- *  Project                     ___| | | |  _ \| |
  -- *                             / __| | | | |_) | |
  -- *                            | (__| |_| |  _ <| |___
  -- *                             \___|\___/|_| \_\_____|
  -- *
  -- * Copyright (C) 1998 - 2019, Daniel Stenberg, <daniel@haxx.se>, et al.
  -- *
  -- * This software is licensed as described in the file COPYING, which
  -- * you should have received as part of this distribution. The terms
  -- * are also available at https://curl.haxx.se/docs/copyright.html.
  -- *
  -- * You may opt to use, copy, modify, merge, publish, distribute and/or sell
  -- * copies of the Software, and permit persons to whom the Software is
  -- * furnished to do so, under the terms of the COPYING file.
  -- *
  -- * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
  -- * KIND, either express or implied.
  -- *
  -- **************************************************************************

  -- the typechecker doesn't work in C++ (yet)
  -- This preprocessor magic that replaces a call with the exact same call is
  --   only done to make sure application authors pass exactly three arguments
  --   to these functions.

end CurlAda;
