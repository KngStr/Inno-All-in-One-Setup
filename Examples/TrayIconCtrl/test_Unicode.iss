; -- test_Unicode.iss --
; restools
; http://restools.hanzify.org

#ifndef UNICODE
  #error Unicode Inno Setup is required to compile this script
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

[Languages]
Name: "eng"; MessagesFile: "compiler:\languages\English.isl"
Name: "chs"; MessagesFile: "compiler:\languages\ChineseSimp.isl"
Name: "cht"; MessagesFile: "compiler:\languages\ChineseTrad.isl"
Name: "jp"; MessagesFile: "compiler:\languages\Japanese.isl"
Name: "ko"; MessagesFile: "compiler:\languages\Korean.isl"
Name: "rus"; MessagesFile: "compiler:\languages\Russian.isl"

[CustomMessages]
eng.Tooltip=MyApp Ver 1.0
eng.TooltipText=Setup is starting...
eng.MenuStrs=&Show/Hide WizardForm;-;&About...;-;E&xit

chs.Tooltip=我的应用程序 Ver 1.0
chs.TooltipText=安装正在开始...
chs.MenuStrs=显示/隐藏 WizardForm(&S);-;关于(&A)...;-;退出(&X)

cht.Tooltip=我的應用程式 Ver 1.0
cht.TooltipText=安裝正在開始...
cht.MenuStrs=顯示/隱藏 WizardForm(&S);-;關於(&A)...;-;退出(&X)

jp.Tooltip=私のアプリケーション Ver 1.0
jp.TooltipText=セットアップを開始しています...
jp.MenuStrs=見せる/隠す WizardForm(&S);-;セットアップについて(&A)...;-;終了(&X)

ko.Tooltip=내 응용 프로그램 Ver 1.0
ko.TooltipText=설치 프로그램을 시작합니다...
ko.MenuStrs=보이다/숨기기 WizardForm(&S);-;설치에 대하여(&A)...;-;종료(&X)

rus.Tooltip=мое заявление Ver 1.0
rus.TooltipText=Установка начинается...
rus.MenuStrs=Показывать/Прятать WizardForm(&S);-;О программе(&A)...;-;Выйти(&X)

[code]
const
  WM_USER = $400;
 	WM_ICON_NOTIFY = WM_USER + 22; // 自己定义一个 TrayIcon 的消息标志以和其他的消息区分
  MF_BYPOSITION = $400;
  MF_ENABLED = 0;
  MF_GRAYED = 1;

function EnableMenuItem(hMenu: UINT; uIDEnableItem, uEnable: UINT): BOOL; external 'EnableMenuItem@user32.dll stdcall';
function IsWindowEnabled(hWnd: HWND): BOOL; external 'IsWindowEnabled@user32.dll stdcall';

// TrayIcon 菜单点击事件
procedure TrayMenuItemOnClick(MenuItemIndex: Integer);
begin
  // 下面 这句代码表示 WizardForm 有弹出对话框时禁止菜单点击事件
  if not IsWindowEnabled(WizardForm.Handle) then exit;

  Case MenuItemIndex of
  0: ToggleWizardVisible; // 因为 0 项菜单为默认菜单, 所以这里的事件除了菜单点击外, 双击图标也能触发.
  2: MainForm.ShowAboutBox;
  4: WizardForm.Close;
  end;
end;

procedure TrayMenuOnPopup(PopMenu: LongWord; var bShow: Boolean);
begin
  // 下面这一句的效果是如果 WizardForm 显示了对话框后,为了防止多重显示对话框,所以禁止了右键菜单
  bShow := IsWindowEnabled(WizardForm.Handle);
  // 这里是菜单弹出前的处理回调函数, 以下的作用是当 WziardForm 缩到托盘区的时候, 禁用 "About" 和 "Exit" 的菜单
  if WizardFormInTray() then
  begin
    EnableMenuItem(PopMenu, 2, MF_BYPOSITION or MF_GRAYED);
    EnableMenuItem(PopMenu, 4, MF_BYPOSITION or MF_GRAYED);
  end else begin
    EnableMenuItem(PopMenu, 2, MF_BYPOSITION or MF_ENABLED);
    EnableMenuItem(PopMenu, 4, MF_BYPOSITION or MF_ENABLED);
  end;
end;

procedure InitializeWizard();
begin
  PDir('trayiconctrl.dll');
//  MenuStrs := '&Show/Hide WizardForm;' + // 0
//              '-;' +                     // 1
//              '&About...;' +             // 2
//              '-;' +                     // 3
//              'E&xit';                   // 4
  InitTrayIconCtrl(MainForm.Handle, WizardForm.Handle, WM_ICON_NOTIFY, CustomMessage('Tooltip'), 0,
       True, False, CustomMessage('MenuStrs'), -1, @TrayMenuItemOnClick, @TrayMenuOnPopup, nil);

  // 显示漫画型气泡提示
  ShowBalloon(CustomMessage('TooltipText'), CustomMessage('Tooltip'), NIIF_INFO, 10, False);

end;

procedure DeinitializeSetup();
begin
  MainForm.Hide;
  WizardForm.Hide;
  UninitTrayIconCtrl();
end;















