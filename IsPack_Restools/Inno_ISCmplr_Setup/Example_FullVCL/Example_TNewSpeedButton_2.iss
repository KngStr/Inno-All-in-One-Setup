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
OutputDir=userdocs:Inno Setup Examples Output

[Files]      
Source: "arrow2l.bmp"; Flags: dontcopy solidbreak
Source: "arrow2r.bmp"; Flags: dontcopy solidbreak
Source: "close.bmp"; Flags: dontcopy solidbreak

[Code]
var
  BackButton, NextButton, CancelButton: TNewSpeedButton;
  ISCustomPage1, ISCustomPage2: TWizardPage;
  Panel1, Panel2: TPanel;
  MnuItem1, MnuItem2: TMenuItem;

procedure MenuItemClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := True;
  TMenuItem(Sender).Default := True;
end;

procedure NewButtonClick(Sender: TObject);
begin
  TNewButton(TNewSpeedButton(Sender).FocusControl).Click;
end;

procedure InitializeWizard();
var
  PupMnu: TPopupMenu;
begin
#ifdef UNICODE
  WizardForm.DoubleBuffered := True;
#endif
  ISCustomPage1 := CreateCustomPage(wpWelcome, 'ISCustomPage1_Caption', 'ISCustomPage1_Description');
  ISCustomPage2 := CreateCustomPage(ISCustomPage1.ID, 'ISCustomPage2_Caption', 'ISCustomPage2_Description');
  with TPanel.Create(WizardForm) do
  begin
    Parent := ISCustomPage1.Surface;
    Align := alClient;
    BevelInner := bvRaised;
    BevelOuter := bvLowered;
    Caption := 'WizardPage 1';
  end;
  with TPanel.Create(WizardForm) do
  begin
    Parent := ISCustomPage2.Surface;
    Align := alClient;
    BevelInner := bvRaised;
    BevelOuter := bvLowered;
    Caption := 'WizardPage 2';
  end;

  ExtractTemporaryFile('arrow2l.bmp');
  ExtractTemporaryFile('arrow2r.bmp');
  ExtractTemporaryFile('close.bmp');

  PupMnu := TPopupMenu.Create(WizardForm);
  MnuItem1 := TMenuItem.Create(WizardForm);
  MnuItem1.Caption := 'WizardPage 1';
  MnuItem1.OnClick := @MenuItemClick;
  MnuItem1.RadioItem := True;
  MnuItem1.GroupIndex := 1;
  MnuItem1.Checked := True;
  MnuItem1.Default := True;
  MnuItem1.Tag := 1;
  PupMnu.Items.Add(MnuItem1);
  MnuItem2 := TMenuItem.Create(WizardForm);
  MnuItem2.Caption := 'WizardPage 2';
  MnuItem2.RadioItem := True;
  MnuItem2.GroupIndex := 1;
  MnuItem2.OnClick := @MenuItemClick;
  MnuItem2.Tag := 2;
  PupMnu.Items.Add(MnuItem2);

  BackButton := TNewSpeedButton.Create(WizardForm);
  with BackButton do
  begin
    Parent := WizardForm;
    SetBounds(WizardForm.BackButton.Left, WizardForm.BackButton.Top, WizardForm.BackButton.Width, WizardForm.BackButton.Height+2);
    NumGlyphs := 2;
    FocusControl := WizardForm.BackButton;
    Glyph.LoadFromFile(ExpandConstant('{tmp}\arrow2l.bmp'))
    OnClick := @NewButtonClick;
  end;

  NextButton := TNewSpeedButton.Create(WizardForm);
  with NextButton do
  begin
    Parent := WizardForm;
    SetBounds(WizardForm.NextButton.Left, WizardForm.NextButton.Top, WizardForm.NextButton.Width, WizardForm.NextButton.Height+2);
    NumGlyphs := 2;
    Layout := blGlyphRight;
    FocusControl := WizardForm.NextButton;
    Glyph.LoadFromFile(ExpandConstant('{tmp}\arrow2r.bmp'))
    DropdownMenu := PupMnu;
    OnClick := @NewButtonClick;
    Style := nsbDropDown;
  end;

  CancelButton := TNewSpeedButton.Create(WizardForm);
  with CancelButton do
  begin
    Parent := WizardForm;
    SetBounds(WizardForm.CancelButton.Left, WizardForm.CancelButton.Top, WizardForm.CancelButton.Width, WizardForm.CancelButton.Height+2);
    NumGlyphs := 2;
    FocusControl := WizardForm.CancelButton;
    Glyph.LoadFromFile(ExpandConstant('{tmp}\close.bmp'))
    OnClick := @NewButtonClick;
  end;

  WizardForm.BackButton.Height := 0;
  WizardForm.NextButton.Height := 0;
  WizardForm.CancelButton.Height := 0;
end;

function TransCaption(s: string): string;
begin
  StringChangeEx(s, '< ', '', True);
  StringChangeEx(s, ' >', '', True);
  Result := s;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  BackButton.Caption := TransCaption(WizardForm.BackButton.Caption);
  NextButton.Caption := TransCaption(WizardForm.NextButton.Caption);
  CancelButton.Caption := TransCaption(WizardForm.CancelButton.Caption);
  BackButton.Visible := WizardForm.BackButton.Visible;
  NextButton.Visible := WizardForm.NextButton.Visible;
  CancelButton.Visible := WizardForm.CancelButton.Visible;
  BackButton.Enabled := WizardForm.BackButton.Enabled;
  NextButton.Enabled := WizardForm.NextButton.Enabled;
  CancelButton.Enabled := WizardForm.CancelButton.Enabled;
  if CurPageID=wpWelcome then
    NextButton.Style := nsbDropDown
  else
    NextButton.Style := nsbButton;
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  if PageID = ISCustomPage1.ID then
    Result := not MnuItem1.Checked
  else if PageID = ISCustomPage2.ID then
    Result := not MnuItem2.Checked;
end;



