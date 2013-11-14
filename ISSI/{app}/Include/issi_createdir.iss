
; _ISSI_CREATEDIR.EXE source script
;
;  This script will generate _issi_createdir.exe
;  This exe will read the _issi.ini and will
;  create a folder based indicated in the ini
;
;  ISSI_CreateSerial
;  ISSI_CreateDir
;
; (c) 2005 Jan Albartus / LOGAN Interactive

#define AppName "ISSI CreateDir"
#define AppVersion "1.1"
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
OutputBaseFilename=_issi_createdir
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
function InitializeSetup(): Boolean;
  var
      myDir          : String;
      mykey          : String;
begin
      if Pos('/VERYSILENT', UpperCase(GetCmdTail)) = 0 then
        begin
          MsgBox( ExpandConstant('This file is only to be used by ISSI'), mbInformation, MB_OK );
          Result := False;
        end;
      if Pos('/VERYSILENT', UpperCase(GetCmdTail)) > 0 then
        begin
          myDir      :=  GetIniString('ISSI', 'issi_CreateDir','', ExpandConstant('{src}\_issi.ini'));
          CreateDir(expandConstant(myDir));
          Result := True;
        end;
end;



