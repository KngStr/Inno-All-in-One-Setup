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

[Files]
Source: "key.ico"; Flags: dontcopy

[code]
function LoadImage(hInst: UINT; ImageName: String; ImageType: UINT; X, Y: Integer; Flags: UINT): THandle;
#ifdef UNICODE
external 'LoadImageW@user32.dll stdcall';
#else
external 'LoadImageA@user32.dll stdcall';
#endif

function LoadIcon(hInstance: UINT; lpIconName: UINT): HICON;
#ifdef UNICODE
external 'LoadIconW@user32.dll stdcall';
#else
external 'LoadIconA@user32.dll stdcall';
#endif

const
  IMAGE_ICON = 1;
  LR_LOADFROMFILE = $10;
  IDI_QUESTION = 32514;
var
  ALeft, ATop, BtnW, BtnH: Integer;
  Ico: UINT;
  
procedure BtnOnClick1(Sender: TObject);
var
  AResult: Integer;
begin
  case TButton(Sender).Tag of
  1: AResult := MsgBoxEx(WizardForm.Handle, 'This is a Example.','MyApp', MB_OK, 0, 0);
  2: AResult := MsgBoxEx(WizardForm.Handle, 'This is a Example.','MyApp', MB_YESNOCANCEL, 0, 0);
  3: AResult := MsgBoxEx(WizardForm.Handle, 'This is a Example.','MyApp', MB_YESNO or MB_ICONQUESTION, 0, 0);
  4: AResult := MsgBoxEx(WizardForm.Handle, 'This is a Example.','MyApp', MB_YESNOCANCEL or MB_ICONQUESTION, 0, 5);
  5: AResult := MsgBoxEx(WizardForm.Handle, 'This is a Example.','MyApp', MB_RETRYCANCEL or MB_ICONERROR or MB_DEFBUTTON2, 0, 5);
  6: AResult := MsgBoxEx(WizardForm.Handle, 'This is a Example.','MyApp', MB_ABORTRETRYIGNORE or MB_ICONERROR or MB_DEFBUTTON3, 0, 5);
  7: AResult := MsgBoxEx(WizardForm.Handle, 'This is a Example.','MyApp', MB_OK, Ico, 5);
  8: AResult := MsgBoxEx(WizardForm.Handle, 'This is a Example.','MyApp', MB_ABORTRETRYIGNORE or MB_DEFBUTTON2, Ico, 5);
  end;
  
  case AResult of
  IDOK: MsgBox('You clicked "OK" button.', mbInformation, MB_OK);
  IDCANCEL: MsgBox('You clicked "Cancel" button.', mbInformation, MB_OK);
  IDABORT: MsgBox('You clicked "Abort" button.', mbInformation, MB_OK);
  IDRETRY: MsgBox('You clicked "Retry" button.', mbInformation, MB_OK);
  IDIGNORE: MsgBox('You clicked "Ignore" button.', mbInformation, MB_OK);
  IDYES: MsgBox('You clicked "Yes" button.', mbInformation, MB_OK);
  IDNO: MsgBox('You clicked "No" button.', mbInformation, MB_OK);
  end;
end;

procedure CreateButton1(Index: Integer);
begin
  with TButton.Create(WizardForm) do
  begin
    Parent := WizardForm;
    Caption := 'Example ' + IntToStr(Index);
    SetBounds(ALeft, ATop, BtnW, BtnH);
    Tag := Index;
    OnClick := @BtnOnClick1;
  end;
  ATop := ATop + BtnH + 10;
end;

procedure BtnOnClick2(Sender: TObject);
var
  AResult: Boolean;
  AResultStr: String;
begin
  case TButton(Sender).Tag of
  1: AResult := InputBoxEx(WizardForm.Handle, 'This is a Example.' + #13#10 + 'Enter your password:', 'Confirm Password', '', '', 0, 0, 0, 0, AResultStr);
  2: AResult := InputBoxEx(WizardForm.Handle, 'This is a Example.' + #13#10 + 'Enter your password:', 'Confirm Password', 'MyPassword', '', 0, 0, 0, 0, AResultStr);
  3: AResult := InputBoxEx(WizardForm.Handle, 'This is a Example.' + #13#10 + 'Enter your password:', 'Confirm Password', 'MyPassword', '*', 0, 0, 0, 0, AResultStr);
  4: AResult := InputBoxEx(WizardForm.Handle, 'This is a Example.' + #13#10 + 'Enter your password:', 'Confirm Password', 'MyPassword', '*', LoadIcon(0, IDI_QUESTION), 0, 0, 0, AResultStr);
  5: AResult := InputBoxEx(WizardForm.Handle, 'This is a Example. This is a Example. This is a Example. This is a Example. This is a Example. This is a Example. This is a Example. This is a Example.' + #13#10#13#10 + 'Enter your password:', 'Confirm Password', 'MyPassword', '*', ico, 0, 0, 0, AResultStr);
  6: AResult := InputBoxEx(WizardForm.Handle, 'This is a Example. This is a Example. This is a Example. This is a Example. This is a Example. This is a Example. This is a Example. This is a Example.' + #13#10#13#10 + 'Enter your password:', 'Confirm Password', 'MyPassword', '*', ico, 250, 0, 0, AResultStr);
  7: AResult := InputBoxEx(WizardForm.Handle, 'This is a Example. This is a Example. This is a Example. This is a Example. This is a Example. This is a Example. This is a Example. This is a Example.' + #13#10#13#10 + 'Enter your password:', 'Confirm Password', 'MyPassword', '*', ico, 250, 250, 0, AResultStr);
  8: AResult := InputBoxEx(WizardForm.Handle, 'This is a Example. This is a Example. This is a Example. This is a Example. This is a Example. This is a Example. This is a Example. This is a Example.' + #13#10#13#10 + 'Enter your password:', 'Confirm Password', 'MyPassword', '*', ico, 250, 0, 10, AResultStr);
  end;
  
  if AResult then
    MsgBox('Your password is "' + AResultStr + '".', mbInformation, MB_OK);
end;

procedure CreateButton2(Index: Integer);
begin
  with TButton.Create(WizardForm) do
  begin
    Parent := WizardForm;
    Caption := 'Example ' + IntToStr(Index);
    SetBounds(ALeft, ATop, BtnW, BtnH);
    Tag := Index;
    OnClick := @BtnOnClick2;
  end;
  ATop := ATop + BtnH + 10;
end;

procedure InitializeWizard();
var
  I: Integer;
begin
  WizardForm.Caption := 'MsgBoxEx & InputBoxEx Example';
  WizardForm.OuterNotebook.Hide;
  
  ExtractTemporaryFile('key.ico');
  Ico := LoadImage(0, ExpandConstant('{tmp}\key.ico'), IMAGE_ICON, 32, 32, LR_LOADFROMFILE);
  
  ALeft := 50;
  ATop := 30;
  BtnW := WizardForm.NextButton.Width;
  BtnH := WizardForm.NextButton.Height;
  
  with TNewStaticText.Create(WizardForm) do
  begin
    Parent := WizardForm;
    Left := ALeft - 10;
    Top := 10;
    Caption := 'MsgBoxEx Example:';
  end;
  
  for I := 1 to 8 do
    CreateButton1(I);
    
  ALeft := 250;
  ATop := 30;
  with TNewStaticText.Create(WizardForm) do
  begin
    Parent := WizardForm;
    Left := ALeft - 10;
    Top := 10;
    Caption := 'InputBoxEx Example:';
  end;
  
  for I := 1 to 8 do
    CreateButton2(I);
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



