//Author      : KngStr
//Link        : http://www.kngstr.com/
//Description :
//Modified    : 2013-11-14 11:40:59
//Tested Inno :
//Usage       : See Examples folder

#define private CurDir ExtractFileDir(__PATHFILENAME__)

#define IDE_ISStudio VerBuild(CurDir + '\{app}\ISStudio.exe')

[CustomMessages]
English.OpenWithISStudio=Open with &ISStudio
ChineseSimp.OpenWithISStudio=用 ISStudio 打开(&I)


[Components]
Name: IDE\ISStudio; Description: Inno Script Studio     ({#IDE_ISStudio}); Types: full compact custom

[Files]
;ISStudio
Source: {#CurDir}\{app}\*; DestDir: {app}\ISStudio; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Tasks: ; Components: IDE\ISStudio
Source: {#CurDir}\Extra_Languages\*; DestDir: {app}\ISStudio\Languages; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Tasks: ; Components: IDE\ISStudio

[Icons]
;ISStudio
Name: {group}\ISStudio; Filename: {app}\ISStudio\ISStudio.exe; WorkingDir: {app}; Comment: Start ISStudio; IconIndex: 0; Components: IDE\ISStudio

[INI]
FileName: "{app}\ISStudio\Settings.ini"; Section: "Portable"; Key: "Portable"; String: "1"; Components: IDE\ISStudio and EasySets\EditorSet;
FileName: "{app}\ISStudio\Settings.ini"; Section: "Options"; Key: "Language"; String: "{code:ISStudio|Lang}"; Components: IDE\ISStudio and EasySets\EditorSet;
FileName: "{app}\ISStudio\Settings.ini"; Section: "Options"; Key: "UndoAfterSave"; String: "1"; Components: IDE\ISStudio and EasySets\EditorSet;
FileName: "{app}\ISStudio\Settings.ini"; Section: "Options\Compiler"; Key: "InnoCompilerPath"; String: "{app}"; Components: IDE\ISStudio and EasySets\EditorSet;
FileName: "{app}\ISStudio\Settings.ini"; Section: "Options\Editor"; Key: "EditorFontName"; String: "Courier New CE"; Components: IDE\ISStudio and EasySets\EditorSet;
FileName: "{app}\ISStudio\Settings.ini"; Section: "Inno\Compiler Directive"; Key: "ForeColor"; String: "255"; Components: IDE\ISStudio and EasySets\EditorSet;

[Registry]
;关联
Root: HKLM; Subkey: SOFTWARE\Classes\InnoSetupScriptFile\shell\OpenWithISStudio; ValueType: string; ValueData: {cm:OpenWithISStudio}; Flags: uninsdeletekey; Components: IDE\ISStudio; Tasks: AssocIss
Root: HKLM; Subkey: SOFTWARE\Classes\InnoSetupScriptFile\shell\OpenWithISStudio\command; ValueType: string; ValueData: """{app}\ISStudio\ISStudio.exe"" ""%1"""; Flags: uninsdeletekey; Components: IDE\ISStudio; Tasks: AssocIss

Root: HKLM; Subkey: SOFTWARE\Classes\InnoSetupHeaderFile\shell\OpenWithISStudio; ValueType: string; ValueData: {cm:OpenWithISStudio}; Flags: uninsdeletekey; Components: IDE\ISStudio; Tasks: AssocIsh
Root: HKLM; Subkey: SOFTWARE\Classes\InnoSetupHeaderFile\shell\OpenWithISStudio\command; ValueType: string; ValueData: """{app}\ISStudio\ISStudio.exe"" ""%1"""; Flags: uninsdeletekey; Components: IDE\ISStudio; Tasks: AssocIsh

;Root: HKCR; Subkey: ".iss"; ValueType: String; ValueData: "ISStudio Files"; Tasks: "AssocIsh"; Components: IDE\ISStudio; Flags: uninsdeletekey
Root: HKLM; Subkey: SOFTWARE\Classes\ISStudio Files; ValueType: String; ValueData: ISStudio Files; Components: IDE\ISStudio; Tasks: AssocIsh AssocIss; Flags: uninsdeletekey
Root: HKLM; Subkey: SOFTWARE\Classes\ISStudio Files\Shell\Open\Command; ValueType: String; ValueData: """{app}\ISStudio\ISStudio.exe"" ""%1"""; Components: IDE\ISStudio; Tasks: AssocIsh AssocIss; Flags: uninsdeletevalue
Root: HKLM; Subkey: SOFTWARE\Classes\ISStudio Files\DefaultIcon; ValueType: String; ValueData: {app}\ISStudio\ISStudio.exe,-1; Components: IDE\ISStudio; Tasks: AssocIsh AssocIss; Flags: uninsdeletevalue

[UninstallDelete]
Type: files; Name: "{app}\ISStudio\Settings.ini";

[Code]
function ISStudio(Param: String): String;
begin
  if Param = 'Lang' then
    Result := IntToStr(GetUILanguage);
end;
[/Code]
