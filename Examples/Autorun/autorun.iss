[Setup]
AppName=AutoRun
AppVerName=AutoRun
CreateAppDir=no
SetupIconFile=icon.ico
WizardImageFile=wizard.bmp
OutputBaseFilename=autorun
OutputDir=userdocs:Inno Setup Examples Output

[Messages]
SetupAppTitle=AutoRun

[Files]
Source: btn1.bmp; DestDir: {tmp}; Flags: dontcopy
Source: btn2.bmp; DestDir: {tmp}; Flags: dontcopy
Source: btn3.bmp; DestDir: {tmp}; Flags: dontcopy
Source: btn4.bmp; DestDir: {tmp}; Flags: dontcopy
Source: btn5.bmp; DestDir: {tmp}; Flags: dontcopy
Source: start.mp3; DestDir: {tmp}; Flags: dontcopy

[Code]
const
  TransparentColor = clLime;
  TransparentPercent = 80;
  WS_EX_LAYERED = $80000;
  WS_EX_TRANSPARENT = $20;
  LWA_COLORKEY = 1;
  LWA_ALPHA = 2;
  GWL_EXSTYLE = (-20);
  WM_SYSCOMMAND = $0112;

var
  Panel1,Panel2,Panel3,Panel4,Panel5: TPanel;
  Image1,Image2,Image3,Image4,Image5: TBitmapImage;
  Label1,Label2,Label3,Label4,Label5,WizardLabel: TLabel;
  AppPath,UninsPath: string;
  Res: Integer;

function SetLayeredWindowAttributes(hwnd: HWND; crKey: TColor; bAlpha: BYTE; dwFlags: DWORD): Boolean; external 'SetLayeredWindowAttributes@user32.dll stdcall';
function GetWindowLong(Wnd: HWnd; Index: Integer): Longint; external 'GetWindowLong{#A}@user32.dll stdcall';
function SetWindowLong(Wnd: HWnd; Index: Integer; NewLong: Longint): Longint; external 'SetWindowLong{#A}@user32.dll stdcall';
function ReleaseCapture(): Longint; external 'ReleaseCapture@user32.dll stdcall';
function mciSendString(lpstrCommand: string; lpstrReturnString: string; uReturnLength:integer; hwndCallback:integer):integer; external 'mciSendString{#A}@winmm.dll stdcall';

procedure CancelButtonClick(CurPage: Integer; var Cancel, Confirm: Boolean);
begin
 Confirm:=False
 Cancel:=True
end;

procedure ButtonClick1(Sender: TObject);
begin
  if RegQueryStringValue(HKLM, 'SOFTWARE\Game','Path', AppPath) then
  begin
    Exec(AppPath,'','',SW_SHOWNORMAL,ewNoWait,Res)
    WizardForm.Close
  end
end;

procedure ButtonClick2(Sender: TObject);
begin
  Exec(ExpandConstant('{src}\game.exe'),'','',SW_SHOW,ewNoWait,Res)
  WizardForm.Close
end;

procedure ButtonClick3(Sender: TObject);
begin
if RegQueryStringValue(HKLM, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Game_is1','UninstallString', UninsPath) then
  begin
    UninsPath:=RemoveQuotes(UninsPath)
    Exec(UninsPath,'','',SW_SHOWNORMAL,ewNoWait,Res)
    WizardForm.Close
  end
end;

procedure ButtonClick4(Sender: TObject);
begin
  ShellExec('open', ExpandConstant('{src}\readme.txt'),'','', SW_SHOW, ewNoWait, Res)
end;

procedure ButtonClick5(Sender: TObject);
begin
  WizardForm.Close
end;

procedure LabelMouseMove1(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  Image1.Top:=-16
  Image2.Top:=0
  Image3.Top:=0
  Image4.Top:=0
  Image5.Top:=0
end;

procedure LabelMouseMove2(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  Image1.Top:=0
  Image2.Top:=-16
  Image3.Top:=0
  Image4.Top:=0
  Image5.Top:=0
end;

procedure LabelMouseMove3(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  Image1.Top:=0
  Image2.Top:=0
  Image3.Top:=-16
  Image4.Top:=0
  Image5.Top:=0
end;

procedure LabelMouseMove4(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  Image1.Top:=0
  Image2.Top:=0
  Image3.Top:=0
  Image4.Top:=-16
  Image5.Top:=0
  if Image4.Tag = 0 then
  begin
     mciSendString(ExpandConstant('play {tmp}\start.mp3'),'NULL',0,0)
     Image4.Tag:= 1
  end
end;

procedure LabelMouseMove5(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  Image1.Top:=0
  Image2.Top:=0
  Image3.Top:=0
  Image4.Top:=0
  Image5.Top:=-16
  Image4.Tag:= 0
end;

Procedure NoLabelMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
Begin
  Image1.Top:=0
  Image2.Top:=0
  Image3.Top:=0
  Image4.Top:=0
  Image5.Top:=0
end;

procedure WizardLabelMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture
  SendMessage(WizardForm.Handle, WM_SYSCOMMAND, $F012, 0)
end;

function InitializeSetup(): Boolean;
begin
  ExtractTemporaryFile('btn1.bmp')
  ExtractTemporaryFile('btn2.bmp')
  ExtractTemporaryFile('btn3.bmp')
  ExtractTemporaryFile('btn4.bmp')
  ExtractTemporaryFile('btn5.bmp')
  ExtractTemporaryFile('start.mp3')
  Result:=True
end;

procedure InitializeWizard();
begin
  mciSendString(ExpandConstant('play {tmp}\start.mp3'),'NULL',0,0)

  WizardForm.Width:=700
  WizardForm.Height:=540
  WizardForm.Color:=TransparentColor
  WizardForm.BorderStyle:=bsNone
  WizardForm.Center
  WizardForm.OuterNotebook.Hide
  WizardForm.NextButton.Left:=710
  WizardForm.CancelButton.Left:=710

  WizardLabel:=TLabel.Create(WizardForm)
  WizardLabel.Width:=WizardForm.Width
  WizardLabel.Height:=WizardForm.Height
  WizardLabel.AutoSize:=False
  WizardLabel.OnMouseMove:=@NoLabelMove
  WizardLabel.OnMouseDown:=@WizardLabelMouseDown
  WizardLabel.Parent:=WizardForm

  WizardForm.WizardBitmapImage.Left:=0
  WizardForm.WizardBitmapImage.Top:=0
  WizardForm.WizardBitmapImage.AutoSize:=True
  WizardForm.WizardBitmapImage.Enabled:=False
  WizardForm.WizardBitmapImage.Parent:=WizardForm

  SetWindowLong(WizardForm.Handle, GWL_EXSTYLE, GetWindowLong(WizardForm.Handle, GWL_EXSTYLE) or WS_EX_LAYERED)
  SetLayeredWindowAttributes(WizardForm.Handle, TransparentColor,(255 * TransparentPercent) / 100, LWA_COLORKEY)

  Panel1:=TPanel.Create(WizardForm)
  Panel1.Left:=108
  Panel1.Top:=425
  Panel1.Width:=145
  Panel1.Height:=16
  Panel1.Parent:=WizardForm

  Image1:=TBitmapImage.Create(WizardForm)
  Image1.Autosize:=True
  Image1.Enabled:=False
  Image1.Bitmap.LoadFromFile(ExpandConstant('{tmp}\btn1.bmp'))
  Image1.Parent:=Panel1

  Label1:=TLabel.Create(WizardForm)
  Label1.Left:=0
  Label1.Top:=0
  Label1.Width:=Panel1.Width
  Label1.Height:=Panel1.Height
  Label1.Autosize:=False
  Label1.Transparent:=True
  Label1.Cursor:=crHand
  Label1.OnMouseMove:=@LabelMouseMove1
  Label1.OnClick:=@ButtonClick1
  Label1.Parent:=Panel1
  if not RegQueryStringValue(HKLM, 'SOFTWARE\Game','Path', AppPath) then
  begin
    Panel1.Hide
  end;

  Panel2:=TPanel.Create(WizardForm)
  Panel2.Left:=108
  Panel2.Top:=447
  Panel2.Width:=158
  Panel2.Height:=16
  Panel2.Parent:=WizardForm

  Image2:=TBitmapImage.Create(WizardForm)
  Image2.Autosize:=True
  Image2.Enabled:=False
  Image2.Bitmap.LoadFromFile(ExpandConstant('{tmp}\btn2.bmp'))
  Image2.Parent:=Panel2

  Label2:=TLabel.Create(WizardForm)
  Label2.Left:=0
  Label2.Top:=0
  Label2.Width:=Panel2.Width
  Label2.Height:=Panel2.Height
  Label2.Autosize:=False
  Label2.Transparent:=True
  Label2.Cursor:=crHand
  Label2.OnMouseMove:=@LabelMouseMove2
  Label2.OnClick:=@ButtonClick2
  Label2.Parent:=Panel2

  Panel3:=TPanel.Create(WizardForm)
  Panel3.Left:=108
  Panel3.Top:=447
  Panel3.Width:=126
  Panel3.Height:=16
  Panel3.Parent:=WizardForm

  Image3:=TBitmapImage.Create(WizardForm)
  Image3.Autosize:=True
  Image3.Enabled:=False
  Image3.Bitmap.LoadFromFile(ExpandConstant('{tmp}\btn3.bmp'))
  Image3.Parent:=Panel3

  Label3:=TLabel.Create(WizardForm)
  Label3.Left:=0
  Label3.Top:=0
  Label3.Width:=Panel3.Width
  Label3.Height:=Panel3.Height
  Label3.Autosize:=False
  Label3.Transparent:=True
  Label3.Cursor:=crHand
  Label3.OnMouseMove:=@LabelMouseMove3
  Label3.OnClick:=@ButtonClick3
  Label3.Parent:=Panel3

  Panel2.Hide
  Panel3.Hide
  if not RegQueryStringValue(HKLM, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Game_is1','UninstallString', UninsPath) then
    Panel2.Show
  else
    Panel3.Show;

  Panel4:=TPanel.Create(WizardForm)
  Panel4.Left:=108
  Panel4.Top:=468
  Panel4.Width:=122
  Panel4.Height:=16
  Panel4.Parent:=WizardForm

  Image4:=TBitmapImage.Create(WizardForm)
  Image4.Autosize:=True
  Image4.Enabled:=False
  Image4.Bitmap.LoadFromFile(ExpandConstant('{tmp}\btn4.bmp'))
  Image4.Parent:=Panel4

  Label4:=TLabel.Create(WizardForm)
  Label4.Left:=0
  Label4.Top:=0
  Label4.Width:=Panel4.Width
  Label4.Height:=Panel4.Height
  Label4.Autosize:=False
  Label4.Transparent:=True
  Label4.Cursor:=crHand
  Label4.OnMouseMove:=@LabelMouseMove4
  Label4.OnClick:=@ButtonClick4
  Label4.Parent:=Panel4

  Panel5:=TPanel.Create(WizardForm)
  Panel5.Left:=108
  Panel5.Top:=489
  Panel5.Width:=64
  Panel5.Height:=16
  Panel5.Parent:=WizardForm

  Image5:=TBitmapImage.Create(WizardForm)
  Image5.Autosize:=True
  Image5.Enabled:=False
  Image5.Bitmap.LoadFromFile(ExpandConstant('{tmp}\btn5.bmp'))
  Image5.Parent:=Panel5

  Label5:=TLabel.Create(WizardForm)
  Label5.Left:=0
  Label5.Top:=0
  Label5.Width:=Panel5.Width
  Label5.Height:=Panel5.Height
  Label5.Autosize:=False
  Label5.Transparent:=True
  Label5.Cursor:=crHand
  Label5.OnMouseMove:=@LabelMouseMove5
  Label5.OnClick:=@ButtonClick5
  Label5.Parent:=Panel5
end;

