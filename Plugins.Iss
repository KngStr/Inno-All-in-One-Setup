//Author      : KngStr
//Link        : http://www.kngstr.com/
//Description :
//Modified    : 2013-11-14 11:40:59
//Tested Inno :

[Components]
Name: Plugins; Description: 插件; Types: full
Name: Plugins\IsSkin; Description: IsSkin  皮肤插件; Types: full
Name: Plugins\IsTask; Description: IsTask  进程插件; Types: full compact

Name: Plugins\ISXDL;  Description: ISXDL  在线下载 插件; Types: full compact
Name: Plugins\ItDownload;  Description: ItDownload   在线下载 插件   (Sherlock Software); Types: full compact
Name: Plugins\ItTray;      Description: ItTray   托盘 插件   (Sherlock Software); Types: full compact

#ifndef Lite
Name: Plugins\botva2;  Description: botva2  图片皮肤插件   (htuos); Types: full
Name: Plugins\ISWin7;  Description: ISWin7  Win7透明效果插件; Types: full
Name: Plugins\ISFlash; Description: ISFlash  Flash插件; Types: full
Name: Plugins\is7z;    Description: is7z  7z进度条解压插件; Types: full

Name: Plugins\WaterCtrl; Description: WaterCtrl  水纹特效插件   (Restools); Types: full compact
Name: Plugins\GifCtrl;   Description: GifCtrl  Gif显示插件   (Restools); Types: full
Name: Plugins\FireCtrl;  Description: FireCtrl  火焰特效插件   (Restools); Types: full
#endif
Name: Plugins\DescCtrl; Description: DescCtrl  组件列表描述控制插件   (Restools); Types: full compact
Name: Plugins\TimeCtrl; Description: TimeCtrl  按钮激活时间控制插件   (Restools); Types: full compact
Name: Plugins\CallbackCtrl; Description: CallbackCtrl  回调函数插件   (Restools); Types: full
#ifdef ExecCtrl
Name: Plugins\ExecCtrl; Description: ExecCtrl  线程执行插件   (Restools); Types: full
#endif
Name: Plugins\CallNsis; Description: CallNsis  调用 NSIS 插件的通用插件   (Restools); Types: full
Name: Plugins\WebCtrl; Description: WebCtrl  网页显示插件   (Restools); Types: full
Name: Plugins\TrayIconCtrl; Description: TrayIconCtrl  系统托盘图标插件   (Restools); Types: full
Name: Plugins\CpuDesc; Description: CpuDesc CPU  参数检测插件   (Restools); Types: full
Name: Plugins\MsgCtrl; Description: MsgCtrl Message  插件   (Restools); Types: full

#ifndef Lite
Name: Plugins\FlashLib; Description: FlashLib Flash效果 插件   (SkyGz); Types: full
Name: Plugins\GifLib;   Description: GifLib GIF插放 插件       (SkyGz); Types: full
Name: Plugins\WaterLib; Description: WaterLib 水波效果 插件    (SkyGz); Types: full
#endif

Name: Plugins\UpdateIcon; Description: UpdateIcon  替换 卸载程序图标 插件   (zhfi); Types: full compact
Name: Plugins\IssProc; Description: IssProc 文件占用查看/结束插件; Types: full compact

Name: Plugins\Isgsg; Description: isgsg 闪屏/图片轮播 插件; Types: full compact

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
