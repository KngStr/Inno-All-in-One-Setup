; -- test.iss --
; restools
; http://restools.hanzify.org
; gifctrl.dll 为一个用于 Inno Setup 的 13 KB 的 gif 显示插件，同样可以显示 BMP 和 JPEG。

; V2 增强函数，可以同时显示 16 个 GIF 图片。

#include "GifCtrl.ish"

[Setup]
AppName=我的程序
AppVerName=我的程序 版本 1.5
DefaultDirName={pf}\我的程序
DefaultGroupName=我的程序
UninstallDisplayIcon={app}\MyProg.exe
Compression=lzma
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "compiler:\Examples\MyProg.exe"; DestDir: "{app}"
Source: "compiler:\Examples\Readme.txt"; DestDir: "{app}"; Flags: isreadme
Source: nsisinstall.gif; Flags: dontcopy
Source: 0023.gif; Flags: dontcopy

[Icons]
Name: "{group}\我的程序"; Filename: "{app}\MyProg.exe"

[code]
var
  GifPanel: TPanel;
  GIFHWND1, GIFHWND2: HWND;

function InitializeSetup(): Boolean;
begin
  PDir('GifCtrl.dll');

  GIFHWND1 := 0;
  GIFHWND2 := 0;
  Result := True;
end;

procedure DeinitializeSetup();
begin
  FreeAllGifWnd();
end;

procedure LblOnClick(Sender: TObject);
var
  ErrorCode: Integer;
begin
  ShellExec('open', 'http://restools.hanzify.org', '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);
end;

procedure InitializeWizard();
var
  GifFileName: String;
  Lbl: TNewStaticText;
begin
  ExtractTemporaryFile('nsisinstall.gif');
  ExtractTemporaryFile('0023.gif');

  GIFHWND1 := NewGifbWnd(WizardForm.InstallingPage.Handle, 0, WizardForm.PROGRESSGAUGE.Top + WizardForm.PROGRESSGAUGE.Height + SCaleY(5),
       WizardForm.InstallingPage.Width, WizardForm.InstallingPage.Height - (WizardForm.PROGRESSGAUGE.Top
       + WizardForm.PROGRESSGAUGE.Height + SCaleY(5)));
  GifWndLoadFromFile(GIFHWND1, HALIGN_CENTER, VALIGN_BOTTOM, CLR_INVALID, FIT_WIDTH, ExpandConstant('{tmp}\nsisinstall.gif'));

  // 创建一个网站 Logo 连接
  GIFHWND2 := NewGifbWnd(WizardForm.Handle, ScaleX(30), WizardForm.Bevel.Top + ScaleY(8), 88, 31);
  GifWndLoadFromFile(GIFHWND2, HALIGN_CENTER, VALIGN_CENTER, CLR_INVALID, FIT_NONE, ExpandConstant('{tmp}\0023.gif'));
  Lbl := TNewStaticText.Create(WizardForm);
  Lbl.Parent := WizardForm;
  Lbl.AutoSize := False;
  Lbl.SetBounds(ScaleX(30), WizardForm.Bevel.Top + ScaleY(8), 88, 31);
  Lbl.OnClick := @LblOnClick;
  Lbl.Cursor := crHand;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpInstalling then
  begin
    MsgBox('暂停一下，看看效果。', mbInformation, MB_OK);
  end;
end;



