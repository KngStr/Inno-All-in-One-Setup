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
 TEnumWinFunc = function(hwnd: HWND; lParam: Longword): Boolean;

var
  ListBox: TListBox;

function EnumWindows(lpEnumFunc: Longword; lParam: Longword): Boolean; external 'EnumWindows@user32.dll stdcall';
// 枚举当前所有窗口，需要调用回调函数。

function GetWindowText(hWnd: HWND; lpString: String; nMaxCount: Integer): Integer;
external 'GetWindowText{#A}@user32.dll stdcall';

function WrapTimerProc(callback: TEnumWinFunc; ParamCount: Integer): longword; {# CallbackCtrl_External };

function IsWindowVisible(hWnd: HWND): Boolean; external 'IsWindowVisible@user32.dll stdcall';

function EnumWindowsProc(
    hwnd: HWND;	    // handle to parent window
    lParam: Longword  	// application-defined value
    ): Boolean;
var
  s: String;
begin
  Result := True; // 返回真值表示继续枚举，也就是继续调用这个函数直至所有窗口被枚举一遍。
  // 以下列举所有有标题的可视窗口的标题。
  if IsWindowVisible(hwnd) then
  begin
    s := StringOfChar(' ', 256);
    GetWindowText(hwnd, s, 256);
    s := Trim(s);
    if s <> '' then
      if ListBox.Items.IndexOf(s) = -1 then
        ListBox.Items.Append(S);
  end;
end;

procedure InitializeWizard();
var
  EnumWincallback: Longword;
begin
  PDir('{# CallbackCtrl_Dll }');

  WizardForm.Caption := 'Visible window title';
  WizardForm.OuterNotebook.Hide;
  ListBox := TListBox.Create(WizardForm);
  ListBox.Parent := WizardForm;
  ListBox.SetBounds(5, 5, WizardForm.ClientWidth - 10, WizardForm.Bevel.Top - 10);
  
  EnumWincallback := WrapTimerProc(@EnumWindowsProc,2);
  EnumWindows(EnumWincallback, 0);
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  WizardForm.NextButton.Hide;
  WizardForm.CancelButton.Caption := 'Close';
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := False;
end;
