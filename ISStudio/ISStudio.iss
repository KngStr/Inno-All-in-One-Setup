//Author      : WLDNA
//Link        : http://www.wldna.com/
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

[Registry]
;关联
Root: HKLM; Subkey: SOFTWARE\Classes\InnoSetupScriptFile\shell\OpenWithISStudio; ValueType: string; ValueData: {cm:OpenWithISStudio}; Flags: uninsdeletekey; Components: IDE\ISStudio; Tasks: AssocIss
Root: HKLM; Subkey: SOFTWARE\Classes\InnoSetupScriptFile\shell\OpenWithISStudio\command; ValueType: string; ValueData: """{app}\ISStudio.exe"" ""%1"""; Flags: uninsdeletekey; Components: IDE\ISStudio; Tasks: AssocIss

Root: HKLM; Subkey: SOFTWARE\Classes\InnoSetupHeaderFile\shell\OpenWithISStudio; ValueType: string; ValueData: {cm:OpenWithISStudio}; Flags: uninsdeletekey; Components: IDE\ISStudio; Tasks: AssocIsh
Root: HKLM; Subkey: SOFTWARE\Classes\InnoSetupHeaderFile\shell\OpenWithISStudio\command; ValueType: string; ValueData: """{app}\ISStudio.exe"" ""%1"""; Flags: uninsdeletekey; Components: IDE\ISStudio; Tasks: AssocIsh

;Root: HKCR; Subkey: ".iss"; ValueType: String; ValueData: "ISStudio Files"; Tasks: "AssocIsh"; Components: IDE\ISStudio; Flags: uninsdeletekey
Root: HKLM; Subkey: SOFTWARE\Classes\ISStudio Files; ValueType: String; ValueData: ISStudio Files; Components: IDE\ISStudio; Tasks: AssocIsh AssocIss; Flags: uninsdeletekey
Root: HKLM; Subkey: SOFTWARE\Classes\ISStudio Files\Shell\Open\Command; ValueType: String; ValueData: """{app}\ISStudio.exe"" ""%1"""; Components: IDE\ISStudio; Tasks: AssocIsh AssocIss; Flags: uninsdeletevalue
Root: HKLM; Subkey: SOFTWARE\Classes\ISStudio Files\DefaultIcon; ValueType: String; ValueData: {app}\ISStudio.exe,-1; Components: IDE\ISStudio; Tasks: AssocIsh AssocIss; Flags: uninsdeletevalue


;优化配置
Root: HKCU; SubKey: Software\Kymoto Solutions; Flags: uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio 2; Flags: uninsdeletekeyifempty

Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio 2\Options; ValueType: string; ValueName: UndoAfterSave; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\ISStudio and EasySets\EditorSet;
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio 2\Options\Compiler; ValueType: string; ValueName: InnoCompilerPath; ValueData: {app}; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\ISStudio and EasySets\EditorSet;
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio 2\Options\Editor; ValueType: string; ValueName: EditorFontName; ValueData: Courier New CE; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\ISStudio and EasySets\EditorSet;
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio 2\Stylers\Inno Setup\Compiler Directive; ValueType: string; ValueName: ForeColor; ValueData: 255; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\ISStudio and EasySets\EditorSet;
