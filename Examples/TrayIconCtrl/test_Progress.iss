; -- test_Progress.iss --
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

[Files]
[Files]
Source: "icons\ico1.ico"; Flags: dontcopy
Source: "icons\ico2.ico"; Flags: dontcopy
Source: "icons\ico3.ico"; Flags: dontcopy
Source: "icons\ico4.ico"; Flags: dontcopy
Source: "icons\ico5.ico"; Flags: dontcopy
Source: "icons\ico6.ico"; Flags: dontcopy
Source: "icons\ico7.ico"; Flags: dontcopy
Source: "icons\ico8.ico"; Flags: dontcopy
Source: "icons\ico9.ico"; Flags: dontcopy
Source: "icons\ico10.ico"; Flags: dontcopy
Source: "icons\ico11.ico"; Flags: dontcopy
Source: "icons\ico12.ico"; Flags: dontcopy
Source: "icons\ico13.ico"; Flags: dontcopy
Source: "icons\ico14.ico"; Flags: dontcopy
Source: "icons\ico15.ico"; Flags: dontcopy
Source: "icons\ico16.ico"; Flags: dontcopy
Source: "icons\ico17.ico"; Flags: dontcopy

[code]
type
  TTimerProc = procedure(h: Longword; msg: Longword; idevent: Longword; dwTime: Longword);

function LoadImage(hInst: UINT; ImageName: String; ImageType: UINT; X, Y: Integer; Flags: UINT): THandle;
external 'LoadImage{#A}@user32.dll stdcall';

function WrapTimerProc(Callback: TTimerProc; ParamCount: Integer): Longword; {# CallbackCtrl_External };
function SetTimer(hWnd: Longword; nIDEvent, uElapse: Longword; lpTimerFunc: Longword): Longword; external 'SetTimer@user32.dll stdcall';
function KillTimer(hWnd: HWND; uIDEvent: UINT): BOOL; external 'KillTimer@user32.dll stdcall';

const
  WM_USER = $400;
 	WM_ICON_NOTIFY = WM_USER + 22; // 自己定义一个 TrayIcon 的消息标志以和其他的消息区分
  IMAGE_ICON = 1;
  LR_LOADFROMFILE = $10;

var
  TimerCallback: Longword;
  Ico1, Ico2, Ico3, Ico4, Ico5, Ico6, Ico7, Ico8, Ico9, Ico10, Ico11, Ico12, Ico13, Ico14, Ico15, Ico16, Ico17: UINT;
  ProgressBar: TNewProgressBar;
  AnimateBtn: TNewButton;

procedure MyTimerProc(h: Longword; msg: Longword; idevent: Longword; dwTime: Longword);
begin
  ProgressBar.Position := ProgressBar.Position + 1;
  
  if ProgressBar.Position >= 100 then
  begin
    SetTrayIcon('', ico17);
    ShowBalloon('Progress is 100%', 'MyApp ver 1.0', NIIF_INFO, 2, False);
    sleep(500);
    HideBalloon;
    KillTimer(WizardForm.Handle, 888);
    ProgressBar.Hide;
    AnimateBtn.Visible := True;
  end else
  if ProgressBar.Position >= 96 then
  begin
    SetTrayIcon('', ico16);
    ShowBalloon('Progress is 96%', 'MyApp ver 1.0', NIIF_INFO, 2, False);
  end else
  if ProgressBar.Position >= 90 then
  begin
    SetTrayIcon('', ico15);
    ShowBalloon('Progress is 90%', 'MyApp ver 1.0', NIIF_INFO, 2, False);
  end else
  if ProgressBar.Position >= 84 then
  begin
    SetTrayIcon('', ico14);
    ShowBalloon('Progress is 84%', 'MyApp ver 1.0', NIIF_INFO, 2, False);
  end else
  if ProgressBar.Position >= 78 then
  begin
    SetTrayIcon('', ico13);
    ShowBalloon('Progress is 78%', 'MyApp ver 1.0', NIIF_INFO, 2, False);
  end else
  if ProgressBar.Position >= 72 then
  begin
    SetTrayIcon('', ico12);
    ShowBalloon('Progress is 72%', 'MyApp ver 1.0', NIIF_INFO, 2, False);
  end else
  if ProgressBar.Position >= 66 then
  begin
    SetTrayIcon('', ico11);
    ShowBalloon('Progress is 66%', 'MyApp ver 1.0', NIIF_INFO, 2, False);
  end else
  if ProgressBar.Position >= 60 then
  begin
    SetTrayIcon('', ico10);
    ShowBalloon('Progress is 60%', 'MyApp ver 1.0', NIIF_INFO, 2, False);
  end else
  if ProgressBar.Position >= 54 then
  begin
    SetTrayIcon('', ico9);
    ShowBalloon('Progress is 54%', 'MyApp ver 1.0', NIIF_INFO, 2, False);
  end else
  if ProgressBar.Position >= 48 then
  begin
    SetTrayIcon('', ico8);
    ShowBalloon('Progress is 48%', 'MyApp ver 1.0', NIIF_INFO, 2, False);
  end else
  if ProgressBar.Position >= 42 then
  begin
    SetTrayIcon('', ico7);
    ShowBalloon('Progress is 42%', 'MyApp ver 1.0', NIIF_INFO, 2, False);
  end else
  if ProgressBar.Position >= 36 then
  begin
    SetTrayIcon('', ico6);
    ShowBalloon('Progress is 36%', 'MyApp ver 1.0', NIIF_INFO, 2, False);
  end else
  if ProgressBar.Position >= 30 then
  begin
    SetTrayIcon('', ico5);
    ShowBalloon('Progress is 30%', 'MyApp ver 1.0', NIIF_INFO, 2, False);
  end else
  if ProgressBar.Position >= 24 then
  begin
    SetTrayIcon('', ico4);
    ShowBalloon('Progress is 24%', 'MyApp ver 1.0', NIIF_INFO, 2, False);
  end else
  if ProgressBar.Position >= 18 then
  begin
    SetTrayIcon('', ico3);
    ShowBalloon('Progress is 18%', 'MyApp ver 1.0', NIIF_INFO, 2, False);
  end else
  if ProgressBar.Position >= 12 then
  begin
    SetTrayIcon('', ico2);
    ShowBalloon('Progress is 12%', 'MyApp ver 1.0', NIIF_INFO, 2, False);
  end else
  if ProgressBar.Position >= 6 then
  begin
    SetTrayIcon('', ico1);
    ShowBalloon('Progress is 6%', 'MyApp ver 1.0', NIIF_INFO, 2, False);
  end;

end;

procedure AnimateBtnOnClick(Sender: TObject);
begin
  ProgressBar.Position := 0;
  ProgressBar.Visible := True;
  AnimateBtn.Hide;
  SetTimer(WizardForm.Handle, 888, 200, TimerCallback);
end;

procedure InitializeWizard();
begin
  PDir('{# TrayIconCtrl_DLL }');
  PDir('{# CallbackCtrl_Dll }');
  
  ExtractTemporaryFile('ico1.ico');
  ExtractTemporaryFile('ico2.ico');
  ExtractTemporaryFile('ico3.ico');
  ExtractTemporaryFile('ico4.ico');
  ExtractTemporaryFile('ico5.ico');
  ExtractTemporaryFile('ico6.ico');
  ExtractTemporaryFile('ico7.ico');
  ExtractTemporaryFile('ico8.ico');
  ExtractTemporaryFile('ico9.ico');
  ExtractTemporaryFile('ico10.ico');
  ExtractTemporaryFile('ico11.ico');
  ExtractTemporaryFile('ico12.ico');
  ExtractTemporaryFile('ico13.ico');
  ExtractTemporaryFile('ico14.ico');
  ExtractTemporaryFile('ico15.ico');
  ExtractTemporaryFile('ico16.ico');
  ExtractTemporaryFile('ico17.ico');
  Ico1 := LoadImage(0, ExpandConstant('{tmp}\ico1.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  Ico2 := LoadImage(0, ExpandConstant('{tmp}\ico2.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  Ico3 := LoadImage(0, ExpandConstant('{tmp}\ico3.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  Ico4 := LoadImage(0, ExpandConstant('{tmp}\ico4.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  Ico5 := LoadImage(0, ExpandConstant('{tmp}\ico5.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  Ico6 := LoadImage(0, ExpandConstant('{tmp}\ico6.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  Ico7 := LoadImage(0, ExpandConstant('{tmp}\ico7.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  Ico8 := LoadImage(0, ExpandConstant('{tmp}\ico8.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  Ico9 := LoadImage(0, ExpandConstant('{tmp}\ico9.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  Ico10 := LoadImage(0, ExpandConstant('{tmp}\ico10.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  Ico11 := LoadImage(0, ExpandConstant('{tmp}\ico11.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  Ico12 := LoadImage(0, ExpandConstant('{tmp}\ico12.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  Ico13 := LoadImage(0, ExpandConstant('{tmp}\ico13.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  Ico14 := LoadImage(0, ExpandConstant('{tmp}\ico14.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  Ico15 := LoadImage(0, ExpandConstant('{tmp}\ico15.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  Ico16 := LoadImage(0, ExpandConstant('{tmp}\ico16.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  Ico17 := LoadImage(0, ExpandConstant('{tmp}\ico17.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);

  AnimateBtn := TNewButton.Create(WizardForm);
  with AnimateBtn do
  begin
    Left := ScaleX(5);
    Top := WizardForm.CancelButton.Top;
    Width := ScaleX(95);
    Height := WizardForm.CancelButton.Height;
    Caption := '&AnimateProgress';
    OnClick := @AnimateBtnOnClick;
    Parent := WizardForm;
    
    ProgressBar := TNewProgressBar.Create(WizardForm);
    ProgressBar.Parent := WizardForm;
    ProgressBar.SetBounds(Left, Top, ScaleX(300), Height-5);
    ProgressBar.Hide;
  end;


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
			 nil                    // 自定义托盘图标事件
			 );

end;

procedure DeinitializeSetup();
begin
  MainForm.Hide;
  WizardForm.Hide;
  UninitTrayIconCtrl();
end;








