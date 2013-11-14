; -- test.iss --
; restools
; http://restools.hanzify.org

#include "trayiconctrl.ish"

#ifdef IS_ENHANCED
  #if (Ver < 0x5020300) || (Pos('ee', IS_Ver_Str) < 1)
    #pragma error 'Enhanced edition of Inno Setup (5.2.3.ee1 or higher) is required to compile this script'
    // http://restools.hanzify.org/article.asp?id=89
  #endif
#else
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=MyApp
AppVerName=MyApp Ver 1.0
DefaultDirName={pf}\MyApp
DefaultGroupName=MyApp
Compression=lzma
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "icons\face.ico"; Flags: dontcopy

[code]
function LoadImage(hInst: UINT; ImageName: String; ImageType: UINT; X, Y: Integer; Flags: UINT): THandle;
external 'LoadImage{#A}@user32.dll stdcall';

const
  WM_USER = $400;
 	WM_ICON_NOTIFY = WM_USER + 22; // 自己定义一个 TrayIcon 的消息标志以和其他的消息区分
  IMAGE_ICON = 1;
  LR_LOADFROMFILE = $10;

var
  MySetupForm: TSetupForm;
  Ico: UINT;

procedure InitializeWizard();
begin
  PDir('trayiconctrl.dll');
  ExtractTemporaryFile('face.ico');
  
  MySetupForm := CreateCustomForm();
  MySetupForm.BorderStyle := bsSizeable;
  MySetupForm.Caption := 'Test My SetupForm';
  MySetupForm.SetBounds(0,0,400,300);
  MySetupForm.Center;
  
  Ico := LoadImage(0, ExpandConstant('{tmp}\face.ico'), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
  InitTrayIconCtrl(MySetupForm.Handle, MySetupForm.Handle,
             WM_ICON_NOTIFY,   // 自定义自己的消息 ID, 以区分其他消息
             'MyApp Ver 1.0',  // Tooltip 鼠标在 TrayIcon 图标上移动的时候显示的提示
             Ico,              // 这里默认使用安装程序图标
             True,             // 立即显示, 不用调用 ShowTrayIcon
             False,            // 不显示安装程序的任务栏按钮
             '',               // 不建立托盘图标菜单
             -1,               // 没有默认菜单项
             nil,              // 没有菜单点击事件
             nil,              // 没有菜单弹出事件
             nil               // 没有自定义托盘图标事件
             );

  // 显示漫画型气泡提示
  ShowBalloon('Setup is starting...', 'MyApp ver 1.0', 0, 10, False);
  
  MySetupForm.ShowModal;
  MySetupForm.Free;
  
  UninitTrayIconCtrl();
  
  WizardForm.BorderStyle := bsNone;
  WizardForm.Height := 0;
  Application.Terminate;
end;

