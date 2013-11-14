; 脚本由 Inno Setup 脚本向导 生成！
; 有关创建 Inno Setup 脚本文件的详细资料请查阅帮助文档！
#include "compiler:GifLib.iss"

[Setup]
; 注: AppId的值为单独标识该应用程序。
; 不要为其他安装程序使用相同的AppId值。
; (生成新的GUID，点击 工具|在IDE中生成GUID。)
AppId={{A18A3B64-E516-4299-A51A-5A48BF64E94D}
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

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked

[Files]
Source: compiler:Examples\MyProg.exe; DestDir: {app}; Flags: ignoreversion

[Code]
var
  GifHandle:Integer;

procedure InitializeWizard();
begin
  GifHandle := GifInit(WizardForm.WelcomePage.Handle);
  GifSetBounds(GifHandle, WizardForm.WizardBitmapImage.Left, WizardForm.WizardBitmapImage.Top, WizardForm.WizardBitmapImage.Width ,WizardForm.WizardBitmapImage.Height);
  GifSetFile(GifHandle, '1139681544755.gif');
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  Case CurPageID of
    wpWelcome : GifSetParentWindow(GifHandle, WizardForm.WelcomePage.Handle);
    wpFinished: GifSetParentWindow(GifHandle, WizardForm.FinishedPage.Handle);
  end;
end;

procedure DeinitializeSetup();
begin
  GifAllFree;
end;
