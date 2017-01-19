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
var
  OldFloatText: String;
  FloatEdit: TNewEdit;
  ResultListBox: TNewCheckListBox;
  
procedure FloatEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not((Key=#3)or(Key=#22)or(Key=#24)or(Key=#8)) then // not((Ctrl+C) or (Ctrl+V) or (Ctrl+X) or (Backspace))
  begin
    if FloatEdit.SelText<>'' then
      FloatEdit.ClearSelection;
    if Key = #$2D then  // '-'
    begin
      if (Pos('-', FloatEdit.Text)>0) or (FloatEdit.SelStart<>0) then
        Key := #0;
    end else
    if Key = #$2E then  // '.'
    begin
      if Pos('.', FloatEdit.Text)>0 then
        Key := #0;
    end else
    if (Key < #$30) or (Key > #$39) then  // not('0'..'9')
      Key := #0;
  end;
end;

procedure FloatEditChange(Sender: TObject);
var
  FloatValue: Extended;
  FloatValueText: String;
begin
  ResultListBox.Items.BeginUpdate;
  try
    ResultListBox.Items.Clear;
    ResultListBox.AddGroup('    Format string    ', '    Result    ', 0, nil);
    ResultListBox.ItemFontStyle[0] := [fsBold, fsUnderline];
    ResultListBox.SubItemFontStyle[0] := [fsBold, fsUnderline];
    if (FloatEdit.Text='')or(FloatEdit.Text='-') then
    begin
      ResultListBox.AddGroup('0', '', 0, nil);
      ResultListBox.AddGroup('0.00', '', 0, nil);
      ResultListBox.AddGroup('#.##', '', 0, nil);
      ResultListBox.AddGroup('#,##0.00', '', 0, nil);
      ResultListBox.AddGroup('#,##0.00;(#,##0.00)', '', 0, nil);
      ResultListBox.AddGroup('#,##0.00;;Zero', '', 0, nil);
      ResultListBox.AddGroup('0.000E+00', '', 0, nil);
      ResultListBox.AddGroup('#.###E-0', '', 0, nil);
    end else
      try
        FloatValueText := FloatEdit.Text;
        if FloatValueText[Length(FloatValueText)]='.' then
          Delete(FloatValueText, Length(FloatValueText), 1);
        FloatValue := StrToFloat(FloatValueText);
        OldFloatText := FloatEdit.Text;
        ResultListBox.AddGroup('0', FormatFloat('0', FloatValue), 0, nil);
        ResultListBox.AddGroup('0.00', FormatFloat('0.00', FloatValue), 0, nil);
        ResultListBox.AddGroup('#.##', FormatFloat('#.##', FloatValue), 0, nil);
        ResultListBox.AddGroup('#,##0.00', FormatFloat('#,##0.00', FloatValue), 0, nil);
        ResultListBox.AddGroup('#,##0.00;(#,##0.00)', FormatFloat('#,##0.00;(#,##0.00)', FloatValue), 0, nil);
        ResultListBox.AddGroup('#,##0.00;;Zero', FormatFloat('#,##0.00;;Zero', FloatValue), 0, nil);
        ResultListBox.AddGroup('0.000E+00', FormatFloat('0.000E+00', FloatValue), 0, nil);
        ResultListBox.AddGroup('#.###E-0', FormatFloat('#.###E-0', FloatValue), 0, nil);
      except
        FloatEdit.Text := OldFloatText;
      end;
  finally
    ResultListBox.Items.EndUpdate;
  end;
end;

procedure InitializeWizard();
begin
#ifdef UNICODE
  WizardForm.DoubleBuffered := True;
#endif
	WizardForm.OuterNotebook.Hide;
	WizardForm.NextButton.Hide;
	
  with TLabel.Create(WizardForm) do
  begin
    Parent := WizardForm;
    Caption := 'floating-point value:';
    Transparent := True;
    SetBounds(ScaleX(50), ScaleY(20), ScaleX(135), ScaleY(13));
  end;

  FloatEdit := TNewEdit.Create(WizardForm);
  with FloatEdit do
  begin
    Parent := WizardForm;
    SetBounds(ScaleX(160), ScaleY(16), ScaleX(200), ScaleY(21));
    Text := '';
    OnKeyPress := @FloatEditKeyPress;
    OnChange := @FloatEditChange;
  end;
  
  ResultListBox := TNewCheckListBox.Create(WizardForm);
  with ResultListBox do
  begin
    Parent := WizardForm;
    SetBounds(ScaleX(72), ScaleY(48), ScaleX(337), ScaleY(257));
    BorderStyle := bsNone;
    ParentColor := True;
    WantTabs := True;
  end;
  
  FloatEdit.Text := '1234.567';
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  WizardForm.Caption := 'FormatFloat Demo';
  WizardForm.NextButton.Hide;
  WizardForm.CancelButton.Caption := 'Close';
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := False;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  Confirm := False;
end;
