; 演示如何使用Setup参数 UninstallIconFile.
; 脚本: restools ( http://restools.hanzify.org )

; 处理了相关所有对话框在安装程序置顶的情况下仍然保持在安装程序前面显示.

#ifndef IS_ENHANCED
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=My Program
AppVersion=1.5
DefaultDirName={pf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
SolidCompression=yes
Compression=lzma/ultra
OutputDir=userdocs:Inno Setup Examples Output
;WindowVisible=yes

[Files]
Source: "MyProg.exe"; DestDir: "{app}"
Source: "MyProg1.chm"; DestName: "MyProg.chm"; DestDir: "{app}"
Source: "Readme1.txt"; DestName: "Readme.txt"; DestDir: "{app}"; Flags: isreadme

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"
Name: "{group}\My Program Documentation"; Filename: "{app}\MyProg.chm";
Name: "{group}\My Program Readme"; Filename: "{app}\Readme.txt";
Name: "{group}\Remove My Program"; Filename: "{uninstallexe}";

[code]
const
  HWND_TOPMOST = -1;
  SWP_NOMOVE = 2;
  SWP_NOSIZE = 1;

function SetWindowPos(hWnd: HWND; hWndInsertAfter: HWND; X, Y, cx, cy: Longint; uFlags: UINT): Integer;
external 'SetWindowPos@user32.dll stdcall';

procedure AboutButtonOnClick(Sender: TObject);
//var
//  Dir: String;
begin                                                      
  MsgBox('MessageBox remains on top of WizardForm.', mbInformation, mb_Ok);
//  BrowseForFolder('Please specify the location:', Dir, False);
end;

procedure InitializeWizard();
var
  AboutButton: TNewButton;
begin
//  SetWindowPos(MainForm.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
  SetWindowPos(WizardForm.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);

  AboutButton := TNewButton.Create(WizardForm);
  AboutButton.Left := WizardForm.ClientWidth - WizardForm.CancelButton.Left - WizardForm.CancelButton.Width;
  AboutButton.Top := WizardForm.CancelButton.Top;
  AboutButton.Width := WizardForm.CancelButton.Width;
  AboutButton.Height := WizardForm.CancelButton.Height;
  AboutButton.Caption := '&About...';
  AboutButton.OnClick := @AboutButtonOnClick;
  AboutButton.Parent := WizardForm;
end;

