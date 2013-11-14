; 演示如何使用增强的主体安装程序和增强的编译器。
; 脚本: restools ( http://restools.hanzify.org )
; 这里将会演示所有增强功能并提供相关解释。

; 其他更多的 VCL 属性和函数，具体请查看“Support Classes.txt”

#ifdef IS_ENHANCED
  #if (Ver < 0x5020300) || (Pos('ee', IS_Ver_Str) < 1)
    #pragma error 'Enhanced edition of Inno Setup (5.2.3.ee1 or higher) is required to compile this script'
  #endif
#else
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

#ifdef UNICODE
  #define A "W"
#else
  #define A "A"
#endif

[Setup]
AppName=My Application
AppVersion=1.5
DefaultDirName={pf}\My Application
SolidCompression=yes
Compression=lzma/ultra	
PrivilegesRequired=none
OutputDir=userdocs:Inno Setup Examples Output

[code]
function AppendMenu(hMenu: HMENU; uFlags, uIDNewItem: UINT; lpNewItem: String): BOOL;
external 'AppendMenu{#A}@user32.dll stdcall';

function GetSystemMenu(hWnd: HWND; bRevert: BOOL): HMENU;
external 'GetSystemMenu@user32.dll stdcall';

const
  WM_SYSCOMMAND = $0112;
  
var
  Menu: TMenuItem;

procedure MenuOnClick(Sender: TObject);
begin
  MsgBox('My AppInfo!', mbInformation, MB_OK);
end;

procedure AppOnMessage(var Msg: TMsg; var Handled: Boolean);
begin
  // 安装程序所有的消息处理都可以在这个事件中触发。
  // 只要你熟悉 Windows 消息处理，那么就代表你可以处理安装程序中的一切事件触发。
  if Msg.message = WM_SYSCOMMAND then
    if Msg.wParam = Menu.Handle then
      Menu.Click;
end;

procedure InitializeWizard();
var
  SysMenu: HMENU;
begin
  // 创建一个菜单项。
  Menu := TMenuItem.Create(WizardForm);
  Menu.OnClick := @MenuOnClick;

  // 鼠标在安装程序标题栏上右键点击弹出的系统菜单上添加菜单项。
  SysMenu := GetSystemMenu(Wizardform.Handle, False);
  AppendMenu(SysMenu, 0, 0, '');  // 加一横线
  AppendMenu(SysMenu, 0, Menu.Handle, 'About My App'); // 加一菜单项
  
  // 鼠标在任务栏的安装程序按钮上右键点击弹出的系统菜单上添加菜单项。
  SysMenu := GetSystemMenu(Application.Handle, False);
  AppendMenu(SysMenu, 0, 0, '');  // 加一横线
  AppendMenu(SysMenu, 0, Menu.Handle, 'About My App'); // 加一菜单项
  
  // 安装程序所有的消息处理都可以在这个事件中触发。
  // 也就是说这个事件可以囊括所有已经定义好的控件事件。而且一些特殊事件也可以由这里处理。
  // 满足了部分特殊要求的事件触发。
  Application.onMessage := @AppOnMessage;
end;








