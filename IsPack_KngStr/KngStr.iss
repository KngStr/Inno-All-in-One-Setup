//Author      : KngStr
//Link        : http://www.kngstr.com/
//Description :
//Modified    : 2013-11-14 11:40:59
//Tested Inno :
//Usage       : See Examples folder

#define private CurDir ExtractFileDir(__PATHFILENAME__)

;KngStr Info
#define KngStrVer ISCmplr_VerStr(CurDir + "\ANSI\ISCC.exe", 'Ver')
#define ISCmplr_KngStr KngStrVer + ' Build ' + GetFileDateTimeString(CurDir + '\ANSI\Setup.e32', 'yymmdd', '', '')
#define IDE_KngStr_ISCC KngStrVer + ' Build ' + GetFileDateTimeString(CurDir + '\ANSI\ISCC.exe', 'yymmdd', '', '')
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#if InnoVer == Copy(ISCmplr_KngStr, 1, Len(InnoVer))
  #define Include_ISCmplr_KngStr
#endif

[Files]
;KngStr Ansi Ispp
  #ifdef Include_ISCmplr_KngStr
Source: {#CurDir}\Ansi\*; Excludes: Compil32.*,ISCC.exe; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Ansi and ISCmplr_Setup\KngStr; Tasks:
  #endif
Source: {#CurDir}\Ansi\ISCC.exe; DestDir: {app}; Flags: ignoreversion; BeforeInstall: AddToDetaList; Components: Inno\Ansi and ISCC\KngStr; Tasks:
;KngStr Unicode Ispp
  #ifdef Include_ISCmplr_KngStr
Source: {#CurDir}\Unicode\*; Excludes: Compil32.*,ISCC.exe; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Inno\Unicode and ISCmplr_Setup\KngStr; Tasks:
  #endif
Source: {#CurDir}\Unicode\ISCC.exe; DestDir: {app}; Flags: ignoreversion; BeforeInstall: AddToDetaList; Components: Inno\Unicode and ISCC\KngStr; Tasks: