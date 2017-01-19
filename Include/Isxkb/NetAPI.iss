;Author: Vincenzo
;Article created: 17/09/03 0:31:35
;Article URL : http://www.vincenzo.net/isxkb/modules.php?name=News&file=article&sid=61
;
;Library for NetAPI functions, include a function to convert ansi string to UNICODE strings.

[Code]

Const

  NERR_Success = 0;
  NERR_BASE    =   2100;

  NERR_BadUsername = (NERR_BASE+102);
  NERR_InvalidComputer  = (NERR_BASE+251);
  NERR_NotPrimary  = (NERR_BASE+126);
  NERR_GroupExists  = (NERR_BASE+123);
  NERR_UserExists  = (NERR_BASE+124);
  NERR_PasswordTooShort  = (NERR_BASE+145);


  USER_PRIV_GUEST = 0;
  USER_PRIV_USER = 1;
  USER_PRIV_ADMIN = 2;


  UF_SCRIPT = $0001;
  UF_ACCOUNTDISABLE = $0002;
  UF_HOMEDIR_REQUIRED = $0008;
  UF_LOCKOUT = $0010;
  UF_PASSWD_NOTREQD = $0020;
  UF_PASSWD_CANT_CHANGE = $0040;

  UF_TEMP_DUPLICATE_ACCOUNT = $0100;
  UF_NORMAL_ACCOUNT = $0200;
  UF_INTERDOMAIN_TRUST_ACCOUNT = $0800;
  UF_WORKSTATION_TRUST_ACCOUNT = $1000;
  UF_SERVER_TRUST_ACCOUNT = $2000;

  UF_DONT_EXPIRE_PASSWD = $10000;

  DOMAIN_GROUP_RID_ADMINS = $00000200;
  DOMAIN_GROUP_RID_USERS = $00000201;
  DOMAIN_GROUP_RID_GUESTS = $00000202;
  DOMAIN_GROUP_RID_COMPUTERS = $00000203;
  DOMAIN_GROUP_RID_CONTROLLERS = $00000204;
  DOMAIN_GROUP_RID_CERT_ADMINS = $00000205;
  DOMAIN_GROUP_RID_SCHEMA_ADMINS = 00000206;


type
	NET_API_STATUS = LongInt;

type
  TUserInfo1 = record
   usri1_name : PChar;
   usri1_password : PChar;
   usri1_password_age: LongInt;
   usri1_priv: LongInt;
   usri1_home_dir: PChar;
   usri1_comment: PChar;
   usri1_flags: LongInt;
   usri1_script_path:PChar;
  end;

type
  TUserInfo3 = record
    usri3_name : PChar;
    usri3_password: PChar;
    usri3_password_age: LongInt;
    usri3_priv: LongInt;
    usri3_home_dir: PChar;
    usri3_comment: PChar;
    usri3_flags: LongInt;
    usri3_script_path: PChar;
    usri3_auth_flags: LongInt;
    usri3_full_name: PChar;
    usri3_usr_comment: PChar;
    usri3_parms: PChar;
    usri3_workstations: PChar;
    usri3_last_logon: LongInt;
    usri3_last_logoff: LongInt;
    usri3_acct_expires: LongInt;
    usri3_max_storage: LongInt;
    usri3_units_per_week: LongInt;
    usri3_logon_hours: LongInt;
    usri3_bad_pw_count: LongInt;
    usri3_num_logons: LongInt;
    usri3_logon_server: PChar;
    usri3_country_code: LongInt;
    usri3_code_page: LongInt;
    usri3_user_id: LongInt;
    usri3_primary_group_id: LongInt;
    usri3_profile: PChar;
    usri3_home_dir_drive: PChar;
    usri3_password_expired: LongInt;
end;



function NetUserAdd3(
  servername: PChar;
  level: LongInt;
  var info3: TUserInfo3;
  var param_err: LongInt ): NET_API_STATUS;
external 'NetUserAdd@NETAPI32.DLL stdcall';

function NetUserAdd1(
  servername: PChar;
  level: LongInt;
  var info1: TUserInfo1;
  var param_err: LongInt ): NET_API_STATUS;
external 'NetUserAdd@NETAPI32.DLL stdcall';


//
// Ansi2Unicode
//
function Ansi2Unicode( s: String ) : String;
var
	z : Char; i : Integer;
	uni: String;
begin

  z := Chr(0);

  for i := 1 to Length(s) do
  	uni := uni + StrGet(s, i ) + z;

  Result := uni;
end;

[/Code]
