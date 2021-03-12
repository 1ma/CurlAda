pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package CurlAda is
   pragma Link_With("-lcurl");

   subtype CURL is System.Address;

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
   with Convention => C;

   function Global_Init (flags : long) return CURLcode
   with Import => True,
        Convention => C,
        External_Name => "curl_global_init";

   procedure Global_Cleanup
   with Import => True,
        Convention => C,
        External_Name => "curl_global_cleanup";

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
   CURLOPT_LASTENTRY : constant unsigned := 10290;

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
   CURLINFO_LASTONE : constant unsigned := 57;

end CurlAda;
