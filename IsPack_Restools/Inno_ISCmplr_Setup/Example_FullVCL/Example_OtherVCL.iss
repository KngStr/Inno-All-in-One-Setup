; 演示如何使用增强的主体安装程序和增强的编译器。
; 脚本: restools ( http://restools.hanzify.org )
; 这里将会演示所有增强功能并提供相关解释。

; 其他更多的 VCL 属性和函数，具体请查看“Support Classes.txt”

#ifdef IS_ENHANCED
  #if (Ver < 0x5020300) || (Pos('ee', IS_Ver_Str) < 1)
    #pragma error 'Enhanced edition of Inno Setup (5.2.3.ee1 or higher) is required to compile this script'
  #endif
#else
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
Source: "InnoSetup.ico"; Flags: dontcopy

[code]
var
	Header: THeaderControl;
  NBook: TNewNotebook;
  sbLabel: TLabel;
  sb: TScrollBar;
  stLabel: TLabel;
  st: TTrackBar;

procedure SectionOnClick(HeaderControl: THeaderControl; Section: THeaderSection);
begin
  NBook.ActivePage := NBook.Pages[Section.Index];
end;

procedure sbOnChange(Sender: TObject);
begin
  sbLabel.Caption := 'TScrollBar Position := ' + IntToStr(sb.Position);
end;

procedure stOnChange(Sender: TObject);
begin
  stLabel.Caption := 'TTrackBar Position := ' + IntToStr(st.Position);
end;

procedure InitializeWizard();
var
  GBox: TNewGroupBox;
	i: Integer;
  ud: TUpDown;
  udEdt: TNewMemo;
  hk: THotKey;
  tc: TTabControl;
  pc: TPageControl;
  pcts: TTabSheet;
begin
	WizardForm.OuterNotebook.Hide;
	WizardForm.NextButton.Hide;

	{ THeaderControl }
	Header := THeaderControl.Create(WizardForm);
	Header.Parent := WizardForm;
	Header.Height := ScaleY(22);
  with Header.Sections.Add do
  begin
    Text := 'Demo';
    Width := 50;
  end;
  with Header.Sections.Add do
  begin
    Text := 'TNewGroupBox,TScrollBar,TTrackBar,TUpDown,THotKey';
    Width := 190;
  end;
  with Header.Sections.Add do
  begin
    Text := 'TNewIconImage';
    Width := 100;
  end;
  with Header.Sections.Add do
  begin
    Text := 'TTabControl,TPageControl';
    Width := 150;
  end;
  Header.OnSectionClick := @SectionOnClick;

  { TNewNotebook }
  NBook := TNewNotebook.Create(WizardForm);
  NBook.Parent := WizardForm;
  NBook.SetBounds(0, Header.Height, WizardForm.OuterNotebook.Width,
       WizardForm.OuterNotebook.Height - Header.Height);
  for i := 0 to 4 do
    with TNewNotebookPage.Create(WizardForm) do
      Notebook := NBook;
  NBook.ActivePage := NBook.Pages[0];
  NBook.Pages[0].Color := clWindow;

  { TLabel }
  with TLabel.Create(WizardForm) do
  begin
    Parent := NBook.Pages[0];
    Font.Size := 24;
    Font.Style := [fsBold];
    Font.Color := clBlue;
    AutoSize := False;
    Alignment := taCenter;
    SetBounds(0, Header.Height + ScaleY(100), WizardForm.OuterNotebook.Width, ScaleY(100));
    Caption := 'Inno Setup VCL Demo';
  end;
  
  { TNewGroupBox }
  GBox := TNewGroupBox.Create(WizardForm);
	GBox.Parent := NBook.Pages[1];
	GBox.SetBounds(ScaleX(280), ScaleY(10), ScaleX(150), ScaleY(100));
	GBox.Caption := 'TNewGroupBox 01';

  GBox := TNewGroupBox.Create(WizardForm);
	GBox.Parent := NBook.Pages[1];
	GBox.SetBounds(ScaleX(280), ScaleY(150), ScaleX(150), ScaleY(100));
	GBox.Caption := 'TNewGroupBox 02';
  for i := 1 to 4 do
  	with TRadioButton.Create(WizardForm) do
  	begin
      if i = 1 then Checked := True;
      Parent := GBox;
      Left := ScaleX(10);
      Top := ScaleY(i*20-5);
      Caption := 'RadioButton ' + IntToStr(i);
    end;
    
  { TNewIconImage }
  with TNewIconImage.Create(WizardForm) do
  begin
    BackColor := clBtnShadow;
    Center := True;
    Parent := NBook.Pages[2];
    Align := alClient;
    ExtractTemporaryFile('InnoSetup.ico');
    Icon.LoadFromFile(ExpandConstant('{tmp}\InnoSetup.ico'));
    Icon.Width := 48; // Selected Icon Size (16x16 ; 32x32; 48x48 ......)
    Icon.Height := 48; // Default Size: 32x32
  end;
  
  { TScrollBar }
  sb := TScrollBar.Create(WizardForm);
  sb.Parent := NBook.Pages[1];
  sb.SetBounds(ScaleX(20), ScaleY(30), ScaleX(250), sb.Height);
  sb.Max := 100;
  sb.LargeChange := 10;
  sbLabel := TLabel.Create(WizardForm);
  with sbLabel do
  begin
    Parent := NBook.Pages[1];
    Font.Size := 12;
    Font.Style := [fsBold];
    SetBounds(sb.Left, sb.Top + sb.Height + 10, sbLabel.Width, sbLabel.Height);
    Caption := 'TScrollBar Position := 0';
  end;
  sb.OnChange := @sbOnChange;

  { TTrackBar }
  st := TTrackBar.Create(WizardForm);
  st.Parent := NBook.Pages[1];
  st.SetBounds(ScaleX(20), ScaleY(100), ScaleX(250), st.Height);
  st.Max := 50;
  st.ThumbLength := 15;
  stLabel := TLabel.Create(WizardForm);
  with stLabel do
  begin
    Parent := NBook.Pages[1];
    Font.Size := 12;
    Font.Style := [fsBold];
    SetBounds(st.Left, st.Top + st.Height + 10, stLabel.Width, stLabel.Height);
    Caption := 'TTrackBar Position := 0';
  end;
  st.OnChange := @stOnChange;

  { TUpDown }
  udEdt := TNewMemo.Create(WizardForm);
  udEdt.Parent := NBook.Pages[1];
  udEdt.SetBounds(ScaleX(20), ScaleY(190), SCaleX(80), ScaleY(20));
  udEdt.Alignment := taCenter;
  udEdt.WantReturns := False;
  udEdt.WordWrap := False;
  udEdt.MaxLength := 10;
  
  ud := TUpDown.Create(WizardForm);
  ud.Parent := NBook.Pages[1];
  ud.Associate := udEdt;

  { THotKey }
  hk := THotKey.Create(WizardForm);
  hk.Parent := NBook.Pages[1];
  hk.SetBounds(ScaleX(20), ScaleY(230), SCaleX(150), hk.Height);
  hk.InvalidKeys := [];
  hk.HotKey := TextToShortCut('Ctrl+Y');

  { TTabControl }
  tc := TTabControl.Create(WizardForm);
  tc.Parent := NBook.Pages[3];
  tc.SetBounds(ScaleX(10), ScaleY(10), NBook.Width - SCaleX(20), ScaleY(24));
  for i := 1 to 8 do
    tc.Tabs.Append('Tab ' + IntToStr(i));
    
  { TPageControl }
  pc := TPageControl.Create(WizardForm);
  pc.Parent := NBook.Pages[3];
  pc.SetBounds(ScaleX(10), ScaleY(40), NBook.Width - SCaleX(20), ScaleY(200));
  
  pcts := TTabSheet.Create(WizardForm);
  pcts.PageControl := pc;
  pcts.Caption := 'Page 1';
  with TNewButton.Create(WizardForm) do
  begin
    Parent := pcts;
    Caption := 'Button';
    SetBounds(ScaleX(10), ScaleY(40), ScaleX(80), ScaleY(30));
  end;
  
  pcts := TTabSheet.Create(WizardForm);
  pcts.PageControl := pc;
  pcts.Caption := 'Page 2';
  with TNewEdit.Create(WizardForm) do
  begin
    Parent := pcts;
    Text := 'Edit';
    SetBounds(ScaleX(40), ScaleY(90), ScaleX(80), ScaleY(30));
  end;

  pcts := TTabSheet.Create(WizardForm);
  pcts.PageControl := pc;
  pcts.Caption := 'Page 3';
  with TNewListBox.Create(WizardForm) do
  begin
    Parent := pcts;
    Items.Append('ListBox');
    SetBounds(ScaleX(80), ScaleY(20), ScaleX(80), ScaleY(100));
  end;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  Application.Title := 'VCL Demo';
  WizardForm.Caption := 'VCL Demo';
  WizardForm.NextButton.Hide;
  WizardForm.CancelButton.Caption := 'Close';
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := False;
end;

