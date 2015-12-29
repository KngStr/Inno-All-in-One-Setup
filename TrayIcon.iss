//Author      : KngStr
//Link        : http://www.kngstr.com/
//Description :
//Modified    : 2013-11-14 11:40:59
//Tested Inno :

#include "trayiconctrl.ish"

[CustomMessages]
pm_ShowAndShow=&Show/Hide WizardForm
pm_ActivateVIP=Activate&VIP
pm_VisitOurSite=&VisitOurSite
pm_About=&About...
pm_Exit=E&xit
pm_Start={#AppVerName}Setup is starting...

ChineseSimp.pm_ShowAndShow=显示/隐藏 安装窗口(&S)
ChineseSimp.pm_ActivateVIP=激活VIP功能(&V)
ChineseSimp.pm_VisitOurSite=访问我们的网站(&O)
ChineseSimp.pm_About=关于...(&A)
ChineseSimp.pm_Exit=退出(&X)
ChineseSimp.pm_Start={#AppVerName}安装程序开始...

[code]
function EnableMenuItem(hMenu: HMENU; uIDEnableItem, uEnable: UINT): BOOL; external 'EnableMenuItem@user32.dll stdcall';
function IsWindowEnabled(hWnd: HWND): BOOL; external 'IsWindowEnabled@user32.dll stdcall';

const
  WM_USER = $400;
 	WM_ICON_NOTIFY = WM_USER + 1331; // 自己定义一个 TrayIcon 的消息标志以和其他的消息区分

  MF_BYPOSITION = $400;
  MF_ENABLED = 0;
  MF_GRAYED = 1;

// TrayIcon 菜单点击事件
procedure TrayMenuItemOnClick(MenuItemIndex: Integer);
begin     
  // 下面 这句代码表示 WizardForm 有弹出对话框时禁止菜单点击事件
  if not IsWindowEnabled(WizardForm.Handle) then exit;

  Case MenuItemIndex of
    0: ToggleWizardVisible; // 因为 0 项菜单为默认菜单, 所以这里的事件除了菜单点击外, 双击图标也能触发.
    2: 
    begin
#ifdef D8Team_VIP
      if not Assigned(IKGPage) then InitIKG;
      IKGPage.ShowModal;
#endif
    end;
    3: OpenSite('{#url}');
    5: MainForm.ShowAboutBox;
    7: WizardForm.Close;
  end;
end;

procedure TrayMenuOnPopup(PopMenu: LongWord; var bShow: Boolean);
var
  Idx: Integer;
  sl: TStringList;
  s: string;
begin
  // 下面这一句的效果是如果 WizardForm 显示了对话框后,为了防止多重显示对话框,所以禁止了右键菜单
  bShow := IsWindowEnabled(WizardForm.Handle);
  // 这里是菜单弹出前的处理回调函数, 以下的作用是当 WziardForm 缩到托盘区的时候, 禁用 "About" 和 "Exit" 的菜单
  if WizardFormInTray() then
  begin
    EnableMenuItem(PopMenu, 5, MF_BYPOSITION or MF_GRAYED);
    EnableMenuItem(PopMenu, 7, MF_BYPOSITION or MF_GRAYED);
  end else begin
    EnableMenuItem(PopMenu, 5, MF_BYPOSITION or MF_ENABLED);
    EnableMenuItem(PopMenu, 7, MF_BYPOSITION or MF_ENABLED);
  end;

#ifndef D8Team_VIP
  EnableMenuItem(PopMenu, 2, MF_BYPOSITION or MF_GRAYED);    //如果不启用VIP的话，灰掉菜单。。。
#endif
end;

procedure InitTray();
var
  MenuStrs: string;
begin
  PDir('{# TrayIconCtrl_DLL }');

  MenuStrs := CustomMessage('pm_ShowAndShow') + ';' + // 0
             '-;' +                     // 1
             CustomMessage('pm_ActivateVIP') + ';' +         // 2
             CustomMessage('pm_VisitOurSite') + ';' +         // 3
             '-;' +                     // 4
             CustomMessage('pm_About') + ';' +             // 5
             '-;' +                     // 6
             CustomMessage('pm_Exit');                   // 7

  InitTrayIconCtrl(MainForm.Handle, WizardForm.Handle, WM_ICON_NOTIFY, '{#AppVerName}', 0,
       True, False, MenuStrs, 0, @TrayMenuItemOnClick, @TrayMenuOnPopup, nil);

  // 显示漫画型气泡提示
  ShowBalloon(CustomMessage('pm_Start'), '{#AppVerName}', 0, 10, False);
end;

procedure DeinitTray();
begin
  UninitTrayIconCtrl();
end;
[/Code]