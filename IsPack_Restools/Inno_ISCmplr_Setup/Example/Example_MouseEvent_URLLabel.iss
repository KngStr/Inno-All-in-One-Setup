; 演示使用多个鼠标事件进行高级界面处理
; 脚本: restools ( http://restools.hanzify.org )

#ifndef IS_ENHANCED
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=Test Mouse Event
AppVersion=1.5
DefaultDirName={pf}\My Application
SolidCompression=yes
Compression=lzma/ultra
PrivilegesRequired=none
OutputDir=userdocs:Inno Setup Examples Output

[Code]
var
  URLLabel: TNewStaticText;
  URLLabelMouseEnter: Boolean;
  MouseEventList: TNewListBox;

procedure URLLabelOnClick(Sender: TObject);
var
  ErrorCode: Integer;
begin
  ShellExecAsOriginalUser('open', 'http://restools.hanzify.org/', '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);
  URLLabel.Tag := 1;
  MouseEventList.Items.Append('OnClick');
  MouseEventList.ItemIndex := MouseEventList.Items.Count-1;
end;

procedure URLLabelOnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X: Integer; Y: Integer);
begin
  URLLabel.Font.Color := clFuchsia;
  MouseEventList.Items.Append('OnMouseDown');
  MouseEventList.ItemIndex := MouseEventList.Items.Count-1;
end;

procedure URLLabelOnMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X: Integer; Y: Integer);
begin
  if URLLabelMouseEnter then
    URLLabel.Font.Color := clRed;
  MouseEventList.Items.Append('OnMouseUp');
  MouseEventList.ItemIndex := MouseEventList.Items.Count-1;
end;

procedure URLLabelOnMouseEnter(Sender: TObject);
begin
  URLLabelMouseEnter := True;
  URLLabel.Font.Color := clRed;
  URLLabel.Font.Style := URLLabel.Font.Style + [fsUnderline];
  MouseEventList.Items.Append('OnMouseEnter');
  MouseEventList.ItemIndex := MouseEventList.Items.Count-1;
end;

procedure URLLabelOnMouseLeave(Sender: TObject);
begin
  URLLabelMouseEnter := False;
  if URLLabel.Tag = 1 then
    URLLabel.Font.Color := clMaroon
  else
    URLLabel.Font.Color := clBlue;
  URLLabel.Font.Style := URLLabel.Font.Style - [fsUnderline];
  MouseEventList.Items.Append('OnMouseLeave');
  MouseEventList.ItemIndex := MouseEventList.Items.Count-1;
end;

procedure InitializeWizard();
begin
  WizardForm.OuterNotebook.Hide;
  WizardForm.Bevel.Hide;
  
  URLLabel := TNewStaticText.Create(WizardForm);
  URLLabel.Caption := 'http://restools.hanzify.org/';
  URLLabel.Cursor := crHand;
  URLLabel.OnClick := @URLLabelOnClick;
  URLLabel.OnMouseDown := @URLLabelOnMouseDown;
  URLLabel.OnMouseUp := @URLLabelOnMouseUp;
  URLLabel.OnMouseEnter := @URLLabelOnMouseEnter;
  URLLabel.OnMouseLeave := @URLLabelOnMouseLeave;
  URLLabel.Parent := WizardForm;
  URLLabel.Font.Style := URLLabel.Font.Style + [fsBold];
  URLLabel.Font.Color := clBlue;
  URLLabel.Font.Size := 10;
  URLLabel.Left := ScaleX(20);
  URLLabel.Top := ScaleY(20);
  URLLabel.Hint := 'visit my blog';
  URLLabel.ShowHint := True;

  with TNewStaticText.Create(WizardForm) do
  begin
    Caption := 'Mouse Event:';
    Parent := WizardForm;
    Left := URLLabel.Left;
    Top := URLLabel.Top+ScaleY(30);
  end;
  
  MouseEventList := TNewListBox.Create(WizardForm);
  with MouseEventList do
  begin
    Parent := WizardForm;
    Left := URLLabel.Left;
    Top := URLLabel.Top+ScaleY(50);
    Width := ScaleX(150);
    Height := ScaleY(250);
  end;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  WizardForm.NextButton.Hide;
  WizardForm.CancelButton.Caption := 'Close';
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  Confirm := False;
end;


