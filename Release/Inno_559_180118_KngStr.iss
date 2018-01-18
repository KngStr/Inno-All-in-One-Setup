; BEGIN ISPPBUILTINS.ISS


; END ISPPBUILTINS.ISS


; ½Å±¾ÓÃ Inno Setup ½Å±¾Ïòµ¼ Éú³É¡£
; ²éÔÄÎÄµµ»ñÈ¡´´½¨ INNO SETUP ½Å±¾ÎÄ¼þµÄÏêÏ¸×ÊÁÏ£¡

;#expr BuildNum



[Preprocessor]






  





















  
  
  





  





[/Preprocessor]

[Preprocessor]
#ifndef _PREDEFINES_ISH_
[/Preprocessor]

[Code]
type
  PChar = String;




    HMENU = HWND;

  WPARAM = Longint;
  {$EXTERNALSYM WPARAM}
  LPARAM = Longint;
  {$EXTERNALSYM LPARAM}
  LRESULT = Longint;
  {$EXTERNALSYM LRESULT}
  PIDL = DWORD;  // Opaque pointer.

  HANDLE   = LongInt;
  HMODULE  = HANDLE;
  pHMODULE = Array[0..255] of HMODULE;
  LPDWORD  = DWORD;
  PDWORD   = Array[0..255] of DWORD;
  LPTSTR   = String;

function PDir(PName: String): String;
var
  FindRec: TFindRec;
begin
  Result := ExpandConstant('{tmp}\' + PName);

  if not FileExists(Result) then
  begin
    if IsUninstaller then
    begin
      if FileExists(ExpandConstant('{app}\') + PName) then
        FileCopy(ExpandConstant('{app}\') + PName, Result, False)
      else
      if FindFirst(ExpandConstant('{app}\*'), FindRec) then
      try
        repeat
          if FindRec.Attributes and FILE_ATTRIBUTE_DIRECTORY <> 0 then
            if FileExists(ExpandConstant('{app}\') + FindRec.Name + '\' + PName) then
              FileCopy(ExpandConstant('{app}\') + FindRec.Name + '\' + PName, Result, False);
        until FileExists(Result) or (not FindNext(FindRec));
      finally
        FindClose(FindRec);
      end;
    end
    else
    try
      ExtractTemporaryFile(PName);
    except //2014-06-18 Do not show error message
    end;
  end;

  If not FileExists(Result) then Result := '';
end;

[/Code]

[Preprocessor]
#endif
[/Preprocessor]


[Messages]
AboutSetupNote="PreDefines.ish" is supported by KngStr : %nhttp://www.kngstr.com/?PreDefines.ish
[/Messages]




;#define Test

;²»Ê¹ÓÃ²å¼þÐ¶ÔØ¹¦ÄÜ
;ÊÇ·ñÆôÓÃ²»°²È«ÎÄ¼þ£¨Îó±¨ ²å¼þºÍ¹¤¾ß£©
;#Define UnSafe

;È«¾ÖÎÄ¼þ¶¨Òå



;²å¼þÎÄ¼þÌí¼Ó






;ÎÄ¼þ°æ±¾¼°±àÒëÊ±¼ä

;ºËÐÄ°æ±¾ºÅ




[Code]
var
  ResultCode: Integer;
[/Code]



[Messages]
AboutSetupNote=Inno Setup Preprocessor home page:%nhttp://ispp.sourceforge.net/ %n%n±¾³ÌÐòÓÉ KngStr ÇãÇéÖÆ×÷£¬»¶Ó­Ê¹ÓÃ%nÎÒµÄ²©¿Í£ºhttp://www.kngstr.com/

[Run]
Filename: http://www.kngstr.com/; Description: ·ÃÎÊ KngStr;  Flags: postinstall shellexec skipifsilent

[Icons]
Name: "{group}\·ÃÎÊ KngStr"; Filename: http://www.kngstr.com/; 
;Name: "{userdesktop}\{#UrlName}"; Filename: {#Url}; {#SecPara} Flags: uninsneveruninstall;

[LangOptions]
DialogFontName=tahoma
DialogFontSize=8

[Messages]
ChineseSimp.BeveledLabel=KngStr

ChineseSimp.SetupWindowTitle=KngStr - %1
ChineseSimp.SetupAppTitle=KngStr - Inno Setup ¼¯³É°æ
ChineseSimp.UninstallAppTitle=KngStr - Ð¶ÔØ
ChineseSimp.UninstallAppFullTitle=KngStr - %1 Ð¶ÔØ


[CustomMessages]
ChineseSimp.Btn_About_Caption=¹ØÓÚ(&A)
ChineseSimp.Btn_About_Text=KngStr-×¨×¢ÓÚInno/DelphiºÍNsisÎªÖ÷µÄÈí¼þ·â×°¼¼Êõ£¬ÒÔ¼°¿ìËÙÅúÁ¿µÄÈí¼þ´ò°ü·½°¸¡£
ChineseSimp.Lbl_FinishTip_Caption=·ÃÎÊ KngStr
ChineseSimp.Lbl_FinishTip_Url=http://www.kngstr.com/
ChineseSimp.BevelLabel_Url=http://www.kngstr.com/



;#define ISPPVer GetFileVersionString(IsPack + "\isfiles\ISPP.dll")


;OutName
;#expr   DeleteFile(OutName + "*" + FileExt + ".exe")

;ÔöÇ¿°æ±¾


;Restools Info

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;#if InnoVer == Copy(ISCmplr_Restools_MiniVCL, 1, Len(InnoVer))
;#endif

[Files]
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\\IsPack_5_5_2\isfiles\*; Excludes: .git*,cvs\*,ISPP.dll,*.e32,Compil32.exe,isscint.dll,ISPPCC.exe,ISCC.exe,ISCmplr.dll; DestDir: {app}; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList; Components: ISCmplr_Setup\Restools_MiniVCL or ISCmplr_Setup\Restools_FullVCL

;Languages
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\\IsPack_5_5_2\Languages\*; DestDir: {app}\Languages; Components: ISCmplr_Setup\Restools_MiniVCL or ISCmplr_Setup\Restools_FullVCL; Tasks: ; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList

;Restools ReadMe
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_Restools\Inno_ISCmplr_Setup\*; DestDir: {app}\Docs\Restools ISCmplr; Flags: ignoreversion; BeforeInstall: AddToDetaList; Tasks: ; Components: ISCmplr_Setup
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_Restools\Inno_ISCmplr_Setup\Example\*; DestDir: {app}\Examples\Restools; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Tasks: ; Components: ISCmplr_Setup

;Restools Ansi FullVcl
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_Restools\Inno_ISCmplr_Setup\InnoSetup_ANSI\FullVCL\*; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Ansi and ISCmplr_Setup\Restools_FullVcl; Tasks:
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_Restools\Inno_ISCmplr_Setup\Example_FullVCL\*; DestDir: {app}\Examples\Restools FullVCL; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Ansi and ISCmplr_Setup\Restools_FullVcl; Tasks:
;Restools Ansi MiniVcl
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_Restools\Inno_ISCmplr_Setup\InnoSetup_ANSI\MiniVcl\*; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Ansi and ISCmplr_Setup\Restools_MiniVcl; Tasks:
;Restools Enhance Ansi Compiler
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_Restools\InnoCompiler\ANSI\*; DestDir: {app}; Excludes: Templates.dat; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Ansi and IDE\Restools; Tasks:
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_Restools\InnoCompiler\ANSI\Templates.dat; DestDir: {app}; Components: Inno\Ansi and IDE\Restools; Tasks:; Flags: confirmoverwrite ignoreversion promptifolder; BeforeInstall: AddToDetaList

;Restools Unicode FullVcl
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_Restools\Inno_ISCmplr_Setup\InnoSetup_Unicode\FullVCL\*; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Unicode and ISCmplr_Setup\Restools_FullVcl; Tasks:
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_Restools\Inno_ISCmplr_Setup\Example_FullVCL\*; DestDir: {app}\Examples\Restools FullVCL; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Unicode and ISCmplr_Setup\Restools_FullVcl; Tasks:
;Restools Unicode MiniVcl
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_Restools\Inno_ISCmplr_Setup\InnoSetup_Unicode\MiniVcl\*; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Unicode and ISCmplr_Setup\Restools_MiniVcl; Tasks:
;Restools Enhance Unicode Compiler
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_Restools\InnoCompiler\Unicode\*; DestDir: {app}; Excludes: Templates.dat; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Unicode and IDE\Restools; Tasks:
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_Restools\InnoCompiler\Unicode\Templates.dat; DestDir: {app}; Components: Inno\Unicode and IDE\Restools; Tasks:; Flags: confirmoverwrite ignoreversion promptifolder; BeforeInstall: AddToDetaList

;Restools Enhance Compiler Info
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_Restools\InnoCompiler\Example\*; DestDir: {app}\Examples; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Tasks: ; Components: IDE\Restools
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_Restools\InnoCompiler\*; Excludes: ANSI\*,Unicode\*,Example\*; DestDir: {app}\Docs\Restools Compiler; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList; Tasks: ; Components: IDE\Restools
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_Restools\Inno_ISCmplr_Setup\license.txt; DestDir: {app}; Components: Inno; Languages: ChineseSimp; BeforeInstall: AddToDetaList; Flags: ignoreversion


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


;SkyGz Info
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


[Files]



;SkyGz Ansi Ispp
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_SkyGz\Ansi\*; Excludes: Compil32.*; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Ansi and ISCmplr_Setup\SkyGz; Tasks:
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_SkyGz\Ansi\Compil32.exe; DestDir: {app}; Flags: ignoreversion; BeforeInstall: AddToDetaList; Components: Inno\Ansi and IDE\SkyGz; Tasks:
;SkyGz Unicode Ispp
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_SkyGz\Unicode\*; Excludes: Compil32.*; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Unicode and ISCmplr_Setup\SkyGz; Tasks:
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_SkyGz\Unicode\Compil32.exe; DestDir: {app}; Flags: ignoreversion; BeforeInstall: AddToDetaList; Components: Inno\Unicode and IDE\SkyGz; Tasks:

;SkyGz Examples
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_SkyGz\Examples\UninstallCodeDll.iss; DestDir: {app}\Examples; Flags: ignoreversion; BeforeInstall: AddToDetaList;
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_SkyGz\Examples\ExtendExample.iss; DestDir: {app}\Examples\SkyGz; Components: ISCmplr_Setup\SkyGz; Flags: ignoreversion; BeforeInstall: AddToDetaList;
;Help
;Source: {#CurDir}\Help\*; DestDir: {app}; Excludes: IsExtend.chm; Components: Inno; Languages: ChineseSimp; BeforeInstall: AddToDetaList; Flags: ignoreversion
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_SkyGz\Help\IsExtend.chm; DestDir: {app}; Components: ISCmplr_Setup\SkyGz; Languages: ChineseSimp; BeforeInstall: AddToDetaList; Flags: ignoreversion


Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack\isfiles\isscint.dll; DestDir: {app}; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: IDE\SkyGz

[INI]
Filename: {app}\Config.ini; Section: Options; Key: ShowStartupForm; String: 0; Components: IDE\SkyGz and EasySets\EditorSet
Filename: {app}\Config.ini; Section: Options; Key: UseWizard; String: 1; Components: IDE\SkyGz and EasySets\EditorSet
Filename: {app}\Config.ini; Section: Options; Key: Autosave; String: 0; Components: IDE\SkyGz and EasySets\EditorSet
Filename: {app}\Config.ini; Section: Options; Key: MakeBackups; String: 0; Components: IDE\SkyGz and EasySets\EditorSet
Filename: {app}\Config.ini; Section: Options; Key: FullPathInTitleBar; String: 1; Components: IDE\SkyGz and EasySets\EditorSet
Filename: {app}\Config.ini; Section: Options; Key: UndoAfterSave; String: 1; Components: IDE\SkyGz and EasySets\EditorSet
Filename: {app}\Config.ini; Section: Options; Key: PauseOnDebuggerExceptions; String: 1; Components: IDE\SkyGz and EasySets\EditorSet
Filename: {app}\Config.ini; Section: Options; Key: RunAsDifferentUser; String: 0; Components: IDE\SkyGz and EasySets\EditorSet
Filename: {app}\Config.ini; Section: Options; Key: UseSynHigh; String: 1; Components: IDE\SkyGz and EasySets\EditorSet
Filename: {app}\Config.ini; Section: Options; Key: EditorCursorPastEOL; String: 1; Components: IDE\SkyGz and EasySets\EditorSet
Filename: {app}\Config.ini; Section: Options; Key: TabWidth; String: 2; Components: IDE\SkyGz and EasySets\EditorSet
Filename: {app}\Config.ini; Section: Options; Key: EditorFontName; String: Courier New Ex; Components: IDE\SkyGz and EasySets\CodeFont
Filename: {app}\Config.ini; Section: Options; Key: EditorFontSize; String: 9; Components: IDE\SkyGz and EasySets\CodeFont
Filename: {app}\Config.ini; Section: Options; Key: EditorFontCharset; String: 0; Components: IDE\SkyGz and EasySets\CodeFont
Filename: {app}\Config.ini; Section: Options; Key: ShowToolbar; String: 1; Components: IDE\SkyGz and EasySets\EditorSet
Filename: {app}\Config.ini; Section: Options; Key: ShowStatusBar; String: 1; Components: IDE\SkyGz and EasySets\EditorSet
Filename: {app}\Config.ini; Section: Options; Key: AutoCompleteShortCut; String: 8224; Components: IDE\SkyGz and EasySets\EditorSet
Filename: {app}\Config.ini; Section: Options; Key: LowPriorityDuringCompile; String: 0; Components: IDE\SkyGz and EasySets\EditorSet

[UninstallDelete]
Type: files; Name: {app}\Config.ini; Components: IDE\SkyGz


;KngStr Info
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


[Files]
;KngStr Ansi Ispp
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_KngStr\Ansi\*; Excludes: Compil32.*,ISCC.exe; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Ansi and ISCmplr_Setup\KngStr; Tasks:
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_KngStr\Ansi\ISCC.exe; DestDir: {app}; Flags: ignoreversion; BeforeInstall: AddToDetaList; Components: Inno\Ansi and ISCC\KngStr; Tasks:
;KngStr Unicode Ispp
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_KngStr\Unicode\*; Excludes: Compil32.*,ISCC.exe; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Unicode and ISCmplr_Setup\KngStr; Tasks:
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack_KngStr\Unicode\ISCC.exe; DestDir: {app}; Flags: ignoreversion; BeforeInstall: AddToDetaList; Components: Inno\Unicode and ISCC\KngStr; Tasks:





[Code]
procedure OpenSite(Site: string);
var
  ResultCode: Integer;
begin
  if Pos('://', Site) = 0 then
    Site := 'http://' + Site;

  ShellExec('open', Site, '', '', SW_SHOWNORMAL, ewNoWait, ResultCode)
end;
[/Code]





[Files]
; Add the ISSkin DLL used for skinning Inno Setup installations.
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\ISSkinU.dll; DestDir: {tmp}; Flags: ignoreversion noencryption nocompression dontcopy

[Code]
procedure LoadSkin(lpszPath: String; lpszIniFileName: String);
external 'LoadSkin@{tmp}\ISSkinU.dll stdcall delayload';

procedure UnloadSkin();
external 'UnloadSkin@{tmp}\ISSkinU.dll stdcall delayload';

function ShowWindow(hWnd: Integer; uType: Integer): Integer;
external 'ShowWindow@user32.dll stdcall delayload';

function GetClassLong(Wnd: HWnd; Index: Integer): Longint;
external 'GetClassLongW@user32.dll stdcall delayload';
function SetClassLong(Wnd: HWnd; Index: Integer; NewLong: Longint): Longint;
external 'SetClassLongW@user32.dll stdcall delayload';

function CheckWin32Version(AMajor: Integer; AMinor: Integer): Boolean;
var
  WinVer: TWindowsVersion;
begin
  GetWindowsVersionEx(WinVer);
  Result := (WinVer.Major > AMajor) or
            ((WinVer.Major = AMajor) and
             (WinVer.Minor >= AMinor));
end;

procedure FormShadow(Handle: THandle);
begin
  if CheckWin32Version(5, 1) and (not CheckWin32Version(6, 0)) then
    SetClassLong(Handle, -26, GetClassLong(Handle, -26) or $20000);
end;

procedure InitSkin(SkinFile, Para: String);
begin
  if PDir ('ISSkinU.dll') = '' then Exit;
  if not FileExists(ExpandConstant('{tmp}\' + SkinFile + '.cjstyles')) then
  	ExtractTemporaryFile(SkinFile + '.cjstyles');
	LoadSkin(ExpandConstant('{tmp}\' + SkinFile + '.cjstyles'), Para);
end;

procedure DeinitSkin();
begin
  if not FileExists(ExpandConstant('{tmp}\ISSkinU.dll')) then Exit;
	ShowWindow(StrToInt(ExpandConstant('{wizardhwnd}')), 0);
	UnloadSkin();
end;


function RandomSkin(Skins: String): Boolean;
Var
  I: Integer;
  sl: TStringList;
begin
  sl := TStringList.Create;
  try
    sl.Text := Skins;
    I := Random(sl.Count);
    InitSkin(sl[I], '');
  finally
    sl.Free;
  end;
end;

[/Code]








[Code]
type
  TMyMsg = record
      hwnd: HWND;
      message: UINT;
      wParam: Longint;
      lParam: Longint;
      time: DWORD;
      pt: TPoint;
  end;
    
const
  PM_REMOVE = 1;
  oneMb = 1048576;


function PeekMessage(var lpMsg: TMyMsg; hWnd: HWND; wMsgFilterMin, wMsgFilterMax, wRemoveMsg: UINT): BOOL; external 'PeekMessageW@user32.dll stdcall';
function TranslateMessage(const lpMsg: TMyMsg): BOOL; external 'TranslateMessage@user32.dll stdcall';
function DispatchMessage(const lpMsg: TMyMsg): Longint; external 'DispatchMessageW@user32.dll stdcall';

Function OemToChar(lpszSrc, lpszDst: AnsiString): longint; external 'OemToCharW@user32.dll stdcall delayload';
function SetWindowLong(hWnd: HWND; nIndex: Integer; dwNewLong: Longint): Longint; external 'SetWindowLongW@user32.dll stdcall';
function GetWindowLong(hWnd, nIndex: Integer): Longint; external 'GetWindowLongW@user32 stdcall delayload';
function SetWindowText(hWnd: Longint; lpString: String): Longint; external 'SetWindowTextW@user32 stdcall delayload';

function GetTickCount: DWord; external 'GetTickCount@kernel32';


procedure AppProcessMessage;
var
  Msg: TMyMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

Function NumToStr(Float: Extended): String;
Begin
  Result:= Format('%.3n', [Float]); StringChange(Result, ',', '.');
  while ((Result[Length(Result)] = '0') or (Result[Length(Result)] = '.')) and (Length(Result) > 1) do
      SetLength(Result, Length(Result)-1);
End;

Function Size64(Hi, Lo: Integer): Extended;
Begin
  Result:= Lo;
  if Lo<0 then Result:= Result + $7FFFFFFF + $7FFFFFFF + 2;
  for Hi:= Hi-1 Downto 0 do
      Result:= Result + $7FFFFFFF + $7FFFFFFF + 2;
End;

function OemToAnsiStr( strSource: AnsiString): AnsiString;
var
  nRet : longint;
begin
  SetLength( Result, Length( strSource ) );
  nRet:= OemToChar( strSource, Result );
end;

Procedure SetTaskBarTitle(Title: String); var h: Integer;
Begin
  h:= GetWindowLong(MainForm.Handle, -8); if h <> 0 then SetWindowText(h, Title);
End;

Function TicksToTime(Ticks: DWord; h,m,s: String; detail: Boolean): String;
Begin
  if detail                               {hh:mm:ss format} then
      Result:= PADZ(IntToStr(Ticks/3600000), 2) +':'+ PADZ(IntToStr((Ticks/1000 - Ticks/1000/3600*3600)/60), 2) +':'+ PADZ(IntToStr(Ticks/1000 - Ticks/1000/60*60), 2)
  else if Ticks/3600 >= 1000              {more than hour}  then
      Result:= IntToStr(Ticks/3600000) +h+' '+ PADZ(IntToStr((Ticks/1000 - Ticks/1000/3600*3600)/60), 2) +m
  else if Ticks/60 >= 1000                {1..60 minutes}   then
      Result:= IntToStr(Ticks/60000) +m+' '+ PADZ(IntToStr(Ticks/1000 - Ticks/1000/60*60), 2) +s
 else Result:= IntToStr(Ticks/1000) +s    {less than one minute}
End;

function App_Handle: Longint;
begin
  with TForm.Create(nil) do
  begin
    Result := GetWindowLong(Handle, -8);
    Free;
  end;
end;

function IntToHex(Value: Integer; Digits: Integer): string;
begin
  Result := Format('%0:.' + IntToStr(Digits) + 'x', [Value]);
end;

[/Code]
[code]

Const
  GWL_EXSTYLE = (-20);
  WS_EX_LAYERED = $80000;
  LWA_ALPHA = $2;

  {$EXTERNALSYM AW_HOR_POSITIVE}
  AW_HOR_POSITIVE = $00000001;
  {$EXTERNALSYM AW_HOR_NEGATIVE}
  AW_HOR_NEGATIVE = $00000002;
  {$EXTERNALSYM AW_VER_POSITIVE}
  AW_VER_POSITIVE = $00000004;
  {$EXTERNALSYM AW_VER_NEGATIVE}
  AW_VER_NEGATIVE = $00000008;
  {$EXTERNALSYM AW_CENTER}
  AW_CENTER = $00000010;
  {$EXTERNALSYM AW_HIDE}
  AW_HIDE = $00010000;
  {$EXTERNALSYM AW_ACTIVATE}
  AW_ACTIVATE = $00020000;
  {$EXTERNALSYM AW_SLIDE}
  AW_SLIDE = $00040000;
  {$EXTERNALSYM AW_BLEND}
  AW_BLEND = $00080000;


function SetLayeredWindowAttributes(hwnd:HWND; crKey:Longint; bAlpha:byte; dwFlags:longint ):longint;
external 'SetLayeredWindowAttributes@user32 stdcall'; //º¯ÊýÉùÃ÷

function AnimateWindow(hWnd: HWND; dwTime: DWORD; dwFlags: DWORD): BOOL;
external 'AnimateWindow@user32 stdcall';


(*
procedure InitializeWizard();
begin
  AnimateWindow(StrToInt(ExpandConstant('{wizardhwnd}')), 500, AW_CENTER or AW_ACTIVATE);

  SetWindowLong(StrToInt(ExpandConstant('{wizardhwnd}')),GWL_EXSTYLE, WS_EX_LAYERED);
  SetLayeredWindowAttributes(StrToInt(ExpandConstant('{wizardhwnd}')), 0, 240, LWA_ALPHA);
end;

procedure DeinitializeSetup();
begin
   ANimateWindow(StrToInt(ExpandConstant('{wizardhwnd}')),500,AW_CENTER+AW_HOR_POSITIVE+AW_HIDE);
end;


ÔÚOnShow¼ÓÈëµ¯³öÊ½´°¿ÚÊÂ¼þ£º
procedure TForm1.FormShow(Sender: TObject);
begin
   ANimateWindow(Handle,200,AW_SLIDE+AW_HOR_NEGATIVE);
end;
¹Øµô´°¿Ú»¬¶¯ÊÂ¼þÔÚOnClose¼ÓÈë£º
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ANimateWindow(Handle,200,AW_SLIDE+AW_HOR_POSITIVE+AW_HIDE);
end;
¸öÈË¸Ð¾õ²»´í£¬ÔÚLeftÊôÐÔºÍTopÊôÐÔÏÂµ÷ÕûºÃÎ»ÖÃ¡£
AnImateWindowÊÇ¸öapi ÊôÐÔÓÃ·¨£º

º¯Êý¹¦ÄÜ£º¸Ãº¯ÊýÄÜÔÚÏÔÊ¾ÓëÒþ²Ø´°¿ÚÊ±ÄÜ²úÉúÌØÊâµÄÐ§¹û¡£ÓÐÁ½ÖÖÀàÐÍµÄ¶¯»­Ð§¹û£º¹ö¶¯¶¯»­ºÍ»¬¶¯¶¯»­¡£
º¯ÊýÔ­ÐÍ£ºBOOL   AnimateWindow£¨HWND   hWnd£¬DWORD   dwTime£¬DWORD   dwFlags£©£»
²ÎÊý£º
hWnd£ºÖ¸¶¨²úÉú¶¯»­µÄ´°¿ÚµÄ¾ä±ú¡£
dwTime£ºÖ¸Ã÷¶¯»­³ÖÐøµÄÊ±¼ä£¨ÒÔÎ¢Ãë¼Æ£©£¬Íê³ÉÒ»¸ö¶¯»­µÄ±ê×¼Ê±¼äÎª200Î¢Ãë¡£
dwFags£ºÖ¸¶¨¶¯»­ÀàÐÍ¡£Õâ¸ö²ÎÊý¿ÉÒÔÊÇÒ»¸ö»ò¶à¸öÏÂÁÐ±êÖ¾µÄ×éºÏ¡£±êÖ¾ÃèÊö£º
AW_SLIDE£ºÊ¹ÓÃ»¬¶¯ÀàÐÍ¡£È±Ê¡ÔòÎª¹ö¶¯¶¯»­ÀàÐÍ¡£µ±Ê¹ÓÃAW_CENTER±êÖ¾Ê±£¬Õâ¸ö±êÖ¾¾Í±»ºöÂÔ¡£
AW_ACTIVE£º¼¤»î´°¿Ú¡£ÔÚÊ¹ÓÃÁËAW_HIDE±êÖ¾ºó²»ÒªÊ¹ÓÃÕâ¸ö±êÖ¾¡£
AW_BLEND£ºÊ¹ÓÃµ­³öÐ§¹û¡£Ö»ÓÐµ±hWndÎª¶¥²ã´°¿ÚµÄÊ±ºò²Å¿ÉÒÔÊ¹ÓÃ´Ë±êÖ¾¡£
AW_HIDE£ºÒþ²Ø´°¿Ú£¬È±Ê¡ÔòÏÔÊ¾´°¿Ú¡£
AW_CENTER£ºÈôÊ¹ÓÃÁËAW_HIDE±êÖ¾£¬ÔòÊ¹´°¿ÚÏòÄÚÖØµþ£»ÈôÎ´Ê¹ÓÃAW_HIDE±êÖ¾£¬ÔòÊ¹´°¿ÚÏòÍâÀ©Õ¹¡£
AW_HOR_POSITIVE£º×Ô×óÏòÓÒÏÔÊ¾´°¿Ú¡£¸Ã±êÖ¾¿ÉÒÔÔÚ¹ö¶¯¶¯»­ºÍ»¬¶¯¶¯»­ÖÐÊ¹ÓÃ¡£µ±Ê¹ÓÃAW_CENTER±êÖ¾Ê±£¬¸Ã±êÖ¾½«±»ºöÂÔ¡£
AW_HOR_NEGATIVE£º×ÔÓÒÏò×óÏÔÊ¾´°¿Ú¡£¸Ã±êÖ¾¿ÉÒÔÔÚ¹ö¶¯¶¯»­ºÍ»¬¶¯¶¯»­ÖÐÊ¹ÓÃ¡£µ±Ê¹ÓÃAW_CENTER±êÖ¾Ê±£¬¸Ã±êÖ¾½«±»ºöÂÔ¡£

AW_VER_POSITIVE£º×Ô¶¥ÏòÏÂÏÔÊ¾´°¿Ú¡£¸Ã±êÖ¾¿ÉÒÔÔÚ¹ö¶¯¶¯»­ºÍ»¬¶¯¶¯»­ÖÐÊ¹ÓÃ¡£µ±Ê¹ÓÃAW_CENTER±êÖ¾Ê±£¬¸Ã±êÖ¾½«±»ºöÂÔ¡£
AW_VER_NEGATIVE£º×ÔÏÂÏòÉÏÏÔÊ¾´°¿Ú¡£¸Ã±êÖ¾¿ÉÒÔÔÚ¹ö¶¯¶¯»­ºÍ»¬¶¯¶¯»­ÖÐÊ¹ÓÃ¡£µ±Ê¹ÓÃAW_CENTER±êÖ¾Ê±£¬¸Ã±êÖ¾½«±»ºöÂÔ¡£
·µ»ØÖµ£ºÈç¹ûº¯Êý³É¹¦£¬·µ»ØÖµÎª·ÇÁã£»Èç¹ûº¯ÊýÊ§°Ü£¬·µ»ØÖµÎªÁã¡£ÔÚÏÂÁÐÇé¿öÏÂº¯Êý½«Ê§°Ü£º
´°¿ÚÊ¹ÓÃÁË´°¿Ú±ß½ç£»´°¿ÚÒÑ¾­¿É¼ûÈÔÒªÏÔÊ¾´°¿Ú£»´°¿ÚÒÑ¾­Òþ²ØÈÔÒªÒþ²Ø´°¿Ú¡£ÈôÏë»ñµÃ¸ü¶à´íÎóÐÅÏ¢£¬Çëµ÷ÓÃGetLastErrorº¯Êý¡£
±¸×¢£º¿ÉÒÔ½«AW_HOR_POSITIVE»òAW_HOR_NEGTVEÓëAW_VER_POSITVE»òAW_VER_NEGATIVE×éºÏÀ´¼¤»îÒ»¸ö´°¿Ú¡£
          ¿ÉÄÜÐèÒªÔÚ¸Ã´°¿ÚµÄ´°¿Ú¹ý³ÌºÍËüµÄ×Ó´°¿ÚµÄ´°¿Ú¹ý³ÌÖÐ´¦ÀíWM_PRINT»òWM_PRINTCLIENTÏûÏ¢¡£¶Ô»°¿ò£¬¿ØÖÆ£¬¼°¹²ÓÃ¿ØÖÆÒÑ´¦ÀíWM_PRINTCLIENTÏûÏ¢£¬È±Ê¡´°¿Ú¹ý³ÌÒ²ÒÑ´¦ÀíWM_PRINTÏûÏ¢¡£



´°Ìå µÄOnShowÊÂ¼þ´¦Àíº¯ÊýÖÐ¼ÓÈëÏÂÃæµÄ´úÂë:
AnimateWindow(Self.Handle, 500, AW_BLEND or AW_ACTIVATE);

OnCloseÊÂ¼þÖÐ¼ÓÈë
AnimateWindow(Self.Handle, 500,AW_BLEND or AW_HIDE);

*)
[/Code]


[Code]
procedure Nsis_Header(LeftHeader: Boolean);
begin
  with WizardForm do
  begin
    WizardSmallBitmapImage.Stretch := True;

    if LeftHeader then
    begin
      WizardSmallBitmapImage.Left := 0;
      WizardSmallBitmapImage.Top := 0;
      WizardSmallBitmapImage.ClientWidth := ScaleX(150);
      WizardSmallBitmapImage.ClientHeight := MainPanel.ClientHeight;

      PageNameLabel.Width := MainPanel.ClientWidth - ScaleX(170);
      PageNameLabel.Left := WizardSmallBitmapImage.ClientWidth + ScaleX(15);
      PageDescriptionLabel.Width := MainPanel.ClientWidth - ScaleX(180);
      PageDescriptionLabel.Left := WizardSmallBitmapImage.ClientWidth + ScaleX(25);
    end
    else
    begin
      WizardSmallBitmapImage.Left := WizardSmallBitmapImage.Left - 90;
      WizardSmallBitmapImage.Width := MainPanel.Width - WizardSmallBitmapImage.Left;

      PageDescriptionLabel.Width := PageDescriptionLabel.Width - 90;
      PageNameLabel.Width := PageNameLabel.Width - 90;
    end;
  end;
end;

procedure ShowDetaBtnOnClick(Sender: TObject); forward;
procedure DetailInfo; forward;

var
  DetaList: TNewListBox;
  ShowDetaBtn: TNewButton;
  DetaLabel: TNewStaticText;
  LastDetaDir: string;

procedure DetailInfo;
begin
  with WizardForm.StatusLabel do
  begin
    Visible := False;
  end;

  with WizardForm.FilenameLabel do
  begin
    Visible := False;
  end;

  with WizardForm.ProgressGauge do
  begin
    Top := ScaleY(18);
  end;

  { DetaList }
  DetaList := TNewListBox.Create(WizardForm);
  with DetaList do
  begin
    Parent := WizardForm.InstallingPage;
    Left := ScaleX(0);
    Top := WizardForm.ProgressGauge.Top + WizardForm.ProgressGauge.Height + ScaleY(5);
    Width := WizardForm.ProgressGauge.Width;
    Height := WizardForm.InstallingPage.Height - Top - 5;
    TabOrder := 4;
    Visible := False;
  end;

  { ShowDetaBtn }
  ShowDetaBtn := TNewButton.Create(WizardForm);
  with ShowDetaBtn do
  begin
    Parent := WizardForm.InstallingPage;
    Left := ScaleX(0);
    Top := DetaList.Top;
    Width := ScaleX(75);
    Height := ScaleY(22);
    Caption := 'ÏÔÊ¾Ï¸½Ú(&D)';
    TabOrder := 3;
  end;

  { DetaLabel }
  DetaLabel := TNewStaticText.Create(WizardForm);
  with DetaLabel do
  begin
    Parent := WizardForm.InstallingPage;
    Left := ScaleX(0);
    Top := ScaleY(0);
    Width := DetaList.Width;
    Height := ScaleY(16);
    WordWrap := False;
    AutoSize := False;
    ShowAccelChar := False;
    TabOrder := 5;
  end;

  ShowDetaBtn.OnClick := @ShowDetaBtnOnClick;
end;

procedure ShowDetaBtnOnClick(Sender: TObject);
begin
  ShowDetaBtn.Visible := False;
  DetaList.Visible := True;
end;

procedure AddToDetaList;
begin
  if ExpandConstant(CurrentFileName) = '' then Exit;

  if Lowercase(ExtractFileExt(ExpandConstant(CurrentFileName))) = '.lnk' then
  begin
    if Pos('{group}', Lowercase(CurrentFileName)) > 0 then
    begin
      if LastDetaDir <> ExtractFileDir(ExpandConstant('{group}')) then
      begin
        LastDetaDir := ExtractFileDir(ExpandConstant('{group}'))
        DetaLabel.Caption := '´´½¨ÎÄ¼þ¼Ð:  ' + LastDetaDir;
        DetaList.Items.Add(DetaLabel.Caption);
      end;
    end;

    DetaLabel.Caption := '´´½¨¿ì½Ý·½Ê½£º' + ExpandConstant(CurrentFileName);
  end
  else
  begin
    if LastDetaDir <> ExtractFileDir(ExpandConstant(CurrentFileName)) then
    begin
      LastDetaDir := ExtractFileDir(ExpandConstant(CurrentFileName))
      DetaLabel.Caption := 'Êä³öÄ¿Â¼:  ' + LastDetaDir;
      DetaList.Items.Add(DetaLabel.Caption);
    end;

    DetaLabel.Caption := '³éÈ¡:  ' + ExtractFileName(ExpandConstant(CurrentFileName));
  end;

  DetaList.Items.Add(DetaLabel.Caption);

  DetaList.ItemIndex := DetaList.Items.Count - 1;
end;

procedure CurPageChanged_DetaInfo(CurPageID: Integer);
begin
  if CurPageID = wpFinished then
  begin
    DetaList.Items.Append('´´½¨Ð¶ÔØ³ÌÐò£º' + ExpandConstant('{uninstallexe}'));
    DetaLabel.Caption := 'ÒÑÍê³É';
    DetaList.Items.Add(DetaLabel.Caption);

    with WizardForm do
    begin
      PageNameLabel.Caption := '°²×°Íê³É';
      PageDescriptionLabel.Caption := '°²×°³ÌÐòÒÑ¾­³É¹¦Íê³É°²×°¡£';
      InnerNotebook.ActivePage := InstallingPage;
      OuterNotebook.ActivePage := InnerPage;
      NextButton.Caption := '¹Ø±Õ(&L)';
      BackButton.Visible := True;
      BackButton.Enabled := False;
      CancelButton.Visible := True;
      CancelButton.Enabled := False;
    end;
    DetaList.ItemIndex := DetaList.Items.Count - 1;
  end;
end;

function NextButtonClick_DetaInfo(CurPageID: Integer): Boolean;
begin
  Result := True;

  if (DetaLabel.Caption = 'ÒÑÍê³É') and (WizardForm.OuterNotebook.ActivePage = WizardForm.InnerPage) then
  begin
    Result := False;

    WizardForm.OuterNotebook.ActivePage := WizardForm.FinishedPage;
    WizardForm.NextButton.Caption := SetupMessage(msgButtonFinish);
  end;
end;

procedure CancelButtonClick_DetaInfo(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  Confirm := False;

  if MsgBox(SetupMessage(msgExitSetupMessage), mbConfirmation, MB_YESNO or MB_DEFBUTTON2) = IDYES then
  begin
    WizardForm.StatusLabel.Show;
    WizardForm.FilenameLabel.Show;

    DetaLabel.Hide;
    ShowDetaBtn.Hide;
    DetaList.Hide;
  end
  else Cancel := False;
end;

var
  lbl_PreEx: TLabel;

function GetModuleHandle(lpModuleName: LongInt): LongInt;
external 'GetModuleHandleW@kernel32.dll stdcall';
function ExtractIcon(hInst: LongInt; lpszExeFileName: String; nIconIndex: LongInt): LongInt;
external 'ExtractIconW@shell32.dll stdcall';
function DrawIconEx(hdc: LongInt; xLeft, yTop: Integer; hIcon: LongInt; cxWidth, cyWidth: Integer; istepIfAniCur: LongInt; hbrFlickerFreeDraw, diFlags: LongInt): LongInt;
external 'DrawIconEx@user32.dll stdcall';
function DestroyIcon(hIcon: LongInt): LongInt;
external 'DestroyIcon@user32.dll stdcall';

const
  DI_NORMAL = 3;

function PreExtractInfo(ExFiles: string): TForm;
var
  Rect: TRect;
  hIcon: LongInt;
begin
  Result := TForm.Create(nil);
  with Result do
  begin
    Position := poScreenCenter;
    BorderStyle := bsNone;
    FormStyle := fsStayOnTop;
    Width := ScaleX(260);
    Height := ScaleY(70);
    Font.Name := 'tahoma';
    Font.Size := 8;
  end;

  try
    Rect.Left := 0;
    Rect.Top := 0;
    Rect.Right := 32;
    Rect.Bottom := 32;

    hIcon := ExtractIcon(GetModuleHandle(0), ExpandConstant('{srcexe}'), 0);
    try
      with TBitmapImage.Create(Result) do begin
        with Bitmap do begin
          Width := 32;
          Height := 32;
          Canvas.Brush.Color := Result.Color;
          Canvas.FillRect(Rect);
          DrawIconEx(Canvas.Handle, 0, 0, hIcon, 32, 32, 0, 0, DI_NORMAL);
        end;
        Parent := Result;
        Top := ScaleY(20);
        Left := ScaleX(20);
      end;
    finally
      DestroyIcon(hIcon);
    end;
  except
  end;

  with TLabel.Create(Result) do
  begin
    Parent := Result;
    WordWrap := True;
    AutoSize := False;
    ParentFont := True;
    Left := ScaleX(70);
    Top := ScaleY(15);
    Width := Result.Width - Left - ScaleX(25);
    Height := Result.Height - Top - ScaleY(25);
    Caption := '°²×°³ÌÐòÕýÔÚ¼ÓÔØ£¬ÇëÉÔºò... ' + #13#10;
  end;

  lbl_PreEx := TLabel.Create(Result);
  with lbl_PreEx do
  begin
    Parent := Result;
    ParentFont := True;
    Left := ScaleX(70);
    Top := Result.Height - ScaleY(35);
    Caption := 'ÒÑ¼ÓÔØ£º0%';
  end;
end;
[/Code]







[Code]
procedure ModifyUISize(Ctrl: TComponent);
var
  i: Integer;
begin
  with TWinControl(Ctrl) do
  begin
    for i := 0 to ControlCount - 1 do
    begin
      if not (Controls[i] is TBitmapImage) then
        if TWinControl(Controls[i]).ControlCount > 0 then  ModifyUISize(Controls[i])
        else
        begin
          if TWinControl(Controls[i]).Width = WizardForm.InnerNotebook.Width - ScaleX(30) then
            TWinControl(Controls[i]).Width := WizardForm.InnerNotebook.Width
          else
          if (TWinControl(Controls[i]).Left  = ScaleX(0)) and (TWinControl(Controls[i]).Width > WizardForm.InnerNotebook.Width / 2) then
            TWinControl(Controls[i]).Width := TWinControl(Controls[i]).Width + ScaleX(30)
          else
          if TWinControl(Controls[i]).Left + TWinControl(Controls[i]).Width  = WizardForm.InnerNotebook.Width - ScaleX(30) then
          begin
            if TWinControl(Controls[i]).Left > WizardForm.InnerNotebook.Width / 2 then
              TWinControl(Controls[i]).Left := WizardForm.InnerNotebook.Width - TWinControl(Controls[i]).Width
            else
              TWinControl(Controls[i]).Width := TWinControl(Controls[i]).Width + ScaleX(30);
          end;
        end;
    end;
  end;
end;

var
  chk_Accpected: TCheckBox;

procedure chk_AccpectedClick(Sender: TObject);
begin
  WizardForm.LicenseAcceptedRadio.Checked := chk_Accpected.Checked;
  WizardForm.LicenseNotAcceptedRadio.Checked := not chk_Accpected.Checked;
end;

procedure ModifyUI();
begin
  with WizardForm.LicenseMemo do
  begin
    ParentFont := False;
  end;

  with WizardForm.InnerNotebook do
  begin
    Left := Left - ScaleX(15);
    Width := Width + ScaleX(30);

    ModifyUISize(WizardForm.InnerNotebook);
  end;

  with WizardForm do
  begin
    LicenseAcceptedRadio.Hide;
    LicenseNotAcceptedRadio.Hide;
    LicenseMemo.Top := LicenseMemo.Top - ScaleY(10);
    LicenseMemo.Height := LicenseMemo.Height + LicenseAcceptedRadio.Height + ScaleY(10);;

    ReadyMemo.ScrollBars := ssVertical;
  end;

  Nsis_Header(False);

  chk_Accpected := TCheckBox.Create(WizardForm);
  with chk_Accpected do
  begin
    chk_Accpected.Parent := WizardForm.LicensePage;
    Top := WizardForm.LicenseNotAcceptedRadio.Top - ScaleY(5);
    Left := WizardForm.LicenseAcceptedRadio.Left;
    Width := WizardForm.LicenseAcceptedRadio.Width;
    Caption := WizardForm.LicenseAcceptedRadio.Caption;
    OnClick := @chk_AccpectedClick;
  end;
end;

[/Code]




[Code]

procedure AboutButtonOnClick(Sender: TObject);
begin
  MsgBox(CustomMessage('Btn_About_Text'), mbInformation, MB_OK);
end;

procedure BevelLabelOnClick(Sender: TObject);
begin
  OpenSite(CustomMessage('BevelLabel_Url'));
end;

procedure FinishOnClick(Sender: TObject);
begin
  OpenSite(CustomMessage('Lbl_FinishTip_Url'));
end;

procedure AddLinkandInfo;
var
  AboutButton: TButton;
  FinishTip: TNewStaticText;
begin

  AboutButton := TButton.Create(WizardForm);
  with AboutButton do
  begin
    Left := WizardForm.ClientWidth - WizardForm.CancelButton.Left - WizardForm.CancelButton.Width;
    Top := WizardForm.CancelButton.Top;
    Width := WizardForm.CancelButton.Width;
    Height := WizardForm.CancelButton.Height;
    Caption := CustomMessage('Btn_About_Caption');
    OnClick := @AboutButtonOnClick;
    Parent := WizardForm;
  end;

  with WizardForm.BeveledLabel do
  begin
    Cursor := crHand;
    OnClick := @BevelLabelOnClick;
    Font.Color:= CLGREEN;
    Enabled := True;
  end;

	FinishTip := TNewStaticText.Create(WizardForm.FinishedPage);
	with FinishTip do
	begin
	  Parent := WizardForm.FinishedPage;
	  Caption := CustomMessage('Lbl_FinishTip_Caption');
	  Left := WizardForm.FinishedLabel.Left;
	  Top := WizardForm.OuterNotebook.Height - ScaleY(20);
	  Width := ScaleX(80);
	  Height := ScaleY(14);
	  Font.Color := clblue;
	  Cursor := crHand;
	  OnClick := @FinishOnClick;
	end;

end;

[/Code]
;µ¼Èë²å¼þ¹¦ÄÜ
; Äåìîíñòðàöèîííûé ñêðèïò ISWin7 v0.5
;
; [+] Çíà÷èòåëüí?ïåðåäåëàíà îòðèñîâê?ïðîçðà÷íûõ îáëàñòåé
;
; Ïîääåðæê?Windows Vista áûëà íåêîððåòíà âñëåäñòâèè ÷åãî áûëà óäàëåí?
;
; Ýò?òåñòîâûé ñêðèïò ïîçâîëÿåò ñäåëàò?ïðîçðà÷íûì?êð? èë?âñ?îêíî öåëèêî?
; Ðàáîòàåò ?Windows 7, Windows 8
;
; ?Windows XP ?Windows Vista îí ïðîïóñêàåò èíèöèàëèçàöè?
; ÷ò?íå ìåøàåò ðàáîòîñïîñîáíîñò?ñåòàïíèê??ýòèõ îïåðàöèîííûõ ñèñòåìàõ
;
; Ñîçäàòåë? VoLT ( Vo1T íà Ru-Board )



[Files]
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\ISWin7.dll; DestDir: {tmp}; Flags: ignoreversion noencryption nocompression dontcopy

[Code]
procedure iswin7_add_glass(Handle:HWND; Left, Top, Right, Bottom : Integer; GDIPLoadMode: boolean);
external 'iswin7_add_glass@{tmp}\ISWin7.dll stdcall delayload';

procedure iswin7_add_button(Handle:HWND);
external 'iswin7_add_button@{tmp}\ISWin7.dll stdcall delayload';

procedure iswin7_free;
external 'iswin7_free@{tmp}\ISWin7.dll stdcall delayload';

[/Code]








[Files]
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\ISTask.dll; DestDir: {tmp}; Flags: ignoreversion noencryption nocompression dontcopy

[Code]
function RunTask(FileName: AnsiString; bFullpath: Boolean): Boolean;
external 'RunTask@{tmp}\ISTask.dll stdcall delayload';

function KillTask(ExeFileName: AnsiString): Integer;
external 'KillTask@{tmp}\ISTask.dll stdcall delayload';

function RunTasks(Tasks: AnsiString; bFullpath: Boolean; CheckAll: Boolean): Boolean;
var
  sl: TStringList;
  i: Integer;
begin
  Result := False;
  sl := TStringList.Create;
  try
    sl.Text := Tasks;
    if sl.Count > 0 then
      for i := 0 to sl.Count -1 do 
      begin
        if CheckAll then
        begin
          if i = 0 then Result := RunTask(sl[i], bFullpath)
          else
            Result := Result and RunTask(sl[i], bFullpath);
        end
        else
        if RunTask(sl[i], bFullpath) then
        begin
          Result := True;
          Break;
        end;
      end;
  finally
    sl.Free;
  end;
end;

procedure KillTasks(Tasks: AnsiString);
var
  sl: TStringList;
  i: Integer;
begin
  sl := TStringList.Create;
  try
    sl.Text := Tasks;
    if sl.Count > 0 then
      for i := 0 to sl.Count -1 do KillTask(sl[i]);
  finally
    sl.Free;
  end;
end;

[/Code]




[Files]
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\WaterLib.dll; DestDir: {tmp}; Flags: ignoreversion noencryption nocompression dontcopy

[Code]
function WaterInit(HWD: HWND; DrawTextSize, DrawBmpSize: Integer):Integer;
external 'WaterInit@{tmp}\WaterLib.dll stdcall delayload';

Procedure WaterSetBounds(Handle, Left, Top, Width, Height: Integer);
external 'WaterSetBounds@{tmp}\WaterLib.dll stdcall delayload';

Procedure WaterSetType(Handle, ClickBlob, Damping, RandomBlob, RandomDelay, TrackBlob: Integer);
external 'WaterSetType@{tmp}\WaterLib.dll stdcall delayload';

Procedure WaterSetFile(Handle: Integer; FileName: AnsiString);
external 'WaterSetFile@{tmp}\WaterLib.dll stdcall delayload';

Procedure WaterSetActive(Handle: Integer; Active: Boolean);
external 'WaterSetActive@{tmp}\WaterLib.dll stdcall delayload';

Procedure WaterSetParentWindow(Handle: Integer; HWND: HWND);
external 'WaterSetParentWindow@{tmp}\WaterLib.dll stdcall delayload';

Procedure WaterClear(Handle: Integer);
external 'WaterClear@{tmp}\WaterLib.dll stdcall delayload';

Procedure WaterFree(Handle: Integer);
external 'WaterFree@{tmp}\WaterLib.dll stdcall delayload';

Procedure WaterAllFree;
external 'WaterAllFree@{tmp}\WaterLib.dll stdcall delayload';

Procedure WaterSupportAuthor(SupportAuthor: Boolean);
external 'WaterSupportAuthor@{tmp}\WaterLib.dll stdcall delayload';

procedure WaterDrawTextBrush(Handle, Index: Integer; BrushColor: TColor; BrushStyle: TBrushStyle);
external 'WaterDrawTextBrush@{tmp}\WaterLib.dll stdcall delayload';

Procedure WaterDrawTextFont(Handle, Index: Integer; FontName: AnsiString; FontSize: Integer; FontColor: TColor; FontCharset: Byte);
external 'WaterDrawTextFont@{tmp}\WaterLib.dll stdcall delayload';

procedure WaterDrawBmpBrush(Handle, Index: Integer; BrushColor: TColor; BrushStyle: TBrushStyle);
external 'WaterDrawBmpBrush@{tmp}\WaterLib.dll stdcall delayload';

Procedure WaterDrawBmpFont(Handle, Index: Integer; FontName: AnsiString; FontSize: Integer; FontColor: TColor; FontCharset: Byte);
external 'WaterDrawBmpFont@{tmp}\WaterLib.dll stdcall delayload';

Procedure WaterDrawBitmap(Handle, Index: Integer; X, Y: Integer; HBitmap: LongWord; Transparent: Boolean; TransparentColor: TColor);
external 'WaterDrawBitmap@{tmp}\WaterLib.dll stdcall delayload';

Procedure WaterDrawText(Handle, Index: Integer; X, Y: Integer; S: AnsiString);
external 'WaterDrawText@{tmp}\WaterLib.dll stdcall delayload';

[/Code]




[Files]
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\winmsgctrl.dll; DestDir: {tmp}; Flags: ignoreversion noencryption nocompression dontcopy

[Code]


function UnhookWinHookEx(): Boolean; external 'UnhookWinHookEx@{tmp}\winmsgctrl.dll stdcall delayload';

[/Code]



[Files]
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\ItDownload.dll; DestDir: {tmp}; Flags: ignoreversion noencryption nocompression dontcopy
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\ItDownload\languages\*.ini; DestDir: {tmp}; Flags: ignoreversion noencryption nocompression dontcopy

[Code]
(*
 Inno Tools Downloader DLL
 Copyright (C) Sherlock Software 2008
 Version 0.3.5

 Contact:
  The author, Nicholas Sherlock, at nick@sherlocksoftware.org.
  Comments, questions and suggestions welcome.

 Website:
  http://www.sherlocksoftware.org/

 History:
  0.3.5 - Moved strings used in the updater example to the language file, so that they
          may be more easily translated.
          Added event functions to support the example of integration with InnoTools tray.
          Fixes bugs that could cause the download to hang until
          some mouse movements were received.
          Allows "detailed mode" to be turned on with ITD_SetOption
          Allows the HTTP agent to be set with ITD_SetOption
  0.3.4 - Added Brazilian Portuguese translation by Ronaldo Souza
  0.3.3 - The "Hilbrand Edskes" release :), lots of suggestions and corrections from him, thank you!
          The "Retry" button is now translated.
          The "Current file" progress bar is hidden if only one file is being downloaded.
          The page's title and description are updated in the case of failed downloads.
          Several updates to the translations.
          Several small GUI fixes.
  0.3.2 - Minor tweaks to the English language file and the translation example script (example4.iss)
          Added Dutch translation by Hilbrand Edskes
          Added French translation by Néo
  0.3.1 - Added language file examples, fixed several missing language strings
          Preliminary support for proxy server autodetection
          Allows the size of a file to be queried with ITD_GetFileSize
          Several small bugfixes
  0.3.0 - Properly supports timeouts.
          Fixes bug with time remaining.
          DLL is required again.
          Supports localization through ITD_LoadStrings, ITD_SetString
          Add mirrors for files
          Post HTTP documents
          Quick view and detailed view
  0.2.2 - Fixed empty strings '' in calls and added timeouts
  0.2.1 - Renamed identifiers to avoid name clashes
  0.2.0 - Converted from DLL to pure native code
*)

procedure ITD_Cancel;
  external 'itd_cancel@{tmp}\ItDownload.dll stdcall delayload';

procedure ITD_ClearFiles;
  external 'itd_clearfiles@{tmp}\ItDownload.dll stdcall delayload';

function ITD_DownloadFile(url: PAnsiChar; destfilename: PAnsiChar): integer;
  external 'itd_downloadfile@{tmp}\ItDownload.dll stdcall delayload';

function ITD_GetResultLen: integer;
  external 'itd_getresultlen@{tmp}\ItDownload.dll stdcall delayload';

procedure ITD_GetResultString(buffer: PAnsiChar; maxlen: integer);
  external 'itd_getresultstring@{tmp}\ItDownload.dll stdcall delayload';

procedure ITD_Internal_InitUI(HostHwnd: dword);
  external 'itd_initui@{tmp}\ItDownload.dll stdcall delayload';

function ITD_Internal_LoadStrings(filename: PAnsiChar): boolean;
  external 'itd_loadstrings@{tmp}\ItDownload.dll stdcall delayload';

procedure ITD_Internal_SetOption(option, value: PAnsiChar);
  external 'itd_setoption@{tmp}\ItDownload.dll stdcall delayload';

function ITD_Internal_GetFileSize(url: PAnsiChar; var size: Cardinal): boolean;
  external 'itd_getfilesize@{tmp}\ItDownload.dll stdcall delayload';

function ITD_Internal_GetString(index: integer): boolean;
  external 'itd_getstring@{tmp}\ItDownload.dll stdcall delayload';

function ITD_Internal_GetOption(option: PAnsiChar; buffer: PAnsiChar; length: integer): integer;
  external 'itd_getoption@{tmp}\ItDownload.dll stdcall delayload';

procedure ITD_Internal_SetString(index: integer; value: PAnsiChar);
  external 'itd_setstring@{tmp}\ItDownload.dll stdcall delayload';

procedure ITD_Internal_AddFile(url: PAnsiChar; destfilename: PAnsiChar);
  external 'itd_addfile@{tmp}\ItDownload.dll stdcall delayload';

procedure ITD_Internal_AddMirror(url: PAnsiChar; destfilename: PAnsiChar);
  external 'itd_addmirror@{tmp}\ItDownload.dll stdcall delayload';

procedure ITD_Internal_AddFileSize(url: PAnsiChar; destfilename: PAnsiChar; size: integer);
  external 'itd_addfilesize@{tmp}\ItDownload.dll stdcall delayload';

function ITD_Internal_DownloadFiles(surface: hwnd): integer;
  external 'itd_downloadfiles@{tmp}\ItDownload.dll stdcall delayload';

function ITD_FileCount: integer;
  external 'itd_filecount@{tmp}\ItDownload.dll stdcall delayload';

function ITD_Internal_PostPage(url, buffer: PAnsiChar; length: integer): boolean;
  external 'itd_postpage@{tmp}\ItDownload.dll stdcall delayload';


const
  ITDERR_SUCCESS = 0;
  ITDERR_USERCANCEL = 1;
  ITDERR_ERROR = 3;

  {Constants for Language String indexes:}
  ITDS_DownloadFailed = 104;

  ITDS_TitleCaption = 200;
  ITDS_TitleDescription = 201;

  ITDS_MessageFailRetryContinue = 250;
  ITDS_MessageFailRetry = 251;

  ITDS_Retry = 502;

  {Constants for language strings of updater example}
  ITDS_Update_Caption = 600;
  ITDS_Update_Description = 601;
  ITDS_Update_Checking = 602;
  ITDS_Update_NewAvailable = 603;
  ITDS_Update_NoNewAvailable = 604;
  ITDS_Update_WantToCheck = 605;
  ITDS_Update_Failed = 606;
  ITDS_Update_WillLaunch = 607;
  ITDS_Update_WillLaunchWithPath = 608;

  ITD_Event_DownloadPageEntered = 1;
  ITD_Event_DownloadPageLeft = 2;
  ITD_Event_DownloadFailed = 3;

var
  itd_allowcontinue: boolean;
  itd_retryonback: boolean;

  ITD_AfterSuccess: procedure(downloadPage: TWizardPage);
  ITD_EventHandler: procedure(event: integer);

procedure ITD_DownloadFiles();
begin
  ITD_Internal_DownloadFiles(0);
end;

procedure ITD_AddFile(const URL, filename: AnsiString);
begin
  ITD_Internal_AddFile(URL, filename);
end;

procedure ITD_AddMirror(const URL, filename: AnsiString);
begin
  ITD_Internal_AddMirror(URL, filename);
end;

procedure ITD_AddFileSize(const URL, filename: AnsiString; size: integer);
begin
  ITD_Internal_AddFileSize(URL, filename, size);
end;

function ITD_HandleSkipPage(sender: TWizardPage): boolean;
begin
  result := (itd_filecount = 0);
end;

procedure ITD_SetString(index: integer; value: AnsiString);
begin
  itd_internal_setstring(index, value);
end;

function ITD_GetFileSize(const url: AnsiString; var size: cardinal): boolean;
begin
  result := itd_internal_getfilesize(PAnsiChar(url), size);
end;

function ITD_LoadStrings(const filename: AnsiString): boolean;
begin
  result := itd_internal_loadstrings(filename);
end;

function ITD_GetString(index: integer): AnsiString;
begin
  itd_internal_getstring(index);
  setlength(result, ITD_GetResultLen);
  ITD_GetResultString(PAnsiChar(result), length(result));
end;

procedure ITD_NowDoDownload(sender: TWizardPage);
var err: integer;
begin
  wizardform.backbutton.enabled := false;
  wizardform.nextbutton.enabled := false;

  sender.caption := ITD_GetString(ITDS_TitleCaption);
  sender.description := ITD_GetString(ITDS_TitleDescription);

  err := ITD_Internal_DownloadFiles(sender.surface.handle);

  case err of
    ITDERR_SUCCESS: begin
        wizardform.nextbutton.enabled := true;
        wizardform.nextbutton.onclick(nil);

        if itd_aftersuccess <> nil then
          itd_aftersuccess(sender);
      end;
    ITDERR_USERCANCEL: ; //Don't show a message, this happens on setup close and cancel click
  else begin
      wizardform.backbutton.caption := ITD_GetString(ITDS_Retry);
      wizardform.backbutton.enabled := true;
      wizardform.backbutton.show();
      itd_retryonback := true;

      wizardform.nextbutton.enabled := itd_allowcontinue;

      if ITD_EventHandler <> nil then
        ITD_EventHandler(ITD_Event_DownloadFailed);

      if itd_allowcontinue then begin //Download failed, we can retry, continue, or exit
        sender.caption := ITD_GetString(ITDS_DownloadFailed);
        sender.description := ITD_GetString(ITDS_MessageFailRetryContinue);

        MsgBox(ITD_GetString(ITDS_MessageFailRetryContinue), mbError, MB_OK)
      end else begin //Download failed, we must retry or exit setup
        sender.caption := ITD_GetString(ITDS_DownloadFailed);
        sender.description := ITD_GetString(ITDS_MessageFailRetry);

        MsgBox(ITD_GetString(ITDS_MessageFailRetry), mbError, MB_OK)
      end;
    end;
  end;
end;

procedure ITD_HandleShowPage(sender: TWizardPage);
begin
  wizardform.nextbutton.enabled := false;
  wizardform.backbutton.hide();

  if ITD_EventHandler <> nil then
    ITD_EventHandler(ITD_Event_DownloadPageEntered);

  itd_nowdodownload(sender);
end;

function ITD_HandleBackClick(sender: TWizardpage): boolean;
begin
  result := false;
  if itd_retryonback then begin
    itd_retryonback := false;
    wizardform.backbutton.hide();
    itd_nowdodownload(sender);
  end;
end;

function ITD_HandleNextClick(sender: TWizardpage): boolean;
begin
  if ITD_EventHandler <> nil then
    ITD_EventHandler(ITD_Event_DownloadPageLeft);

  result := true;
end;

procedure ITD_Init;
begin
end;

function ITD_PostPage(const url, data: AnsiString; out response: AnsiString): boolean;
begin
  result := ITD_Internal_PostPage(PAnsiChar(url), PAnsiChar(data), length(data));

  if result then begin
    setlength(response, ITD_GetResultLen);
    ITD_GetResultString(PAnsiChar(response), length(response));
  end;
end;

function ITD_DownloadAfter(afterID: integer): TWizardPage;
var itd_downloadPage: TWizardPage;
begin
  itd_downloadpage := CreateCustomPage(afterID, ITD_GetString(ITDS_TitleCaption), ITD_GetString(ITDS_TitleDescription));

  itd_downloadpage.onactivate := @itd_handleshowpage;
  itd_downloadpage.onshouldskippage := @itd_handleskippage;
  itd_downloadpage.onbackbuttonclick := @itd_handlebackclick;
  itd_downloadpage.onnextbuttonclick := @itd_handlenextclick;

  itd_internal_initui(itd_downloadpage.surface.handle);

  result := itd_downloadpage;
end;

procedure ITD_SetOption(const option, value: AnsiString);
begin
  if comparetext(option, 'UI_Caption') = 0 then
    ITD_SetString(ITDS_TitleCaption, value)
  else if comparetext(option, 'UI_Description') = 0 then
    ITD_SetString(ITDS_TitleDescription, value)
  else if comparetext(option, 'UI_FailMessage') = 0 then
    ITD_SetString(ITDS_MessageFailRetry, value)
  else if comparetext(option, 'UI_FailOrContinueMessage') = 0 then
    ITD_SetString(ITDS_MessageFailRetryContinue, value)
  else if comparetext(option, 'UI_AllowContinue') = 0 then
    ITD_AllowContinue := (value = '1')
  else
    ITD_Internal_SetOption(option, value);
end;

function ITD_GetOption(const option: AnsiString): AnsiString;
begin
  setlength(result, 500);
  setlength(result, itd_internal_getoption(PAnsiChar(option), PAnsiChar(result), length(result)));
end;

[/Code]




[Code]
procedure DecodeVersion( verstr: String; var verint: array of Integer );
var
  i,p: Integer; s: string;
begin
  verint := [0,0,0,0];
  i := 0;
  while ( (Length(verstr) > 0) and (i < 4) ) do
  begin
  	p := pos('.', verstr);
  	if p > 0 then
  	begin
      if p = 1 then s:= '0' else s:= Copy( verstr, 1, p - 1 );
  	  verint[i] := StrToInt(s);
  	  i := i + 1;
  	  verstr := Copy( verstr, p+1, Length(verstr));
  	end
  	else
  	begin
  	  verint[i] := StrToInt( verstr );
  	  verstr := '';
  	end;
  end;

end;

function CompareVersion( ver1, ver2: String ) : Integer;
var
  verint1, verint2: array of Integer;
  i: integer;
begin

  SetArrayLength( verint1, 4 );
  DecodeVersion( ver1, verint1 );

  SetArrayLength( verint2, 4 );
  DecodeVersion( ver2, verint2 );

  Result := 0; i := 0;
  while ( (Result = 0) and ( i < 4 ) ) do
  begin
  	if verint1[i] > verint2[i] then
  	  Result := 1
  	else
      if verint1[i] < verint2[i] then
  	    Result := -1
  	  else
  	    Result := 0;

  	i := i + 1;
  end;
end;

function CheckVersion(Filename : string; hh, hl, lh, ll : integer) : boolean;
var
	VersionMS	: cardinal;
	VersionLS	: cardinal;
	CheckMS		: cardinal;
	CheckLS		: cardinal;
begin
	if GetVersionNumbers(Filename,VersionMS,VersionLS) = false then
		Result := false
	else begin
		CheckMS := (hh shl $10) or hl;
		CheckLS := (lh shl $10) or ll;
		Result := (VersionMS > CheckMS) or ((VersionMS = CheckMS) and (VersionLS >= CheckLS));
	end;
end;


[/Code]



; -- trayiconctrl.iss --
; restools
; http://restools.hanzify.org
; TrayIconCtrl.dll ÎªÒ»¸öÓÃÓÚ Inno Setup µÄ 15.5 KB µÄ ÍÐÅÌÍ¼±ê²å¼þ.
; Õâ¸öÍÐÅÌÍ¼±ê²å¼þÓµÓÐÄ¿Ç° windows ÏµÍ³ÍÐÅÌÍ¼±êÓµÓÐµÄÒ»ÇÐÌØÐÔ.
; ¿ÉÒÔËµÄãÃÇ¿´¼û¹ýµÄ,Ã»¿´¼û¹ýµÄÍÐÅÌÍ¼±êÐ§¹ûÔÚÕâÀï¶¼ÒÑ¾­Õ¹ÏÖÁË³öÀ´
; ÕâÊÇÎÒÄ¿Ç°Ëù×öµÄ×î¸´ÔÓµÄÒ»¸ö²å¼þ, Ï£Íû´ó¼ÒÏ²»¶

; Ver 1.5 ÐÞÕýÔÚÄ³Ð© Windows Æ½Ì¨ÉÏ(ÀýÈç Windows XP SP3)²»ÄÜÕý³£ÔËÐÐµÄÎÊÌâ¡£




[Files]
Source: "D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\trayiconctrl.dll"; DestDir: {tmp}; Flags: ignoreversion noencryption nocompression dontcopy

[code]
const
  NIIF_NONE = 0;
  NIIF_INFO = $1;
  NIIF_WARNING = $2;
  NIIF_ERROR = $3;



type
  TMenuItemClickProc = procedure(MenuIndex: Integer);
  TMenuPopupProc = procedure(PopMenu: LongWord; var bShow: Boolean);
  TTrayIconMsgFunc = function(wParam, lParam: LongWord): Boolean;

function InitTrayIconCtrl(MainForm_Handle, WizardForm_Handle: THandle; uCallbackMessage: UINT;
     szToolTip: String; icon: UINT; bHidden: BOOL; ShowTaskbarAppBtn: BOOL; MenuItems: String;
     DefaultMnuIndex: Integer; MenuItemOnClickCallBack: TMenuItemClickProc;
     MenuOnPopupCallBack: TMenuPopupProc; TrayIconMsgCallBack: TTrayIconMsgFunc): Boolean;
     external 'InitTrayIconCtrlW@{tmp}\trayiconctrl.dll stdcall delayload';

function UninitTrayIconCtrl(): Boolean; external 'UninitTrayIconCtrl@{tmp}\trayiconctrl.dll stdcall delayload';

function HideTrayIcon(): Boolean; external 'HideTrayIcon@{tmp}\trayiconctrl.dll stdcall delayload';

function ShowTrayIcon(): Boolean; external 'ShowTrayIcon@{tmp}\trayiconctrl.dll stdcall delayload';


function AnimateTrayIcon(nDelayMilliSeconds: UINT; nNumSeconds: Integer): Boolean;
     external 'AnimateTrayIcon@{tmp}\trayiconctrl.dll stdcall delayload';

function StopAnimation(): Boolean; external 'StopAnimation@{tmp}\trayiconctrl.dll stdcall delayload';

function ToggleWizardVisible(): Boolean; external 'ToggleWizardVisible@{tmp}\trayiconctrl.dll stdcall delayload';

function ShowBalloon(szText, szTitle: String; dwIcon: DWORD; uTimeout: UINT; bWaitforPreMsg: Boolean): Boolean; 
     external 'ShowBalloonW@{tmp}\trayiconctrl.dll stdcall delayload';

function HideBalloon(): Boolean; external 'HideBalloon@{tmp}\trayiconctrl.dll stdcall delayload';

function WizardFormInTray(): Boolean; external 'WizardFormInTray@{tmp}\trayiconctrl.dll stdcall delayload';

function SetTrayIcon(szToolTip: String; icon: UINT): Boolean;
     external 'SetTrayIconW@{tmp}\trayiconctrl.dll stdcall delayload';





[CustomMessages]
pm_ShowAndShow=&Show/Hide WizardForm
pm_ActivateVIP=Activate&VIP
pm_VisitOurSite=&VisitOurSite
pm_About=&About...
pm_Exit=E&xit
pm_Start=Inno Setup ¼¯³É°æ 5.5.9Setup is starting...

ChineseSimp.pm_ShowAndShow=ÏÔÊ¾/Òþ²Ø °²×°´°¿Ú(&S)
ChineseSimp.pm_ActivateVIP=¼¤»îVIP¹¦ÄÜ(&V)
ChineseSimp.pm_VisitOurSite=·ÃÎÊÎÒÃÇµÄÍøÕ¾(&O)
ChineseSimp.pm_About=¹ØÓÚ...(&A)
ChineseSimp.pm_Exit=ÍË³ö(&X)
ChineseSimp.pm_Start=Inno Setup ¼¯³É°æ 5.5.9°²×°³ÌÐò¿ªÊ¼...

[code]
function EnableMenuItem(hMenu: HMENU; uIDEnableItem, uEnable: UINT): BOOL; external 'EnableMenuItem@user32.dll stdcall';
function IsWindowEnabled(hWnd: HWND): BOOL; external 'IsWindowEnabled@user32.dll stdcall';

const
  WM_USER = $400;
 	WM_ICON_NOTIFY = WM_USER + 1331; // ×Ô¼º¶¨ÒåÒ»¸ö TrayIcon µÄÏûÏ¢±êÖ¾ÒÔºÍÆäËûµÄÏûÏ¢Çø·Ö

  MF_BYPOSITION = $400;
  MF_ENABLED = 0;
  MF_GRAYED = 1;

procedure TrayMenuItemOnClick(MenuItemIndex: Integer);
begin     
  if not IsWindowEnabled(WizardForm.Handle) then exit;

  Case MenuItemIndex of
    0: ToggleWizardVisible; // ÒòÎª 0 Ïî²Ëµ¥ÎªÄ¬ÈÏ²Ëµ¥, ËùÒÔÕâÀïµÄÊÂ¼þ³ýÁË²Ëµ¥µã»÷Íâ, Ë«»÷Í¼±êÒ²ÄÜ´¥·¢.
    2: 
    begin
    end;
    3: OpenSite('http://www.kngstr.com/');
    5:
      try
        WizardForm.FormStyle := fsNormal;
        MainForm.ShowAboutBox;
      finally
        WizardForm.FormStyle := fsStayOnTop;
      end;
    7: WizardForm.Close;
  end;
end;

procedure TrayMenuOnPopup(PopMenu: LongWord; var bShow: Boolean);
var
  Idx: Integer;
  sl: TStringList;
  s: string;
begin
  bShow := IsWindowEnabled(WizardForm.Handle);
  if WizardFormInTray() then
  begin
    EnableMenuItem(PopMenu, 5, MF_BYPOSITION or MF_GRAYED);
    EnableMenuItem(PopMenu, 7, MF_BYPOSITION or MF_GRAYED);
  end else begin
    EnableMenuItem(PopMenu, 5, MF_BYPOSITION or MF_ENABLED);
    EnableMenuItem(PopMenu, 7, MF_BYPOSITION or MF_ENABLED);
  end;

  EnableMenuItem(PopMenu, 2, MF_BYPOSITION or MF_GRAYED);    //Èç¹û²»ÆôÓÃVIPµÄ»°£¬»Òµô²Ëµ¥¡£¡£¡£
end;

procedure InitTray();
var
  MenuStrs: string;
begin
  PDir('trayiconctrl.dll');

  MenuStrs := CustomMessage('pm_ShowAndShow') + ';' + // 0
             '-;' +                     // 1
             CustomMessage('pm_ActivateVIP') + ';' +         // 2
             CustomMessage('pm_VisitOurSite') + ';' +         // 3
             '-;' +                     // 4
             CustomMessage('pm_About') + ';' +             // 5
             '-;' +                     // 6
             CustomMessage('pm_Exit');                   // 7

  InitTrayIconCtrl(MainForm.Handle, WizardForm.Handle, WM_ICON_NOTIFY, 'Inno Setup ¼¯³É°æ 5.5.9', 0,
       True, False, MenuStrs, 0, @TrayMenuItemOnClick, @TrayMenuOnPopup, nil);

  ShowBalloon(CustomMessage('pm_Start'), 'Inno Setup ¼¯³É°æ 5.5.9', 0, 10, False);
end;

procedure DeinitTray();
begin
  UninitTrayIconCtrl();
end;
[/Code]

;Ð¶ÔØÊ±Ê¹ÓÃµÄÎÄ¼þ
  

[Files]
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\IssProc.dll; DestDir: {app}\UninsFiles; Flags: ignoreversion noencryption nocompression
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\IssProc\IssProcLanguage.ini; DestDir: {app}\UninsFiles; Flags: ignoreversion noencryption nocompression

[Code]

function IssFindModule(hWnd: Integer; Modulename: PAnsiChar; Language: PAnsiChar; Silent: Boolean; CanIgnore: Boolean ): Integer;
external 'IssFindModule@{tmp}\IssProc.dll stdcall delayload';



function IssEnableAnyFileInUseCheck(Folder: PAnsiChar): Integer;
external 'IssEnableAnyFileInUseCheck@{tmp}\IssProc.dll stdcall delayload';

function IssRegister(rName: PAnsiChar; rKey: PAnsiChar): Integer;
external 'IssRegister@{tmp}\IssProc.dll stdcall delayload';

function AutoIssProc(Modulename: PAnsiChar; Language: PAnsiChar; Silent: Boolean; CanIgnore: Boolean ): Boolean;
var
  hWnd: Integer;
  sCurLanguage: String;
  nCode: Integer;                                                       { IssFindModule returns: 0 if no module found; 1 if cancel pressed; 2 if ignore pressed; -1 if an error occured }
begin
  Result := false;

  PDir('IssProcLanguage.ini');                                             { extract extra language file - you don't need to add this line if you are using english only }
  PDir('IssProc.dll');                                                  { extract extra language file - you don't need to add this line if you are using english only }

  if Language <> nil then sCurLanguage := Language
  else
  begin
    if IsUninstaller then
    begin
      hWnd := 0
      sCurLanguage := Copy(ExpandConstant('{language}'),0,2) + 'u';                 { extract first 2 characters from current setup language name }
    end
    else
    begin
      hWnd := StrToInt(ExpandConstant('{wizardhwnd}'));                     { get main wizard handle }
      sCurLanguage := Copy(ExpandConstant('{language}'),0,2);                 { extract first 2 characters from current setup language name }
    end;
  end;

  nCode:=IssFindModule(hWnd, ModuleName, sCurLanguage, Silent, CanIgnore);       { search for module and display files-in-use window if found  }
  if (not IsUninstaller) and (nCode=1) then  begin                      { cancel pressed or files-in-use window closed }
    PostMessage (WizardForm.Handle, $0010, 0, 0);                       { quit setup, $0010=WM_CLOSE }
  end else if (nCode=0) or (nCode=2) then begin                         { no module found or ignored pressed}
    Result := true;                                                     { continue setup  }
  end;
end;

[/Code]




[Setup]
AppId=Inno Setup 5
AppName=Inno Setup ¼¯³É°æ
AppVerName=Inno Setup ¼¯³É°æ 5.5.9
AppPublisher=KngStr
AppPublisherURL=http://www.kngstr.com/
AppSupportURL=http://www.kngstr.com/
AppUpdatesURL=http://www.kngstr.com/
AppVersion=5.5.9
;AppCopyright=Copyright ? 1997-2010 Jordan Russell. Portions Copyright ? 2000-2010 Martijn Laan. All rights reserved.
VersionInfoVersion=2018.1.18.10
;#ifndef Test
;AppMutex=InnoSetupCompilerAppMutex,Global\InnoSetupCompilerAppMutex
;#endif
DefaultDirName={pf}\Inno Setup 5
DefaultGroupName=Inno Setup 5
AllowNoIcons=true
LicenseFile=D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack\isfiles\License.txt
OutputDir=.\Release
OutputBaseFilename=Inno_559_180118_KngStr
UninstallFilesDir={app}\UninsFiles
SetupIconFile=D:\Version\[Inno]\Inno-All-in-One-Setup\\Res\Inst.ico
WizardImageFile=D:\Version\[Inno]\Inno-All-in-One-Setup\\Res\Left.bmp
WizardSmallImageFile=D:\Version\[Inno]\Inno-All-in-One-Setup\\Res\Header.bmp

Compression=lzma/ultra
InternalCompressLevel=ultra
SolidCompression=true
AppModifyPath="{app}\Ispack-setup.exe" /modify=1

ChangesAssociations=true


DisableWelcomePage=no

;³£Á¿ÒýÓÃ

[LangOptions]
DialogFontName=tahoma
DialogFontSize=8

[Languages]
;Name: swedish; MessagesFile: compiler:languages\swedish.isl
;Name: Basque; MessagesFile: compiler:Languages\Basque.isl
Name: BrazilianPortuguese; MessagesFile: compiler:Languages\BrazilianPortuguese.isl
Name: Catalan; MessagesFile: compiler:Languages\Catalan.isl

Name: ChineseSimp; MessagesFile: D:\Version\[Inno]\Inno-All-in-One-Setup\\Res\Languages\ChineseSimp.isl
Name: ChineseTrad; MessagesFile: D:\Version\[Inno]\Inno-All-in-One-Setup\\Res\Languages\ChineseTrad.isl

Name: Czech; MessagesFile: compiler:Languages\Czech.isl
Name: Danish; MessagesFile: compiler:Languages\Danish.isl
Name: Dutch; MessagesFile: compiler:Languages\Dutch.isl

Name: English; MessagesFile: compiler:Default.isl

Name: Finnish; MessagesFile: compiler:Languages\Finnish.isl
Name: French; MessagesFile: compiler:Languages\French.isl
Name: German; MessagesFile: compiler:Languages\German.isl
Name: Hebrew; MessagesFile: compiler:Languages\Hebrew.isl
Name: Hungarian; MessagesFile: compiler:Languages\Hungarian.isl
Name: Italian; MessagesFile: compiler:Languages\Italian.isl
Name: Japanese; MessagesFile: compiler:Languages\Japanese.isl
Name: Norwegian; MessagesFile: compiler:Languages\Norwegian.isl
Name: Polish; MessagesFile: compiler:Languages\Polish.isl
Name: Portuguese; MessagesFile: compiler:Languages\Portuguese.isl
;Name: PortugueseStd; MessagesFile: compiler:Languages\PortugueseStd.isl
Name: Russian; MessagesFile: compiler:Languages\Russian.isl
;Name: Slovak; MessagesFile: compiler:Languages\Slovak.isl
Name: Slovenian; MessagesFile: compiler:Languages\Slovenian.isl
Name: Spanish; MessagesFile: compiler:Languages\Spanish.isl

[Messages]
ChineseSimp.BeveledLabel=KngStr

ChineseSimp.SetupWindowTitle=KngStr - %1
ChineseSimp.SetupAppTitle=KngStr - Inno Setup ¼¯³É°æ
ChineseSimp.UninstallAppTitle=KngStr - Ð¶ÔØ
ChineseSimp.UninstallAppFullTitle=KngStr - %1 Ð¶ÔØ

ChineseSimp.LicenseAccepted =ÎÒÍ¬Òâ¡°Ðí¿ÉÐ­Òé¡±ÖÐµÄÌõ¿î(&A)

[CustomMessages]
Inno=Inno Setup
ISPP=Inno Setup Preprocessor
Compiler=Compiler

Help=Help
FAQ=FAQ
Docs=Docs
License=License
History=History
Extensions=Extensions

Examples=Example Scripts
Documentation=Documentation
Revision_History=Revision History

ISD=ISD Format
Newsgroups=Newsgroups
Chm_Hanzify=Hanzify Forum Inno Article
Isxkb=Extensions Knowledge Base
Isxkb_Online=Extensions Knowledge Base Online

Unpack=Unpack
Unpacker=Unpacker
Converter=Converter
InnoLogView=InnoLogView

English.Inno=Inno Setup
English.ISPP=Inno Setup Preprocessor
English.Compiler=Compiler

English.Help=Help
English.FAQ=FAQ
English.Docs=Docs
English.License=License
English.History=History
English.Extensions=Extensions

English.Examples=Example Scripts
English.Documentation=Documentation
English.Revision_History=Revision History

English.ISD=ISD Format
English.Newsgroups=Newsgroups
English.Chm_Hanzify=Hanzify Forum Inno Article
English.Isxkb=Extensions Knowledge Base
English.Isxkb_Online=Extensions Knowledge Base Online

English.Unpack=Unpack
English.Unpacker=Unpacker
English.Converter=Converter
English.InnoLogView=InnoLogView

;cn
ChineseSimp.Inno=Inno Setup
ChineseSimp.ISPP=Inno Setup Ô¤´¦ÀíÆ÷
ChineseSimp.Compiler=±à¼­Æ÷

ChineseSimp.Help=°ïÖú
ChineseSimp.FAQ=³£¼ûÎÊÌâ
ChineseSimp.Docs=ÎÄµµ
ChineseSimp.License=Ðí¿ÉÐ­Òé
ChineseSimp.History=ÀúÊ·
ChineseSimp.Extensions=À©Õ¹×ÊÔ´

ChineseSimp.Examples=Ê¾Àý½Å±¾
ChineseSimp.Documentation=ÎÄµµ
ChineseSimp.Revision_History=¸üÐÂÀúÊ·

ChineseSimp.ISD=ISD ÎÄ¼þ¸ñÊ½
ChineseSimp.Newsgroups=ÐÂÎÅ×é
ChineseSimp.Chm_Hanzify=ºº»¯ÐÂÊÀ¼ÍÂÛÌ³¾«»ª
ChineseSimp.Isxkb=ÖªÊ¶¿â
ChineseSimp.Isxkb_Online=ÔÚÏßÖªÊ¶¿â

ChineseSimp.Unpack=½â°ü
ChineseSimp.Unpacker=½â°ü¹¤¾ß
ChineseSimp.Converter=×¢²á±í×ª»»Æ÷
ChineseSimp.InnoLogView=Inno Ð¶ÔØ¼ÇÂ¼²é¿´Æ÷

ChineseSimp.AdditionalIcons=¸½¼ÓÍ¼±ê:
ChineseSimp.CreateDesktopIcon=´´½¨×ÀÃæÍ¼±ê
ChineseSimp.CreateQuickLaunchIcon=´´½¨¿ìËÙÆô¶¯Í¼±ê
ChineseSimp.AssocRightFileExtension=½« %2 ÎÄ¼þÀ©Õ¹ÃûÓë %1 ½¨Á¢ÓÒ¼ü¹ØÁª (&A)
ChineseSimp.Assoc=ÎÄ¼þ¹ØÁª:

Skins=°×ÑòÍÃÃÀÃ¼%nChromex%nSustenance%n¹´¹´ÊÖ%n¿É°®Ð¡ÐÜ%nÄ¾Í·Æ»¹û%nÑó´ÐÍ·ÇéÂÂ%nCodejock%nISSkinEx%nSakura

[Types]
;Name: "recommand"; Description: "ÍÆ¼ö°²×°"
Name: "full"; Description: "ÍêÈ«°²×°"
Name: "compact"; Description: "¼ò½à°²×°"
Name: "custom"; Description: "×Ô¶¨Òå°²×°"; Flags: iscustom

[Components]
Name: Inno; Description: Ö÷³ÌÐò(±ØÐë) - (Inno 5.5.9); Flags: fixed; Types: custom compact full
Name: Inno\Ansi; Description: Ansi {cm:Inno}; Flags: exclusive disablenouninstallwarning; Types: custom compact full
Name: Inno\Unicode; Description: Unicode {cm:Inno}; Flags: exclusive disablenouninstallwarning

Name: ISCmplr_Setup; Description: {cm:Inno} ±àÒëÆ÷ÔöÇ¿°æ; Flags: disablenouninstallwarning; 
Name: ISCmplr_Setup\Restools_MiniVCL; Description: Restools Mini VCL    (5.5.1.e2 Build 180110); Flags: exclusive disablenouninstallwarning;
Name: ISCmplr_Setup\Restools_FullVCL; Description: Restools Full VCL    (5.5.1.ee2 Build 180110); Flags: exclusive disablenouninstallwarning;
Name: ISCmplr_Setup\SkyGz; Description: SkyGz ±àÒëÆ÷ÔöÇ¿°æ   (5.5.9 Build 170516); Flags: exclusive disablenouninstallwarning;
Name: ISCmplr_Setup\KngStr; Description: KngStr ±àÒëÆ÷ÔöÇ¿°æ   (5.5.9 Build 170516); Flags: exclusive disablenouninstallwarning;


[Components]
Name: IDE; Description: {cm:Inno} ½Å±¾±à¼­Æ÷; Types: full compact custom
Name: IDE\Compile; Description: Inno Setup Compiler; Flags: exclusive disablenouninstallwarning; Types: custom compact full
Name: IDE\Restools; Description: Restools ±à¼­Æ÷ÔöÇ¿°æ (5.5.2.0 Build 170516); Flags: exclusive disablenouninstallwarning; Types: custom compact full
Name: IDE\SkyGz; Description: SkyGz ±à¼­Æ÷ÔöÇ¿°æ  (5.5.9 Build 170516); Flags: exclusive disablenouninstallwarning;

;¸÷ÖÖ±àÒëÆ÷
;#include "InnoIDE.iss"



[CustomMessages]
English.OpenWithISStudio=Open with &ISStudio
ChineseSimp.OpenWithISStudio=ÓÃ ISStudio ´ò¿ª(&I)


[Components]
Name: IDE\ISStudio; Description: Inno Script Studio     (2.2.2.32 Build 170516); Types: full compact custom

[Files]
;ISStudio
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\ISStudio\{app}\*; DestDir: {app}\ISStudio; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Tasks: ; Components: IDE\ISStudio
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\ISStudio\Extra_Languages\*; DestDir: {app}\ISStudio\Languages; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Tasks: ; Components: IDE\ISStudio

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
;¹ØÁª
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
;#include "ISTool.iss"

[Components]
Name: ISCC; Description: ÃüÁîÐÐ±àÒëÆ÷; Flags: disablenouninstallwarning; Types: custom compact full
Name: ISCC\ISCC; Description: Inno Setup Command-Line Compiler; Flags: exclusive disablenouninstallwarning; Types: custom compact full
Name: ISCC\KngStr; Description: KngStr Command-Line Compiler (5.5.9 Build 170516); Flags: exclusive disablenouninstallwarning;

[Registry]
Root: HKCU; SubKey: Software\Jordan Russell; Flags: uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup; Flags: uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: ShowStartupForm; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: UseWizard; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: Autosave; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: MakeBackups; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: FullPathInTitleBar; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: UndoAfterSave; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: PauseOnDebuggerExceptions; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: RunAsDifferentUser; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: AutoComplete; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: UseSynHigh; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: UnderlineErrors; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorCursorPastEOL; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: TabWidth; ValueData: 2; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: UseTabCharacter; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: WordWrap; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: AutoIndent; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: IndentationGuides; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorFontName; ValueData: Courier New; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorFontSize; ValueData: 10; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorFontCharset; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: ShowToolbar; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: ShowStatusBar; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: LowPriorityDuringCompile; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: Zoom; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet

[Components]
Name: EasySets; Description: ÍÆ¼öÉèÖÃ; Types: custom compact full
Name: EasySets\EditorSet; Description: KngStr ÍÆ¼öÉèÖÃ; Types: custom compact full; Flags: disablenouninstallwarning;
Name: EasySets\CodeFont; Description: Restools ÍÆ¼ö×ÖÌå; Types: custom compact full

Name: Extensions; Description: {cm:Extensions}; Types: custom compact full
Name: Extensions\IsSkin_Styles; Description: IsSkin Æ¤·ô¼¯ºÏ; Types: full
Name: Extensions\IsSkin_SkinBuilder; Description: IsSkin Æ¤·ô±à¼­Æ÷   (13.2.0.0 Build 170516); Types: full
Name: Extensions\UninsHs; Description: UninsHs Ð¶ÔØÔöÇ¿   (2.1.0.283 Build 170516); Types: full compact
Name: Extensions\Converter; Description: Converter {cm:Converter}  (cntrump ºº»¯)   (0.1.4.0 Build 170516); Types: full compact

Name: Extensions\Unpack; Description: {cm:Unpacker} (SkyGz); Types: full;
Name: Extensions\Unpack\InnoExp; Description: {cm:Inno} Unpacker Explorer; Types: full;
Name: Extensions\Unpack\Disasm; Description: {cm:Inno} Disasm Tool   (X-Star); Types: full;

Name: Extensions\InnoLogView; Description: InnoLogView {cm:InnoLogView}   (1.0.0.0 Build 170516); Types: custom full

Name: Help; Description: {cm:Help}; Types: custom compact full
Name: Help\Hanzify; Description: {cm:Chm_Hanzify}; Types: custom compact full
Name: Help\Isxkb; Description: {cm:Inno} {cm:Isxkb}; Types: custom compact full
;Name: Help\VCL; Description: Delphi 2.0 VCL Help & Windows SDK Help; Types: full
Name: Help\ISD; Description: {cm:Inno} {cm:ISD}; Types: custom compact full

;Nsis Res Components
Name: Nsis; Description: Nsis×ÊÔ´; Types: full
Name: Nsis\Graphics; Description: Graphics ×ÊÔ´; Types: full
Name: Nsis\Graphics\Header; Description: Header; Types: full
Name: Nsis\Graphics\Wizard; Description: Wizard; Types: full
Name: Nsis\Graphics\Icons; Description: Icons; Types: full

Name: Nsis\Graphics\MUIOrangeVistaTheme; Description: MUIOrangeVistaTheme; Types: full
Name: Nsis\Graphics\MUIOrangeVistaTheme_CD; Description: MUIOrangeVistaTheme_CD; Types: full


[Components]
Name: Plugins; Description: ²å¼þ; Types: full
Name: Plugins\IsSkin; Description: IsSkin  Æ¤·ô²å¼þ; Types: full
Name: Plugins\IsTask; Description: IsTask  ½ø³Ì²å¼þ; Types: full compact

Name: Plugins\ISXDL;  Description: ISXDL  ÔÚÏßÏÂÔØ ²å¼þ; Types: full compact
Name: Plugins\ItDownload;  Description: ItDownload   ÔÚÏßÏÂÔØ ²å¼þ   (Sherlock Software); Types: full compact
Name: Plugins\ItTray;      Description: ItTray   ÍÐÅÌ ²å¼þ   (Sherlock Software); Types: full compact

Name: Plugins\botva2;  Description: botva2  Í¼Æ¬Æ¤·ô²å¼þ   (htuos); Types: full
Name: Plugins\ISWin7;  Description: ISWin7  Win7Í¸Ã÷Ð§¹û²å¼þ; Types: full
Name: Plugins\ISFlash; Description: ISFlash  Flash²å¼þ; Types: full
Name: Plugins\is7z;    Description: is7z  7z½ø¶ÈÌõ½âÑ¹²å¼þ; Types: full

Name: Plugins\WaterCtrl; Description: WaterCtrl  Ë®ÎÆÌØÐ§²å¼þ   (Restools); Types: full compact
Name: Plugins\GifCtrl;   Description: GifCtrl  GifÏÔÊ¾²å¼þ   (Restools); Types: full
Name: Plugins\FireCtrl;  Description: FireCtrl  »ðÑæÌØÐ§²å¼þ   (Restools); Types: full
Name: Plugins\DescCtrl; Description: DescCtrl  ×é¼þÁÐ±íÃèÊö¿ØÖÆ²å¼þ   (Restools); Types: full compact
Name: Plugins\TimeCtrl; Description: TimeCtrl  °´Å¥¼¤»îÊ±¼ä¿ØÖÆ²å¼þ   (Restools); Types: full compact
Name: Plugins\CallbackCtrl; Description: CallbackCtrl  »Øµ÷º¯Êý²å¼þ   (Restools); Types: full
Name: Plugins\CallNsis; Description: CallNsis  µ÷ÓÃ NSIS ²å¼þµÄÍ¨ÓÃ²å¼þ   (Restools); Types: full
Name: Plugins\ksiCallNsis; Description: ksiCallNsis  µ÷ÓÃ NSIS ²å¼þµÄÍ¨ÓÃ²å¼þ   (KngStr); Types: full
Name: Plugins\WebCtrl; Description: WebCtrl  ÍøÒ³ÏÔÊ¾²å¼þ   (Restools); Types: full
Name: Plugins\TrayIconCtrl; Description: TrayIconCtrl  ÏµÍ³ÍÐÅÌÍ¼±ê²å¼þ   (Restools); Types: full
Name: Plugins\CpuDesc; Description: CpuDesc CPU  ²ÎÊý¼ì²â²å¼þ   (Restools); Types: full
Name: Plugins\MsgCtrl; Description: MsgCtrl Message  ²å¼þ   (Restools); Types: full

Name: Plugins\FlashLib; Description: FlashLib FlashÐ§¹û ²å¼þ   (SkyGz); Types: full
Name: Plugins\GifLib;   Description: GifLib GIF²å·Å ²å¼þ       (SkyGz); Types: full
Name: Plugins\WaterLib; Description: WaterLib Ë®²¨Ð§¹û ²å¼þ    (SkyGz); Types: full

Name: Plugins\UpdateIcon; Description: UpdateIcon  Ìæ»» Ð¶ÔØ³ÌÐòÍ¼±ê ²å¼þ   (zhfi); Types: full compact
Name: Plugins\IssProc; Description: IssProc ÎÄ¼þÕ¼ÓÃ²é¿´/½áÊø²å¼þ; Types: full compact

Name: Plugins\Isgsg; Description: isgsg ÉÁÆÁ/Í¼Æ¬ÂÖ²¥ ²å¼þ; Types: full compact

[Files]
;ISSkin Resouces
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\ISSkin.ish; DestDir: {app}\Include; Components: Plugins\IsSkin; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\ISSkinU.dll; DestDir: {app}\Plugins; Components: Plugins\IsSkin and Inno\Unicode; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\ISSkin.dll; DestDir: {app}\Plugins; Components: Plugins\IsSkin and Inno\Ansi; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\ISSkin\*; DestDir: {app}\Examples\ISSkin; Components: Extensions\IsSkin_Styles; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Tasks:
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\ISSkin\SkinBuilder.exe; DestDir: {app}\Extensions\ISSkin; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList; Components: Extensions\IsSkin_SkinBuilder
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\ISSkin\ISSkinViewer.exe; DestDir: {app}\Extensions\ISSkin; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList; Components: Extensions\IsSkin_SkinBuilder
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\ISSkin\ISSkinViewer.iss; DestDir: {app}\Extensions\ISSkin; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList; Components: Extensions\IsSkin_SkinBuilder

;ISSkinEx Resouces
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\ISSkinExU.dll; DestDir: {app}\Plugins; DestName: ISSkin.dll; Components: Plugins\IsSkin and Inno\Unicode and (ISCmplr_Setup\Restools_MiniVcl or ISCmplr_Setup\Restools_FullVcl); Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\ISSkinEx.dll; DestDir: {app}\Plugins; DestName: ISSkinU.dll; Components: Plugins\IsSkin and Inno\Ansi and (ISCmplr_Setup\Restools_MiniVcl or ISCmplr_Setup\Restools_FullVcl); Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\ISSkinEx\ISSkinViewer.*; DestDir: {app}\Extensions\ISSkin; Components: Extensions\IsSkin_Styles and (ISCmplr_Setup\Restools_MiniVcl or ISCmplr_Setup\Restools_FullVcl); Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\ISSkinEx\License.txt; DestDir: {app}\Extensions\ISSkin; DestName: ISSkinEx_License.txt; Components: Extensions\IsSkin_Styles and (ISCmplr_Setup\Restools_MiniVcl or ISCmplr_Setup\Restools_FullVcl); Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
;ISSkin Styles
;Source: {#Extensions}\ISSkin\Styles\*; DestDir: {app}\Extensions\ISSkins; Components: Extensions\IsSkin_Styles; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Tasks:
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\ISSkinEx\Styles\Vista.cjstyles; DestDir: {app}\Extensions\ISSkin\Styles; Components: Extensions\IsSkin_Styles; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\ISSkinEx\Styles\Codejock.cjstyles; DestDir: {app}\Extensions\ISSkin\Styles; Components: Extensions\IsSkin_Styles; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\ISSkinEx\Styles\ISSkinEx.cjstyles; DestDir: {app}\Extensions\ISSkin\Styles; Components: Extensions\IsSkin_Styles; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\ISSkinEx\Styles\Office2007.cjstyles; DestDir: {app}\Extensions\ISSkin\Styles; Components: Extensions\IsSkin_Styles; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\ISSkinEx\Styles\Sakura.cjstyles; DestDir: {app}\Extensions\ISSkin\Styles; Components: Extensions\IsSkin_Styles; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

;ISTask
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\ISTask.dll; DestDir: {app}\Plugins\; Components: Plugins\ISTask; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\ISTask.Ish; DestDir: {app}\Include\; Components: Plugins\ISTask; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\ISTask.Iss; DestDir: {app}\Examples\; Components: Plugins\ISTask; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\ISTask.dll; DestDir: {app}\Plugins\; Components: Plugins\ISTask; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\ISTask.Ish; DestDir: {app}\Include\; Components: Plugins\ISTask; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\ISTask.Iss; DestDir: {app}\Examples\; Components: Plugins\ISTask; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList



  ;botva2
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\botva2.dll; DestDir: {app}\Plugins\; Components: Plugins\botva2; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\botva2\*; DestDir: {app}\Include\botva2; Components: Plugins\botva2; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\botva2\*; DestDir: {app}\Examples\botva2; Components: Plugins\botva2; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\botva2.dll; DestDir: {app}\Plugins\; Components: Plugins\botva2; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\botva2\*; DestDir: {app}\Include\botva2; Components: Plugins\botva2; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\botva2\*; DestDir: {app}\Examples\botva2; Components: Plugins\botva2; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList



    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\STS.Ish; DestDir: {app}\Include\; Components: Plugins\botva2; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList




    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\STS.Ish; DestDir: {app}\Include\; Components: Plugins\botva2; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList



  ;ISWin7
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\ISWin7.dll; DestDir: {app}\Plugins\; Components: Plugins\ISWin7; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\ISWin7.Ish; DestDir: {app}\Include\; Components: Plugins\ISWin7; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\ISWin7.Iss; DestDir: {app}\Examples\; Components: Plugins\ISWin7; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\ISWin7.dll; DestDir: {app}\Plugins\; Components: Plugins\ISWin7; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\ISWin7.Ish; DestDir: {app}\Include\; Components: Plugins\ISWin7; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\ISWin7.Iss; DestDir: {app}\Examples\; Components: Plugins\ISWin7; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


  ;ISFlash
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\ISFlash.dll; DestDir: {app}\Plugins\; Components: Plugins\ISFlash; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\ISFlash\*; DestDir: {app}\Examples\ISFlash; Components: Plugins\ISFlash; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\ISFlash.dll; DestDir: {app}\Plugins\; Components: Plugins\ISFlash; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\ISFlash\*; DestDir: {app}\Examples\ISFlash; Components: Plugins\ISFlash; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList


  ;is7z
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\is7z.dll; DestDir: {app}\Plugins\; Components: Plugins\is7z; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\is7z\*; DestDir: {app}\Examples\is7z; Components: Plugins\is7z; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Docs\is7z\*; DestDir: {app}\Docs\is7z; Components: Plugins\is7z; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\is7z.dll; DestDir: {app}\Plugins\; Components: Plugins\is7z; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\is7z\*; DestDir: {app}\Examples\is7z; Components: Plugins\is7z; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Docs\is7z\*; DestDir: {app}\Docs\is7z; Components: Plugins\is7z; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList
  ;IssProc
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\IssProc.dll; DestDir: {app}\Plugins\; Components: Plugins\IssProc; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\IssProc\*; DestDir: {app}\Include\IssProc; Components: Plugins\IssProc; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\IssProc\*; DestDir: {app}\Examples\IssProc; Components: Plugins\IssProc; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\IssProc.dll; DestDir: {app}\Plugins\; Components: Plugins\IssProc; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\IssProc\*; DestDir: {app}\Include\IssProc; Components: Plugins\IssProc; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\IssProc\*; DestDir: {app}\Examples\IssProc; Components: Plugins\IssProc; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList


  ;UpdateIcon
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\UpdateIcon.dll; DestDir: {app}\Plugins\; Components: Plugins\UpdateIcon; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\UpdateIcon\*; DestDir: {app}\Examples\UpdateIcon; Components: Plugins\UpdateIcon; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\UpdateIcon.dll; DestDir: {app}\Plugins\; Components: Plugins\UpdateIcon; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\UpdateIcon\*; DestDir: {app}\Examples\UpdateIcon; Components: Plugins\UpdateIcon; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList



  ;Isgsg
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\Isgsg.dll; DestDir: {app}\Plugins\; Components: Plugins\Isgsg; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\Isgsg.Ish; DestDir: {app}\Include\; Components: Plugins\Isgsg; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\Isgsg\*; DestDir: {app}\Examples\Isgsg; Components: Plugins\Isgsg; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\Isgsg.dll; DestDir: {app}\Plugins\; Components: Plugins\Isgsg; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\Isgsg.Ish; DestDir: {app}\Include\; Components: Plugins\Isgsg; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\Isgsg\*; DestDir: {app}\Examples\Isgsg; Components: Plugins\Isgsg; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList


  ;ISDone
  ;#expr AddPlugin("ISDone")

  ;CallNsis2
  ;#expr AddPlugin("CallNsis2")
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Restools Plugins;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;CallNsis
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\CallNsis.dll; DestDir: {app}\Plugins\; Components: Plugins\CallNsis; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\CallNsis\*; DestDir: {app}\Examples\CallNsis; Components: Plugins\CallNsis; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList



    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\Restools\CallNsis.Ish; DestDir: {app}\Include\Restools; Components: Plugins\CallNsis; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList



  ;ksiCallNsis
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\ksiCallNsis.dll; DestDir: {app}\Plugins\; Components: Plugins\ksiCallNsis; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\ksiCallNsis.Ish; DestDir: {app}\Include\; Components: Plugins\ksiCallNsis; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\ksiCallNsis\*; DestDir: {app}\Examples\ksiCallNsis; Components: Plugins\ksiCallNsis; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\ksiCallNsis.dll; DestDir: {app}\Plugins\; Components: Plugins\ksiCallNsis; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\ksiCallNsis.Ish; DestDir: {app}\Include\; Components: Plugins\ksiCallNsis; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\ksiCallNsis\*; DestDir: {app}\Examples\ksiCallNsis; Components: Plugins\ksiCallNsis; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList


  Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\Nsis\*; DestDir: {app}\Plugins\Nsis; Components: Plugins\CallNsis or Plugins\ksiCallNsis; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList
  ;WaterCtrl
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\WaterCtrl.dll; DestDir: {app}\Plugins\; Components: Plugins\WaterCtrl; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\WaterCtrl\*; DestDir: {app}\Examples\WaterCtrl; Components: Plugins\WaterCtrl; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList






  ;GifCtrl
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\GifCtrl.dll; DestDir: {app}\Plugins\; Components: Plugins\GifCtrl; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\GifCtrl\*; DestDir: {app}\Examples\GifCtrl; Components: Plugins\GifCtrl; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList



    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\Restools\GifCtrl.Ish; DestDir: {app}\Include\Restools; Components: Plugins\GifCtrl; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList



  ;FireCtrl
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\FireCtrl.dll; DestDir: {app}\Plugins\; Components: Plugins\FireCtrl; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\FireCtrl\*; DestDir: {app}\Examples\FireCtrl; Components: Plugins\FireCtrl; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList







;DesCtrl
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\DescCtrl.dll; DestDir: {app}\Plugins\; Components: Plugins\DescCtrl; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\DescCtrl.Iss; DestDir: {app}\Examples\; Components: Plugins\DescCtrl; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList



    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\Restools\DescCtrl.Ish; DestDir: {app}\Include\Restools; Components: Plugins\DescCtrl; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList



;TimeCtrl
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\TimeCtrl.dll; DestDir: {app}\Plugins\; Components: Plugins\TimeCtrl; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\TimeCtrl\*; DestDir: {app}\Examples\TimeCtrl; Components: Plugins\TimeCtrl; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList






;CallbackCtrl
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\CallbackCtrl.dll; DestDir: {app}\Plugins\; Components: Plugins\CallbackCtrl; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\CallbackCtrl\*; DestDir: {app}\Examples\CallbackCtrl; Components: Plugins\CallbackCtrl; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList



    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\Restools\CallbackCtrl.Ish; DestDir: {app}\Include\Restools; Components: Plugins\CallbackCtrl; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList




;ExecCtrl
;WebCtrl
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\WebCtrl.dll; DestDir: {app}\Plugins\; Components: Plugins\WebCtrl; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\WebCtrl\*; DestDir: {app}\Examples\WebCtrl; Components: Plugins\WebCtrl; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList



    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\Restools\WebCtrl.Ish; DestDir: {app}\Include\Restools; Components: Plugins\WebCtrl; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList



;TrayIconCtrl
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\TrayIconCtrl.dll; DestDir: {app}\Plugins\; Components: Plugins\TrayIconCtrl; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\TrayIconCtrl\*; DestDir: {app}\Examples\TrayIconCtrl; Components: Plugins\TrayIconCtrl; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList



    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\Restools\TrayIconCtrl.Ish; DestDir: {app}\Include\Restools; Components: Plugins\TrayIconCtrl; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList



;CpuDesc
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\CpuDesc.dll; DestDir: {app}\Plugins\; Components: Plugins\CpuDesc; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\CpuDesc.Iss; DestDir: {app}\Examples\; Components: Plugins\CpuDesc; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList






;MsgCtrl
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\winmsgctrl.dll; DestDir: {app}\Plugins\; Components: Plugins\MsgCtrl; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\MsgCtrl\*; DestDir: {app}\Examples\MsgCtrl; Components: Plugins\MsgCtrl; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList



    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\Restools\MsgCtrl.Ish; DestDir: {app}\Include\Restools; Components: Plugins\MsgCtrl; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;ISXDL
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\ISXDL.dll; DestDir: {app}\Plugins\; Components: Plugins\ISXDL; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\ISXDL.Ish; DestDir: {app}\Include\; Components: Plugins\ISXDL; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\ISXDL.Iss; DestDir: {app}\Examples\; Components: Plugins\ISXDL; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Docs\ISXDL\*; DestDir: {app}\Docs\ISXDL; Components: Plugins\ISXDL; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\ISXDL.dll; DestDir: {app}\Plugins\; Components: Plugins\ISXDL; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\ISXDL.Ish; DestDir: {app}\Include\; Components: Plugins\ISXDL; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\ISXDL.Iss; DestDir: {app}\Examples\; Components: Plugins\ISXDL; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Docs\ISXDL\*; DestDir: {app}\Docs\ISXDL; Components: Plugins\ISXDL; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList
;ItDownload
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\ItDownload.dll; DestDir: {app}\Plugins\; Components: Plugins\ItDownload; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\ItDownload\*; DestDir: {app}\Examples\ItDownload; Components: Plugins\ItDownload; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\ItDownload\*; DestDir: {app}\Extensions\ItDownload; Components: Plugins\ItDownload; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\Sherlock\ItDownload.Ish; DestDir: {app}\Include\Sherlock; Components: Plugins\ItDownload; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList



;ItTray
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\ItTray.dll; DestDir: {app}\Plugins\; Components: Plugins\ItTray; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\ItTray\*; DestDir: {app}\Examples\ItTray; Components: Plugins\ItTray; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList



    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\Sherlock\ItTray.Ish; DestDir: {app}\Include\Sherlock; Components: Plugins\ItTray; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList




;SkyGz Plugins
;FlashLib
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\SkyGz\FlashLib.ish; DestDir: {app}\Include\SkyGz; Components: Plugins\FlashLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\FlashLib.dll; DestDir: {app}\Plugins; Components: Plugins\FlashLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\SkyGz\FlashLib_Example.iss; DestDir: {app}\Examples\SkyGz; Components: Plugins\FlashLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\SkyGz\FlashLib.swf; DestDir: {app}\Examples\SkyGz; Components: Plugins\FlashLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
;GifLib
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\SkyGz\GifLib.ish; DestDir: {app}\Include\SkyGz; Components: Plugins\GifLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\GifLib.dll; DestDir: {app}\Plugins; Components: Plugins\GifLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\SkyGz\GifLib_Example.iss; DestDir: {app}\Examples\SkyGz; Components: Plugins\GifLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\SkyGz\1139681544755.gif; DestDir: {app}\Examples\SkyGz; Components: Plugins\GifLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
;WaterLib
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\SkyGz\WaterLib.ish; DestDir: {app}\Include\SkyGz; Components: Plugins\WaterLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\WaterLib.dll; DestDir: {app}\Plugins; Components: Plugins\WaterLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\SkyGz\WaterLib_Example.iss; DestDir: {app}\Examples\SkyGz; Components: Plugins\WaterLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

  ;InnoCallBack
    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\InnoCallBack.dll; DestDir: {app}\Plugins\; Components: ; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\InnoCallBack.Ish; DestDir: {app}\Include\; Components: ; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\InnoCallBack.Iss; DestDir: {app}\Examples\; Components: ; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\InnoCallBack.dll; DestDir: {app}\Plugins\; Components: ; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\InnoCallBack.Ish; DestDir: {app}\Include\; Components: ; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\InnoCallBack.Iss; DestDir: {app}\Examples\; Components: ; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList



;Source: {#Plugins}\bass.dll; DestDir: {app}\Plugins; Flags: ignoreversion; BeforeInstall: AddToDetaList
;Source: {#Plugins}\bassmidi.dll; DestDir: {app}\Plugins; Flags: ignoreversion; BeforeInstall: AddToDetaList
;Source: {#Plugins}\BASSMOD.dll; DestDir: {app}\Plugins; Flags: ignoreversion; BeforeInstall: AddToDetaList
;Source: {#Plugins}\GameuxInstallHelper.dll; DestDir: {app}\Plugins; Flags: ignoreversion; BeforeInstall: AddToDetaList
;Source: {#Plugins}\ImgGdiPlus.dll; DestDir: {app}\Plugins; Flags: ignoreversion; BeforeInstall: AddToDetaList
;Source: {#Plugins}\IssSurvey.dll; DestDir: {app}\Plugins; Flags: ignoreversion; BeforeInstall: AddToDetaList
;Source: {#Plugins}\isxbb.dll; DestDir: {app}\Plugins; Flags: ignoreversion; BeforeInstall: AddToDetaList
;Source: {#Plugins}\unarc.dll; DestDir: {app}\Plugins; Flags: ignoreversion; BeforeInstall: AddToDetaList

[Tasks]
Name: DesktopIcon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked
Name: QuickLaunchIcon; Description: {cm:CreateQuickLaunchIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked

Name: AssocIss; Description: {cm:AssocFileExtension,Inno Setup,.iss}; GroupDescription: {cm:Assoc}; Components: Inno
Name: AssocIsh; Description: {cm:AssocFileExtension,Inno Setup,.ish}; GroupDescription: {cm:Assoc}; Components: Inno

Name: InnoExp_ICON; Description: {cm:AssocRightFileExtension,Inno Setup Unpacker Explorer,.exe}; GroupDescription: {cm:Assoc}; Components: Extensions\Unpack\InnoExp; Flags: unchecked

Name: Restools_Lang_En; Description: ¼æÈÝRestoolsÉè¼ÆÆ÷£¬Ê¹ÓÃÓ¢ÎÄÓïÑÔÎÄ¼þ×÷ÎªÄ¬ÈÏÓïÑÔ; GroupDescription: Restools±à¼­Æ÷¸½¼ÓÑ¡Ïî; Components: IDE\Restools;

[Run]
;£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡ÒªÐÞ¸Ä-Ä¬ÈÏ±àÒëÆ÷»ñÈ¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡
Filename: {app}\Compil32.exe; WorkingDir: {app}; Description: {cm:LaunchProgram,Inno Setup}; Flags: nowait postinstall skipifsilent; 

[Files]
Source: What's new.txt; DestDir: {app}\UninsFiles; Flags: isreadme


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\[Ish]\*; DestDir: {app}\Examples\[Ish]; Components: ; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Docs\[Ish]\*; DestDir: {app}\Docs\[Ish]; Components: ; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\[Ish]\*; DestDir: {app}\Examples\[Ish]; Components: ; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Docs\[Ish]\*; DestDir: {app}\Docs\[Ish]; Components: ; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\System.Ish; DestDir: {app}\Include\; Components: ; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList




    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\System.Ish; DestDir: {app}\Include\; Components: ; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList




    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\Macros.Ish; DestDir: {app}\Include\; Components: ; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList




    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\Macros.Ish; DestDir: {app}\Include\; Components: ; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList




    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\Isxkb\*; DestDir: {app}\Include\Isxkb; Components: ; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\Isxkb\*; DestDir: {app}\Examples\Isxkb; Components: ; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList



    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\Isxkb\*; DestDir: {app}\Include\Isxkb; Components: ; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\Isxkb\*; DestDir: {app}\Examples\Isxkb; Components: ; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList







    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\ISPP\InstFiles.Ish; DestDir: {app}\Include\ISPP; Components: ; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\ISPP\InstFiles\*; DestDir: {app}\Examples\ISPP\InstFiles; Components: ; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList



;Ô¤ÊÍ·ÅÎÄ¼þ
Source: Res\Uninst.ico; Flags: solidbreak dontcopy
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\UpdateIcon.dll; DestDir: {app}\Plugins; Flags: ignoreversion dontcopy; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\\Res\Skins\*; DestDir: {tmp}; Flags: ignoreversion dontcopy; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\ISSkinEx\Styles\Codejock.cjstyles; DestDir: {tmp}; Flags: ignoreversion dontcopy; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\ISSkinEx\Styles\ISSkinEx.cjstyles; DestDir: {tmp}; Flags: ignoreversion dontcopy; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\ISSkinEx\Styles\Sakura.cjstyles; DestDir: {tmp}; Flags: ignoreversion dontcopy; BeforeInstall: AddToDetaList

Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack\isfiles\*; Excludes: .git*,cvs\*,ISPP.dll,*.e32,Compil32.exe,isscint.dll,ISPPCC.exe,ISCC.exe,ISCmplr.dll; DestDir: {app}; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList; Components: Inno  and not (ISCmplr_Setup\Restools_MiniVCL or ISCmplr_Setup\Restools_FullVCL)
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack\Setup.*; DestDir: {app}\Examples; BeforeInstall: AddToDetaList; Components: Inno; Flags: ignoreversion
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack\isfiles\isscint.dll; DestDir: {app}; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: IDE\Compile

;Ansi Ispp
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack\isfiles\Compil32.exe; DestDir: {app}; DestName: Compil32.exe; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: Inno\Ansi and IDE\Compile
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack\isfiles\ISPP.dll; DestDir: {app}; DestName: ISPP.dll; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: Inno\Ansi and not ISCmplr_Setup
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack\isfiles\ISCC.exe; DestDir: {app}; DestName: ISCC.exe; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: Inno\Ansi and not ISCmplr_Setup
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack\isfiles\*.e32; DestDir: {app}; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: Inno\Ansi and not ISCmplr_Setup
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack\isfiles\ISCmplr.dll; DestDir: {app}; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: Inno\Ansi and not ISCmplr_Setup

;Unicode Ispp
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack\isfiles-unicode\Compil32.exe; DestDir: {app}; DestName: Compil32.exe; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: Inno\Unicode  and IDE\Compile
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack\isfiles-unicode\ISPP.dll; DestDir: {app}; DestName: ISPP.dll; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: Inno\Unicode and not ISCmplr_Setup
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack\isfiles-unicode\ISCC.exe; DestDir: {app}; DestName: ISCC.exe; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: Inno\Unicode and not ISCmplr_Setup
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack\isfiles-unicode\*.e32; DestDir: {app}; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: Inno\Unicode and not ISCmplr_Setup
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\IsPack\isfiles-unicode\ISCmplr.dll; DestDir: {app}; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: Inno\Unicode and not ISCmplr_Setup

Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Docs\Hanzify Forum Inno Article.chm; DestDir: {app}\Docs; Flags: ignoreversion; Components: Help\Hanzify; Tasks:
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Docs\Inno Setup Extensions Knowledge Base.chm; DestDir: {app}\Docs; Flags: ignoreversion; Components: Help\Isxkb; Tasks:
;Source: {#Docs}\VCL_Win32SDK_Help\*; DestDir: {app}\Docs\VCL_Win32SDK_Help\; Components: Help\VCL; Flags: ignoreversion recursesubdirs createallsubdirs
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Docs\Inno Setup ISD Format.htm; DestDir: {app}\Docs; Flags: ignoreversion; Components: Help\ISD; Tasks:
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Docs\DelphiKey.htm; DestDir: {app}\Docs; Flags: ignoreversion; Components: Help; Tasks:

Source: D:\Version\[Inno]\Inno-All-in-One-Setup\\Res\ISetup.chm; DestDir: {app}; Languages: ChineseSimp; BeforeInstall: AddToDetaList; Flags: ignoreversion

;Extensions



    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\Graphics\*; DestDir: {app}\Extensions\Graphics; Components: ; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList




    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\Graphics\*; DestDir: {app}\Extensions\Graphics; Components: ; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList

;UninsHs


    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\UninsHs.Iss; DestDir: {app}\Examples\; Components: Extensions\UninsHs; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\UninsHs\*; DestDir: {app}\Extensions\UninsHs; Components: Extensions\UninsHs; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList



    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\UninsHs.Iss; DestDir: {app}\Examples\; Components: Extensions\UninsHs; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\UninsHs\*; DestDir: {app}\Extensions\UninsHs; Components: Extensions\UninsHs; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList

;Converter



    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\Converter\*; DestDir: {app}\Extensions\Converter; Components: Extensions\Converter; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList




    Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\Converter\*; DestDir: {app}\Extensions\Converter; Components: Extensions\Converter; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList


;Restools Recommanded Fonts
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\CodeFont\CourierNewEx.fon; DestDir: {app}\Extensions\CodeFont; Components: EasySets\CodeFont; Flags: onlyifdoesntexist ignoreversion fontisnttruetype; FontInstall: Courier New Ex; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\CodeFont\Megatops ProCoder 1.0.fon; DestDir: {app}\Extensions\CodeFont; Components: EasySets\CodeFont; Flags: onlyifdoesntexist ignoreversion fontisnttruetype; FontInstall: Megatops ProCoder 1.0; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\CodeFont\Raize.fon; DestDir: {app}\Extensions\CodeFont; Components: EasySets\CodeFont; Flags: onlyifdoesntexist ignoreversion fontisnttruetype; FontInstall: Raize; BeforeInstall: AddToDetaList

;SkyGz Enhanced Unpack Tools
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\Unpack\innounp.exe; DestDir: {app}\Extensions\Unpack; Flags: ignoreversion touch; Components:  Extensions\Unpack\InnoExp; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\Unpack\Languages\*.dll; DestDir: {app}\Extensions\Unpack\Languages; Flags: ignoreversion touch; Components:  Extensions\Unpack\InnoExp; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\Unpack\ISUnp.exe; DestDir: {app}\Extensions\Unpack; Components: Extensions\Unpack\InnoExp; BeforeInstall: AddToDetaList; Flags: ignoreversion touch
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\Unpack\Languages\*.lng; DestDir: {app}\Extensions\Unpack\Languages; Flags: ignoreversion touch; Components: Extensions\Unpack\InnoExp; BeforeInstall: AddToDetaList

Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\Unpack\DisasmGUI.exe; DestDir: {app}\Extensions\Unpack; Components: Extensions\Unpack\Disasm; BeforeInstall: AddToDetaList; Flags: ignoreversion touch
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\Unpack\Disasm.exe; DestDir: {app}\Extensions\Unpack; Components: Extensions\Unpack\Disasm; BeforeInstall: AddToDetaList; Flags: ignoreversion touch

Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Extensions\InnoLogView\*; DestDir: {app}\Extensions\InnoLogView; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Extensions\InnoLogView

;Nsis Resouces
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\\Nsis\Graphics\Header\*; DestDir: {app}\Extensions\Graphics\Nsis_Header; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Nsis\Graphics\Header
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\\Nsis\Graphics\Wizard\*; DestDir: {app}\Extensions\Graphics\Nsis_Wizard; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Nsis\Graphics\Wizard
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\\Nsis\Graphics\Icons\*; DestDir: {app}\Extensions\Graphics\Nsis_Icons; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Nsis\Graphics\Icons
;MUIOrangeVistaTheme
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\\Nsis\Graphics\MUIOrangeVistaTheme\*; DestDir: {app}\Extensions\Graphics\Nsis_MUIOrangeVistaTheme; Components: Nsis\Graphics\MUIOrangeVistaTheme; Tasks: ; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\\Nsis\Graphics\MUIOrangeVistaTheme_CD\*; DestDir: {app}\Extensions\Graphics\Nsis_MUIOrangeVistaTheme_CD; Components: Nsis\Graphics\MUIOrangeVistaTheme_CD; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList

;Examples
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\UI\Install Shield Skins\*; DestDir: {app}\Examples\UI\Install Shield Skins; Tasks: ; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList
;Source: {#Examples}\UI\MUI_InstallShield\*; DestDir: {app}\Examples\UI\MUI_InstallShield; Tasks: ; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\UI\WaitingForm\*; DestDir: {app}\Examples\UI\WaitingForm; Tasks: ; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\Autorun\*; DestDir: {app}\Examples\Autorun; Tasks: ; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList

Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\browse for a machine.iss; DestDir: {app}\Examples; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\SelfDel.iss; DestDir: {app}\Examples; Flags: ignoreversion; BeforeInstall: AddToDetaList
;Mui_Nsis
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\MUIs\Mui_Nsis.Ish; DestDir: {app}\Include\MUIs; Components: Nsis; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\MUIs\Mui_Nsis_Adv.Ish; DestDir: {app}\Include\MUIs; Components: Nsis; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Examples\UI\Mui_Nsis\*; DestDir: {app}\Examples\UI\Mui_Nsis; Components: Nsis; Tasks: ; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList

Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\MUIs\AllMove.Ish; DestDir: {app}\Include\MUIs; Flags: ignoreversion; BeforeInstall: AddToDetaList

;Include
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\PreDefines.ish; DestDir: {app}\Include; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\AnimateWindow.ish; DestDir: {app}\Include; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\SHFileOperation.ish; DestDir: {app}\Include; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Include\ExecAndWait.Ish; DestDir: {app}\Include; Flags: ignoreversion; BeforeInstall: AddToDetaList

;Plugin
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\Plugins\ISCrypt.dll; DestDir: {app}; Flags: ignoreversion; BeforeInstall: AddToDetaList

;Languages
Source: D:\Version\[Inno]\Inno-All-in-One-Setup\\Res\Languages\*; DestDir: {app}\Languages; Components:  not (ISCmplr_Setup\Restools_MiniVCL or ISCmplr_Setup\Restools_FullVCL); Tasks: ; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList
Source: {app}\Default.isl; DestDir: {app}\Languages; DestName: English.isl; Flags: ignoreversion skipifsourcedoesntexist external; BeforeInstall: AddToDetaList
Source: {app}\Languages\English.isl; DestDir: {app}; DestName: Default.isl;Components: IDE\Restools; Tasks: Restools_Lang_En; Flags: ignoreversion skipifsourcedoesntexist external; BeforeInstall: AddToDetaList
Source: {app}\Languages\{language}.isl; DestDir: {app}; DestName: Default.isl; Tasks: not Restools_Lang_En; Flags: ignoreversion skipifsourcedoesntexist external; BeforeInstall: AddToDetaList

[InstallDelete]
;old ISPP files
Type: files; Name: {app}\ISCmplr.dls
Type: files; Name: {app}\Builtins.iss
;optional ISCrypt files
Type: files; Name: {app}\IsCrypt.dll
;optional desktop icon files
Type: files; Name: {commondesktop}\Inno Setup Compiler.lnk
;older versions created the desktop icon under {userdesktop}
Type: files; Name: {userdesktop}\Inno Setup Compiler.lnk
;Some includes in old dir;
Type: files; Name: {app}\Include\botva2.Ish;
Type: files; Name: {app}\Include\Mui_Nsis.Ish;
Type: files; Name: {app}\Include\itdownload.ish
Type: files; Name: {app}\Include\trayiconctrl.ish
Type: files; Name: {app}\Include\execctrl.ish

[UninstallDelete]
Type: files; Name: {app}\Examples\Output\setup.exe
Type: files; Name: {app}\Examples\Output\setup-*.bin
Type: dirifempty; Name: {app}\Examples\Output
Type: dirifempty; Name: {app}\Examples\MyDll\Delphi
Type: dirifempty; Name: {app}\Examples\MyDll\C
Type: dirifempty; Name: {app}\Examples\MyDll
Type: dirifempty; Name: {app}\Examples

Type: files; Name: {userdocs}\Inno Setup Examples Output\setup.exe
Type: files; Name: {userdocs}\Inno Setup Examples Output\setup-*.bin

Type: files; Name: {app}\Examples\Preprocessed.iss
Type: files; Name: {app}\Extensions\Unpack\Config.ini; Components: Extensions\Unpack\InnoExp
Type: filesandordirs; Name: {app}\Extensions\Graphics\*\Thumbs.db; Components: Nsis; Tasks:
Type: files; Name: {app}\Extensions\Graphics\Checks\Thumbs.db; Components: Nsis; Tasks:
Type: files; Name: {app}\Extensions\Graphics\Header\Thumbs.db; Components: Nsis; Tasks:
Type: files; Name: {app}\Extensions\Graphics\Wizard\Thumbs.db; Components: Nsis; Tasks:

[Icons]
Name: {commondesktop}\Inno Setup ¼¯³É°æ; Filename: {app}\Compil32.exe; Tasks: DesktopIcon
Name: {userappdata}\Microsoft\Internet Explorer\Quick Launch\Inno Setup ¼¯³É°æ; Filename: {app}\Compil32.exe; Tasks: QuickLaunchIcon

;Name: {group}\{#AppName}; Filename: {app}\{#AppExeName}
Name: {group}\{cm:UninstallProgram,Inno Setup ¼¯³É°æ}; Filename: {uninstallexe}

Name: {group}\{cm:Inno} {cm:Compiler}; Filename: {app}\Compil32.exe; WorkingDir: {app}
Name: {group}\{cm:Inno} {cm:Examples}; Filename: {app}\Examples\
;Inno Help
Name: {group}\{cm:Help}\{cm:Inno} {cm:Documentation}; Filename: {app}\ISetup.chm
Name: {group}\{cm:Help}\{cm:Inno} {cm:FAQ}; Filename: {app}\isfaq.htm
Name: {group}\{cm:Help}\{cm:Inno} {cm:Revision_History}; Filename: {app}\whatsnew.htm
Name: {group}\{cm:Help}\Ish Í·ÎÄ¼þ Ê¹ÓÃËµÃ÷; Filename: {app}\Docs\[Ish]\ReadMe.txt
Name: {group}\{cm:Help}\°æ±¾¸üÐÂËµÃ÷; Filename: {app}\{app}\UninsFiles\What's new.txt

;Docs
Name: {group}\{cm:Docs}\{cm:Inno} {cm:Docs}; Filename: {app}\Docs\
Name: {group}\{cm:Docs}\{cm:Chm_Hanzify}; Filename: {app}\Docs\Hanzify Forum Inno Article.chm; Components: Help\Hanzify
Name: {group}\{cm:Docs}\{cm:Inno} {cm:ISD}; Filename: {app}\Docs\Inno Setup ISD Format.htm; Components: Help\ISD; Tasks:
Name: {group}\{cm:Docs}\{cm:Inno} {cm:Isxkb}; Filename: {app}\Docs\Inno Setup Extensions Knowledge Base.chm; Components: Help\Isxkb; Tasks: ; Languages: 
Name: {group}\{cm:Docs}\DelphiKey; Filename: {app}\Docs\DelphiKey.htm; Components: Help; Tasks:
;Inno Online Help
Name: {group}\{cm:Docs}\{cm:Inno} {cm:Isxkb_Online}; Filename: http://www.vincenzo.net/isxkb/index.php?title=Main_Page; Components: ; Tasks: ; Languages: 
Name: {group}\{cm:Docs}\{cm:Inno} {cm:Newsgroups}; Filename: http://www.jrsoftware.org/newsgroups.php; Components: ; Tasks: ; Languages: 
Name: {group}\{cm:Docs}\Inno Setup Feature Request; Filename: http://innosetup.uservoice.com/forums/33177-inno-setup-feature-request; Components: ; Tasks: ; Languages:
Name: {group}\{cm:Docs}\Restools WebSite; Filename: http://restools.hanzify.org; Components: ; Tasks: ; Languages:

;Extensions
Name: {group}\{cm:Extensions}\{cm:Inno} {cm:Extensions}; Filename: {app}\Extensions\; Components: Extensions
;ISSkin
Name: {group}\{cm:Extensions}\{cm:Inno} Skin Builder; Filename: {app}\Extensions\ISSkin\SkinBuilder.exe; WorkingDir: {app}\Extensions\ISSkin; Components: Extensions\IsSkin_SkinBuilder
Name: {group}\{cm:Extensions}\ISSkinViewer; Filename: {app}\Extensions\ISSkin\ISSkinViewer.exe; Components: Extensions\IsSkin_Styles; Tasks:
Name: {group}\{cm:Extensions}\{cm:Converter}; Filename: {app}\Extensions\Converter\Converter.exe; Components: Extensions\Converter
Name: {group}\{cm:Extensions}\{cm:InnoLogView}; Filename: {app}\Extensions\InnoLogView\InnoLogView.exe; Components: Extensions\InnoLogView; Tasks:

;Inno Unpack Tools
Name: {group}\{cm:Unpack}\{cm:Inno} Unpacker Explorer; Filename: {app}\Extensions\Unpack\ISUnp.exe; WorkingDir: {app}\Extensions\Unpack; Comment: ISUnp; Flags: createonlyiffileexists; IconIndex: 0; Components: Extensions\Unpack\InnoExp
Name: {group}\{cm:Unpack}\{cm:Inno} Disasm Tool; Filename: {app}\Extensions\Unpack\DisasmGUI.exe; Flags: createonlyiffileexists; Components: Extensions\Unpack\Disasm

[Registry]
Root: HKCU; SubKey: Software\Microsoft\Windows\CurrentVersion\Explorer\MenuOrder\Start Menu\Programs\{code:ExtractFileName|{group}}; Flags: deletekey uninsdeletekey
Root: HKCU; SubKey: Software\Microsoft\Windows\CurrentVersion\Explorer\MenuOrder\Start Menu2\Programs\{code:ExtractFileName|{group}}; Flags: deletekey uninsdeletekey
;Unicode Font Link
Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink; ValueType: multisz; ValueName: Courier New; ValueData: SimSun.TTC,SimSun{break}gulim.ttc,gulim{break}MSGOTHIC.TTC,MS UI Gothic{break}mingliu.ttc,PMingLiU{break}BATANG.TTC,Batang{break}{break}; Components: Inno\Unicode and EasySets\CodeFont; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink; ValueType: multisz; ValueName: Megatops ProCoder 1.0; ValueData: SimSun.TTC,SimSun{break}gulim.ttc,gulim{break}MSGOTHIC.TTC,MS UI Gothic{break}mingliu.ttc,PMingLiU{break}BATANG.TTC,Batang{break}{break}; Components: Inno\Unicode and EasySets\CodeFont; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink; ValueType: multisz; ValueName: Raize; ValueData: SimSun.TTC,SimSun{break}gulim.ttc,gulim{break}MSGOTHIC.TTC,MS UI Gothic{break}mingliu.ttc,PMingLiU{break}BATANG.TTC,Batang{break}{break}; Components: Inno\Unicode and EasySets\CodeFont; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink; ValueType: multisz; ValueName: Courier New Ex; ValueData: SimSun.TTC,SimSun{break}gulim.ttc,gulim{break}MSGOTHIC.TTC,MS UI Gothic{break}mingliu.ttc,PMingLiU{break}BATANG.TTC,Batang{break}{break}; Components: Inno\Unicode and EasySets\CodeFont; Flags: uninsdeletevalue uninsdeletekeyifempty

Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorGutterFontName; ValueData: Courier New Ex; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\CodeFont
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorFontName; ValueData: Courier New Ex; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\CodeFont

Root: HKCR; Subkey: exefile\shell\Inno Setup Unpacker Explorer; Flags: uninsdeletekey noerror; Tasks: InnoExp_ICON
Root: HKCR; SubKey: exefile\shell\Inno Setup Unpacker Explorer\Command; ValueType: string; ValueData: """{app}\Extensions\Unpack\ISUnp.exe"" ""%1"""; Tasks: InnoExp_ICON

Root: HKCR; SubKey: Applications\Compil32.exe; Flags: deletekey; Tasks: AssocIss
Root: HKCR; SubKey: .iss; ValueType: string; ValueData: InnoSetupScriptFile; Flags: uninsdeletekey; Tasks: AssocIss
Root: HKCR; SubKey: .iss; ValueType: string; ValueName: Content Type; ValueData: text/plain; Flags: uninsdeletekey; Tasks: AssocIss

Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupScriptFile; ValueType: string; ValueData: Inno Setup ½Å±¾; Flags: uninsdeletekey; Tasks: AssocIss
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupScriptFile\DefaultIcon; ValueType: string; ValueData: {app}\Compil32.exe,1; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: AssocIss
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupScriptFile\shell; Flags: uninsdeletekeyifempty; Tasks: AssocIss
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupScriptFile\shell\Compile; ValueType: string; ValueData: ±àÒë(&L); Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: AssocIss
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupScriptFile\shell\Compile\command; ValueType: string; ValueData: """{app}\Compil32.exe"" /cc ""%1"""; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: AssocIss
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupScriptFile\shell\open; Flags: uninsdeletekeyifempty; Tasks: AssocIss
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupScriptFile\shell\open\command; ValueType: string; ValueData: """{app}\Compil32.exe"" ""%1"""; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: AssocIss
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupScriptFile\shell\OpenWithInnoSetup; ValueType: string; ValueData: ÓÃ Inno Setup ´ò¿ª(&I); Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: AssocIss
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupScriptFile\shell\OpenWithInnoSetup\command; ValueType: string; ValueData: """{app}\Compil32.exe"" ""%1"""; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: AssocIss

Root: HKCR; SubKey: .ish; ValueType: string; ValueData: InnoSetupHeaderFile; Flags: uninsdeletekey; Tasks: AssocIsh
Root: HKCR; SubKey: .ish; ValueType: string; ValueName: Content Type; ValueData: text/plain; Flags: uninsdeletekey; Tasks: AssocIsh

Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupHeaderFile; ValueType: string; ValueData: Inno Setup Í·ÎÄ¼þ; Flags: uninsdeletekey; Tasks: AssocIsh
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupHeaderFile\DefaultIcon; ValueType: string; ValueData: {app}\Compil32.exe,1; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: AssocIsh
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupHeaderFile\shell; Flags: uninsdeletekeyifempty; Tasks: AssocIsh
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupHeaderFile\shell\open; Flags: uninsdeletekeyifempty; Tasks: AssocIsh
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupHeaderFile\shell\open\command; ValueType: string; ValueData: """{app}\Compil32.exe"" ""%1"""; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: AssocIsh
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupHeaderFile\shell\OpenWithInnoSetup; ValueType: string; ValueData: ÓÃ Inno Setup ´ò¿ª(&I); Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: AssocIsh
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupHeaderFile\shell\OpenWithInnoSetup\command; ValueType: string; ValueData: """{app}\Compil32.exe"" ""%1"""; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: AssocIsh

Root: HKLM; SubKey: SOFTWARE\Classes\.cjstyles; ValueType: string; ValueData: SkinBuilder.StyleDocument; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Classes\.cjstyles\ShellNew; ValueType: string; ValueName: NullFile; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Classes\.skinproj; ValueType: string; ValueData: SkinBuilder.Document; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Classes\.skinproj\ShellNew; ValueType: string; ValueName: NullFile; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Classes\SkinBuilder.Document; ValueType: string; ValueData: Skin Builder Project; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Classes\SkinBuilder.Document\DefaultIcon; ValueType: string; ValueData: {app}\Extensions\ISSkin\SkinBuilder.exe,1; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Classes\SkinBuilder.Document\shell; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Classes\SkinBuilder.Document\shell\open; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Classes\SkinBuilder.Document\shell\open\command; ValueType: string; ValueData: "{app}\Extensions\ISSkin\SkinBuilder.exe ""%1"""; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Classes\SkinBuilder.Document\shell\print; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Classes\SkinBuilder.Document\shell\print\command; ValueType: string; ValueData: "{app}\Extensions\ISSkin\SkinBuilder.exe /p ""%1"""; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Classes\SkinBuilder.Document\shell\printto; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Classes\SkinBuilder.Document\shell\printto\command; ValueType: string; ValueData: "{app}\Extensions\ISSkin\SkinBuilder.exe /pt ""%1"" ""%2"" ""%3"" ""%4"""; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Classes\SkinBuilder.StyleDocument; ValueType: string; ValueData: Skin Builder Style Project; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Classes\SkinBuilder.StyleDocument\DefaultIcon; ValueType: string; ValueData: {app}\Extensions\ISSkin\SkinBuilder.exe,2; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Classes\SkinBuilder.StyleDocument\shell; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Classes\SkinBuilder.StyleDocument\shell\open; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Classes\SkinBuilder.StyleDocument\shell\open\command; ValueType: string; ValueData: "{app}\Extensions\ISSkin\SkinBuilder.exe ""%1"""; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Classes\SkinBuilder.StyleDocument\shell\print; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Classes\SkinBuilder.StyleDocument\shell\print\command; ValueType: string; ValueData: "{app}\Extensions\ISSkin\SkinBuilder.exe /p ""%1"""; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Classes\SkinBuilder.StyleDocument\shell\printto; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Classes\SkinBuilder.StyleDocument\shell\printto\command; ValueType: string; ValueData: "{app}\Extensions\ISSkin\SkinBuilder.exe /pt ""%1"" ""%2"" ""%3"" ""%4"""; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Codejock Software Applications\Codejock Skin Builder; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletekey
Root: HKCU; SubKey: Software\Codejock Software Applications; Components: Extensions\IsSkin_SkinBuilder; Flags: uninsdeletekeyifempty


[Code]
var
  Modifying: Boolean;

  As_Tips: TArrayOfString;

procedure ExitProcess(exitCode:integer);
  external 'ExitProcess@kernel32.dll stdcall';

function UpdateIcon(const hWnd: Integer; const exeFileName, exeIcon, IcoFileName: String; wlangID: DWORD): Boolean;
external 'UpdateIcon@files:UpdateIcon.dll stdcall';

const
  WH_MOUSE = 7;

type
  TMouseHookStruct = record
    pt: TPoint;
    hwnd: HWND;
    wHitTestCode: UINT;
    dwExtraInfo: DWORD;
  end;

  TMessageProc = procedure(nCode: LongWord; wParam: LongWord; lParam: TMouseHookStruct);

function GetWindowRect(hWnd: HWND; var lpRect: TRect): BOOL;
external 'GetWindowRect@user32.dll stdcall';

function SetWinHookEx(idHook: Integer; MessageProc: TMessageProc): Boolean;
external 'SetWinHookExW@{tmp}\winmsgctrl.dll stdcall delayload';
  

var
  HandleMark: Boolean;

function MyPtInRect(const lprc: TRect; pt: TPoint): Boolean;
begin
  Result := (pt.x >= lprc.Left) and (pt.x <= lprc.Right) and (pt.y >= lprc.Top) and (pt.y <= lprc.Bottom);
end;

procedure MyMessageProc(nCode: LongWord; wParam: LongWord; lParam: TMouseHookStruct);
var
  MPpt: TPoint;
  ItemRect: TRect;
begin
  if HandleMark then exit;
  if nCode >= 0 then
  try
    HandleMark := True;
    MPpt := lParam.pt;
    GetWindowRect(WizardForm.BeveledLabel.Handle, ItemRect);
    ItemRect.Right := ItemRect.Left + WizardForm.Bevel.Width;

		if (lParam.hwnd = WizardForm.BeveledLabel.Handle) or MyPtInRect(ItemRect, MPpt) then
    begin
      WizardForm.BeveledLabel.Font.Style := [fsUnderline];
    end
    else
    begin
      WizardForm.BeveledLabel.Font.Style := [];
    end;
  finally
    HandleMark := False;
  end;
end;


function ModifyingCheck: Boolean;
begin
  Result := Modifying;
end;

var
  btn_NewComps: TButton;
  frm_NewComps: TForm;
  pnl_Top, Pnl_Left, Pnl_Right, Pnl_Bottom, Pnl_Main: TPanel;
  TypeIndex: Integer;

procedure frm_NewCompsClose(Sender: TObject; var Action: TCloseAction);
begin
  with WizardForm do
  begin
    TypeIndex := TypesCombo.ItemIndex;
    TypesCombo.Parent := SelectComponentsPage;
    TypesCombo.ItemIndex := TypeIndex;
    TypesCombo.Top := SelectComponentsLabel.Top + SelectComponentsLabel.Height + ScaleX(5);
    ComponentsList.Align := alNone;
    ComponentsList.Top := TypesCombo.Top + TypesCombo.Height + ScaleY(5);
    ComponentsList.Parent := SelectComponentsPage;
    ComponentsList.Width := SelectComponentsPage.Width;
    ComponentsList.Height := SelectComponentsPage.Height - TypesCombo.Top - TypesCombo.Height - ScaleY(10);
  end;
  
  with btn_NewComps do
  begin
    Parent := WizardForm.SelectComponentsPage;
    Caption := 'ÐÂ´°¿ÚÑ¡Ôñ';
    Top := WizardForm.TypesCombo.Top;
  end;
end;

procedure btn_NewCompsClick(Sender: TObject);
begin
  if btn_NewComps.Parent <> WizardForm.SelectComponentsPage then
  begin
    frm_NewComps.Close;
    WizardForm.Show;
  end
  else
  begin
    if not Assigned(frm_NewComps) then
    begin
      frm_NewComps := TForm.Create(WizardForm);
      with frm_NewComps do
      begin
        Position := poScreenCenter;
        Width := WizardForm.Width + ScaleX(100);
        Height := WizardForm.Height + ScaleY(100);
        AutoScroll := False;
        Caption := '×é¼þÑ¡Ôñ - ' + WizardForm.Caption;
        OnClose := @frm_NewCompsClose;
        Visible := False;
        FormStyle := fsStayOnTop;
      end;

      Pnl_Left := TPanel.Create(WizardForm);
      with Pnl_Left do
      begin
        Align := alLeft;
        Parent := frm_NewComps;
        BevelOuter := bvNone;
        Width := ScaleX(5);
      end;

      Pnl_Right := TPanel.Create(WizardForm);
      with Pnl_Right do
      begin
        Align := alRight;
        Parent := frm_NewComps;
        BevelOuter := bvNone;
        Width := ScaleX(5);
      end;

      pnl_Top := TPanel.Create(WizardForm);
      with pnl_Top do
      begin
        Align := alTop;
        Parent := frm_NewComps;
        BevelOuter := bvNone;
        Height := ScaleY(35);
      end;

      pnl_Top := TPanel.Create(WizardForm);
      with pnl_Top do
      begin
        Parent := frm_NewComps;
        BevelOuter := bvNone;
        Left := ScaleX(5);
        Width := frm_NewComps.Width - Left * 2;
      end;

      Pnl_Bottom := TPanel.Create(WizardForm);
      with Pnl_Bottom do
      begin
        Align := alBottom;
        Parent := frm_NewComps;
        BevelOuter := bvNone;
        Height := ScaleY(5);
      end;
      
      Pnl_Main := TPanel.Create(WizardForm);
      with Pnl_Main do
      begin
        Align := alClient;
        Parent := frm_NewComps;
        BevelOuter := bvNone;
      end;
    end;

    with btn_NewComps do
    begin
      Parent := pnl_Top;
      Caption := '·µ»ØÏòµ¼Ò³Ãæ';
      Top := ScaleY(5);
      Cancel := True;
    end;
    
    with WizardForm do
    begin
      TypeIndex := TypesCombo.ItemIndex;
      TypesCombo.Parent := pnl_Top;
      TypesCombo.ItemIndex := TypeIndex;
      TypesCombo.Top := ScaleY(5);
      ComponentsList.Parent := Pnl_Main;
      ComponentsList.Align := alClient;
      frm_NewComps.ActiveControl := ComponentsList;
    end;

    WizardForm.Hide;
    try
      frm_NewComps.ShowModal;
    finally
      WizardForm.Show;
    end;
  end;
end;

procedure NewFormComponents();
begin
  btn_NewComps := TButton.Create(WizardForm);
  with btn_NewComps do
  begin
    Parent := WizardForm.SelectComponentsPage;
    Caption := 'ÐÂ´°¿ÚÑ¡Ôñ';
    Width := ScaleX(90);
    Height := WizardForm.TypesCombo.Height;
    Left := WizardForm.SelectComponentsPage.Width - Width;
    Top := WizardForm.SelectComponentsLabel.Top + WizardForm.SelectComponentsLabel.Height + ScaleX(5);
    OnClick := @btn_NewCompsClick;
  end;

  with WizardForm do
  begin
    TypesCombo.Width := SelectComponentsPage.Width - btn_NewComps.Width - ScaleX(5);
    WizardForm.TypesCombo.Top := WizardForm.SelectComponentsLabel.Top + WizardForm.SelectComponentsLabel.Height + ScaleX(5);
  end;
end;

function CheckUpdate(): Boolean;
var
  Ver, Url, Message, Tips: string;
  Frm_Update: TForm;
  Btn_UpOK, Btn_UpCancel: TButton;
  Mmo_UpMessage: TRichEditViewer;
begin
  Result := False;
  PDir('ItDownload.dll');
  itd_init;

  if itd_downloadfile('http://app.kngstr.com/update/is/info.ini',ExpandConstant('{tmp}\d8Inno.tmp'))=ITDERR_SUCCESS then
  begin
    Ver := GetIniString('Main', 'Ver', '', ExpandConstant('{tmp}\d8Inno.tmp'));
    Url := GetIniString('Main', 'Url', '', ExpandConstant('{tmp}\d8Inno.tmp'));
    Message := GetIniString('Main', 'Message', '', ExpandConstant('{tmp}\d8Inno.tmp'));
    Tips := GetIniString('Main', 'Tips', '', ExpandConstant('{tmp}\d8Inno.tmp'));

    if CompareVersion(Ver, '2018.1.18.10') > 0 then  //ÓÐ¸üÐÂ
    begin
      if itd_downloadfile(Message,ExpandConstant('{tmp}\d8Inno.tmp'))=ITDERR_SUCCESS then
      begin
        Frm_Update := TForm.Create(nil);
        with Frm_Update do
        try
          Position := poScreenCenter;
          BorderStyle := bsSingle;
          BorderIcons := [biSystemMenu, biMinimize];
          Width := 397;
          Height := 260;
      		Caption := '¸üÐÂÍ¨Öª - ' + SetupMessage(msgSetupAppTitle);

          Mmo_UpMessage := TRichEditViewer.Create(Frm_Update);
          with Mmo_UpMessage do
          begin
            Parent := Frm_Update;
            Top := 5;
            Left := 5;
            Width := Parent.Width - Left * 3;
            Height := Parent.Height - Top - 70;
            ReadOnly := True;
            ScrollBars := ssVertical;
            UseRichEdit := True;
            Lines.LoadFromFile(ExpandConstant('{tmp}\d8Inno.tmp'));
            RTFText := Lines.Text;
          end;

          Btn_UpOK := TButton.Create(Frm_Update);
          with Btn_UpOK do
          begin
            Parent := Frm_Update;
            Top := Mmo_UpMessage.Top + Mmo_UpMessage.Height + 10;
            Left := Parent.Width / 2 - Width - 10;
            Caption := 'Á¢¼´ÏÂÔØ';
            ModalResult := mrOk;
          end;

          Btn_UpCancel := TButton.Create(Frm_Update);
          with Btn_UpCancel do
          begin
            Parent := Frm_Update;
            Top := Btn_UpOK.Top;
            Left := Btn_UpOK.Left + Btn_UpOK.Width + 20;
            Caption := '·ÅÆú¸üÐÂ';
            ModalResult := mrCancel;
          end;
          if Frm_Update.ShowModal = mrOk then
          begin
            OpenSite(Url);
            Result := True;
          end;
        finally
          Free;
        end;
      end;
    end;

    if itd_downloadfile(Tips,expandconstant('{tmp}\d8Inno.tmp'))=ITDERR_SUCCESS then
    begin
      LoadStringsFromFile(expandconstant('{tmp}\d8Inno.tmp'), As_Tips);
    end;
  end;
end;

var
  OldEvent_DirBrowseButtonClick: TNotifyEvent;
procedure DirBrowseButtonClick(Sender: TObject);
begin
  try
    WizardForm.FormStyle := fsNormal;
    OldEvent_DirBrowseButtonClick(Sender);
  finally
    WizardForm.FormStyle := fsStayOnTop;
  end;
end;

procedure InitializeWizard();
var
  F: AnsiString;
  WaterHandle:Integer;
begin
  InitTray();
  WizardForm.FormStyle := fsStayOnTop;

  ModifyUI;

  AddLinkandInfo;
  DetailInfo;
  
  NewFormComponents;

  with WizardForm.DirBrowseButton do
  begin
    OldEvent_DirBrowseButtonClick := OnClick;
    OnClick := @DirBrowseButtonClick;
  end;

  if ScaleX(100) = 100 then begin
    WaterSupportAuthor(False);
    F:= ExpandConstant('{tmp}\WizardImage.bmp');
    WizardForm.WizardBitmapImage.Bitmap.SaveToFile(F);
    WaterHandle := WaterInit(WizardForm.WelcomePage.Handle, 0, 0);
    with WizardForm.WizardBitmapImage do
      WaterSetBounds(WaterHandle, Left, Top, Width, Height);
    WaterSetFile(WaterHandle, AnsiString(F));
    WaterSetActive(WaterHandle, True);
    DeleteFile(F);
  end;

  SetWinHookEx(WH_MOUSE, @MyMessageProc);

  FormShadow(WizardForm.Handle);
end;

function InitializeSetup(): Boolean;
var
  i: Integer;
begin

  Result := True;

  with PreExtractInfo('') do
  begin
    Show;
    Hide;

    SetWindowLong(Handle, GWL_EXSTYLE, WS_EX_LAYERED);
    SetLayeredWindowAttributes(Handle, 0, 210, LWA_ALPHA);

    AnimateWindow(Handle, 500, AW_CENTER or AW_ACTIVATE);
    Show;
    Repaint;

    for i := 0 to 10 do
    begin
      lbl_PreEx.Caption := 'ÒÑ¼ÓÔØ£º' + IntToStr(i * 100 / 10) + '%';
      Repaint;
      case i of
        1:
        begin
          lbl_PreEx.Caption := lbl_PreEx.Caption + ' [ÊÍ·ÅISWin7]';
          Repaint;
          Sleep(100);


          PDir('ISWin7.dll');
        end;
        2:
        begin
          lbl_PreEx.Caption := lbl_PreEx.Caption + ' [ÊÍ·ÅWaterLib]';
          Repaint;
          Sleep(100);

          PDir('WaterLib.dll');
        end;
        3:
        begin
          lbl_PreEx.Caption := lbl_PreEx.Caption + ' [ÊÍ·ÅMsgCtrl]';
          Repaint;
          Sleep(100);

          PDir('winmsgctrl.dll');
        end;
        4:
        begin
          lbl_PreEx.Caption := lbl_PreEx.Caption + ' [ÊÍ·ÅISSkin]';
          Repaint;
          Sleep(100);

          PDir('ISSkinU.dll');
        end;
        5:
        begin
          lbl_PreEx.Caption := lbl_PreEx.Caption + ' [ÊÍ·ÅIssProc]';
          Repaint;
          Sleep(100);

          PDir('IssProcLanguage.ini');
          PDir('IssProc.dll');
        end;
        6:
        begin
          lbl_PreEx.Caption := lbl_PreEx.Caption + ' [ÊÍ·ÅIsTask]';
          Repaint;
          Sleep(100);

          PDir('ISTask.dll');
        end;
        7:
        begin
          lbl_PreEx.Caption := lbl_PreEx.Caption + ' [ÊÍ·ÅTrayIconCtrl]';
          Repaint;
          Sleep(100);

          PDir('trayiconctrl.dll');
        end;
        8:
        begin
          lbl_PreEx.Caption := lbl_PreEx.Caption + ' [¼ì²é¸üÐÂ]';
          Repaint;

          if CheckUpdate then Result := False;
        end;
        9:
        begin
            lbl_PreEx.Caption := lbl_PreEx.Caption + ' [ÆôÓÃÆ¤·ô]';
            Repaint;
            Sleep(100);

            RandomSkin(CustomMessage('Skins'));
        end
      end;

      if not Result then
      begin
        Break;
        Exit;
      end;
      lbl_PreEx.Caption := 'ÒÑ¼ÓÔØ£º' + IntToStr(i * 100 / 10) + '%';
      Repaint;

       PDir('ISWin7.dll'); PDir('ISTask.dll'); PDir('winmsgctrl.dll'); PDir('ItDownload.dll');
      AppProcessMessage;
    end;

    if not Result then Exit;
    lbl_PreEx.Caption := 'ÒÑ¼ÓÔØ£º100%';

    AnimateWindow(Handle, 500, AW_CENTER or AW_HIDE);
    Free;
  end;
end;

procedure DeinitializeSetup();
Begin
  try

    DeInitSkin;

    WaterAllFree;

    UnhookWinHookEx();
    DeinitTray();
  except
  end;
end;

procedure RandomTips;
begin
if not WizardForm.WelcomePage.Visible then
  if GetArrayLength(As_Tips) > 0 then
  begin
    ShowBalloon(As_Tips[Random(GetArrayLength(As_Tips))], 'Inno Setup ¼¯³É°æ 5.5.9', 0, 10, False);
  end;
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  Result := Modifying and ((PageID = wpSelectDir) or (PageID = wpSelectProgramGroup));
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  CurPageChanged_DetaInfo(CurPageID);
  RandomTips;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := NextButtonClick_DetaInfo(CurPageID);
  if Result and (CurPageID = wpReady) then
  begin
    try
      WizardForm.FormStyle := fsNormal;
      IssEnableAnyFileInUseCheck(ExpandConstant('{app}'));
      Result := AutoIssProc(ExpandConstant('*{app}*'), 'chs', false, true);
      WizardForm.FormStyle := fsStayOnTop;
    except
      Result := True;
    end;
  end;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  try
    WizardForm.FormStyle := fsNormal;
    CancelButtonClick_DetaInfo(CurPageID, Cancel, Confirm);
  finally
    if not Cancel then
      WizardForm.FormStyle := fsStayOnTop;
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  sl: TStringList;
  sIcon: String;
  i: Integer;
begin
  RandomTips;

  case CurStep of
    ssInstall:
    begin
      sIcon:= ExpandConstant('{tmp}\uninst.ico'); //¶¨ÒåÐ¶ÔØÍ¼±ê
      ExtractTemporaryFile(ExtractFileName(sIcon)); //ÊÍ·ÅÐ¶ÔØÍ¼±ê
      try
        UpdateIcon(MainForm.Handle, '', '', sIcon, 0); //Ìæ»»Ð¶ÔØÍ¼±ê
      except
      end;
    end;
    ssPostInstall:
    begin
      if FileExists(ExpandConstant('{app}\ISPPBuiltins.iss')) then
      begin
        sl := TStringList.Create;
        try
          sl.LoadFromFile(ExpandConstant('{app}\ISPPBuiltins.iss'));

          if sl.IndexOf('; END ISPPBUILTINS.ISS') <> -1 then
            i := sl.IndexOf('; END ISPPBUILTINS.ISS') - 1
          else
            i := sl.Count - 1;
            
          sl.Insert(i, '');
          sl.Insert(i, '#pragma include  __INCLUDE__ + ";" + AddBackslash(CompilerPath) + "Include;" + AddBackslash(ExtractFileDir(RemoveBackslash(CompilerPath))) + "Include;"' + #13#10 +
                   '#include "PreDefines.ish"');
          sl.Insert(i, '');
          
          sl.SaveToFile(ExpandConstant('{app}\ISPPBuiltins.iss'));
        finally
          sl.Free;
        end;
      end;
    end;
  end;
end;

function InitializeUninstall(): Boolean;
begin
  PDir('IssProcLanguage.ini');
  PDir('IssProc.dll');
  IssEnableAnyFileInUseCheck(ExpandConstant('{app}'));
  Result := AutoIssProc(ExpandConstant('*{app}\is*;*{app}\Inno*;*{app}\Examples\*;*{app}\Extensions\*;'), 'chsu', false, true);
end;

[/Code]
