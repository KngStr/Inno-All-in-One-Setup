; 脚本由 Inno Setup 脚本向导 生成！
; 有关创建 Inno Setup 脚本文件的详细资料请查阅帮助文档！

#include "FlashLib.ish"

[Setup]
; 注: AppId的值为单独标识该应用程序。
; 不要为其他安装程序使用相同的AppId值。
; (生成新的GUID，点击 工具|在IDE中生成GUID。)
AppId={{07A9667A-62FA-4EE1-BA80-DE7B0AC3C12E}
AppName=我的程序
AppVerName=我的程序 1.5
AppPublisher=我的公司
AppPublisherURL=http://www.example.com/
AppSupportURL=http://www.example.com/
AppUpdatesURL=http://www.example.com/
DefaultDirName={pf}\我的程序
DefaultGroupName=我的程序
OutputDir=userdocs:Inno Setup Examples Output
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes

[Files]
; 注意: 不要在任何共享系统文件上使用“Flags: ignoreversion”
Source: FlashLib.swf; DestDir: {tmp}; Flags: noencryption nocompression

[Icons]
Name: {group}\{cm:UninstallProgram, 我的程序}; Filename: {uninstallexe}

[Code]
var
  FlashHwnd: HWND;

procedure InitializeWizard();
var
  F: String;
begin
  PDir('FlashLib.dll');
  ExtractTemporaryFile('FlashLib.swf');
  F:= ExpandConstant('{tmp}\FlashLib.swf');
  with WizardForm.WizardBitmapImage do
  begin
    FlashHwnd := FlashLibInit(Left, Top, Width, Height, WizardForm.WelcomePage.Handle, Bitmap.Handle, True);
  end;
  FlashLoadMovie(FlashHwnd, AnsiString(F));
end;

procedure DeinitializeSetup();
begin
  FlashLibFree(FlashHwnd);
end;
