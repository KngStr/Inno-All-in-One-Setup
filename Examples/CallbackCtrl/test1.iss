; -- test.iss --
; restools
; http://restools.hanzify.org
; 时间仓促，如有错误请到我的 BLOG 咨询
; CallbackCtrl.dll 为一个用于 Inno Setup 的 4 KB 的回调( Callback )函数插件。
; 跟 InnoCallback 插件功能完全一样，但是由于它是用 VC 重现功能，所以仅仅只有 4 KB 就足以完成回调函数的处理。
; 同样的功能，将会在后续的 Inno Setup 增强版中直接提供回调函数的支持，
; 也就是说无须任何插件就可以在脚本中处理回调函数。
; 这个插件只是提供给那些使用普通版本 Inno Setup 的用户使用。

; Inno Setup plugin - CallbackCtrl ( 4 KB )
; Copyright (C) restools 2009-2010
; Version 1.1
; 修正在某些 Windows 平台(例如: Windows XP SP3)出现不能正常运行的问题。

#include "CallbackCtrl.Ish"

[Setup]
AppName=My Application
AppVerName=My Application Ver 1.5
DefaultDirName={pf}\My Application
SolidCompression=yes
Compression=lzma/ultra	
OutputDir=userdocs:Inno Setup Examples Output

[code]
type
 TTimerProc=procedure(h:longword; msg:longword; idevent:longword; dwTime:longword);

function WrapTimerProc(callback:TTimerProc; paramcount:integer):longword; {# CallbackCtrl_External };

function SetTimer(hWnd: longword; nIDEvent, uElapse: longword; lpTimerFunc: longword): longword;
  external 'SetTimer@user32.dll stdcall';

procedure mytimerproc1(h:longword; msg:longword; idevent:longword; dwTime:longword);
begin
  WizardForm.WelcomePage.Color:=random($FFFFFF);
  WizardForm.WelcomeLabel2.Font.Color:=random($FFFFFF);
end;

procedure mytimerproc2(h:longword; msg:longword; idevent:longword; dwTime:longword);
begin
  WizardForm.WelcomeLabel1.Font.Color:=random($FFFFFF);
  WizardForm.Color:=random($FFFFFF);
end;

procedure InitializeWizard();
var
  timercallback: Longword;
begin
  PDir('{# CallbackCtrl_Dll }');

  timercallback := WrapTimerProc(@mytimerproc1,4);
  settimer(0,0,1000,timercallback); 
  
  timercallback := WrapTimerProc(@mytimerproc2,4);
  settimer(0,0,700,timercallback);
end;

