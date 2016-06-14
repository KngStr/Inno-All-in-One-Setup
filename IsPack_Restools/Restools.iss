//Author      : KngStr
//Link        : http://www.kngstr.com/
//Description :
//Modified    : 2013-11-14 11:40:59
//Tested Inno :
//Usage       : See Examples folder

#define private CurDir ExtractFileDir(__PATHFILENAME__)

;Restools Info
#define ISCmplr_Restools_MiniVCL ISCmplr_VerStr(CurDir + "\Inno_ISCmplr_Setup\InnoSetup_ANSI\MiniVCL\ISCC.exe", 'IS_Ver_Str')
#define ISCmplr_Restools_FullVCL ISCmplr_VerStr(CurDir + "\Inno_ISCmplr_Setup\InnoSetup_ANSI\FullVCL\ISCC.exe", 'IS_Ver_Str')

#define IDE_Restools VerBuild(CurDir + '\InnoCompiler\ANSI\' + AppExeName)
#define ISCmplr_Restools_MiniVCL ISCmplr_Restools_MiniVCL + ' Build ' + GetFileDateTimeString(CurDir + '\Inno_ISCmplr_Setup\InnoSetup_ANSI\MiniVCL\Setup.e32', 'yymmdd', '', '');
#define ISCmplr_Restools_FullVCL ISCmplr_Restools_FullVCL + ' Build ' + GetFileDateTimeString(CurDir + '\Inno_ISCmplr_Setup\InnoSetup_ANSI\FullVCL\Setup.e32', 'yymmdd', '', '');
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;#if InnoVer == Copy(ISCmplr_Restools_MiniVCL, 1, Len(InnoVer))
  #define Include_ISCmplr_Restools
;#endif

[Files]
#ifdef Include_ISCmplr_Restools
Source: {#SrcPath}\IsPack_5_5_2\isfiles\*; Excludes: .git*,cvs\*,ISPP.dll,*.e32,Compil32.exe,isscint.dll,ISPPCC.exe,ISCC.exe,ISCmplr.dll; DestDir: {app}; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList; Components: ISCmplr_Setup\Restools_MiniVCL or ISCmplr_Setup\Restools_FullVCL

;Languages
Source: {#SrcPath}\IsPack_5_5_2\Languages\*; DestDir: {app}\Languages; Components: ISCmplr_Setup\Restools_MiniVCL or ISCmplr_Setup\Restools_FullVCL; Tasks: ; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList

;Restools ReadMe
Source: {#CurDir}\Inno_ISCmplr_Setup\*; DestDir: {app}\Docs\Restools ISCmplr; Flags: ignoreversion; BeforeInstall: AddToDetaList; Tasks: ; Components: ISCmplr_Setup
Source: {#CurDir}\Inno_ISCmplr_Setup\Example\*; DestDir: {app}\Examples\Restools; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Tasks: ; Components: ISCmplr_Setup

;Restools Ansi FullVcl
Source: {#CurDir}\Inno_ISCmplr_Setup\InnoSetup_ANSI\FullVCL\*; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Ansi and ISCmplr_Setup\Restools_FullVcl; Tasks:
Source: {#CurDir}\Inno_ISCmplr_Setup\Example_FullVCL\*; DestDir: {app}\Examples\Restools FullVCL; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Ansi and ISCmplr_Setup\Restools_FullVcl; Tasks:
;Restools Ansi MiniVcl
Source: {#CurDir}\Inno_ISCmplr_Setup\InnoSetup_ANSI\MiniVcl\*; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Ansi and ISCmplr_Setup\Restools_MiniVcl; Tasks:
#endif
;Restools Enhance Ansi Compiler
Source: {#CurDir}\InnoCompiler\ANSI\*; DestDir: {app}; Excludes: Templates.dat; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Ansi and IDE\Restools; Tasks:
Source: {#CurDir}\InnoCompiler\ANSI\Templates.dat; DestDir: {app}; Components: Inno\Ansi and IDE\Restools; Tasks:; Flags: confirmoverwrite ignoreversion promptifolder; BeforeInstall: AddToDetaList

#ifdef Include_ISCmplr_Restools
;Restools Unicode FullVcl
Source: {#CurDir}\Inno_ISCmplr_Setup\InnoSetup_Unicode\FullVCL\*; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Unicode and ISCmplr_Setup\Restools_FullVcl; Tasks:
Source: {#CurDir}\Inno_ISCmplr_Setup\Example_FullVCL\*; DestDir: {app}\Examples\Restools FullVCL; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Unicode and ISCmplr_Setup\Restools_FullVcl; Tasks:
;Restools Unicode MiniVcl
Source: {#CurDir}\Inno_ISCmplr_Setup\InnoSetup_Unicode\MiniVcl\*; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Unicode and ISCmplr_Setup\Restools_MiniVcl; Tasks:
#endif
;Restools Enhance Unicode Compiler
Source: {#CurDir}\InnoCompiler\Unicode\*; DestDir: {app}; Excludes: Templates.dat; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Unicode and IDE\Restools; Tasks:
Source: {#CurDir}\InnoCompiler\Unicode\Templates.dat; DestDir: {app}; Components: Inno\Unicode and IDE\Restools; Tasks:; Flags: confirmoverwrite ignoreversion promptifolder; BeforeInstall: AddToDetaList

;Restools Enhance Compiler Info
Source: {#CurDir}\InnoCompiler\Example\*; DestDir: {app}\Examples; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Tasks: ; Components: IDE\Restools
Source: {#CurDir}\InnoCompiler\*; Excludes: ANSI\*,Unicode\*,Example\*; DestDir: {app}\Docs\Restools Compiler; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList; Tasks: ; Components: IDE\Restools
#ifdef Include_ISCmplr_Restools
Source: {#CurDir}\Inno_ISCmplr_Setup\license.txt; DestDir: {app}; Components: Inno; Languages: ChineseSimp; BeforeInstall: AddToDetaList; Flags: ignoreversion
#endif


[Registry]

;Restools Enhanced Editor Options
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Assembler; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Assembler; ValueType: dword; ValueName: Foreground; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Assembler; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Bracket; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Bracket; ValueType: dword; ValueName: Foreground; ValueData: $00800080; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Bracket; ValueType: dword; ValueName: Style; ValueData: $00000001; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Bracket Error; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Bracket Error; ValueType: dword; ValueName: Foreground; ValueData: $000000ff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Bracket Error; ValueType: dword; ValueName: Style; ValueData: $00000001; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\BracketError; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\BracketError; ValueType: dword; ValueName: Foreground; ValueData: $000000ff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\BracketError; ValueType: dword; ValueName: Style; ValueData: $00000001; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Character; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Character; ValueType: dword; ValueName: Foreground; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Character; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Comment; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Comment; ValueType: dword; ValueName: Foreground; ValueData: $00008000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Comment; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Const; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Const; ValueType: dword; ValueName: Foreground; ValueData: $000000FF; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Const; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Constant; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Constant; ValueType: dword; ValueName: Foreground; ValueData: $000000ff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Constant; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\CurrentIdentifier; ValueType: dword; ValueName: Background; ValueData: $00ffff00; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\CurrentIdentifier; ValueType: dword; ValueName: Foreground; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\CurrentIdentifier; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Directive; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Directive; ValueType: dword; ValueName: Foreground; ValueData: $000000ff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Directive; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Event function; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Event function; ValueType: dword; ValueName: Foreground; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Event function; ValueType: dword; ValueName: Style; ValueData: $00000001; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\EventFunction; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\EventFunction; ValueType: dword; ValueName: Foreground; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\EventFunction; ValueType: dword; ValueName: Style; ValueData: $00000001; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Float; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Float; ValueType: dword; ValueName: Foreground; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Float; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Hexadecimal; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Hexadecimal; ValueType: dword; ValueName: Foreground; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Hexadecimal; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Hot Link; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Hot Link; ValueType: dword; ValueName: Foreground; ValueData: $00ff0000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Hot Link; ValueType: dword; ValueName: Style; ValueData: $00000004; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\HotLink; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\HotLink; ValueType: dword; ValueName: Foreground; ValueData: $00ff0000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\HotLink; ValueType: dword; ValueName: Style; ValueData: $00000004; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Identifier; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Identifier; ValueType: dword; ValueName: Foreground; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Identifier; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Line Highlight; ValueType: dword; ValueName: Background; ValueData: $00e6fffa; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Line Highlight; ValueType: dword; ValueName: Foreground; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Line Highlight; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\LineHighlight; ValueType: dword; ValueName: Background; ValueData: $00e6fffa; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\LineHighlight; ValueType: dword; ValueName: Foreground; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\LineHighlight; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Number; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Number; ValueType: dword; ValueName: Foreground; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Number; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Preprocessor; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Preprocessor; ValueType: dword; ValueName: Foreground; ValueData: $00000080; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Preprocessor; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Reserved Word; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Reserved Word; ValueType: dword; ValueName: Foreground; ValueData: $00ff0000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Reserved Word; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\ReservedWord; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\ReservedWord; ValueType: dword; ValueName: Foreground; ValueData: $00ff0000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\ReservedWord; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Space; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Space; ValueType: dword; ValueName: Foreground; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Space; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\String; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\String; ValueType: dword; ValueName: Foreground; ValueData: $00808040; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\String; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Symbol; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Symbol; ValueType: dword; ValueName: Foreground; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\InnoPasColors\Symbol; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Comment; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Comment; ValueType: dword; ValueName: Foreground; ValueData: $00008000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Comment; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Constant; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Constant; ValueType: dword; ValueName: Foreground; ValueData: $004040ff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Constant; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Directive; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Directive; ValueType: dword; ValueName: Foreground; ValueData: $000000ff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Directive; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Identifier; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Identifier; ValueType: dword; ValueName: Foreground; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Identifier; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Illegal Char; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Illegal Char; ValueType: dword; ValueName: Foreground; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Illegal Char; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\IllegalChar; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\IllegalChar; ValueType: dword; ValueName: Foreground; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\IllegalChar; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Number; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Number; ValueType: dword; ValueName: Foreground; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Number; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Parameters; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Parameters; ValueType: dword; ValueName: Foreground; ValueData: $00202080; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Parameters; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Reserved Word; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Reserved Word; ValueType: dword; ValueName: Foreground; ValueData: $00ff0000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Reserved Word; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\ReservedWord; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\ReservedWord; ValueType: dword; ValueName: Foreground; ValueData: $00ff0000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\ReservedWord; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Section; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Section; ValueType: dword; ValueName: Foreground; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Section; ValueType: dword; ValueName: Style; ValueData: $00000001; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Space; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Space; ValueType: dword; ValueName: Foreground; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Space; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\String; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\String; ValueType: dword; ValueName: Foreground; ValueData: $00808040; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\String; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Symbol; ValueType: dword; ValueName: Background; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Symbol; ValueType: dword; ValueName: Foreground; ValueData: $1fffffff; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\ISSColors\Symbol; ValueType: dword; ValueName: Style; ValueData: $00000000; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet

Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: ActiveLang; ValueData: ChineseSimp.lng; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: ShowToolbar; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: ShowStatusBar; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: LowPriorityDuringCompile; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: AutoCompleteShortCut; ValueData: 8224; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: scpCodeLines; ValueData: 8; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: scpCodeWidth; ValueData: 335; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: scpCodeSorted; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: scpCodeMatchType; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: scpAllCodeSorted; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: scpAllCodeMatchType; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: UndoAfterSave; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: UseSynHigh; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorCursorPastEOL; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: TabWidth; ValueData: 2; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorFontName; ValueData: Courier New; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\CodeFont
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorFontSize; ValueData: 9; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorFontCharset; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorFontColor; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorGutterVisible; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorGutterShowLineNumbers; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorGutterShowLeaderZeros; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorGutterUseFontStyle; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorGutterFontName; ValueData: Courier New; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\CodeFont
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorGutterFontSize; ValueData: 9; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorGutterFontCharset; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorGutterFontColor; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorGutterColor; ValueData: -16777201; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorGutterDigitCnt; ValueData: 4; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorColor; ValueData: -16777211; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorBookmarkKeys; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorBookmarkVisible; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorRightEdge; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorRightEdgeColor; ValueData: 12632256; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorExtraLineSpacing; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorIndentLineVisible; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorIndentLineColor; ValueData: 15198183; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorCurIndentLineColor; ValueData: 12632256; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorAutoIndent; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorDragDropEditing; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorKeepCaretX; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorSmartTabs; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorSmartTabDelete; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorRightMouseMoves; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorEnhanceHomeKey; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorHideShowScrollbars; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorHalfPageScroll; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorDefauldWordWrap; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorScrollByOneLess; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorScrollPastEOF; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorShowScrollHint; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorScrollHintFollows; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorTabsToSpaces; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorTrimTrailingSpaces; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorGroupUndo; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EnableBracket; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorDisableScrollArrows; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorInsertCaret; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorOverwriteCaret; ValueData: 3; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: ISS_HVIS; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: SaveAsHtmlAddLineNum; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: CopyUBBType; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: CopyUBBSFName; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: CopyUBBSTime; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: scpCodeTimerInterval; ValueData: 500; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: scpEventCodeTimerInterval; ValueData: 500; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: scpParamsTimerInterval; ValueData: 500; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: scpParamsAutoExec; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: scpCodeAutoExec; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: scpEventCodeAutoExec; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorKeystrokes; ValueData: 5200000026000000000003002600010000006700260004000000D30028000000000004002800010000006800280004000000D40025000000000001002500010000006500250004000000050025000500000069002700000000000200270001000000660027000400000006002700050000006A002200000000000A002200010000006E002200040000000E00220005000000720021000000000009002100010000006D002100040000000D00210005000000710024000000000007002400010000006B002400040000000F00240005000000730023000000000008002300010000006C00230004000000100023000500000074002D0000000000DF002D0004000000C9002E00010000005B022D00010000005C022E0000000000F601080000000000F501080001000000F501080004000000F80108000200000059020800030000005A020D0000000000FD010D0001000000FD0109000000000064020900010000006502700000000000EA01410004000000C700430004000000C9005600040000005C025800040000005B02490005000000620255000500000063024D0004000000FD014E0004000000FE01540004000000F701590004000000FB01590005000000FA015A000400000059025A00050000005A023000040000002D013100040000002E013200040000002F0133000400000030013400040000003101350004000000320136000400000033013700040000003401380004000000350139000400000036013000050000005F013100050000006001320005000000610133000500000062013400050000006301350005000000640136000500000065013700050000006601380005000000670139000500000068014E0005000000E700430005000000E8004C0005000000E900420005000000FA00; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\CodeFont
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: ShowStartupForm; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: UseWizard; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: MakeBackups; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: FullPathInTitleBar; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: PauseOnDebuggerExceptions; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: RunAsDifferentUser; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorTooltipExpressionEvaluation; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorTooltipSymbolInsight; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: HighlightCurLine; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: scpAllCodeTimerInterval; ValueData: 500; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: scpAllCodeAutoExec; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: Autosave; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: AlignmentPaletteVisible; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: HighlightCurIdentifier; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: ColorDlgCustomColors; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorFontCompact; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\EditorSet
