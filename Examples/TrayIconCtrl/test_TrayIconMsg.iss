; -- test_TrayIconMsg.iss --
; restools
; http://restools.hanzify.org

#include "CallbackCtrl.ish"
#include "trayiconctrl.ish"

[Setup]
AppName=MyApp
AppVerName=MyApp Ver 1.0
DefaultDirName={pf}\MyApp
DefaultGroupName=MyApp
Compression=lzma
;WindowVisible=yes
OutputDir=userdocs:Inno Setup Examples Output

[code]
type
  TTimerProc = procedure(h: Longword; msg: Longword; idevent: Longword; dwTime: Longword);

function WrapTimerProc(Callback: TTimerProc; ParamCount: Integer): Longword; {# CallbackCtrl_External };
function SetTimer(hWnd: Longword; nIDEvent, uElapse: Longword; lpTimerFunc: Longword): Longword;
  external 'SetTimer@user32.dll stdcall';
function KillTimer(hWnd: HWND; uIDEvent: UINT): BOOL; external 'KillTimer@user32.dll stdcall';

function GetSystemMetrics(nIndex: Integer): Integer; external 'GetSystemMetrics@user32.dll stdcall';

const
  WM_USER = $400;
 	WM_ICON_NOTIFY = WM_USER + 22; // 自己定义一个 TrayIcon 的消息标志以和其他的消息区分
  WM_MOUSEMOVE = $0200;
  SM_CXSCREEN = 0;
  SM_CYSCREEN = 1;

var
  TimerCallback: Longword;
  TimerActive: Boolean;
  TimerCount: Integer;
  MsgForm: TForm;

procedure MyTimerProc(h: Longword; msg: Longword; idevent: Longword; dwTime: Longword);
begin
  TimerCount := TimerCount + 1;
  if TimerCount >= 3 then
  begin
    MsgForm.Hide;
    KillTimer(WizardForm.Handle, 888);
    TimerActive := False;
  end;
end;

function LOWORD(DW: LongWord): LongWord;
begin
  Result := DW and $FFFF;
end;
var
  ScreenWidth, ScreenHeight: Integer;

function MyTrayIconMsgCallBack(wParam, lParam: LongWord): Boolean;
var
  lpPoint: TPoint;
begin
  Result := False;
  if LOWORD(lParam) = WM_MOUSEMOVE then // 这句代码表示 当鼠标移到托盘图标上的时候，消息窗口自动显示出来
  begin
    TimerCount := 0; // 只要鼠标还在图标上移动，那么就永远重新计数，5秒之后消息窗口才会消失
    if not TimerActive then
    begin
      TimerActive := True;
      MsgForm.Show;
      WizardForm.BringToFront;
      SetTimer(WizardForm.Handle, 888, 1000, TimerCallback);
    end;
  end;
end;

procedure InitializeWizard();
var
  Panel: TPanel;
begin
  PDir('{# TrayIconCtrl_DLL }');
  PDir('{# CallbackCtrl_Dll }');

  ScreenWidth := GetSystemMetrics(SM_CXSCREEN);
  ScreenHeight := GetSystemMetrics(SM_CYSCREEN);
  MsgForm := TForm.Create(MainForm);
  MsgForm.Color := clBlack;
  MsgForm.BorderStyle := bsNone;
  MsgForm.FormStyle := fsStayOnTop;
  MsgForm.Width := 200;
  MsgForm.Height := 100;
  Panel := TPanel.Create(MsgForm);
  Panel.Parent := MsgForm;
  Panel.SetBounds(1, 1, MsgForm.ClientWidth-2, MsgForm.ClientHeight-2);
  Panel.Color := clInfoBk;
  Panel.BevelOuter := bvNone;
#ifdef UNICODE
  Panel.ParentBackground := False;
#endif
#ifdef IS_ENHANCED
  Panel.ParentBackground := False;
#endif
  MsgForm.Left := ScreenWidth-205;
  MsgForm.Top := ScreenHeight-135;
  with TLabel.Create(MsgForm) do
  begin
    Parent := Panel;
    Left := 4;
    Top := 4;
    Caption := 'Title: MyApp Ver 1.0';
    Font.Height := -21;
  end;
  with TLabel.Create(MsgForm) do
  begin
    Parent := Panel;
    Left := 4;
    Top := 30;
    Caption := 'My Message; My Message'#13'My Message; My Message'#13'My Message; My Message';
  end;

  TimerActive := False;
  TimerCallback := WrapTimerProc(@MyTimerProc, 4);

  InitTrayIconCtrl(MainForm.Handle, WizardForm.Handle,
			 WM_ICON_NOTIFY,        // 自定义自己的消息 ID, 以区分其他消息
			 '',                    // 由于这个例子使用了自定义消息窗口，所以就把它省掉了
			 0,                     // 这里默认使用安装程序图标
       True,                  // 立即显示, 不用调用 ShowTrayIcon
			 True,                  // 显示安装程序的任务栏按钮
			 '',                    // 不建立托盘图标菜单
			 -1,                    // 没有默认菜单项
			 nil,                   // 没有菜单点击事件
			 nil,                   // 没有菜单弹出事件
			 @MyTrayIconMsgCallBack // 自定义托盘图标事件
			 );

end;

procedure DeinitializeSetup();
begin
  MsgForm.Hide;
  MainForm.Hide;
  WizardForm.Hide;
  UninitTrayIconCtrl();
end;









