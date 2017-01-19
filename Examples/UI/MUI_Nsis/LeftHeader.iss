; 脚本用 Inno Setup 脚本向导 生成。
; 查阅文档获取创建 INNO SETUP 脚本文件的详细资料！

#define MyAppName "我的程序"
#define MyAppVersion "1.5"
#define MyAppPublisher "我的公司"
#define MyAppURL "http://www.example.com/"
#define MyAppExeName "MyProg.exe"

#include "Mui_Nsis.ish"

[Setup]
; 注意: AppId 的值是唯一识别这个程序的标志。
; 不要在其他程序中使用相同的 AppId 值。
; (在编译器中点击菜单“工具 -> 产生 GUID”可以产生一个新的 GUID)
AppId={{2A5C5BDA-AA04-4E53-99AE-736B4AB25CDA}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputDir=userdocs:Inno Setup Examples Output
OutputBaseFilename=setup
Compression=lzma
SolidCompression=true
WizardImageFile={#ExtendDir}\Graphics\Nsis_Wizard\orange.bmp
WizardSmallImageFile={#ExtendDir}\Graphics\Nsis_Header\orange.bmp

[Languages]
Name: default; MessagesFile: compiler:Default.isl
Name: chinesesimp; MessagesFile: compiler:Languages\ChineseSimp.isl

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked

[Files]
Source: compiler:\Examples\MyProg.exe; DestDir: {app}; Flags: ignoreversion
; 注意: 不要在任何共享的系统文件使用 "Flags: ignoreversion"

[Icons]
Name: {group}\{#MyAppName}; Filename: {app}\{#MyAppExeName}
Name: {commondesktop}\{#MyAppName}; Filename: {app}\{#MyAppExeName}; Tasks: desktopicon

[Code]
procedure InitializeWizard();
begin
  Nsis_Header(True);
end;
