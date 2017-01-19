; 演示如何使用增强的主体安装程序和增强的编译器。
; 脚本: restools ( http://restools.hanzify.org )
; 这里将会演示所有增强功能并提供相关解释。

; 其他更多的 VCL 属性和函数，具体请查看“Support Classes.txt”

; 改善 Hint 的显示效果，在 Delphi 2.0 下编译的 Hint 显示将会更加接近 Windows 的风格。
; 它没有采用 Delphi 往后版本的风格，而是采用了大多数 VC++ 编译的 Windows 程序的提示风格。

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
procedure InitializeWizard();
var
  Panel: TPanel;
begin
	WizardForm.OuterNotebook.Hide;
	WizardForm.NextButton.Hide;
	
//  Application.HintHidePause := 4000; // Hint 停留的时间 单位: ms

  Panel := TPanel.Create(WizardForm);
  with Panel do
  begin
    Parent := WizardForm;
    Caption := 'Panel';
    SetBounds(ScaleX(180), ScaleY(200), ScaleX(230), ScaleY(100));
    Hint := 'I am a Panel.'
    ShowHint := True;
  end;

  with TLabel.Create(WizardForm) do
  begin
    Parent := WizardForm;
    Caption := 'Position your mouse over these components.';
    Left := ScaleX(10);
    Top := ScaleY(10);
    Font.Size := 16;
  end;

  with TNewButton.Create(WizardForm) do
  begin
    Parent := Panel;
    Caption := 'Button';
    SetBounds(ScaleX(30), ScaleY(60), ScaleX(80), ScaleY(30));
    Hint := 'I am a Button.'
    ShowHint := True;
  end;

  with TNewEdit.Create(WizardForm) do
  begin
    Parent := WizardForm;
    Text := 'Edit';
    SetBounds(ScaleX(40), ScaleY(170), ScaleX(120), ScaleY(30));
    Hint := 'I am a Edit.'
    ShowHint := True;
  end;

  with TNewListBox.Create(WizardForm) do
  begin
    Parent := WizardForm;
    Items.Append('ListBox');
    SetBounds(ScaleX(180), ScaleY(70), ScaleX(180), ScaleY(120));
    Hint := 'I am a ListBox.'
    ShowHint := True;
  end;
  
  WizardForm.CancelButton.Hint := 'Don''t click meeee.... :(';
  WizardForm.CancelButton.ShowHint := True;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  WizardForm.Caption := 'TControl Hint Demo';
  WizardForm.NextButton.Hide;
  WizardForm.CancelButton.Caption := 'Close';
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := False;
end;
