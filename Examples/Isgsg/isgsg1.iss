
;      §³§Ü§â§Ú§á§ä §ã§à§Ù§Õ§Ñ§ß §ã §á§à§Þ§à§ë§î§ð
; IS GameScript Generator by South
;   §ã§á§Ö§è§Ú§Ñ§Ý§î§ß§à §Õ§Ý§ñ www.csmania.ru

[Setup]
SourceDir=.
OutputDir=userdocs:Inno Setup Examples Output
AppName=Counter-Strike Source v53
AppVerName=Counter-Strike Source v53
AppVersion=Counter-Strike Source v53
AppPublisher=WellCome
AppCopyright=WellCome
AppPublisherURL=wellcome.moy.su
AppSupportURL=wellcome.moy.su
AppUpdatesURL=wellcome.moy.su
DefaultDirName={pf}\Counter-Strike Source v53
DefaultGroupName=Counter-Strike Source v53
AllowNoIcons=yes
WindowVisible=no
WindowShowCaption=no
WindowResizable=no
Compression=lzma/ultra64
DiskSpanning=yes
DiskSliceSize=2100000000
SlicesPerDisk=1

[Files]
Source: Files\*.jpg; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: {#PluginDir}\isgsg.dll; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: {#PluginDir}\innocallback.dll; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: "{win}\help\*"; DestDir: "{app}\help"; Flags: external recursesubdirs ignoreversion

[Icons]
Name: {group}\{cm:UninstallProgram,Counter-Strike Source v53}; Filename: {uninstallexe}

[Code]
type
  HSTREAM=DWORD;
  TTimerProc=procedure(uTimerID,uMessage:UINT;dwUser,dw1,dw2:DWORD);
const
  Indent=25;
  dURL=2;

var
  URLLabel,URLLabelShadow:TLabel;
  MP3List:TStringList;
  CurrentMP3:integer;
  hMP3:HWND;
  TimerID:LongWord;

function GetWindowLong(hWnd: HWND; nIndex: Integer): Longint; external 'GetWindowLongA@user32.dll stdcall delayload';

function ssInitialize(hParent:HWND;ssTimeShow:integer;FadeOut:boolean;StretchMode:integer;BkgColor:DWORD):boolean; external 'ssInitialize@files:isgsg.dll stdcall delayload';
procedure ssDeInitialize; external 'ssDeInitialize@files:isgsg.dll stdcall delayload';
procedure ssAddImage(FileName:PChar); external 'ssAddImage@files:isgsg.dll stdcall delayload';
procedure ssStartShow; external 'ssStartShow@files:isgsg.dll stdcall delayload';
procedure ssStopShow; external 'ssStopShow@files:isgsg.dll stdcall delayload';

function GetSystemMetrics(nIndex:Integer):integer; external 'GetSystemMetrics@user32.dll stdcall delayload';
function SetTimer(hWnd:HWND;nIDEvent,uElapse:UINT;lpTimerFunc:LongWord{TFNTimerProc}):UINT;  external 'SetTimer@user32.dll stdcall delayload';
function KillTimer(hWnd:HWND;uIDEvent:UINT):BOOL; external 'KillTimer@user32.dll stdcall delayload';

function WrapTimerProc(CallBack:TTimerProc;ParamCount:integer):LongWord; external 'wrapcallback@files:innocallback.dll stdcall';

function ShowWindow(hWnd: Integer; uType: Integer): Integer; external 'ShowWindow@user32.dll stdcall';

procedure URLLabelClick(Sender: TObject);
var
  ErrorCode:integer;
begin
  ShellExec('open','wellcome.moy.su','','',SW_SHOWNORMAL,ewNoWait,ErrorCode);
end;

procedure URLLabelMouseDown(Sender:TObject;Button:TMouseButton;Shift:TShiftState;X,Y:Integer);
begin
  URLLabel.Top:=URLLabel.Top+dURL;
  URLLabel.Left:=URLLabel.Left+dURL;
  URLLabel.Font.Style:=URLLabel.Font.Style+[fsUnderline];
  URLLabel.Font.Color:=$50B5C4;
  URLLabelShadow.Visible:=False;
end;

procedure URLLabelMouseUp(Sender:TObject;Button:TMouseButton;Shift:TShiftState;X,Y:Integer);
begin
  URLLabel.Top:=URLLabel.Top-dURL;
  URLLabel.Left:=URLLabel.Left-dURL;
  URLLabel.Font.Style:=URLLabel.Font.Style-[fsUnderline];
  URLLabel.Font.Color:=$708A7A;
  URLLabelShadow.Visible:=True;
end;

procedure InitializeWizard;
begin
  URLLabelShadow:=TLabel.Create(WizardForm);
  with URLLabelShadow do begin
    Top:=ScaleY(331);
    Left:=ScaleX(25);
    Caption:='wellcome.moy.su';
    AutoSize:=True;
    Parent:=WizardForm;
    Transparent:=True;
    Font.Color:=$041207;
    Font.Size:=9;
    Font.Style:=Font.Style+[fsBold];
  end;
  URLLabel:=TLabel.Create(WizardForm);
  with URLLabel do begin
    Top:=ScaleY(331)-dURL;
    Left:=ScaleX(25)-dURL;
    Caption:='wellcome.moy.su';
    AutoSize:=True;
    Parent:=WizardForm;
    Cursor:=crHand;
    Transparent:=True;
    Font.Color:=$708A7A;
    Font.Size:=9;
    Font.Style:=Font.Style+[fsBold];
    BringToFront;
    OnClick:=@URLLabelClick;
    OnMouseDown:=@URLLabelMouseDown;
    OnMouseUp:=@URLLabelMouseUp;
  end;
//  ssInitialize(WizardForm.Handle,1,True,2,$FF000000);
  ssInitialize(GetWindowLong(MainForm.Handle,-8),15,True,1,$FF000000);
  WizardForm.BeveledLabel.Enabled:=True;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep=ssInstall then begin
    ExtractTemporaryFile('1.jpg');
    ssAddImage(ExpandConstant('{tmp}')+'\1.jpg');
    ExtractTemporaryFile('2.jpg');
    ssAddImage(ExpandConstant('{tmp}')+'\2.jpg');
    ExtractTemporaryFile('3.jpg');
    ssAddImage(ExpandConstant('{tmp}')+'\3.jpg');
    ExtractTemporaryFile('4.jpg');
    ssAddImage(ExpandConstant('{tmp}')+'\4.jpg');
    ExtractTemporaryFile('5.jpg');
    ssAddImage(ExpandConstant('{tmp}')+'\5.jpg');
    ExtractTemporaryFile('6.jpg');
    ssAddImage(ExpandConstant('{tmp}')+'\6.jpg');
    ExtractTemporaryFile('7.jpg');
    ssAddImage(ExpandConstant('{tmp}')+'\7.jpg');
    ExtractTemporaryFile('8.jpg');
    ssAddImage(ExpandConstant('{tmp}')+'\8.jpg');
    ExtractTemporaryFile('9.jpg');
    ssAddImage(ExpandConstant('{tmp}')+'\9.jpg');
    ExtractTemporaryFile('10.jpg');
    ssAddImage(ExpandConstant('{tmp}')+'\10.jpg');
    ExtractTemporaryFile('11.jpg');
    ssAddImage(ExpandConstant('{tmp}')+'\11.jpg');
    ExtractTemporaryFile('12.jpg');
    ssAddImage(ExpandConstant('{tmp}')+'\12.jpg');
    ExtractTemporaryFile('13.jpg');
    ssAddImage(ExpandConstant('{tmp}')+'\13.jpg');
    ExtractTemporaryFile('14.jpg');
    ssAddImage(ExpandConstant('{tmp}')+'\14.jpg');
    ExtractTemporaryFile('15.jpg');
    ssAddImage(ExpandConstant('{tmp}')+'\15.jpg');
    ExtractTemporaryFile('16.jpg');
    ssAddImage(ExpandConstant('{tmp}')+'\16.jpg');
    ExtractTemporaryFile('17.jpg');
    ssAddImage(ExpandConstant('{tmp}')+'\17.jpg');
    ExtractTemporaryFile('18.jpg');
    ssAddImage(ExpandConstant('{tmp}')+'\18.jpg');
    ExtractTemporaryFile('19.jpg');
    ssAddImage(ExpandConstant('{tmp}')+'\19.jpg');
    ExtractTemporaryFile('20.jpg');
    ssAddImage(ExpandConstant('{tmp}')+'\20.jpg');
    ssStartShow;
  end;
  if CurStep=ssPostInstall then ssStopShow;
end;

//procedure CurPageChanged(CurPageID: Integer);
//begin
//  if CurPageID=wpInstalling then begin
//    WizardForm.MainPanel.Visible:=False;
//    WizardForm.Bevel1.Visible:=False;
//    WizardForm.Width:=ScaleX(395);
//    WizardForm.Height:=ScaleY(142);
//    WizardForm.Left:=ScaleX(GetSystemMetrics(0)-WizardForm.Width-Indent);
//    WizardForm.Top:=ScaleY(GetSystemMetrics(1)-WizardForm.Height-Indent);
//    WizardForm.InnerNotebook.Left:=ScaleX(10);
//    WizardForm.InnerNotebook.Top:=ScaleY(10);
//    WizardForm.InnerNotebook.Width:=ScaleX(370);
//    WizardForm.StatusLabel.Left:=ScaleX(0);
//    WizardForm.StatusLabel.Top:=ScaleY(0);
//    WizardForm.StatusLabel.Width:=WizardForm.InnerNotebook.Width;
//    WizardForm.FileNameLabel.Left:=ScaleX(0);
//    WizardForm.FileNameLabel.Top:=ScaleY(20);
//    WizardForm.FileNameLabel.Width:=WizardForm.InnerNotebook.Width;
//    WizardForm.ProgressGauge.Top:=ScaleY(40);
//    WizardForm.ProgressGauge.Width:=WizardForm.InnerNotebook.Width;
//    WizardForm.CancelButton.Left:=ScaleX(154);
//    WizardForm.CancelButton.Top:=ScaleY(80);
//  end;
//  if (CurPageID=wpFinished) or (CurPageID=wpInfoAfter) then begin
//    if WizardForm.Width<>502 then begin
//      WizardForm.Visible:=False;
//      WizardForm.Width:=ScaleX(502);
//      WizardForm.Height:=ScaleY(392);
//      WizardForm.Left:=(GetSystemMetrics(0)-WizardForm.Width) div 2;
//      WizardForm.Top:=(GetSystemMetrics(1)-WizardForm.Height) div 2;
//      WizardForm.MainPanel.Visible:=True;
//      WizardForm.Bevel1.Visible:=True;
//      WizardForm.InnerNotebook.Left:=ScaleX(40);
//      WizardForm.InnerNotebook.Top:=ScaleY(72);
//      WizardForm.InnerNotebook.Width:=ScaleX(417);
//      WizardForm.Visible:=True;
//    end;
//  end;
//end;

procedure DeinitializeSetup;
begin
  KillTimer(0,TimerID);
  ShowWindow(WizardForm.Handle,0);
  ssDeInitialize;
end;

