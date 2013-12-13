//Author      : WLDNA
//Link        : http://www.wldna.com/
//Description :
//Modified    : 2013-11-14 11:40:59
//Tested Inno :
//Usage       : See Examples folder

#define private CurDir ExtractFileDir(__PATHFILENAME__)

#define SkyGz_Unpack False
;SkyGz Info
#if SkyGz_Unpack
  #define SkyGzVer ReadIni(CurDir + "\°²×°½Å±¾.iss", "Setup", "AppVersion", "")
  #define ISCmplr_SkyGz SkyGzVer + ' Build ' + GetFileDateTimeString(CurDir + '\{app}\{code_GetDir_Lib}\SetupLdr,1.e32', 'yymmdd', '', '')
  #define IDE_SkyGz SkyGzVer + ' Build ' + GetFileDateTimeString(CurDir + '\{app}\Compil32,2.exe', 'yymmdd', '', '')
#else
  #define SkyGzVer ISCmplr_VerStr(CurDir + "\ANSI\ISCC.exe", 'Ver')
  #define ISCmplr_SkyGz SkyGzVer + ' Build ' + GetFileDateTimeString(CurDir + '\ANSI\Setup.e32', 'yymmdd', '', '')
  #define IDE_SkyGz SkyGzVer + ' Build ' + GetFileDateTimeString(CurDir + '\ANSI\Compil32.exe', 'yymmdd', '', '')
#endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#if InnoVer == Copy(ISCmplr_SkyGz, 1, Len(InnoVer))
  #define Include_ISCmplr_SkyGz
#endif

[Files]
#if SkyGz_Unpack

;SkyGz Ansi Ispp
Source: "{#CurDir}\{app}\Compil32,2.exe"; DestDir: "{app}"; DestName: "Compil32.exe"; Components: Inno\Ansi and IDE\SkyGz; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList
  #ifdef Include_ISCmplr_SkyGz
Source: "{#CurDir}\{app}\ISCC,4.exe"; DestDir: "{app}"; DestName: "ISCC.exe"; Components: Inno\Ansi and ISCmplr_Setup\SkyGz; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList;
Source: "{#CurDir}\{app}\ISCmplr,2.dll"; DestDir: "{app}"; DestName: "ISCmplr.dll"; Components: Inno\Ansi and ISCmplr_Setup\SkyGz; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList;
Source: "{#CurDir}\{app}\{code_GetDir_Lib}\ISPP,2.dll"; DestDir: "{app}"; DestName: "ISPP.dll"; Components: Inno\Ansi and ISCmplr_Setup\SkyGz; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList;
Source: "{#CurDir}\{app}\{code_GetDir_Lib}\Setup,2.e32"; DestDir: "{app}"; DestName: "Setup.e32"; Components: Inno\Ansi and ISCmplr_Setup\SkyGz; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList
Source: "{#CurDir}\{app}\{code_GetDir_Lib}\SetupLdr,2.e32"; DestDir: "{app}"; DestName: "SetupLdr.e32"; Components: Inno\Ansi and ISCmplr_Setup\SkyGz; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList
  #endif
;SkyGz Unicode Ispp
Source: "{#CurDir}\{app}\Compil32,4.exe"; DestDir: "{app}"; DestName: "Compil32.exe"; Components: Inno\Unicode and IDE\SkyGz; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList;
  #ifdef Include_ISCmplr_SkyGz
Source: "{#CurDir}\{app}\ISCC,8.exe"; DestDir: "{app}"; DestName: "ISCC.exe"; Components: Inno\Unicode and ISCmplr_Setup\SkyGz; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList;
Source: "{#CurDir}\{app}\ISCmplr,4.dll"; DestDir: "{app}"; DestName: "ISCmplr.dll"; Components: Inno\Unicode and ISCmplr_Setup\SkyGz; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList;
Source: "{#CurDir}\{app}\{code_GetDir_Lib}\ISPP,4.dll"; DestDir: "{app}"; DestName: "ISPP.dll"; Components: Inno\Unicode and ISCmplr_Setup\SkyGz; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList;
Source: "{#CurDir}\{app}\{code_GetDir_Lib}\Setup,4.e32"; DestDir: "{app}"; DestName: "Setup.e32"; Components: Inno\Unicode and ISCmplr_Setup\SkyGz; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList;
Source: "{#CurDir}\{app}\{code_GetDir_Lib}\SetupLdr,4.e32"; DestDir: "{app}"; DestName: "SetupLdr.e32"; Components: Inno\Unicode and ISCmplr_Setup\SkyGz; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList;
;SkyGz Extend Help
Source: "{#CurDir}\{app}\{code_GetDir_help}\IsExtend.chm"; DestDir: "{app}"; Components: ISCmplr_Setup\SkyGz; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList;
  #endif
;CodeTemplates.dat
Source: "{#CurDir}\{app}\{code_GetDir_Config}\CodeTemplates.dat"; DestDir: "{app}"; Components: ISCmplr_Setup\SkyGz; Flags: confirmoverwrite ignoreversion promptifolder skipifsourcedoesntexist; BeforeInstall: AddToDetaList;
;SkyGz Examples
Source: {#CurDir}\{app}\Examples\UninstallCodeDll.iss; DestDir: {app}\Examples; Flags: ignoreversion; BeforeInstall: AddToDetaList;
  #ifdef Include_ISCmplr_SkyGz
Source: {#CurDir}\{app}\Examples\ExtendExample.iss; DestDir: {app}\Examples\SkyGz; Components: ISCmplr_Setup\SkyGz; Flags: ignoreversion; BeforeInstall: AddToDetaList;
  #endif
;Help
Source: {#CurDir}\{app}\{code_GetDir_help}\ISetup.chm; DestDir: {app}; Components: Inno; Languages: ChineseSimp; BeforeInstall: AddToDetaList; Flags: ignoreversion
Source: {#CurDir}\{app}\{code_GetDir_help}\ISPP.chm; DestDir: {app}; Components: Inno; Languages: ChineseSimp; BeforeInstall: AddToDetaList; Flags: ignoreversion
Source: {#CurDir}\{app}\{code_GetDir_help}\isfaq.htm; DestDir: {app}; Components: Inno; Languages: ChineseSimp; BeforeInstall: AddToDetaList; Flags: ignoreversion
Source: {#CurDir}\{app}\{code_GetDir_help}\whatsnew.htm; DestDir: {app}; Components: Inno; Languages: ChineseSimp; BeforeInstall: AddToDetaList; Flags: ignoreversion

#else

;SkyGz Ansi Ispp
  #ifdef Include_ISCmplr_SkyGz
Source: {#CurDir}\Ansi\*; Excludes: Compil32.*; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Ansi and ISCmplr_Setup\SkyGz; Tasks:
  #endif
Source: {#CurDir}\Ansi\Compil32.exe; DestDir: {app}; Flags: ignoreversion; BeforeInstall: AddToDetaList; Components: Inno\Ansi and IDE\SkyGz; Tasks:
;SkyGz Unicode Ispp
  #ifdef Include_ISCmplr_SkyGz
Source: {#CurDir}\Unicode\*; Excludes: Compil32.*; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Unicode and ISCmplr_Setup\SkyGz; Tasks:
  #endif
Source: {#CurDir}\Unicode\Compil32.exe; DestDir: {app}; Flags: ignoreversion; BeforeInstall: AddToDetaList; Components: Inno\Unicode and IDE\SkyGz; Tasks:

;SkyGz Examples
Source: {#CurDir}\Examples\UninstallCodeDll.iss; DestDir: {app}\Examples; Flags: ignoreversion; BeforeInstall: AddToDetaList;
  #ifdef Include_ISCmplr_SkyGz
Source: {#CurDir}\Examples\ExtendExample.iss; DestDir: {app}\Examples\SkyGz; Components: ISCmplr_Setup\SkyGz; Flags: ignoreversion; BeforeInstall: AddToDetaList;
  #endif
;Help
Source: {#CurDir}\Help\*; DestDir: {app}; Components: Inno; Languages: ChineseSimp; BeforeInstall: AddToDetaList; Flags: ignoreversion

#endif

Source: {#IsPack}\isfiles\isscint.dll; DestDir: {app}; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: IDE\SkyGz

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
