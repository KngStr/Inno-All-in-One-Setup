; 演示如何使用增强的主体安装程序和增强的编译器。
; 脚本: restools ( http://restools.hanzify.org )
; 这里将会演示所有增强功能并提供相关解释。

; 其他更多的 VCL 属性和函数，具体请查看“Support Classes.txt”

#ifndef IS_ENHANCED
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
var
  ListBox: TListBox;

function EnumWindows(lpEnumFunc: Longword; lParam: Longword): Boolean; external 'EnumWindows@user32.dll stdcall';
// 枚举当前所有窗口，需要调用回调函数。

function GetWindowText(hWnd: HWND; lpString: String; nMaxCount: Integer): Integer; external 'GetWindowText{#A}@user32.dll stdcall';

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
begin
  WizardForm.Caption := 'Visible window title';
  WizardForm.OuterNotebook.Hide;
  ListBox := TListBox.Create(WizardForm);
  ListBox.Parent := WizardForm;
  ListBox.SetBounds(5, 5, WizardForm.ClientWidth - 10, WizardForm.Bevel.Top - 10);
  EnumWindows(CallbackAddr('EnumWindowsProc'), 0);
  // CallbackAddr 函数会把指定的函数处理成能够被 WinAPI 调用的回调函数。而且使用相当方便。
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




