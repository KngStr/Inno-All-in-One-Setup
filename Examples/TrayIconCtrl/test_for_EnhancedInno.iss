; -- test_for_EnhancedInno.iss --
; restools
; http://restools.hanzify.org

#ifdef IS_ENHANCED
  #if (Ver < 0x5020300) || (Pos('ee', IS_Ver_Str) < 1)
    #pragma error 'Enhanced edition of Inno Setup (5.2.3.ee1 or higher) is required to compile this script'
    // http://restools.hanzify.org/article.asp?id=89
  #endif
#else
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

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
function GetCursorPos(var lpPoint: TPoint): BOOL; external 'GetCursorPos@user32.dll stdcall';
function IsWindowEnabled(hWnd: HWND): BOOL; external 'IsWindowEnabled@user32.dll stdcall';

const
  WM_USER = $400;
 	WM_ICON_NOTIFY = WM_USER + 22; // 自己定义一个 TrayIcon 的消息标志以和其他的消息区分
  WM_RBUTTONUP = $205;
var
  PupMnu: TPopupMenu;

procedure MenuOnClick(Sender: TObject);
begin
  case TMenuItem(Sender).HelpContext of
  101: ToggleWizardVisible;
  102: MainForm.ShowAboutBox;
  103: WizardForm.Close;
  end;
  WizardForm.BringToFront;
end;

procedure PMenuOnPopup(Sender: TObject);
begin
  // 这里是菜单弹出前的处理, 以下的作用是当 WziardForm 缩到托盘区的时候, 禁用 "About" 和 "Exit" 的菜单
  PupMnu.Items.Items[2].Enabled := not WizardFormInTray;
  PupMnu.Items.Items[4].Enabled := not WizardFormInTray;
end;

function LOWORD(DW: LongWord): LongWord;
begin
  Result := DW and $FFFF;
end;

function MyTrayIconMsgCallBack(wParam, lParam: LongWord): Boolean;
var
  lpPoint: TPoint;
begin
  Result := False;
  if LOWORD(lParam) = WM_RBUTTONUP then // 这句代码表示 右键点击图标将会弹出菜单
    if IsWindowEnabled(WizardForm.Handle) then // 这一句的效果是如果 WizardForm 显示了对话框后,为了防止多重显示对话框,所以禁止了右键菜单
    begin
      GetCursorPos(lpPoint);
      PupMnu.Popup(lpPoint.x, lpPoint.y);
      Result := True; // 已经完成对该消息的处理，返回 True 将会结束后面的内部处理。
    end;
end;

procedure InitializeWizard();
begin
  PDir('trayiconctrl.dll');
  PupMnu := NewPopupMenu(WizardForm, 'MyPopupMenu', paLeft, True, [
      NewItem('&Show/Hide WizardForm', 0, False, True, @MenuOnClick, 101, 'piShowHideWizardForm'),
      NewLine,
      NewItem('&About...', 0, False, True, @MenuOnClick, 102, 'piAbort'),
      NewLine,
      NewItem('E&xit', 0, False, True, @MenuOnClick, 103, 'piExit')
  ]);
  PupMnu.OnPopup := @PMenuOnPopup;

  InitTrayIconCtrl(MainForm.Handle, WizardForm.Handle,
			 WM_ICON_NOTIFY,        // 自定义自己的消息 ID, 以区分其他消息
			 'MyApp Ver 1.0',       // Tooltip 鼠标在 TrayIcon 图标上移动的时候显示的提示
			 0,                     // 这里默认使用安装程序图标
       True,                  // 立即显示, 不用调用 ShowTrayIcon
			 False,                 // 不显示安装程序的任务栏按钮
			 '',                    // 不建立托盘图标菜单
			 -1,                    // 没有默认菜单项
			 nil,                   // 没有菜单点击事件
			 nil,                   // 没有菜单弹出事件
			 @MyTrayIconMsgCallBack // 自定义托盘图标事件
			 );

  // 显示漫画型气泡提示
  ShowBalloon('Setup is starting...', 'MyApp ver 1.0', 0, 10, False);

end;

procedure DeinitializeSetup();
begin
  MainForm.Hide;
  WizardForm.Hide;
  UninitTrayIconCtrl();
end;








