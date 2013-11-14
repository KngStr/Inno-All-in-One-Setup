; 演示如果使用控件 TNewSpeedButton
; 脚本: restools ( http://restools.hanzify.org )

#ifdef IS_ENHANCED
  #if (Ver < 0x5040000) || (Pos('ee', IS_Ver_Str) < 1)
    #pragma error 'Enhanced edition of Inno Setup (5.4.0.ee4 or higher) is required to compile this script'
  #endif
#else
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=Test TNewSpeedButton
AppVersion=1.5
DefaultDirName={pf}\My Application
SolidCompression=yes
Compression=lzma/ultra
PrivilegesRequired=none
WizardImageFile=compiler:WizModernImage-IS.bmp
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "question.bmp"; Flags: dontcopy solidbreak

[Code]
var
  SpeedBtn: TNewSpeedButton;

procedure NewCheckBoxClick(Sender: TObject);
begin
  case TNewCheckBox(Sender).Tag of
  0: SpeedBtn.ThemeEnabled := TNewCheckBox(Sender).Checked;
  1: SpeedBtn.Enabled := TNewCheckBox(Sender).Checked;
  2: begin
       if TNewCheckBox(Sender).Checked then
         SpeedBtn.Glyph.LoadFromFile(ExpandConstant('{tmp}\question.bmp'))
       else
         SpeedBtn.Glyph.Assign(nil);
     end;
  3: SpeedBtn.Transparent := TNewCheckBox(Sender).Checked;
  4: SpeedBtn.Flat := TNewCheckBox(Sender).Checked;
  end;
end;

procedure StyleComboChange(Sender: TObject);
begin
  if TNewComboBox(Sender).ItemIndex = 1 then
    SpeedBtn.Style := nsbDropDown
  else
    SpeedBtn.Style := nsbButton;
end;

procedure MenuItemClick(Sender: TObject);
begin
  MsgBox('Menu ' + IntToStr(TMenuItem(Sender).Tag) + ' OnClick!', mbInformation, MB_OK);
end;

procedure InitializeWizard();
var
  MnuItem: TMenuItem;
  PupMnu: TPopupMenu;
begin
#ifdef UNICODE
  WizardForm.DoubleBuffered := True;
#endif
  WizardForm.WizardBitmapImage.Align := alClient;
  WizardForm.WelcomeLabel1.Hide;
  WizardForm.WelcomeLabel2.Hide;

  ExtractTemporaryFile('question.bmp');

  PupMnu := TPopupMenu.Create(WizardForm);
  MnuItem := TMenuItem.Create(WizardForm);
  MnuItem.Caption := 'MenuItem 1';
  MnuItem.OnClick := @MenuItemClick;
  MnuItem.Tag := 1;
  PupMnu.Items.Add(MnuItem);
  MnuItem := TMenuItem.Create(WizardForm);
  MnuItem.Caption := 'MenuItem 2';
  MnuItem.OnClick := @MenuItemClick;
  MnuItem.Tag := 2;
  PupMnu.Items.Add(MnuItem);

  SpeedBtn := TNewSpeedButton.Create(WizardForm);
  with SpeedBtn do
  begin
    Parent := WizardForm.WelcomePage;
    Caption := 'TestButton';
    SetBounds(ScaleX(160), ScaleY(72), ScaleX(167), ScaleY(46));
    NumGlyphs := 2;
    DropdownMenu := PupMnu;
  end;
  with TNewComboBox.Create(WizardForm) do
  begin
    Parent := WizardForm.WelcomePage;
    SetBounds(ScaleX(60), ScaleY(168), ScaleX(97), ScaleY(21));
    Style := csDropDownList;
    Items.Text := 'nsbButton' + #13#10 + 'nsbDropDown';
    ItemIndex := 0;
    OnChange := @StyleComboChange;
  end;
  with TNewCheckBox.Create(WizardForm) do
  begin
    Parent := WizardForm.WelcomePage;
    SetBounds(ScaleX(164), ScaleY(170), ScaleX(97), ScaleY(17));
    Caption := 'ThemeEnabled';
    Checked := True;
    OnClick := @NewCheckBoxClick;
  end;
  with TNewCheckBox.Create(WizardForm) do
  begin
    Parent := WizardForm.WelcomePage;
    Tag := 1;
    SetBounds(ScaleX(268), ScaleY(170), ScaleX(65), ScaleY(17));
    Caption := 'Enabled';
    Checked := True;
    OnClick := @NewCheckBoxClick;
  end;
  with TNewCheckBox.Create(WizardForm) do
  begin
    Parent := WizardForm.WelcomePage;
    Tag := 2;
    SetBounds(ScaleX(340), ScaleY(170), ScaleX(57), ScaleY(17));
    Caption := 'Glyph';
    OnClick := @NewCheckBoxClick;
  end;
  with TNewCheckBox.Create(WizardForm) do
  begin
    Parent := WizardForm.WelcomePage;
    Tag := 3;
    SetBounds(ScaleX(164), ScaleY(194), ScaleX(81), ScaleY(17));
    Caption := 'Transparent';
    Checked := True;
    OnClick := @NewCheckBoxClick;
  end;
  with TNewCheckBox.Create(WizardForm) do
  begin
    Parent := WizardForm.WelcomePage;
    Tag := 4;
    SetBounds(ScaleX(248), ScaleY(194), ScaleX(41), ScaleY(17));
    Caption := 'Flat';
    OnClick := @NewCheckBoxClick;
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




