; 演示如何使用增强的主体安装程序和增强的编译器。
; 脚本: restools ( http://restools.hanzify.org )
; 这里将会演示所有增强功能并提供相关解释。

; 其他更多的 VCL 属性和函数，具体请查看“Support Classes.txt”

#ifndef IS_ENHANCED
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
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

function SetTimer(hWnd: longword; nIDEvent, uElapse: longword; lpTimerFunc: longword): longword;
     external 'SetTimer@user32.dll stdcall';
// WinAPI 函数, 时间循环函数, 这个函数需要回调函数, 否则不能实现功能

procedure MyTimerProc(h:Longword; msg: Longword; idevent: Longword; dwTime: Longword);
begin
  WizardForm.WelcomePage.Color:=random($FFFFFF);
end;

procedure MyTimerProc2(h:Longword; msg: Longword; idevent: Longword; dwTime: Longword);
begin
  WizardForm.WelcomeLabel1.Font.Color:=random($FFFFFF);
  WizardForm.WelcomeLabel2.Font.Color:=random($FFFFFF);
  WizardForm.Color:=random($FFFFFF);
end;

procedure InitializeWizard();
begin
  SetTimer(0, 101, 1000, CallbackAddr('MyTimerProc'));
  SetTimer(0, 102, 700, CallbackAddr('MyTimerProc2'));
  // CallbackAddr 函数会把指定的函数处理成能够被 WinAPI 调用的回调函数。而且使用相当方便。
end;

