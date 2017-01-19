; -- WH_MOUSE.iss --
; restools
; http://restools.hanzify.org
; WinMsgCtrl.dll 为一个用于 Inno Setup 的 6 KB 的 Windows 消息获取插件。
; 以下例子是演示如何处理安装程序的 Windows Message。

; 这里的例子示范了 Mouse Message 的使用.

; Ver 1.2 修正在某些 Windows 平台上(例如 Windows XP SP3)不能正常运行的问题。

; 低配置的电脑在调试状态下可能感觉有点迟缓，请直接运行生成的安装程序查看效果。

#include "MsgCtrl.ish"

[Setup]
AppName=MyApp
AppVerName=MyApp Ver 1.0
DefaultDirName={pf}\MyApp
DefaultGroupName=MyApp
Compression=lzma
OutputDir=userdocs:Inno Setup Examples Output

[Messages]
BeveledLabel=BrandingTexts

[code]
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

  {# MsgCtrl_SetWinHookEx }

function GetWindowRect(hWnd: HWND; var lpRect: TRect): BOOL;
external 'GetWindowRect@user32.dll stdcall';

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

procedure BeveledLabelClick(Sender: TObject);
begin
  MsgBox('kk', mbInformation, MB_OK);
end;

procedure InitializeWizard();
begin
  PDir('winmsgctrl.dll');
  HandleMark := False;
  SetWinHookEx(WH_MOUSE, @MyMessageProc);
  WizardForm.BeveledLabel.Enabled := True;
  WizardForm.BeveledLabel.Cursor := crHand;
  WizardForm.BeveledLabel.Font.Color := clGreen;
  WizardForm.BeveledLabel.OnClick := @BeveledLabelClick;
end;

procedure DeinitializeSetup();
begin
  UnhookWinHookEx();
end;

