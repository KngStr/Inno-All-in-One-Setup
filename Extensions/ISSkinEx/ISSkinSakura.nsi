  !include LogicLib.nsh
  !include "WinVer.nsh"
  !include "MUI2.nsh"
	!addplugindir .

;--------------------------------
;General

  ;Name and file
  Name "ISSkin Example"
  OutFile "ISSkinSakura.exe"

  ;Default installation folder
  InstallDir "$LOCALAPPDATA\ISSkin"

  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\ISSkin" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel user

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING
  !define MUI_CUSTOMFUNCTION_GUIINIT ISSkinGUIInit
  !define MUI_WELCOMEFINISHPAGE_BITMAP "Styles\SakuraWizard.bmp"
  !define MUI_HEADERIMAGE
  !define MUI_HEADERIMAGE_RIGHT
  !define MUI_HEADERIMAGE_BITMAP "Styles\SakuraSmall2.bmp" 

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_LICENSE "License.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_PAGE_FINISH

  !insertmacro MUI_UNPAGE_WELCOME
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  !insertmacro MUI_UNPAGE_FINISH

;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "English"

Function ISSkinGUIInit
	InitPluginsDir
	File "/oname=$PLUGINSDIR\Sakura.cjstyles" "Styles\Sakura.cjstyles"
  ${If} ${IsWinXP}
    System::Call 'user32::GetClassLong(i,i) i ($HwndParent,-26) .s';
    Pop $R0
    System::Call 'user32::SetClassLong(i,i,i) i ($HwndParent,-26,$R0|0x20000) .s'
    Pop $R0
  ${EndIf}
	ISSkinEx::nsLoadSkin /NOUNLOAD "$PLUGINSDIR\Sakura.cjstyles" ""
FunctionEnd

Function .onGUIEnd
	ISSkinEx::nsUnloadSkin
FunctionEnd

;--------------------------------
;Installer Sections

Section "Dummy Section" SecDummy

  SetOutPath "$INSTDIR"

  ;ADD YOUR OWN FILES HERE...

  ;Store installation folder
  WriteRegStr HKCU "Software\ISSkin" "" $INSTDIR

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"

SectionEnd

;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecDummy ${LANG_ENGLISH} "A test section."

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecDummy} $(DESC_SecDummy)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN FILES HERE...

  Delete "$INSTDIR\Uninstall.exe"

  RMDir "$INSTDIR"

  DeleteRegKey /ifempty HKCU "Software\ISSkin"

SectionEnd
