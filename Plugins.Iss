//Author      : KngStr
//Link        : http://www.kngstr.com/
//Description :
//Modified    : 2013-11-14 11:40:59
//Tested Inno :

[Components]
Name: Plugins; Description: Plugin; Types: full
Name: Plugins\IsSkin; Description: IsSkin - Skins for Setup; Types: full
Name: Plugins\IsTask; Description: IsTask - Process plugin; Types: full compact

Name: Plugins\ISXDL;  Description: ISXDL - Download plug-ins online; Types: full compact
Name: Plugins\ItDownload;  Description: ItDownload - Download plug-ins online   (Sherlock Software); Types: full compact
Name: Plugins\ItTray;      Description: ItTray - Manages Tray Icons  (Sherlock Software); Types: full compact

#ifndef Lite
Name: Plugins\botva2;  Description: botva2  Picture skin plugin   (htuos); Types: full
Name: Plugins\ISWin7;  Description: ISWin7  Win7 Transparent effects plug-in; Types: full
Name: Plugins\ISFlash; Description: ISFlash  Flash Plugin; Types: full
Name: Plugins\is7z;    Description: is7z  Extract 7zip archives; Types: full

Name: Plugins\WaterCtrl; Description: WaterCtrl - Water Like effect (Restools); Types: full compact
Name: Plugins\GifCtrl;   Description: GifCtrl - Use Gifs On Installer (Restools); Types: full
Name: Plugins\FireCtrl;  Description: FireCtrl - Fire effects plug-ins   (Restools); Types: full
#endif

Name: Plugins\DescCtrl; Description: DescCtrl  Plug In   (Restools); Types: full compact
Name: Plugins\TimeCtrl; Description: TimeCtrl  Plug In   (Restools); Types: full compact
Name: Plugins\CallbackCtrl; Description: CallbackCtrl - Callback function plugin (Restools); Types: full

;restools
#ifdef ExecCtrl
Name: Plugins\ExecCtrl; Description: ExecCtrl - thread synchronization for Exec (Restools); Types: full
#endif
Name: Plugins\CallNsis; Description: CallNsis Invokes the generic plug-in for the NSIS plug-in   (Restools); Types: full
Name: Plugins\WebCtrl; Description: WebCtrl - The page displays the plugin (Restools); Types: full
Name: Plugins\TrayIconCtrl; Description: TrayIconCtrl - System tray icon plugin   (Restools); Types: full
Name: Plugins\CpuDesc; Description: CpuDesc CPU - Parameter detection plugin   (Restools); Types: full
Name: Plugins\MsgCtrl; Description: MsgCtrl Message Plugin (Restools); Types: full

#ifndef Lite
Name: Plugins\FlashLib; Description: FlashLib Flash Effect plugin (SkyGz); Types: full
Name: Plugins\GifLib;   Description: GifLib GIF Insert the plug-in  (SkyGz); Types: full
Name: Plugins\WaterLib; Description: WaterLib - Water wave effects plug-ins (SkyGz); Types: full
#endif

Name: Plugins\UpdateIcon; Description: UpdateIcon - Replace the uninstaller icon plugin   (zhfi); Types: full compact
Name: Plugins\IssProc; Description: IssProc - The file occupies the view / end plugin; Types: full compact

Name: Plugins\Isgsg; Description: isgsg - Splash screen / image carousel plugin; Types: full compact

[Files]
#ifdef UsePlugin
;ISSkin Resouces
Source: {#Includes}\ISSkin.ish; DestDir: {app}\Include; Components: Plugins\IsSkin; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

Source: {#Plugins}\ISSkinU.dll; DestDir: {app}\Plugins; Components: Plugins\IsSkin and Inno\Unicode; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Plugins}\ISSkin.dll; DestDir: {app}\Plugins; Components: Plugins\IsSkin and Inno\Ansi; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Examples}\ISSkin\*; DestDir: {app}\Examples\ISSkin; Components: Extensions\IsSkin_Styles; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Tasks:
Source: {#Extensions}\ISSkin\SkinBuilder.exe; DestDir: {app}\Extensions\ISSkin; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList; Components: Extensions\IsSkin_SkinBuilder
Source: {#Extensions}\ISSkin\ISSkinViewer.exe; DestDir: {app}\Extensions\ISSkin; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList; Components: Extensions\IsSkin_SkinBuilder
Source: {#Extensions}\ISSkin\ISSkinViewer.iss; DestDir: {app}\Extensions\ISSkin; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList; Components: Extensions\IsSkin_SkinBuilder

  #ifdef Include_ISCmplr_Restools
;ISSkinEx Resouces
Source: {#Plugins}\ISSkinExU.dll; DestDir: {app}\Plugins; DestName: ISSkin.dll; Components: Plugins\IsSkin and Inno\Unicode and (ISCmplr_Setup\Restools_MiniVcl or ISCmplr_Setup\Restools_FullVcl); Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Plugins}\ISSkinEx.dll; DestDir: {app}\Plugins; DestName: ISSkinU.dll; Components: Plugins\IsSkin and Inno\Ansi and (ISCmplr_Setup\Restools_MiniVcl or ISCmplr_Setup\Restools_FullVcl); Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Extensions}\ISSkinEx\ISSkinViewer.*; DestDir: {app}\Extensions\ISSkin; Components: Extensions\IsSkin_Styles and (ISCmplr_Setup\Restools_MiniVcl or ISCmplr_Setup\Restools_FullVcl); Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Extensions}\ISSkinEx\License.txt; DestDir: {app}\Extensions\ISSkin; DestName: ISSkinEx_License.txt; Components: Extensions\IsSkin_Styles and (ISCmplr_Setup\Restools_MiniVcl or ISCmplr_Setup\Restools_FullVcl); Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
  #endif
;ISSkin Styles
;Source: {#Extensions}\ISSkin\Styles\*; DestDir: {app}\Extensions\ISSkins; Components: Extensions\IsSkin_Styles; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Tasks:
Source: {#Extensions}\ISSkinEx\Styles\Vista.cjstyles; DestDir: {app}\Extensions\ISSkin\Styles; Components: Extensions\IsSkin_Styles; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Extensions}\ISSkinEx\Styles\Codejock.cjstyles; DestDir: {app}\Extensions\ISSkin\Styles; Components: Extensions\IsSkin_Styles; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Extensions}\ISSkinEx\Styles\ISSkinEx.cjstyles; DestDir: {app}\Extensions\ISSkin\Styles; Components: Extensions\IsSkin_Styles; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Extensions}\ISSkinEx\Styles\Office2007.cjstyles; DestDir: {app}\Extensions\ISSkin\Styles; Components: Extensions\IsSkin_Styles; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Extensions}\ISSkinEx\Styles\Sakura.cjstyles; DestDir: {app}\Extensions\ISSkin\Styles; Components: Extensions\IsSkin_Styles; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

;ISTask
#expr AddPlugin("ISTask")

#ifndef Lite
  ;botva2
  #expr AddPlugin("botva2")
  #expr AddFiles("STS", "", "", "", "Plugins\botva2")
  ;ISWin7
  #expr AddPlugin("ISWin7")
  ;ISFlash
  #expr AddPlugin("ISFlash")
  ;is7z
  #expr AddPlugin("is7z")
  ;IssProc
  #expr AddPlugin("IssProc")
  ;UpdateIcon
  #expr AddPlugin("UpdateIcon")

  ;Isgsg
  #expr AddPlugin("Isgsg")
  ;ISDone
  ;#expr AddPlugin("ISDone")

  ;CallNsis2
  ;#expr AddPlugin("CallNsis2")
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Restools Plugins;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;CallNsis
  #expr AddPlugin("CallNsis", "", "Restools")
  Source: {#Plugins}\Nsis\*; DestDir: {app}\Plugins\Nsis; Components: Plugins\CallNsis; Tasks: ; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList
  ;WaterCtrl
  #expr AddPlugin("WaterCtrl", "", "Restools")
  ;GifCtrl
  #expr AddPlugin("GifCtrl", "", "Restools")
  ;FireCtrl
  #expr AddPlugin("FireCtrl", "", "Restools")
#endif

;DesCtrl
#expr AddPlugin("DescCtrl", "", "Restools")
;TimeCtrl
#expr AddPlugin("TimeCtrl", "", "Restools")
;CallbackCtrl
#expr AddPlugin("CallbackCtrl", "", "Restools")

;ExecCtrl
#ifdef ExecCtrl
  #expr AddPlugin("ExecCtrl", "", "Restools")
#endif
;WebCtrl
#expr AddPlugin("WebCtrl", "", "Restools")
;TrayIconCtrl
#expr AddPlugin("TrayIconCtrl", "", "Restools")
;CpuDesc
#expr AddPlugin("CpuDesc", "", "Restools")
;MsgCtrl
#expr AddPlugin("MsgCtrl", "winmsgctrl", "Restools")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;ISXDL
#expr AddPlugin("ISXDL")
;ItDownload
#expr AddPlugin("ItDownload", "", "Sherlock")
;ItTray
#expr AddPlugin("ItTray", "", "Sherlock")

  #ifndef Lite
;SkyGz Plugins
;FlashLib
Source: {#Includes}\SkyGz\FlashLib.ish; DestDir: {app}\Include\SkyGz; Components: Plugins\FlashLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Plugins}\FlashLib.dll; DestDir: {app}\Plugins; Components: Plugins\FlashLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Examples}\SkyGz\FlashLib_Example.iss; DestDir: {app}\Examples\SkyGz; Components: Plugins\FlashLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Examples}\SkyGz\FlashLib.swf; DestDir: {app}\Examples\SkyGz; Components: Plugins\FlashLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
;GifLib
Source: {#Includes}\SkyGz\GifLib.ish; DestDir: {app}\Include\SkyGz; Components: Plugins\GifLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Plugins}\GifLib.dll; DestDir: {app}\Plugins; Components: Plugins\GifLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Examples}\SkyGz\GifLib_Example.iss; DestDir: {app}\Examples\SkyGz; Components: Plugins\GifLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Examples}\SkyGz\1139681544755.gif; DestDir: {app}\Examples\SkyGz; Components: Plugins\GifLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
;WaterLib
Source: {#Includes}\SkyGz\WaterLib.ish; DestDir: {app}\Include\SkyGz; Components: Plugins\WaterLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Plugins}\WaterLib.dll; DestDir: {app}\Plugins; Components: Plugins\WaterLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Examples}\SkyGz\WaterLib_Example.iss; DestDir: {app}\Examples\SkyGz; Components: Plugins\WaterLib; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
  #endif

  ;InnoCallBack
  #expr AddFiles("InnoCallBack")
#endif

;Source: {#Plugins}\bass.dll; DestDir: {app}\Plugins; Flags: ignoreversion; BeforeInstall: AddToDetaList
;Source: {#Plugins}\bassmidi.dll; DestDir: {app}\Plugins; Flags: ignoreversion; BeforeInstall: AddToDetaList
;Source: {#Plugins}\BASSMOD.dll; DestDir: {app}\Plugins; Flags: ignoreversion; BeforeInstall: AddToDetaList
;Source: {#Plugins}\GameuxInstallHelper.dll; DestDir: {app}\Plugins; Flags: ignoreversion; BeforeInstall: AddToDetaList
;Source: {#Plugins}\ImgGdiPlus.dll; DestDir: {app}\Plugins; Flags: ignoreversion; BeforeInstall: AddToDetaList
;Source: {#Plugins}\IssSurvey.dll; DestDir: {app}\Plugins; Flags: ignoreversion; BeforeInstall: AddToDetaList
;Source: {#Plugins}\isxbb.dll; DestDir: {app}\Plugins; Flags: ignoreversion; BeforeInstall: AddToDetaList
;Source: {#Plugins}\unarc.dll; DestDir: {app}\Plugins; Flags: ignoreversion; BeforeInstall: AddToDetaList
