

; Inno Setup Language Pack v4.2.2 AutoSetup for ISSI v5.1.0.6 and up.
;
; This script is called when a language file for a certain language is not available.
;
; It wil generate a setup and is installed to ensure easy de-install

; This script will only be called for Inno Setup v5.0.8 and down

#define AppName "Inno Setup Language Pack"
#define AppVersion "4.2.2"
#define LangVersion "4_2_2"

; Set correct AppID for Inno Setup 4 or 5 depending on compiler version
#if VER >= 0x05000000
  #define AppID "Inno Setup 5"
#else
  #define AppID "Inno Setup 4"
#endif

#define SourceFolder "..\Languages\"+LangVersion
#define AppFileName "islp_v"+LangVersion

[Setup]
OutputBaseFileName={#AppFileName}
AppName={#AppName}
AppVersion={#AppVersion}
AppID={#AppID}
AppPublisher=LOGAN Interactive
AppVerName={cm:NameAndVersion,{#AppName},{#AppVersion}}
DefaultDirName={pf}\Inno Setup Languages\
OutputDir={#SourcePath}
DisableStartupPrompt=true
DisableReadyPage=true
DisableProgramGroupPage=true
DisableDirPage=true
CreateUninstallRegKey=no
UpdateUninstallLogAppName=no
UsePreviousGroup=yes
UsePreviousAppDir=yes

[Files]
Source: "{src}\..\Languages\{#LangVersion}\*.*"; DestDir: "{app}\Languages"; Flags: onlyifdoesntexist external

[Code]
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
