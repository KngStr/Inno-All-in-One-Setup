; -- Example1.iss --
; restools
; http://restools.yeah.net
; 此插件同样可以使用在 NSIS 的安装程序中。
; 这只不过是演示一下没有什么是实现不了的，只是值不值得的问题，为了这么一个小功能而去编一个相对麻烦的插件，我觉得太过浪费时间了。
; 其实只要在 Windows 中，就可以外挂任何的东西，只不过看看究竟你的重心是在做安装程序，还是在做外挂。如果做一个外挂的插件比做这个安装程序还复杂，倒不如我自己编写安装程序的自由度还来得大。
; 时间仓促，所以编程可能会有点谬误，如有错误可以提出

[Setup]
AppName=我的程序
AppVerName=我的程序 版本 1.5
DefaultDirName={pf}\我的程序
DefaultGroupName=我的程序
UninstallDisplayIcon={app}\MyProg.exe
LicenseFile=license.txt
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "compiler:\Examples\MyProg.exe"; DestDir: "{app}"
Source: "compiler:\Examples\Readme.txt"; DestDir: "{app}"; Flags: isreadme
Source: "{#PluginDir}\timectrl.dll"; Flags: dontcopy

[Icons]
Name: "{group}\我的程序"; Filename: "{app}\MyProg.exe"

[code]
function starttimer(WizardFormHandle: HWND; ButtonHandle: HWND; ButtonCaption: PAnsiChar; RTime: UINT): BOOL; external 'starttimer@files:timectrl.dll stdcall';
//WizardFormHandle 向导窗口句柄
//ButtonHandle 下一步按钮句柄
//ButtonCaption 秒数倒数完毕后要在按钮上显示的文字
//RTime 剩余时间
function stoptimer(): BOOL; external 'stoptimer@files:timectrl.dll stdcall';

function IsWindowEnabled(hWnd: HWND): BOOL; external 'IsWindowEnabled@user32.dll stdcall';


procedure InitializeWizard();
begin
  WizardForm.LICENSEACCEPTEDRADIO.Hide;
  WizardForm.LICENSENOTACCEPTEDRADIO.Hide;
  WizardForm.LICENSEACCEPTEDRADIO.Checked := True;
  WizardForm.LICENSEMEMO.Height := 170;
  with TLabel.Create(WizardForm) do
  begin
    Parent := WizardForm.LicensePage;
    Top := WizardForm.LicenseMemo.Top + WizardForm.LicenseMemo.Height + ScaleY(10);
    Left := 2;
    Caption := '如果你点击“我同意”进入下一页面，即表示你同意以上协议。';
  end;
end;

procedure DeinitializeSetup();
begin
  stoptimer();
end;

procedure CurPageChanged(CurPageID: Integer);
begin
//一定要别人先看协议20秒，即使返回欢迎页面，秒数倒数会停止，再进入协议秒数倒数继续
  if CurPageID = wpLicense then
      starttimer(WizardForm.Handle,WizardForm.NEXTBUTTON.Handle,'我同意(&I)',20)
  else
  if (CurPageID = wpWelcome) or (CurPageID = wpSelectDir) then
  begin
    stoptimer();
    WizardForm.NEXTBUTTON.Caption := '下一步(&N) >';
  end;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  case CurPageID of
    wpLicense: Result := IsWindowEnabled(WizardForm.NextButton.Handle)
    else
      Result := True;
  end
end;