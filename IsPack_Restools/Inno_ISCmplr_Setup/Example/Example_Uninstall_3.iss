; 脚本: restools ( http://restools.hanzify.org )

; 这是一个模仿 UninsHs 的例子，只为了证明使用 UninsHs 完全是多此一举的。

#ifndef IS_ENHANCED
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

#define MyAppId "{{1754C7D1-E8A7-4596-B225-FC13C63927BE}"

#ifdef UNICODE
  #define A "W"
#else
  #define A "A"
#endif

[Setup]
AppId={#MyAppId}
AppName=My Application
AppVersion=1.5
DefaultDirName={pf}\My Application
DefaultGroupName=My Application
UninstallDisplayIcon={app}\MyProg.exe
SolidCompression=yes
Compression=lzma/ultra
OutputDir=userdocs:Inno Setup Examples Output
SetupIconFile=Setup.ico
WizardImageFile=compiler:WizModernImage-IS.bmp
WizardSmallImageFile=compiler:WizModernSmallImage-IS.bmp
Uninstallable=not WizardSilent
BitmapResource=BmpModify:2001.bmp|BmpRepair:2002.bmp|BmpRemove:2000.bmp|BmpWizSmall:"compiler:WizModernSmallImage-IS.bmp"
; BitmapResource 格式:
;  BmpResName1:BmpFileName1|BmpResName2:BmpFileName2|BmpResName3:BmpFileName3|......
; 注意: Icon 资源写入安装程序后, 会自动在图标资源名称前面添加前缀 "_IS_"
; 所以在使用 Bitmap.LoadFromResourceName 等等函数的时候也需要在图标资源名称前面添加 "_IS_"
; 例如: Bitmap.LoadFromResourceName(HInstance, '_IS_MYBMP1');

; HInstance 在增强版中也会同时提供, 方便引用安装程序自身的资源.

[Dirs]
Name: "{pf}\InnoSetup Installation Information"; Attribs: hidden

[Files]
Source: "MyProg.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "MyProg1.chm"; DestDir: "{app}"; DestName: "MyProg.chm"; Flags: ignoreversion
Source: "Readme1.txt"; DestDir: "{app}"; DestName: "Readme.txt"; Flags: ignoreversion
Source: "{srcexe}"; DestDir: "{pf}\InnoSetup Installation Information\{#MyAppId}"; DestName: "MySetup.exe"; Flags: external ignoreversion onlyifdoesntexist

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"
Name: "{group}\My Program Documentation"; Filename: "{app}\MyProg.chm";
Name: "{group}\My Program Readme"; Filename: "{app}\Readme.txt";
Name: "{group}\Modify or Remove My Program"; Filename: "{uninstallexe}"; Check: not WizardSilent

[code]
function GetWindowLong(hWnd, nIndex: Integer): Longint; external 'GetWindowLong{#A}@user32.dll';
function SetWindowLong(hWnd, nIndex: Integer; dwNewLong: Longint): Longint; external 'SetWindowLong{#A}@user32.dll';
function ShowWindow(hWnd: HWND; nCmdShow: Integer): BOOL; external 'ShowWindow@user32.dll';

const
  GWL_EXSTYLE = -20;
  WS_EX_APPWINDOW = $40000;
var
  UBevel1, UBevel2: TBevel;
  UnistallForm: TSetupForm;
  UMainPanel: TPanel;
  UWizardSmallBitmapImage: TBitmapImage;
  UPageDescriptionLabel, UPageNameLabel: TNewStaticText;
  UCancelButton, UNextButton, UBackButton: TNewButton;
  hIcon: LongInt;
  NBook: TNewNotebook;
  URepairIcon, UModifyIcon, URemoveIcon: TBitmapImage;
  UModifyDesc, URepairDesc, URemoveDesc, URemoveDesc2: TLabel;
  UModifyButton, URepairButton, URemoveButton: TNewRadioButton;
  
procedure UBackButton_OnClick(Sender: TObject);
begin
  NBook.ActivePage := NBook.Pages[0];
  UBackButton.Hide;
end;

procedure UNextButton_OnClick(Sender: TObject);
var
  RCode: Integer;
begin    
  if URemoveButton.Checked then
  begin
    if NBook.ActivePage = NBook.Pages[0] then
    begin
      NBook.ActivePage := NBook.Pages[1];
      UBackButton.Show;
    end else
    if NBook.ActivePage = NBook.Pages[1] then
      UnistallForm.ModalResult := mrOk;
  end else
  if URepairButton.Checked then begin
    Exec(ExpandConstant('{pf}\InnoSetup Installation Information\{#MyAppId}\MySetup.exe'), '/VERYSILENT', '',
         SW_SHOW, ewWaitUntilTerminated, RCode);
    URemoveDesc2.Caption := 'The repair operation is complete! Click the <Close> button to close the dialog.';
    NBook.ActivePage := NBook.Pages[1];
    UNextButton.Hide;
    UCancelButton.Caption := '&Close';
  end else
    UnistallForm.ModalResult := mrOk;
end;
  
procedure UnistallFormOnShow(Sender: TObject);
begin
  ShowWindow(StrToInt(ExpandConstant('{apphwnd}')), SW_HIDE);
end;

function CreateUnistallForm: Integer;
var
  i: Integer;
begin
  UnistallForm := CreateCustomForm;
  with UnistallForm do
  begin
    BorderStyle := bsSingle;
    BorderIcons := [biSystemMenu,biMinimize];
    Caption := 'Uninstall My Application Program Maintenance';
    ClientWidth := ScaleX(497);
    ClientHeight := ScaleY(360);
  end;
  
  SetWindowLong(UnistallForm.Handle, GWL_EXSTYLE, GetWindowLong(UnistallForm.Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);

  UMainPanel := TPanel.Create(UnistallForm);
  with UMainPanel do
  begin
    Parent := UnistallForm;
    SetBounds(ScaleX(0), ScaleY(0), UnistallForm.ClientWidth, ScaleY(58));
    BevelOuter := bvNone;
    Color := clWindow;
    ParentBackground := False;
  end;

  UPageNameLabel := TNewStaticText.Create(UnistallForm);
  with UPageNameLabel do
  begin
    Parent := UMainPanel;
    AutoSize := False;
    Caption := 'Uninstall My Application Program Maintenance';
    Font.Height := -11;
    Font.Name := 'Tahoma';
    Font.Style := [fsBold];
    ShowAccelChar := False;
    SetBounds(ScaleX(24), ScaleY(10), ScaleX(405), ScaleY(14));
  end;

  UPageDescriptionLabel := TNewStaticText.Create(UnistallForm);
  with UPageDescriptionLabel do
  begin
    Parent := UMainPanel;
    AutoSize := False;
    WordWrap := True;
    Caption := 'Modify, repair, or remove the program.';
    ShowAccelChar := False;
    SetBounds(ScaleX(40), ScaleY(26), ScaleX(389), ScaleY(29));
  end;

  UWizardSmallBitmapImage := TBitmapImage.Create(UnistallForm);
  with UWizardSmallBitmapImage do
  begin
    Parent := UMainPanel;
    SetBounds(ScaleX(440), ScaleY(1), ScaleX(55), ScaleY(55));
    BackColor := UMainPanel.Color;
    Center := True;
    Bitmap.LoadFromResourceName(HInstance, '_IS_BMPWIZSMALL');
  end;

  UBevel1 := TBevel.Create(UnistallForm);
  with UBevel1 do
  begin
    Parent := UnistallForm;
    SetBounds(ScaleX(0), ScaleY(58), ScaleX(499), 3);
    Shape := bsTopLine;
  end;

  UBevel2 := TBevel.Create(UnistallForm);
  with UBevel2 do
  begin
    Parent := UnistallForm;
    SetBounds(ScaleX(0), ScaleY(313), ScaleX(499), 3);
    Shape := bsTopLine;
  end;

  UBackButton := TNewButton.Create(UnistallForm);
  with UBackButton do
  begin
    Parent := UnistallForm;
    SetBounds(ScaleX(252), ScaleY(327), ScaleX(75), ScaleY(23));
    Caption := '< &Back';
    Visible := False;
    OnClick := @UBackButton_OnClick;
  end;

  UNextButton := TNewButton.Create(UnistallForm);
  with UNextButton do
  begin
    Name := 'UNextButton';
    Parent := UnistallForm;
    SetBounds(ScaleX(327), ScaleY(327), ScaleX(75), ScaleY(23));
    Caption := '&Next >';
    Default := True;
    OnClick := @UNextButton_OnClick;
  end;

  UCancelButton := TNewButton.Create(UnistallForm);
  with UCancelButton do
  begin
    Parent := UnistallForm;
    SetBounds(ScaleX(412), ScaleY(327), ScaleX(75), ScaleY(23));
    Cancel := True;
    ModalResult := mrCancel;
    Caption := 'Cancel';
  end;

  NBook := TNewNotebook.Create(UnistallForm);
  with NBook do
  begin
    Parent := UnistallForm;
    SetBounds(0, UBevel1.Top+UBevel1.Height+2, UnistallForm.ClientWidth,
         UBevel2.Top-UBevel1.Top-UBevel1.Height-4);
    for i := 0 to 1 do
      with TNewNotebookPage.Create(UnistallForm) do
        Notebook := NBook;
    ActivePage := Pages[0];
  end;

  UModifyIcon := TBitmapImage.Create(UnistallForm);
  with UModifyIcon do
  begin
    Parent := NBook.Pages[0];
    SetBounds(ScaleX(48), ScaleY(53), ScaleX(32), ScaleY(32));
    BackColor := clNone;
    ReplaceColor := clWhite;                
    Bitmap.LoadFromResourceName(HInstance, '_IS_BMPMODIFY');
  end;

  URepairIcon := TBitmapImage.Create(UnistallForm);
  with URepairIcon do
  begin
    Parent := NBook.Pages[0];
    SetBounds(ScaleX(48), ScaleY(117), ScaleX(32), ScaleY(32));
    BackColor := clNone;
    ReplaceColor := $00FEFEFE;
    Bitmap.LoadFromResourceName(HInstance, '_IS_BMPREPAIR');
  end;

  URemoveIcon := TBitmapImage.Create(UnistallForm);
  with URemoveIcon do
  begin
    Parent := NBook.Pages[0];
    SetBounds(ScaleX(48), ScaleY(181), ScaleX(32), ScaleY(32));
    BackColor := clNone;
    ReplaceColor := clWhite;
    Bitmap.LoadFromResourceName(HInstance, '_IS_BMPREMOVE');
  end;

  UModifyDesc := TLabel.Create(UnistallForm);
  with UModifyDesc do
  begin
    Parent := NBook.Pages[0];
    AutoSize := False;
    WordWrap := True;
    Caption := 'Change which program features are installed. This option displays the Custom Selection dialog where you can change the way features are installed.';
    SetBounds(ScaleX(112), ScaleY(53), ScaleX(345), ScaleY(43));
  end;

  URepairDesc := TLabel.Create(UnistallForm);
  with URepairDesc do
  begin
    Parent := NBook.Pages[0];
    AutoSize := False;
    WordWrap := True;
    Caption := 'Repair errors in the program. This option fixes missing or corrupt files, shortcuts, and registry entries.';
    SetBounds(ScaleX(112), ScaleY(117), ScaleX(345), ScaleY(43));
  end;

  URemoveDesc := TLabel.Create(UnistallForm);
  with URemoveDesc do
  begin
    Parent := NBook.Pages[0];
    AutoSize := False;
    WordWrap := True;
    Caption := 'Remove this program from your computer.';
    SetBounds(ScaleX(112), ScaleY(181), ScaleX(345), ScaleY(43));
  end;

  URemoveDesc2 := TLabel.Create(UnistallForm);
  with URemoveDesc2 do
  begin
    Parent := NBook.Pages[1];
    AutoSize := False;
    WordWrap := True;
    Caption := 'Click the <Next> button to remove the program from your computer.';
    SetBounds(ScaleX(20), ScaleY(15), ScaleX(385), ScaleY(43));
  end;

  UModifyButton := TNewRadioButton.Create(UnistallForm);
  with UModifyButton do
  begin
    Parent := NBook.Pages[0];
    SetBounds(ScaleX(31), ScaleY(33), ScaleX(100), ScaleY(17));
    Caption := '&Modify';
    Font.Style := [fsBold];
  end;

  URepairButton := TNewRadioButton.Create(UnistallForm);
  with URepairButton do
  begin
    Parent := NBook.Pages[0];
    SetBounds(ScaleX(31), ScaleY(97), ScaleX(100), ScaleY(17));
    Caption := 'Re&pair';
    Font.Style := [fsBold];
  end;

  URemoveButton := TNewRadioButton.Create(UnistallForm);
  with URemoveButton do
  begin
    Parent := NBook.Pages[0];
    SetBounds(ScaleX(31), ScaleY(161), ScaleX(100), ScaleY(17));
    Caption := '&Remove';
    Checked := True;
    Font.Style := [fsBold];
  end;

  UnistallForm.Center;
  UnistallForm.OnShow := @UnistallFormOnShow;
  Result := UnistallForm.ShowModal;
end;

function InitializeUninstall(): Boolean;
var
  RCode: Integer;
begin
  Result := False;
  if not UninstallSilent then
  begin
    Exec(ExpandConstant('{uninstallexe}'), '/SILENT', '', SW_SHOW, ewNoWait, RCode)
    Exit;
  end;
  if CreateUnistallForm <> mrCancel then
  begin
    if UModifyButton.Checked then
      Exec(ExpandConstant('{pf}\InnoSetup Installation Information\{#MyAppId}\MySetup.exe'), '', '',
           SW_SHOW, ewNoWait, RCode)
    else if URemoveButton.Checked then
    begin
      ShowWindow(StrToInt(ExpandConstant('{apphwnd}')), SW_SHOW);
      Result := True;
    end;
  end;
  UnistallForm.Free;
end;

procedure InitializeUninstallProgressForm();
begin
  UninstallProgressForm.WizardSmallBitmapImage.Bitmap.LoadFromResourceName(HInstance, '_IS_BMPWIZSMALL');
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
  File, Dir: String;
begin
  if CurUninstallStep = usDone then
  begin
    Dir := ExpandConstant('{pf}\InnoSetup Installation Information\{#MyAppId}');
    File := Dir+'\MySetup.exe';
    if FileExists(File) and (not DeleteFile(File)) then
      RestartReplace(File, '');
    if DirExists(Dir) and (not RemoveDir(Dir)) then
      RestartReplace(Dir, '');
  end;
end;










