//Author      : KngStr
//Link        : http://www.kngstr.com/
//Description :
//Modified    : 2013-11-14 11:40:59
//Tested Inno :

; 脚本用 Inno Setup 脚本向导 生成。
; 查阅文档获取创建 INNO SETUP 脚本文件的详细资料！

;#expr BuildNum
#define SrcPath SourcePath  ;GetCurDir ;".\"

#include "Include\PreDefines.ish"

;#define Test

;不使用插件卸载功能
#Define Plugin_UnInst False
;是否启用不安全文件（误报 插件和工具）
;#Define UnSafe

;全局文件定义
#define IsPack SrcPath + 'IsPack'
#define ResCenter SourcePath ;AddBackslash(ExtractFileDir(RemoveBackslash(CompilerPath)))
#define Plugins ResCenter + 'Plugins'
#define Examples ResCenter + 'Examples'
#define Includes ResCenter + 'Include'
#define Extensions ResCenter + 'Extensions'
#define Docs ResCenter + 'Docs'
#include "IsppExtended.Iss"

#define KngStr

#define MailAddress "kngstr@foxmail.com"

#ifdef D8Team
  #define AppName "Inno Setup D8团队版"
#else
  #define AppName "Inno Setup 集成版(原D8团队版)"
#endif
#include "GlobalDefines.ish"

#define AppPublisher UrlName
#define AppURL Url
#define AppExeName "Compil32.exe"

#define AppVer ReadIni(IsPack + "\setup.iss", "Setup", "AppVersion", "")
#define AppVerName AppName + " " + AppVer

;#define ISPPVer GetFileVersionString(IsPack + "\isfiles\ISPP.dll")
#define InnoVer AppVer ;+ ' Build ' + GetFileDateTimeString(SrcPath + '\', 'yymmdd', '', '')

#define FileVer GetDateTimeString ('yyyy/m/d/h','.','')

;OutName
#define OutName "Inno_" + StringChange(AppVer, ".", "")
#define OutName OutName + "_" + GetDateTimeString('yymmdd', '', '')
;#expr   DeleteFile(OutName + "*" + FileExt + ".exe")
#define OutName OutName + FileExt

;增强版本
#include "IsPack_Restools\Restools.iss"
#include "IsPack_SkyGz\SkyGz.iss"

#define IsSkin_SkinBuilder VerBuild(Extensions + "\ISSkin\SkinBuilder.exe")
#define Extensions_UninsHs VerBuild(Extensions + "\UninsHs\UninsHs.exe")
#define VB_Converter VerBuild(Extensions + "\Converter\Converter.exe")
#define VB_InnoLogView VerBuild(Extensions + "\InnoLogView\InnoLogView.exe")

#ifdef UnSafe
;安全问题的插件
  #define InnoGpw
  #define InnoGUI "Extensions\Unpack\InnoGUI"
  #define ExecCtrl
#endif

#ifdef InnoGUI
  #define InnoGUI_Comp "Extensions\Unpack\InnoGUI"
#else
  #define InnoGUI_Comp ""
#endif


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


#define AboutButton
#define UsePlugin
#define UseSkin

#ifdef UseSkin
  #include "IsSkin.ish"
#endif
#include "System.ish"
#include "AnimateWindow.ish"
#include "Mui_Nsis_Adv.ish"
#include "MUI_Common.Ish"
#include "LinkandInfo.Ish"
;导入插件功能
#include "IsWin7.ish"
#include "ISTask.Ish"
#include "WaterLib.ish"
#include "MsgCtrl.ish"
#include "itdownload.ish"
#include "VerFunc.Ish"

#include "trayicon.iss"

;卸载时使用的文件
#Define Plugin_UnInst True
#Define Plugin_UnInst_Dir "UninsFiles"
#include "IssProc.Ish"
#Define Plugin_UnInst False

[Setup]
AppId=Inno Setup 5
AppName={#AppName}
AppVerName={#AppVerName}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
AppUpdatesURL={#AppURL}
AppVersion={#AppVer}
;AppCopyright=Copyright ? 1997-2010 Jordan Russell. Portions Copyright ? 2000-2010 Martijn Laan. All rights reserved.
VersionInfoVersion={#FileVer}
;#ifndef Test
;AppMutex=InnoSetupCompilerAppMutex,Global\InnoSetupCompilerAppMutex
;#endif
DefaultDirName={pf}\Inno Setup 5
DefaultGroupName=Inno Setup 5
AllowNoIcons=true
LicenseFile={#IsPack}\isfiles\License.txt
OutputDir=.\Release
OutputBaseFilename={#OutName}
UninstallFilesDir={app}\{#Plugin_UnInst_Dir}
SetupIconFile={#SrcPath}\Res\Inst.ico
WizardImageFile={#SrcPath}\Res\Left.bmp
WizardSmallImageFile={#SrcPath}\Res\Header.bmp

Compression=lzma/ultra
InternalCompressLevel=ultra
SolidCompression=true
AppModifyPath="{app}\Ispack-setup.exe" /modify=1

ChangesAssociations=true
#ifdef test
ShowLanguageDialog=no
#endif

#ifdef IS_ENHANCED
// 重新激活 UninstallIconFile 参数的使用
UninstallIconFile=Res\Uninst.ico
#endif

;常量引用
#include "Consts.iss"

[Types]
;Name: "recommand"; Description: "推荐安装"
Name: "full"; Description: "完全安装"
Name: "compact"; Description: "简洁安装"
Name: "custom"; Description: "自定义安装"; Flags: iscustom

[Components]
Name: Inno; Description: 主程序(必须) - (Inno {#InnoVer}); Flags: fixed; Types: custom compact full
Name: Inno\Ansi; Description: Ansi {cm:Inno}; Flags: exclusive disablenouninstallwarning; Types: custom compact full
Name: Inno\Unicode; Description: Unicode {cm:Inno}; Flags: exclusive disablenouninstallwarning

#if Defined(Include_ISCmplr_Restools) || Defined(Include_ISCmplr_SkyGz) 
Name: ISCmplr_Setup; Description: {cm:Inno} 编译器增强版; Flags: disablenouninstallwarning; Types: full
  #ifdef Include_ISCmplr_Restools
Name: ISCmplr_Setup\Restools_MiniVCL; Description: Restools Mini VCL    ({#ISCmplr_Restools_MiniVCL}); Flags: exclusive disablenouninstallwarning; Types: full
Name: ISCmplr_Setup\Restools_FullVCL; Description: Restools Full VCL    ({#ISCmplr_Restools_FullVCL}); Flags: exclusive disablenouninstallwarning;
  #endif
  #ifdef Include_ISCmplr_SkyGz
Name: ISCmplr_Setup\SkyGz; Description: SkyGz 编译器增强版   ({#ISCmplr_SkyGz}); Flags: exclusive disablenouninstallwarning;
  #endif
#endif

#include "IDE.iss"

[Components]
#ifndef Lite
Name: EasySets; Description: 推荐设置; Types: custom compact full
Name: EasySets\EditorSet; Description: {#UrlName} 推荐设置; Types: custom compact full; Flags: disablenouninstallwarning;
Name: EasySets\CodeFont; Description: Restools 推荐字体; Types: custom compact full
#endif

Name: Extensions; Description: {cm:Extensions}; Types: custom compact full
Name: Extensions\IsSkin_Styles; Description: IsSkin 皮肤集合; Types: full
Name: Extensions\IsSkin_SkinBuilder; Description: IsSkin 皮肤编辑器   ({#IsSkin_SkinBuilder}); Types: full
Name: Extensions\UninsHs; Description: UninsHs 卸载增强   ({#Extensions_UninsHs}); Types: full compact
Name: Extensions\Converter; Description: Converter {cm:Converter}  (cntrump 汉化)   ({#VB_Converter}); Types: full compact

Name: Extensions\Unpack; Description: {cm:Unpacker} (SkyGz); Types: full;
#ifdef InnoGUI
Name: {#InnoGUI_Comp}; Description: {cm:Inno} Unpacker GUI; Types: full;
#endif
Name: Extensions\Unpack\InnoExp; Description: {cm:Inno} Unpacker Explorer; Types: full;
#ifdef InnoGpw
Name: Extensions\Unpack\InnoGpw; Description: {cm:Inno} Get PassWord Tool; Types: full;
#endif
Name: Extensions\Unpack\Disasm; Description: {cm:Inno} Disasm Tool   (X-Star); Types: full;

#ifndef Lite
Name: Extensions\InnoLogView; Description: InnoLogView {cm:InnoLogView}   ({#VB_InnoLogView}); Types: custom full
;Name: Extensions\ISSI; Description: {cm:Inno} Script Includes (ISSI) 扩展库   (LOGA); Types: full;

Name: Help; Description: {cm:Help}; Types: custom compact full
Name: Help\Hanzify; Description: {cm:Chm_Hanzify}; Types: custom compact full
Name: Help\Isxkb; Description: {cm:Inno} {cm:Isxkb}; Types: custom compact full
;Name: Help\VCL; Description: Delphi 2.0 VCL Help & Windows SDK Help; Types: full
Name: Help\ISD; Description: {cm:Inno} {cm:ISD}; Types: custom compact full
#endif

;Nsis Res Components
Name: Nsis; Description: Nsis资源; Types: full
Name: Nsis\Graphics; Description: Graphics 资源; Types: full
Name: Nsis\Graphics\Header; Description: Header; Types: full
Name: Nsis\Graphics\Wizard; Description: Wizard; Types: full
Name: Nsis\Graphics\Icons; Description: Icons; Types: full

#ifndef Lite
Name: Nsis\Graphics\MUIOrangeVistaTheme; Description: MUIOrangeVistaTheme; Types: full
Name: Nsis\Graphics\MUIOrangeVistaTheme_CD; Description: MUIOrangeVistaTheme_CD; Types: full
#endif

#ifdef UsePlugin
  #include "Plugins.Iss"
#endif

[Tasks]
Name: DesktopIcon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked
Name: QuickLaunchIcon; Description: {cm:CreateQuickLaunchIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked

Name: AssocIss; Description: {cm:AssocFileExtension,Inno Setup,.iss}; GroupDescription: {cm:Assoc}; Components: Inno
Name: AssocIsh; Description: {cm:AssocFileExtension,Inno Setup,.ish}; GroupDescription: {cm:Assoc}; Components: Inno

#ifdef InnoGUI
Name: InnoGUI_ICON; Description: {cm:AssocRightFileExtension,Inno Setup Unpacker GUI,.exe}; GroupDescription: {cm:Assoc}; Components: {#InnoGUI}; Flags: unchecked
#endif
Name: InnoExp_ICON; Description: {cm:AssocRightFileExtension,Inno Setup Unpacker Explorer,.exe}; GroupDescription: {cm:Assoc}; Components: Extensions\Unpack\InnoExp; Flags: unchecked

Name: Restools_Lang_En; Description: 兼容Restools设计器，使用英文语言文件作为默认语言; GroupDescription: Restools编辑器附加选项; Components: Extensions\Unpack\InnoExp;

[Run]
;！！！！！！！！！！！！要修改-默认编译器获取！！！！！！！！！！！！
Filename: {app}\Compil32.exe; WorkingDir: {app}; Description: {cm:LaunchProgram,Inno Setup}; Flags: nowait postinstall skipifsilent; 

[Files]
Source: What's new.txt; DestDir: {#SetupSetting("UninstallFilesDir")}; Flags: isreadme
#expr AddFiles("[Ish]")
#expr AddFiles("System")
#expr AddFiles("Macros")
#expr AddFiles("InstFiles", "", "", "", "", "", "ISPP")

;预释放文件
Source: Res\Uninst.ico; Flags: solidbreak dontcopy
Source: {#Plugins}\UpdateIcon.dll; DestDir: {app}\Plugins; Flags: ignoreversion dontcopy; BeforeInstall: AddToDetaList
Source: {#SrcPath}\Res\Skins\*; DestDir: {tmp}; Flags: ignoreversion dontcopy; BeforeInstall: AddToDetaList
Source: {#Extensions}\ISSkinEx\Styles\Codejock.cjstyles; DestDir: {tmp}; Flags: ignoreversion dontcopy; BeforeInstall: AddToDetaList
Source: {#Extensions}\ISSkinEx\Styles\ISSkinEx.cjstyles; DestDir: {tmp}; Flags: ignoreversion dontcopy; BeforeInstall: AddToDetaList
Source: {#Extensions}\ISSkinEx\Styles\Sakura.cjstyles; DestDir: {tmp}; Flags: ignoreversion dontcopy; BeforeInstall: AddToDetaList

#ifndef Test
Source: {#IsPack}\isfiles\*; Excludes: .git*,cvs\*,ISPP.dll,*.e32,Compil32.exe,isscint.dll,ISPPCC.exe,ISCC.exe,ISCmplr.dll; DestDir: {app}; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList; Components: Inno
Source: {#IsPack}\Setup.*; DestDir: {app}\Examples; BeforeInstall: AddToDetaList; Components: Inno; Flags: ignoreversion
Source: {#IsPack}\isfiles\isscint.dll; DestDir: {app}; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: not IDE\Restools

;Ansi Ispp
Source: {#IsPack}\isfiles\Compil32.exe; DestDir: {app}; DestName: Compil32.exe; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: Inno\Ansi and not IDE\Restools
Source: {#IsPack}\isfiles\ISPP.dll; DestDir: {app}; DestName: ISPP.dll; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: Inno\Ansi and not ISCmplr_Setup
Source: {#IsPack}\isfiles\ISPPCC.exe; DestDir: {app}; DestName: ISCC.exe; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: Inno\Ansi and not ISCmplr_Setup
Source: {#IsPack}\isfiles\*.e32; DestDir: {app}; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: Inno\Ansi and not ISCmplr_Setup
Source: {#IsPack}\isfiles\ISCmplr.dll; DestDir: {app}; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: Inno\Ansi and not ISCmplr_Setup

;Unicode Ispp
Source: {#IsPack}\isfiles-unicode\Compil32.exe; DestDir: {app}; DestName: Compil32.exe; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: Inno\Unicode  and not IDE\Restools
Source: {#IsPack}\isfiles-unicode\ISPP.dll; DestDir: {app}; DestName: ISPP.dll; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: Inno\Unicode and not ISCmplr_Setup
Source: {#IsPack}\isfiles-unicode\ISPPCC.exe; DestDir: {app}; DestName: ISCC.exe; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: Inno\Unicode and not ISCmplr_Setup
Source: {#IsPack}\isfiles-unicode\*.e32; DestDir: {app}; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: Inno\Unicode and not ISCmplr_Setup
Source: {#IsPack}\isfiles-unicode\ISCmplr.dll; DestDir: {app}; Flags: ignoreversion replacesameversion; BeforeInstall: AddToDetaList; Components: Inno\Unicode and not ISCmplr_Setup

#ifndef Lite
Source: {#Docs}\Hanzify Forum Inno Article.chm; DestDir: {app}\Docs; Flags: ignoreversion; Components: Help\Hanzify; Tasks:
Source: {#Docs}\Inno Setup Extensions Knowledge Base.chm; DestDir: {app}\Docs; Flags: ignoreversion; Components: Help\Isxkb; Tasks:
;Source: {#Docs}\VCL_Win32SDK_Help\*; DestDir: {app}\Docs\VCL_Win32SDK_Help\; Components: Help\VCL; Flags: ignoreversion recursesubdirs createallsubdirs
Source: {#Docs}\Inno Setup ISD Format.htm; DestDir: {app}\Docs; Flags: ignoreversion; Components: Help\ISD; Tasks:
Source: {#Docs}\DelphiKey.htm; DestDir: {app}\Docs; Flags: ignoreversion; Components: Help; Tasks:
#endif

;Extensions
#expr AddFiles("Graphics")
;UninsHs
#expr AddExtensions("UninsHs")
;Converter
#expr AddExtensions("Converter")

#ifndef Lite
;ISSI
;Source: {#SrcPath}\ISSI\{app}\*; DestDir: {app}\Extensions\ISSI; Excludes: _issi*.exe,issi_example*.iss; Components: Extensions\ISSI; Tasks: ; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList
;Source: {#SrcPath}\ISSI\{app}\issi_example*.iss; DestDir: {app}\Examples\ISSI; Components: Extensions\ISSI; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
;Source: {#SrcPath}\ISSI\{app}\_issi.cfg; DestDir: {app}\Examples\ISSI; Components: Extensions\ISSI; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList

;Restools Recommanded Fonts
Source: {#Extensions}\CodeFont\CourierNewEx.fon; DestDir: {app}\Extensions\CodeFont; Components: EasySets\CodeFont; Flags: onlyifdoesntexist ignoreversion fontisnttruetype; FontInstall: Courier New Ex; BeforeInstall: AddToDetaList
Source: {#Extensions}\CodeFont\Megatops ProCoder 1.0.fon; DestDir: {app}\Extensions\CodeFont; Components: EasySets\CodeFont; Flags: onlyifdoesntexist ignoreversion fontisnttruetype; FontInstall: Megatops ProCoder 1.0; BeforeInstall: AddToDetaList
Source: {#Extensions}\CodeFont\Raize.fon; DestDir: {app}\Extensions\CodeFont; Components: EasySets\CodeFont; Flags: onlyifdoesntexist ignoreversion fontisnttruetype; FontInstall: Raize; BeforeInstall: AddToDetaList
#endif

;SkyGz Enhanced Unpack Tools
Source: {#Extensions}\Unpack\innounp.exe; DestDir: {app}\Extensions\Unpack; Flags: ignoreversion touch; Components: {#InnoGUI_Comp} Extensions\Unpack\InnoExp; BeforeInstall: AddToDetaList
Source: {#Extensions}\Unpack\Languages\*.dll; DestDir: {app}\Extensions\Unpack\Languages; Flags: ignoreversion touch; Components: {#InnoGUI_Comp} Extensions\Unpack\InnoExp; BeforeInstall: AddToDetaList
Source: {#Extensions}\Unpack\ISUnp.exe; DestDir: {app}\Extensions\Unpack; Components: Extensions\Unpack\InnoExp; BeforeInstall: AddToDetaList; Flags: ignoreversion touch
Source: {#Extensions}\Unpack\Languages\*.lng; DestDir: {app}\Extensions\Unpack\Languages; Flags: ignoreversion touch; Components: Extensions\Unpack\InnoExp; BeforeInstall: AddToDetaList
#ifdef InnoGUI
Source: {#Extensions}\Unpack\InnoGui.exe; DestDir: {app}\Extensions\Unpack; Components: {#InnoGUI_Comp}; BeforeInstall: AddToDetaList; Flags: ignoreversion touch
#endif
#ifdef InnoGpw
Source: {#Extensions}\Unpack\InnoPWLib.dll; DestDir: {app}\Extensions\Unpack; Components: Extensions\Unpack\InnoGpw; BeforeInstall: AddToDetaList; Flags: ignoreversion touch
Source: {#Extensions}\Unpack\InnoGPW.exe; DestDir: {app}\Extensions\Unpack; Components: Extensions\Unpack\InnoGpw; BeforeInstall: AddToDetaList; Flags: ignoreversion touch
#endif

Source: {#Extensions}\Unpack\DisasmGUI.exe; DestDir: {app}\Extensions\Unpack; Components: Extensions\Unpack\Disasm; BeforeInstall: AddToDetaList; Flags: ignoreversion touch
Source: {#Extensions}\Unpack\Disasm.exe; DestDir: {app}\Extensions\Unpack; Components: Extensions\Unpack\Disasm; BeforeInstall: AddToDetaList; Flags: ignoreversion touch

#ifndef Lite
Source: {#Extensions}\InnoLogView\*; DestDir: {app}\Extensions\InnoLogView; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Extensions\InnoLogView
#endif

;Nsis Resouces
Source: {#SrcPath}\Nsis\Graphics\Header\*; DestDir: {app}\Extensions\Graphics\Nsis_Header; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Nsis\Graphics\Header
Source: {#SrcPath}\Nsis\Graphics\Wizard\*; DestDir: {app}\Extensions\Graphics\Nsis_Wizard; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Nsis\Graphics\Wizard
Source: {#SrcPath}\Nsis\Graphics\Icons\*; DestDir: {app}\Extensions\Graphics\Nsis_Icons; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList; Components: Nsis\Graphics\Icons
#ifndef Lite
;MUIOrangeVistaTheme
Source: {#SrcPath}\Nsis\Graphics\MUIOrangeVistaTheme\*; DestDir: {app}\Extensions\Graphics\Nsis_MUIOrangeVistaTheme; Components: Nsis\Graphics\MUIOrangeVistaTheme; Tasks: ; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList
Source: {#SrcPath}\Nsis\Graphics\MUIOrangeVistaTheme_CD\*; DestDir: {app}\Extensions\Graphics\Nsis_MUIOrangeVistaTheme_CD; Components: Nsis\Graphics\MUIOrangeVistaTheme_CD; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList
#endif

;Examples
Source: {#Examples}\UI\Install Shield Skins\*; DestDir: {app}\Examples\UI\Install Shield Skins; Tasks: ; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList
;Source: {#Examples}\UI\MUI_InstallShield\*; DestDir: {app}\Examples\UI\MUI_InstallShield; Tasks: ; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList
Source: {#Examples}\UI\WaitingForm\*; DestDir: {app}\Examples\UI\WaitingForm; Tasks: ; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList
Source: {#Examples}\Autorun\*; DestDir: {app}\Examples\Autorun; Tasks: ; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList

Source: {#Examples}\browse for a machine.iss; DestDir: {app}\Examples; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Examples}\SelfDel.iss; DestDir: {app}\Examples; Flags: ignoreversion; BeforeInstall: AddToDetaList
;Mui_Nsis
Source: {#Includes}\MUIs\Mui_Nsis.Ish; DestDir: {app}\Include\MUIs; Components: Nsis; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Includes}\MUIs\Mui_Nsis_Adv.Ish; DestDir: {app}\Include\MUIs; Components: Nsis; Tasks: ; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Examples}\UI\Mui_Nsis\*; DestDir: {app}\Examples\UI\Mui_Nsis; Components: Nsis; Tasks: ; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList

Source: {#Includes}\MUIs\AllMove.Ish; DestDir: {app}\Include\MUIs; Flags: ignoreversion; BeforeInstall: AddToDetaList

;Include
Source: {#Includes}\PreDefines.ish; DestDir: {app}\Include; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Includes}\AnimateWindow.ish; DestDir: {app}\Include; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Includes}\SHFileOperation.ish; DestDir: {app}\Include; Flags: ignoreversion; BeforeInstall: AddToDetaList
Source: {#Includes}\ExecAndWait.Ish; DestDir: {app}\Include; Flags: ignoreversion; BeforeInstall: AddToDetaList

;Plugin
Source: {#Plugins}\ISCrypt.dll; DestDir: {app}; Flags: ignoreversion; BeforeInstall: AddToDetaList
#endif
;Languages
Source: {#SrcPath}\Res\Languages\*; DestDir: {app}\Languages; Components: ; Tasks: ; Flags: ignoreversion recursesubdirs createallsubdirs; BeforeInstall: AddToDetaList
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

#ifndef Lite
;Type: filesandordirs; Name: {app}\Examples\ISSI\OutPut; Components: Extensions\ISSI; Tasks:
;Type: filesandordirs; Name: {app}\Extensions\ISSI\*\Thumbs.db; Components: Extensions\ISSI; Tasks:
;Type: files; Name: {app}\Extensions\ISSI\Include\*\_issi*.exe; Components: Extensions\ISSI; Tasks:
;Type: files; Name: {app}\Extensions\ISSI\Include\*_issi*; Components: Extensions\ISSI; Tasks:
;Type: files; Name: {userdocs}\Inno Setup Examples Output\ISSI_*.exe; Components: Extensions\ISSI; Tasks:
#endif

[Icons]
Name: {commondesktop}\{#AppName}; Filename: {app}\{#AppExeName}; Tasks: DesktopIcon
Name: {userappdata}\Microsoft\Internet Explorer\Quick Launch\{#AppName}; Filename: {app}\{#AppExeName}; Tasks: QuickLaunchIcon

;Name: {group}\{#AppName}; Filename: {app}\{#AppExeName}
#ifdef D8Team
Name: {group}\{cm:ProgramOnTheWeb,{#AppName}}; Filename: {#AppURL}
#endif
Name: {group}\{cm:UninstallProgram,{#AppName}}; Filename: {uninstallexe}

Name: {group}\{cm:Inno} {cm:Compiler}; Filename: {app}\Compil32.exe; WorkingDir: {app}
Name: {group}\{cm:Inno} {cm:Examples}; Filename: {app}\Examples\
;Inno Help
Name: {group}\{cm:Help}\{cm:Inno} {cm:Documentation}; Filename: {app}\ISetup.chm
Name: {group}\{cm:Help}\{cm:ISPP} {cm:Documentation}; Filename: {app}\ISPP.chm
Name: {group}\{cm:Help}\{cm:Inno} {cm:FAQ}; Filename: {app}\isfaq.htm
Name: {group}\{cm:Help}\{cm:Inno} {cm:Revision_History}; Filename: {app}\whatsnew.htm
Name: {group}\{cm:Help}\Ish 头文件 使用说明; Filename: {app}\Docs\[Ish]\ReadMe.txt
Name: {group}\{cm:Help}\版本更新说明; Filename: {app}\{#SetupSetting("UninstallFilesDir")}\What's new.txt

;Docs
Name: {group}\{cm:Docs}\{cm:Inno} {cm:Docs}; Filename: {app}\Docs\
#ifndef Lite
Name: {group}\{cm:Docs}\{cm:Chm_Hanzify}; Filename: {app}\Docs\Hanzify Forum Inno Article.chm; Components: Help\Hanzify
Name: {group}\{cm:Docs}\{cm:Inno} {cm:ISD}; Filename: {app}\Docs\Inno Setup ISD Format.htm; Components: Help\ISD; Tasks:
Name: {group}\{cm:Docs}\{cm:Inno} {cm:Isxkb}; Filename: {app}\Docs\Inno Setup Extensions Knowledge Base.chm; Components: Help\Isxkb; Tasks: ; Languages: 
Name: {group}\{cm:Docs}\DelphiKey; Filename: {app}\Docs\DelphiKey.htm; Components: Help; Tasks:
#endif
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
#ifndef Lite
Name: {group}\{cm:Extensions}\{cm:InnoLogView}; Filename: {app}\Extensions\InnoLogView\InnoLogView.exe; Components: Extensions\InnoLogView; Tasks:
#endif

;Inno Unpack Tools
#ifdef InnoGUI
Name: {group}\{cm:Unpack}\{cm:Inno} Unpacker GUI; Filename: {app}\Extensions\Unpack\InnoGui.exe; WorkingDir: {app}\Extensions\Unpack; Comment: InnoGui; Flags: createonlyiffileexists; IconIndex: 0; Components: {#InnoGUI_Comp}
#endif
Name: {group}\{cm:Unpack}\{cm:Inno} Unpacker Explorer; Filename: {app}\Extensions\Unpack\ISUnp.exe; WorkingDir: {app}\Extensions\Unpack; Comment: ISUnp; Flags: createonlyiffileexists; IconIndex: 0; Components: Extensions\Unpack\InnoExp
#ifdef InnoGpw
Name: {group}\{cm:Unpack}\{cm:Inno} Get PassWord Tools; Filename: {app}\Extensions\Unpack\InnoGpw.exe; WorkingDir: {app}\Extensions\Unpack; Comment: InnoGpw; Flags: createonlyiffileexists; IconIndex: 0; Components: Extensions\Unpack\InnoGpw
#endif
Name: {group}\{cm:Unpack}\{cm:Inno} Disasm Tool; Filename: {app}\Extensions\Unpack\DisasmGUI.exe; Flags: createonlyiffileexists; Components: Extensions\Unpack\Disasm

[Registry]
Root: HKCU; SubKey: Software\Microsoft\Windows\CurrentVersion\Explorer\MenuOrder\Start Menu\Programs\{code:ExtractFileName|{group}}; Flags: deletekey uninsdeletekey
Root: HKCU; SubKey: Software\Microsoft\Windows\CurrentVersion\Explorer\MenuOrder\Start Menu2\Programs\{code:ExtractFileName|{group}}; Flags: deletekey uninsdeletekey
;Unicode Font Link
#ifndef Lite
Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink; ValueType: multisz; ValueName: Courier New; ValueData: SimSun.TTC,SimSun{break}gulim.ttc,gulim{break}MSGOTHIC.TTC,MS UI Gothic{break}mingliu.ttc,PMingLiU{break}BATANG.TTC,Batang{break}{break}; Components: Inno\Unicode and EasySets\CodeFont; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink; ValueType: multisz; ValueName: Megatops ProCoder 1.0; ValueData: SimSun.TTC,SimSun{break}gulim.ttc,gulim{break}MSGOTHIC.TTC,MS UI Gothic{break}mingliu.ttc,PMingLiU{break}BATANG.TTC,Batang{break}{break}; Components: Inno\Unicode and EasySets\CodeFont; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink; ValueType: multisz; ValueName: Raize; ValueData: SimSun.TTC,SimSun{break}gulim.ttc,gulim{break}MSGOTHIC.TTC,MS UI Gothic{break}mingliu.ttc,PMingLiU{break}BATANG.TTC,Batang{break}{break}; Components: Inno\Unicode and EasySets\CodeFont; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; SubKey: SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink; ValueType: multisz; ValueName: Courier New Ex; ValueData: SimSun.TTC,SimSun{break}gulim.ttc,gulim{break}MSGOTHIC.TTC,MS UI Gothic{break}mingliu.ttc,PMingLiU{break}BATANG.TTC,Batang{break}{break}; Components: Inno\Unicode and EasySets\CodeFont; Flags: uninsdeletevalue uninsdeletekeyifempty

Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorGutterFontName; ValueData: Courier New Ex; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\CodeFont
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorFontName; ValueData: Courier New Ex; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: IDE\Restools and EasySets\CodeFont
#endif

#ifdef InnoGUI
Root: HKCR; Subkey: exefile\shell\Inno Setup UnPacker GUI; Flags: uninsdeletekey noerror; Tasks: InnoGUI_ICON
Root: HKCR; SubKey: exefile\shell\Inno Setup UnPacker GUI\command; ValueType: string; ValueData: """{app}\Extensions\Unpack\InnoGui.exe"" ""%1"""; Tasks: InnoGUI_ICON
#endif
Root: HKCR; Subkey: exefile\shell\Inno Setup Unpacker Explorer; Flags: uninsdeletekey noerror; Tasks: InnoExp_ICON
Root: HKCR; SubKey: exefile\shell\Inno Setup Unpacker Explorer\Command; ValueType: string; ValueData: """{app}\Extensions\Unpack\ISUnp.exe"" ""%1"""; Tasks: InnoExp_ICON

Root: HKCR; SubKey: Applications\Compil32.exe; Flags: deletekey; Tasks: AssocIss
Root: HKCR; SubKey: .iss; ValueType: string; ValueData: InnoSetupScriptFile; Flags: uninsdeletekey; Tasks: AssocIss
Root: HKCR; SubKey: .iss; ValueType: string; ValueName: Content Type; ValueData: text/plain; Flags: uninsdeletekey; Tasks: AssocIss

Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupScriptFile; ValueType: string; ValueData: Inno Setup 脚本; Flags: uninsdeletekey; Tasks: AssocIss
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupScriptFile\DefaultIcon; ValueType: string; ValueData: {app}\Compil32.exe,1; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: AssocIss
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupScriptFile\shell; Flags: uninsdeletekeyifempty; Tasks: AssocIss
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupScriptFile\shell\Compile; ValueType: string; ValueData: 编译(&L); Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: AssocIss
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupScriptFile\shell\Compile\command; ValueType: string; ValueData: """{app}\Compil32.exe"" /cc ""%1"""; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: AssocIss
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupScriptFile\shell\open; Flags: uninsdeletekeyifempty; Tasks: AssocIss
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupScriptFile\shell\open\command; ValueType: string; ValueData: """{app}\Compil32.exe"" ""%1"""; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: AssocIss
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupScriptFile\shell\OpenWithInnoSetup; ValueType: string; ValueData: 用 Inno Setup 打开(&I); Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: AssocIss
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupScriptFile\shell\OpenWithInnoSetup\command; ValueType: string; ValueData: """{app}\Compil32.exe"" ""%1"""; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: AssocIss

Root: HKCR; SubKey: .ish; ValueType: string; ValueData: InnoSetupHeaderFile; Flags: uninsdeletekey; Tasks: AssocIsh
Root: HKCR; SubKey: .ish; ValueType: string; ValueName: Content Type; ValueData: text/plain; Flags: uninsdeletekey; Tasks: AssocIsh

Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupHeaderFile; ValueType: string; ValueData: Inno Setup 头文件; Flags: uninsdeletekey; Tasks: AssocIsh
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupHeaderFile\DefaultIcon; ValueType: string; ValueData: {app}\Compil32.exe,1; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: AssocIsh
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupHeaderFile\shell; Flags: uninsdeletekeyifempty; Tasks: AssocIsh
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupHeaderFile\shell\open; Flags: uninsdeletekeyifempty; Tasks: AssocIsh
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupHeaderFile\shell\open\command; ValueType: string; ValueData: """{app}\Compil32.exe"" ""%1"""; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: AssocIsh
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupHeaderFile\shell\OpenWithInnoSetup; ValueType: string; ValueData: 用 Inno Setup 打开(&I); Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: AssocIsh
Root: HKLM; SubKey: SOFTWARE\Classes\InnoSetupHeaderFile\shell\OpenWithInnoSetup\command; ValueType: string; ValueData: """{app}\Compil32.exe"" ""%1"""; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: AssocIsh

#ifdef UsePlugin
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
#endif


[Code]
var
  Modifying: Boolean;

  As_Tips: TArrayOfString;

procedure ExitProcess(exitCode:integer);
  external 'ExitProcess@kernel32.dll stdcall';
//   ExitProcess(1);

#ifndef IS_ENHANCED
function UpdateIcon(const hWnd: Integer; const exeFileName, exeIcon, IcoFileName: String; wlangID: DWORD): Boolean;
external 'UpdateIcon@files:UpdateIcon.dll stdcall';
#endif

const
  WH_MOUSE = 7;

type
  TMouseHookStruct = record
    pt: TPoint;
    hwnd: HWND;
    wHitTestCode: UINT;
    dwExtraInfo: DWORD;
  end;

// 回调函数参数格式声明
//TMessageProc = procedure(nCode: LongWord; wParam: LongWord; lParam: LongWord);
  TMessageProc = procedure(nCode: LongWord; wParam: LongWord; lParam: TMouseHookStruct);

function GetWindowRect(hWnd: HWND; var lpRect: TRect): BOOL;
external 'GetWindowRect@user32.dll stdcall';

  {# MsgCtrl_SetWinHookEx }

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
    Caption := '新窗口选择';
    Top := WizardForm.TypesCombo.Top;
  end;
//  frm_NewComps.Free;
end;

procedure btn_NewCompsClick(Sender: TObject);
begin
  if btn_NewComps.Parent <> WizardForm.SelectComponentsPage then
  begin
    frm_NewComps.Close;
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
        Caption := '组件选择 - ' + WizardForm.Caption;
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
      Caption := '返回向导页面';
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

    frm_NewComps.ShowModal;
  end;
end;

procedure NewFormComponents();
begin
  btn_NewComps := TButton.Create(WizardForm);
  with btn_NewComps do
  begin
    Parent := WizardForm.SelectComponentsPage;
    Caption := '新窗口选择';
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
//===========================================================================================================================================

function CheckUpdate(): Boolean;
var
  Ver, Url, Message, Tips: string;
  Frm_Update: TForm;
  Btn_UpOK, Btn_UpCancel: TButton;
  Mmo_UpMessage: TRichEditViewer;
begin
  Result := False;
  PDir('{# ItDownload_DLL }');
  itd_init;

  if itd_downloadfile('http://app.kngstr.com/update/is/info.ini',ExpandConstant('{tmp}\d8Inno.tmp'))=ITDERR_SUCCESS then
  begin
    Ver := GetIniString('Main', 'Ver', '', ExpandConstant('{tmp}\d8Inno.tmp'));
    Url := GetIniString('Main', 'Url', '', ExpandConstant('{tmp}\d8Inno.tmp'));
    Message := GetIniString('Main', 'Message', '', ExpandConstant('{tmp}\d8Inno.tmp'));
    Tips := GetIniString('Main', 'Tips', '', ExpandConstant('{tmp}\d8Inno.tmp'));

    if CompareVersion(Ver, '{#FileVer}') > 0 then  //有更新
    begin
      //MsgBox('', mbInformation, MB_OK);
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
      		Caption := '更新通知 - ' + SetupMessage(msgSetupAppTitle);

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
            Caption := '立即下载';
            ModalResult := mrOk;
          end;

          Btn_UpCancel := TButton.Create(Frm_Update);
          with Btn_UpCancel do
          begin
            Parent := Frm_Update;
            Top := Btn_UpOK.Top;
            Left := Btn_UpOK.Left + Btn_UpOK.Width + 20;
            Caption := '放弃更新';
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
//===========================================================================================================================================

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
  
  WaterSupportAuthor(False);
  F:= ExpandConstant('{tmp}\WizardImage.bmp');
  WizardForm.WizardBitmapImage.Bitmap.SaveToFile(F);
  WaterHandle := WaterInit(WizardForm.WelcomePage.Handle, 0, 0);
  WaterSetBounds(WaterHandle, WizardForm.WizardBitmapImage.Left, WizardForm.WizardBitmapImage.Top, WizardForm.WizardBitmapImage.Width, WizardForm.WizardBitmapImage.Height);
  WaterSetFile(WaterHandle, AnsiString(F));
  WaterSetActive(WaterHandle, True);
  DeleteFile(F);

  SetWinHookEx(WH_MOUSE, @MyMessageProc);

#ifdef UseSkin
  FormShadow(WizardForm.Handle);
#endif
end;
//===========================================================================================================================================

function InitializeSetup(): Boolean;
var
  i: Integer;
begin
//  Modifying := ExpandConstant('{param:modify|0}') = '1';
//  FilesDownloaded := False;

  Result := True;

  with PreExtractInfo('') do
  begin
    //显示隐藏，相当于Form的Show过程
    Show;
    Hide;

    //透明显示
    //SetLayeredWindowAttributes  函数只对具有WS_EX_LAYERED属性的窗体才起作用
    //通常的窗体默认是不包含这个属性的
    //所以调用SetLayeredWindowAttributes  之前要用SetWindowLong 使窗体具有
    //WS_EX_LAYERED属性
    SetWindowLong(Handle, GWL_EXSTYLE, WS_EX_LAYERED);
    SetLayeredWindowAttributes(Handle, 0, 210, LWA_ALPHA);

    AnimateWindow(Handle, 500, AW_CENTER or AW_ACTIVATE);
    Show;
    Repaint;

    for i := 0 to 10 do
    begin
      lbl_PreEx.Caption := '已加载：' + IntToStr(i * 100 / 10) + '%';
      Repaint;
      case i of
        1:
        begin
          lbl_PreEx.Caption := lbl_PreEx.Caption + ' [释放ISWin7]';
          Repaint;
          Sleep(100);


          PDir('{# ISWin7_DLL }');
        end;
        2:
        begin
          lbl_PreEx.Caption := lbl_PreEx.Caption + ' [释放WaterLib]';
          Repaint;
          Sleep(100);

          PDir('{# WaterLib_dll }');
        end;
        3:
        begin
          lbl_PreEx.Caption := lbl_PreEx.Caption + ' [释放MsgCtrl]';
          Repaint;
          Sleep(100);

          PDir('{# MsgCtrl_DLL }');
        end;
        4:
        begin
          lbl_PreEx.Caption := lbl_PreEx.Caption + ' [释放ISSkin]';
          Repaint;
          Sleep(100);

          PDir('{# ISSkin_dll }');
        end;
        5:
        begin
          lbl_PreEx.Caption := lbl_PreEx.Caption + ' [释放IssProc]';
          Repaint;
          Sleep(100);

          PDir('IssProcLanguage.ini');
          PDir('{# IssProc_Dll }');
        end;
        6:
        begin
          lbl_PreEx.Caption := lbl_PreEx.Caption + ' [释放IsTask]';
          Repaint;
          Sleep(100);

          PDir('{# IsTask_Dll }');
        end;
        7:
        begin
          lbl_PreEx.Caption := lbl_PreEx.Caption + ' [释放TrayIconCtrl]';
          Repaint;
          Sleep(100);

          PDir('{# TrayIconCtrl_DLL }');
        end;
        8:
        begin
          lbl_PreEx.Caption := lbl_PreEx.Caption + ' [检查更新]';
          Repaint;

          if CheckUpdate then Result := False;
        end;
        9:
        begin
          #ifdef UseSkin
            lbl_PreEx.Caption := lbl_PreEx.Caption + ' [启用皮肤]';
            Repaint;
            Sleep(100);

            RandomSkin(CustomMessage('Skins'));
          #else
          #endif
        end
        //else Sleep(100);
      end;

      if not Result then
      begin
        Break;
        Exit;
      end;
      lbl_PreEx.Caption := '已加载：' + IntToStr(i * 100 / 10) + '%';
      Repaint;

      {#AutoPdirs}
      AppProcessMessage;
    end;

    if not Result then Exit;
    lbl_PreEx.Caption := '已加载：100%';

    AnimateWindow(Handle, 500, AW_CENTER or AW_HIDE);
    //iswin7_free;
    Free;
  end;
end;

procedure DeinitializeSetup();
Begin
  try
  //隐藏的也不太对，判断主窗体是否存在是个问题。

  #ifdef UseSkin
    DeInitSkin;
  #endif

    WaterAllFree;

    //刚开始就取消的时候会出错。
    UnhookWinHookEx();
    DeinitTray();
  except
  end;
end;
//===========================================================================================================================================

procedure RandomTips;
begin
if not WizardForm.WelcomePage.Visible then
#ifdef _TRAYICONCTRL_ISH_
  if GetArrayLength(As_Tips) > 0 then
  begin
#ifdef IS_ENHANCED
  #if (Pos('ee', IS_Ver_Str) > 0)
    Randomize;
  #endif
#endif
    ShowBalloon(As_Tips[Random(GetArrayLength(As_Tips))], '{#AppVerName}', 0, 10, False);
  end;
#endif
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
      //IssRegister ('name','key');                                            { use your commercial license before using IssFindModule }
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
  WizardForm.FormStyle := fsNormal;
  CancelButtonClick_DetaInfo(CurPageID, Cancel, Confirm);
  if not Cancel then
    WizardForm.FormStyle := fsStayOnTop;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  sl: TStringList;
#ifndef IS_ENHANCED
  sIcon: String;
#endif
  i: Integer;
begin
  RandomTips;

  case CurStep of
    ssInstall:
    begin
#ifndef IS_ENHANCED
      sIcon:= ExpandConstant('{tmp}\uninst.ico'); //定义卸载图标
      ExtractTemporaryFile(ExtractFileName(sIcon)); //释放卸载图标
      try
        UpdateIcon(MainForm.Handle, '', '', sIcon, 0); //替换卸载图标
      except
        //有些机器会出现错误。。。
      end;
#endif
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
  PDir('{# IssProc_Dll }');
  //IssRegister ('name','key');                                            { use your commercial license before using IssFindModule }
  IssEnableAnyFileInUseCheck(ExpandConstant('{app}'));
  Result := AutoIssProc(ExpandConstant('*{app}\is*;*{app}\Inno*;*{app}\Examples\*;*{app}\Extensions\*;'), 'chsu', false, true);
end;

[/Code]
#expr SaveToFile(SetupSetting("OutputDir") + "\" + SetupSetting("OutputBaseFilename") + ".iss")

