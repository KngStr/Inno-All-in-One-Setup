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
Source: {#CurDir}\{userappdata}\*; DestDir: {userappdata}; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Tasks: ; Components: IDE\ISStudio

[Icons]
;ISStudio
Name: {group}\ISStudio; Filename: {app}\ISStudio\ISStudio.exe; WorkingDir: {app}; Comment: Start ISStudio; IconIndex: 0; Components: IDE\ISStudio

[Registry]
;删除工具栏数据
Root: HKCU; Subkey: "Software\Kymoto Solutions\Inno Script Studio\Toolbars"; Components: IDE\ISStudio; Flags: deletekey

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
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio; ValueType: string; ValueName: Language; ValueData: 1033; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio; ValueType: string; ValueName: SingleInstance; ValueData: 0; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options; ValueType: string; ValueName: AutoSave; ValueData: 0; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options; ValueType: string; ValueName: DisplayFullHints; ValueData: 0; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options; ValueType: string; ValueName: FullPathInTitleBar; ValueData: 0; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options; ValueType: string; ValueName: InitialSection; ValueData: 1; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options; ValueType: string; ValueName: MakeBackups; ValueData: 0; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options; ValueType: string; ValueName: PauseOnDebuggerExceptions; ValueData: 1; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options; ValueType: string; ValueName: RunAsDifferentUser; ValueData: 0; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options; ValueType: string; ValueName: StartUpType; ValueData: 2; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options; ValueType: string; ValueName: TestCompiledSetup; ValueData: 1; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options; ValueType: string; ValueName: UndoAfterSave; ValueData: 1; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options; ValueType: string; ValueName: WriteBooleanAs; ValueData: 0; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options\Compiler; ValueType: string; ValueName: InnoCompilerDir; ValueData: {app}\; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options\Display; ValueType: string; ValueName: NumberAllLines; ValueData: 1; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options\Display; ValueType: string; ValueName: RightMarginPosition; ValueData: 80; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options\Display; ValueType: string; ValueName: ShowCloseButtonOn; ValueData: 2; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options\Display; ValueType: string; ValueName: ShowGridLines; ValueData: 1; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options\Display; ValueType: string; ValueName: ShowGutter; ValueData: 1; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options\Display; ValueType: string; ValueName: ShowImagesOnTabs; ValueData: 1; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options\Display; ValueType: string; ValueName: ShowLineNumbers; ValueData: 1; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options\Display; ValueType: string; ValueName: ShowModifiedLines; ValueData: 1; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options\Display; ValueType: string; ValueName: ShowRightMargin; ValueData: 1; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options\Display; ValueType: string; ValueName: ShowSpecialItems; ValueData: 1; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options\Editor; ValueType: string; ValueName: AutoIndent; ValueData: 1; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options\Editor; ValueType: string; ValueName: ConvertTabs; ValueData: 1; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options\Editor; ValueType: string; ValueName: CursorPastEOL; ValueData: 1; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options\Editor; ValueType: string; ValueName: EditorFontCharSet; ValueData: 0; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options\Editor; ValueType: string; ValueName: EditorFontName; ValueData: Courier New Ex; Components: IDE\ISStudio and EasySets\CodeFont; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options\Editor; ValueType: string; ValueName: EditorFontSize; ValueData: 10; Components: IDE\ISStudio and EasySets\CodeFont; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options\Editor; ValueType: string; ValueName: ShowActiveLine; ValueData: 1; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options\Editor; ValueType: string; ValueName: TabWidth; ValueData: 2; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Kymoto Solutions\Inno Script Studio\Options\Editor; ValueType: string; ValueName: UseSyntaxHighlighting; ValueData: 1; Components: IDE\ISStudio and EasySets\EditorSet; Flags: uninsdeletevalue uninsdeletekeyifempty
