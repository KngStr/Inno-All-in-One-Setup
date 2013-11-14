  !include "MUI2.nsh"
	!addplugindir .

;--------------------------------
;General

  ;Name and file
  Name "ISSkin Example"
  OutFile "SetupOffice2007Black.exe"

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
  !define MUI_WELCOMEFINISHPAGE_BITMAP "Styles\Office2007Gray.bmp"

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
	File "/oname=$PLUGINSDIR\Office2007.cjstyles" "Styles\Office2007.cjstyles"
	ISSkinEx::nsLoadSkin /NOUNLOAD "$PLUGINSDIR\Office2007.cjstyles" "NormalBlack.ini"
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
