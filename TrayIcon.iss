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
 	WM_ICON_NOTIFY = WM_USER + 1331; // Define a TrayIcon message flag to distinguish itself from other messages

  MF_BYPOSITION = $400;
  MF_ENABLED = 0;
  MF_GRAYED = 1;

// TrayIcon menu click event
procedure TrayMenuItemOnClick(MenuItemIndex: Integer);
begin     
// The following code indicates that the WizardForm has a pop-up dialog box to prohibit the menu click event
  if not IsWindowEnabled(WizardForm.Handle) then exit;

  Case MenuItemIndex of
    0: ToggleWizardVisible; // because the 0 menu is the default menu, so here the event in addition to the menu click, double-click the icon can also trigger.
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
// The following sentence is the effect if WizardForm shows a dialog box, in order to prevent multiple display dialog box, so the right-click menu is prohibited
  bShow := IsWindowEnabled(WizardForm.Handle);
 // Here is the menu before the pop-up callback function, the following role is when WziardForm shrink to the tray area, disable the "About" and "Exit" menu
  if WizardFormInTray() then
  begin
    EnableMenuItem(PopMenu, 5, MF_BYPOSITION or MF_GRAYED);
    EnableMenuItem(PopMenu, 7, MF_BYPOSITION or MF_GRAYED);
  end else begin
    EnableMenuItem(PopMenu, 5, MF_BYPOSITION or MF_ENABLED);
    EnableMenuItem(PopMenu, 7, MF_BYPOSITION or MF_ENABLED);
  end;

#ifndef D8Team_VIP
  EnableMenuItem(PopMenu, 2, MF_BYPOSITION or MF_GRAYED);    // If you do not enable the VIP, then gray out the menu. . .
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

// Show comic bubble tips
  ShowBalloon(CustomMessage('pm_Start'), '{#AppVerName}', 0, 10, False);
end;

procedure DeinitTray();
begin
  UninitTrayIconCtrl();
end;
[/Code]
