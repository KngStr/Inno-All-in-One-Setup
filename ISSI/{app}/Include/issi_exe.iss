
; _ISSI.EXE source script v1.0
;
; This _issi.exe is an integral part of
; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; This is the sourcecode for the exe file used
; by some of the ISSI functions.
;
; Because _issi.exe is around 255KB I rather
; would offer you the source code so it can be
; re-compile on the fly by ISSI itself.
;
; This exe will be called by the Inno Setup Pre-
; Processor before the script is (pre)processed.
;
; This file will automatically be compiled when
; you use ISSI for the first time.
;
; (c) 2004-2005 Jan Albartus / LOGAN Interactive


#define AppName "ISSI"
#define AppVersion "1.5"
#define AppPublisher "Jan Albartus"
#define AppURL "http://www.albartus.com"

[Setup]
OutputDir={#SourcePath}
AppName={#AppName}
AppVerName={#AppName} v{#AppVersion}
AppVersion={#AppVersion}
VersionInfoVersion={#AppVersion}
VersionInfoTextVersion={#AppVersion}
VersionInfoDescription=ISSI Executable Component
VersionInfoCompany={#AppPublisher}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppUrl}
AppSupportURL={#AppUrl}
AppUpdatesURL={#AppUrl}
AppCopyright={#AppPublisher}
OutputBaseFilename=_issi
DisableStartupPrompt=true
DisableReadyPage=true
DisableFinishedPage=true
CreateAppDir=no
CreateUninstallRegKey=no
Uninstallable=no
Compression=lzma/ultra
SolidCompression=true
InternalCompressLevel=ultra

[Code]
type
  TSystemTime = record
    wYear : Word;
    wMonth : Word;
    wDayOfWeek : Word;
    wDay : Word;
    wHour : Word;
    wMinute : Word;
    wSecond : Word;
    wMilliseconds : Word;
  end;

type
  TMemoryStatus = record
    dwLength : Longint;
    dwMemoryLoad : Longint;
    dwTotalPhys : Longint;
    dwAvailPhys : Longint;
    dwTotalPageFile : Longint;
    dwAvailPageFile : Longint;
    dwTotalVirtual : Longint;
    dwAvailVirtual : Longint;
  end;

procedure GlobalMemoryStatus(var lpBuffer: TMemoryStatus); external
'GlobalMemoryStatus@kernel32.dll';

procedure GetSystemTime(var lpSystemTime: TSystemTime); external
'GetSystemTime@kernel32.dll';

procedure GetLocalTime(var lpSystemTime: TSystemTime); external
'GetLocalTime@kernel32.dll';

var
  st, lt: TSystemTime;

function FormatDateTime( dt: TSystemTime ) : String;
begin
  Result := IntToStr( dt.wDay )+'/'+IntToStr( dt.wMonth )+'/'+IntToStr( dt.wYear ) +
    '  '+IntToStr( dt.wHour )+':'+IntToStr( dt.wMinute )+'.'+IntToStr( dt.wSecond );
end;

function issi_year( dt: TSystemTime ) : String;
var s: String;
begin
  s := IntToStr( dt.wYear-2000 );if length(s) = 1 then s := '0' + s;
  Result := s
end;

function issi_longyear( dt: TSystemTime ) : String;
var s: String;
begin
  s := IntToStr( dt.wYear );
  Result := s
end;

function issi_month( dt: TSystemTime ) : String;
var s: String;
begin
  s := IntToStr( dt.wMonth ); if length(s) = 1 then s := '0' + s;
  Result := s
end;

function issi_day( dt: TSystemTime ) : String;
var s: String;
begin
  s := IntToStr( dt.wDay ); if length(s) = 1 then s := '0' + s;
  Result := s
end;

function issi_hour( dt: TSystemTime ) : String;
var s: String;
begin
  s := IntToStr( dt.wHour ); if length(s) = 1 then s := '0' + s;
  Result := s
end;

function issi_minute( dt: TSystemTime ) : String;
var s: String;
begin
  s := IntToStr( dt.wMinute ); if length(s) = 1 then s := '0' + s;
  Result := s
end;

function issi_second( dt: TSystemTime ) : String;
var s: String;
begin
  s := IntToStr( dt.wSecond ); if length(s) = 1 then s := '0' + s;
  Result := s
end;

function FormatANSI( dt: TSystemTime ) : String;
var s: String;
begin
  Result := IntToStr( dt.wYear );
  s := IntToStr( dt.wMonth ); if length(s) = 1 then s := '0' + s;
  Result := Result + s;
  s := IntToStr( dt.wDay ); if length(s) = 1 then s := '0' + s;
  Result := Result + s;
  s := IntToStr( dt.wHour ); if length(s) = 1 then s := '0' + s;
  Result := Result + s;
  s := IntToStr( dt.wMinute ); if length(s) = 1 then s := '0' + s;
  Result := Result + s;
  s := IntToStr( dt.wSecond ); if length(s) = 1 then s := '0' + s;
  Result := Result + s;
end;

function GetMyStringNow( s : String ) : String;
begin
	Result := FormatANSI( lt );
end;

function getissi_year( s : String ) : String;
begin
	Result := issi_year( lt );
end;

function getissi_longyear( s : String ) : String;
begin
	Result := issi_longyear( lt );
end;

function getissi_month( s : String ) : String;
begin
	Result := issi_month( lt );
end;

function getissi_day( s : String ) : String;
begin
	Result := issi_day( lt );
end;

function getissi_hour( s : String ) : String;
begin
	Result := issi_hour( lt );
end;

function getissi_minute( s : String ) : String;
begin
	Result := issi_minute( lt );
end;

function getissi_second( s : String ) : String;
begin
	Result := issi_second( lt );
end;

function getissi_memory( myDummy : String ) : String;
var
  M: TMemoryStatus;
  oneMB: Longint;
begin
  oneMB := 1024 * 1024;
  GlobalMemoryStatus(M);
  Result := IntToStr( M.dwTotalPhys / oneMB );
end;

function InitializeSetup(): Boolean;
  var
      mykey          : String;
begin
      if Pos('/VERYSILENT', UpperCase(GetCmdTail)) = 0 then
        begin
          MsgBox( ExpandConstant('This file is only to be used by ISSI'), mbInformation, MB_OK );
          Result := False;
        end;
      if Pos('/VERYSILENT', UpperCase(GetCmdTail)) > 0 then
        begin
          GetSystemTime(st);
          GetLocalTime(lt);
          Result := True;
        end;
end;

[INI]
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_datestring"; String: {code:GetMyStringNow|''}
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_longyear"; String: {code:getissi_longyear|''}
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_year"; String: {code:getissi_year|''}
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_month"; String: {code:getissi_month|''}
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_day"; String: {code:getissi_day|''}
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_hour"; String: {code:getissi_hour|''}
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_minute"; String: {code:getissi_minute|''}
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_second"; String: {code:getissi_second|''}
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_win"; String: "{win}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_sys"; String: "{sys}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_sd"; String: "{sd}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_pf"; String: "{pf}"
;Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_pf32"; String: "{pf32}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_cf"; String: "{cf}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_cf32"; String: "{cf32}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_tmp"; String: "{tmp}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_fonts"; String: "{fonts}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_dao"; String: "{dao}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_group"; String: "{group}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_localappdata"; String: "{localappdata}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_sendto"; String: "{sendto}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_userappdata"; String: "{userappdata}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_commonappdata"; String: "{commonappdata}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_userdesktop"; String: "{userdesktop}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_commondesktop"; String: "{commondesktop}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_userdocs"; String: "{userdocs}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_commondocs"; String: "{commondocs}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_userprograms"; String: "{userprograms}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_commonprograms"; String: "{commonprograms}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_userstartmenu"; String: "{userstartmenu}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_commonstartmenu"; String: "{commonstartmenu}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_userstartup"; String: "{userstartup}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_commonstartup"; String: "{commonstartup}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_usertemplates"; String: "{usertemplates}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_commontemplates"; String: "{commontemplates}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_cmd"; String: "{cmd}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_computername"; String: "{computername}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_groupname"; String: "{groupname}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_sysuserinfoname"; String: "{sysuserinfoname}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_sysuserinfoorg"; String: "{sysuserinfoorg}"
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_memory"; String: {code:getissi_memory|''}


