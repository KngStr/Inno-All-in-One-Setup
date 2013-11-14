
; _ISSI_MD5.EXE source script
;
;  This script will generate _issi_md5.exe
;  This exe will read the _issi.ini and will
;  Get the MD5 from a string (or file)
;
;  ISSI_GetMD5OfString
;  ISSI_GetMD5OfFile
; (c) 2005 Jan Albartus / LOGAN Interactive

#define AppName "ISSI MD5"
#define AppVersion "1.2"
#define AppPublisher "Jan Albartus"
#define AppURL "http://www.albartus.com"

[Setup]
AppName={#AppName}
AppVerName={#AppName} v{#AppVersion}
AppVersion={#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppUrl}
AppSupportURL={#AppUrl}
AppUpdatesURL={#AppUrl}
AppCopyright={#AppPublisher}
VersionInfoVersion={#AppVersion}
VersionInfoTextVersion={#AppVersion}
VersionInfoDescription=ISSI Executable Component
VersionInfoCompany={#AppPublisher}
OutputDir={#SourcePath}
OutputBaseFilename=_issi_md5
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
function issiGetMD5ofSerial( dummy: String ) : String;
Var
  myString:String;
begin
  myString      :=  GetIniString('ISSI', 'issi_MD5serial','', ExpandConstant('{src}\_issi.ini'));
  if not (myString = '')then begin
    Result     :=  GetMD5OfString(myString);
  end;
end;

function issiGetMD5ofPassword( dummy: String ) : String;
Var
  myString:String;
begin
  myString      :=  GetIniString('ISSI', 'issi_MD5password','', ExpandConstant('{src}\_issi.ini'));
  if not (myString = '')then begin
    Result     :=  GetMD5OfString(myString);
  end;
end;

function issiGetMD5ofString( dummy: String ) : String;
Var
  myString:String;
begin
  myString      :=  GetIniString('ISSI', 'issi_MD5string','', ExpandConstant('{src}\_issi.ini'));
  if not (myString = '')then begin
    Result     :=  GetMD5OfString(myString);
  end;
end;

function issiGetMD5ofFile( dummy: String ) : String;
Var
  myFile:String;
begin
  myFile      :=  GetIniString('ISSI', 'issi_MD5file','', ExpandConstant('{src}\_issi.ini'));
  if fileExists(myFile)then begin
    Result     :=  GetMD5OfFile(myFile);
  end;
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
          ////
          Result := True;
        end;
end;

[INI]
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_MD5string"; String: {code:issiGetMD5ofString|''}
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_MD5file"; String: {code:issiGetMD5ofFile|''}
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_MD5serial"; String: {code:issiGetMD5ofSerial|''}
Filename: "{src}\_issi.ini"; Section: "ISSI"; Key: "issi_MD5password"; String: {code:issiGetMD5ofPassword|''}
