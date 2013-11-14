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

[Components]
Name: "Basque"; Description: "Basque"; Types: full compact custom; Flags: fixed
Name: "BrazilianPortuguese"; Description: "BrazilianPortuguese"; Types: full
Name: "Catalan"; Description: "Catalan"; Types: full compact
Name: "Czech"; Description: "Czech"; Types: full
Name: "Danish"; Description: "Danish"; Types: full
Name: "Dutch"; Description: "Dutch"; Types: full
Name: "Finnish"; Description: "Finnish"; Types: full
Name: "French"; Description: "French"; Types: full
Name: "German"; Description: "German"; Types: full
Name: "Hebrew"; Description: "Hebrew"; Types: full
Name: "Hungarian"; Description: "Hungarian"; Types: full
Name: "Italian"; Description: "Italian"; Types: full
Name: "Norwegian"; Description: "Norwegian"; Types: full
Name: "Polish"; Description: "Polish"; Types: full
Name: "Portuguese"; Description: "Portuguese"; Types: full
Name: "Russian"; Description: "Russian"; Types: full
Name: "Slovak"; Description: "Slovak"; Types: full
Name: "Slovenian"; Description: "Slovenian"; Types: full
Name: "Spanish"; Description: "Spanish"; Types: full

[code]
const
  LB_GETTOPINDEX = $018E;
  LB_GETITEMRECT = $0198;
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

function ScreenToClient(hWnd: HWND; var lpPoint: TPoint): BOOL; external 'ScreenToClient@user32.dll stdcall';

//以一个相当弯曲的方法来调用 API 函数。
//function SendMessage(const Wnd: HWND; const Msg, WParam, LParam: Longint): Longint; external 'SendMessageA@user32.dll stdcall';
function GetListItemRect(const Wnd: HWND; const Msg, WParam: Longint; var LParam: TRect): Longint;
external 'SendMessage{#A}@user32.dll stdcall';

var
  Old_Desc: String;
  HandleMark: Boolean;
  
function MyPtInRect(const lprc: TRect; pt: TPoint): BOOL;
begin
  Result := (pt.x >= lprc.Left) and (pt.x <= lprc.Right) and (pt.y >= lprc.Top) and (pt.y <= lprc.Bottom);
end;
  
procedure MyMessageProc(nCode: LongWord; wParam: LongWord; lParam: TMouseHookStruct);
var
  TopIndex, ItemCount, CurIndex: Integer;
  ItemRect: TRect;
  MPpt: TPoint;
  s: String;
begin
  if HandleMark then exit;
  if nCode >= 0 then
  try
    HandleMark := True;
		if lParam.hwnd = WizardForm.ComponentsList.Handle then
    begin
			TopIndex := SendMessage(WizardForm.ComponentsList.Handle, LB_GETTOPINDEX, 0, 0);
			ItemCount := WizardForm.ComponentsList.Items.Count;
			CurIndex := TopIndex;
			while CurIndex < ItemCount do
      begin
        GetListItemRect(WizardForm.ComponentsList.Handle, LB_GETITEMRECT, CurIndex, ItemRect);
        MPpt := lParam.pt;
        ScreenToClient(WizardForm.ComponentsList.Handle, MPpt);
        if MyPtInRect(ItemRect, MPpt) then
        begin
          s := 'Current Component Caption: ' + WizardForm.ComponentsList.ItemCaption[CurIndex];
          if Old_Desc <> s  then
          begin
            WizardForm.ComponentsDiskSpaceLabel.Caption := s;
            Old_Desc := s;
	    			WizardForm.ComponentsDiskSpaceLabel.Enabled := True;
          end;
      		exit;
        end;
        CurIndex := CurIndex + 1;
      end;
    end;
    s := 'Position your mouse over a component to see its description.';
    if Old_Desc <> s then
    begin
      WizardForm.ComponentsDiskSpaceLabel.Caption := s;
      Old_Desc := s;
			WizardForm.ComponentsDiskSpaceLabel.Enabled := False;
    end;
  finally
    HandleMark := False;
  end;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpSelectComponents then
  begin
    HandleMark := False;
    SetWinHookEx(WH_MOUSE, @MyMessageProc);
  end else
  begin
    UnhookWinHookEx();
  end;
end;

procedure DeinitializeSetup();
begin
  UnhookWinHookEx();
end;

procedure InitializeWizard();
begin
  PDir('winmsgctrl.dll');
end;

