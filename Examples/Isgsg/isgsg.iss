
;      §³§Ü§â§Ú§á§ä §ã§à§Ù§Õ§Ñ§ß §ã §á§à§Þ§à§ë§î§ð
; IS GameScript Generator by South
;   §ã§á§Ö§è§Ú§Ñ§Ý§î§ß§à §Õ§Ý§ñ www.csmania.ru

[Setup]
SourceDir=.
OutputDir=Setup
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
InfoBeforeFile=D:\TEMP\!CODING\CS\readme.txt
OutputBaseFilename=cs_source53
WizardImageFile=D:\TEMP\!CODING\CS\WizModernImage.bmp
WizardSmallImageFile=D:\TEMP\!CODING\CS\WizModernSmallImage.bmp
SetupIconFile=D:\TEMP\!CODING\CS\Counter-Strike.ico
WindowVisible=no
WindowShowCaption=no
WindowResizable=no
Compression=lzma/ultra64
DiskSpanning=yes
DiskSliceSize=2100000000
SlicesPerDisk=1

[Languages]
Name: russian; MessagesFile: compiler:Languages\Russian.isl

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}
Name: LangEng; Description: §¡§ß§Ô§Ý§Ú§Û§ã§Ü§Ú§Û; GroupDescription: §Á§Ù§í§Ü §Ú§ß§ä§Ö§â§æ§Ö§Û§ã§Ñ; Flags: exclusive
Name: LangRus; Description: §²§å§ã§ã§Ü§Ú§Û; GroupDescription: §Á§Ù§í§Ü §Ú§ß§ä§Ö§â§æ§Ö§Û§ã§Ñ; Flags: exclusive

[Files]
Source: ISSkin.dll; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: steam.cjstyles; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: D:\TEMP\!CODING\CS\1.jpg; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: D:\TEMP\!CODING\CS\2.jpg; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: D:\TEMP\!CODING\CS\3.jpg; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: D:\TEMP\!CODING\CS\4.jpg; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: D:\TEMP\!CODING\CS\5.jpg; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: D:\TEMP\!CODING\CS\6.jpg; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: D:\TEMP\!CODING\CS\7.jpg; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: D:\TEMP\!CODING\CS\8.jpg; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: D:\TEMP\!CODING\CS\9.jpg; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: D:\TEMP\!CODING\CS\10.jpg; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: D:\TEMP\!CODING\CS\11.jpg; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: D:\TEMP\!CODING\CS\12.jpg; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: D:\TEMP\!CODING\CS\13.jpg; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: D:\TEMP\!CODING\CS\14.jpg; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: D:\TEMP\!CODING\CS\15.jpg; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: D:\TEMP\!CODING\CS\16.jpg; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: D:\TEMP\!CODING\CS\17.jpg; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: D:\TEMP\!CODING\CS\18.jpg; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: D:\TEMP\!CODING\CS\19.jpg; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: D:\TEMP\!CODING\CS\20.jpg; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: isgsg.dll; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: bass.dll; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: innocallback.dll; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: D:\TEMP\!CODING\CS\neutralCS2.mp3; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression

Source: C:\Counter-Strike Source v53\*; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs sortfilesbyextension

[Icons]
Name: {group}\Counter-Strike Source v53; Filename: {app}\CS-Source53.exe; WorkingDir: {app}
Name: {userdesktop}\Counter-Strike Source v53; Filename: {app}\CS-Source53.exe; WorkingDir: {app}; Tasks: desktopicon
Name: {group}\{cm:UninstallProgram,Counter-Strike Source v53}; Filename: {uninstallexe}

[Run]
Description: {cm:LaunchProgram, Counter-Strike Source v53}; Filename: {app}\CS-Source53.exe; WorkingDir: {app}; Flags: nowait postinstall skipifsilent unchecked

[Registry]
Root: HKCU; Subkey: Software\Valve\Steam; ValueType: string; ValueName: Language; ValueData: english; Tasks: LangEng
Root: HKCU; Subkey: Software\Valve\Steam; ValueType: string; ValueName: Language; ValueData: russian; Tasks: LangRus


[UninstallDelete]
Name: {app}; Type: filesandordirs

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
function BASS_ChannelIsActive(Handle:HWND):DWORD; external 'BASS_ChannelIsActive@files:bass.dll stdcall';
function BASS_SetConfig(Option,Value:DWORD):DWORD; external 'BASS_SetConfig@files:bass.dll stdcall';
function BASS_Init(Device:integer;Freq,Flags:DWORD;Win:HWND;CLSID:integer):boolean; external 'BASS_Init@files:bass.dll stdcall delayload';
function BASS_StreamCreateFile(Mem:BOOL;f:PChar;Offset:DWORD;Length:DWORD;Flags:DWORD):HSTREAM; external 'BASS_StreamCreateFile@files:bass.dll stdcall';
function BASS_StreamFree(Handle:HWND):boolean; external 'BASS_StreamFree@files:bass.dll stdcall';
function BASS_ChannelPlay(Handle:HWND;Restart:boolean):boolean; external 'BASS_ChannelPlay@files:bass.dll stdcall';
function BASS_Start: Boolean; external 'BASS_Start@files:bass.dll stdcall';
function BASS_Stop: Boolean; external 'BASS_Stop@files:bass.dll stdcall';
function BASS_Free: Boolean; external 'BASS_Free@files:bass.dll stdcall delayload';
function WrapTimerProc(CallBack:TTimerProc;ParamCount:integer):LongWord; external 'wrapcallback@files:innocallback.dll stdcall';
procedure LoadSkin(lpszPath: String; lpszIniFileName: String); external 'LoadSkin@files:isskin.dll stdcall';
procedure UnloadSkin(); external 'UnloadSkin@files:isskin.dll stdcall';
function ShowWindow(hWnd: Integer; uType: Integer): Integer; external 'ShowWindow@user32.dll stdcall';

procedure TimerTick(uTimerID,uMessage:UINT;dwUser,dw1,dw2:DWORD);
begin
  if BASS_ChannelIsActive(hMP3)=0 then begin
    BASS_Stop;
    BASS_StreamFree(hMP3);
    hMP3:=BASS_StreamCreateFile(False,PChar(MP3List.Strings[CurrentMP3]),0,0,0);
    BASS_Start;
    if hMP3<>0 then
      if BASS_ChannelPlay(hMP3,True) then begin
        CurrentMP3:=CurrentMP3+1;
        if CurrentMP3>MP3List.Count-1 then CurrentMP3:=0;
      end;
  end;
end;

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

function InitializeSetup:boolean;
begin
  ExtractTemporaryFile('neutralCS2.mp3');
  MP3List:=TStringList.Create;
  MP3List.Add(ExpandConstant('{tmp}')+'\neutralCS2.mp3');
  CurrentMP3:=0;
  ExtractTemporaryFile('steam.cjstyles');
  LoadSkin(ExpandConstant('{tmp}')+'\steam.cjstyles', '');
  Result:=True;
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
  TimerID:=SetTimer(0,0,500,WrapTimerProc(@TimerTick,5));
  BASS_Init(-1,44100,0,0,0);
  BASS_SetConfig(5,100);
  BASS_SetConfig(6,100);
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

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID=wpInstalling then begin
    WizardForm.MainPanel.Visible:=False;
    WizardForm.Bevel1.Visible:=False;
    WizardForm.Width:=ScaleX(395);
    WizardForm.Height:=ScaleY(142);
    WizardForm.Left:=ScaleX(GetSystemMetrics(0)-WizardForm.Width-Indent);
    WizardForm.Top:=ScaleY(GetSystemMetrics(1)-WizardForm.Height-Indent);
    WizardForm.InnerNotebook.Left:=ScaleX(10);
    WizardForm.InnerNotebook.Top:=ScaleY(10);
    WizardForm.InnerNotebook.Width:=ScaleX(370);
    WizardForm.StatusLabel.Left:=ScaleX(0);
    WizardForm.StatusLabel.Top:=ScaleY(0);
    WizardForm.StatusLabel.Width:=WizardForm.InnerNotebook.Width;
    WizardForm.FileNameLabel.Left:=ScaleX(0);
    WizardForm.FileNameLabel.Top:=ScaleY(20);
    WizardForm.FileNameLabel.Width:=WizardForm.InnerNotebook.Width;
    WizardForm.ProgressGauge.Top:=ScaleY(40);
    WizardForm.ProgressGauge.Width:=WizardForm.InnerNotebook.Width;
    WizardForm.CancelButton.Left:=ScaleX(154);
    WizardForm.CancelButton.Top:=ScaleY(80);
  end;
  if (CurPageID=wpFinished) or (CurPageID=wpInfoAfter) then begin
    if WizardForm.Width<>502 then begin
      WizardForm.Visible:=False;
      WizardForm.Width:=ScaleX(502);
      WizardForm.Height:=ScaleY(392);
      WizardForm.Left:=(GetSystemMetrics(0)-WizardForm.Width) div 2;
      WizardForm.Top:=(GetSystemMetrics(1)-WizardForm.Height) div 2;
      WizardForm.MainPanel.Visible:=True;
      WizardForm.Bevel1.Visible:=True;
      WizardForm.InnerNotebook.Left:=ScaleX(40);
      WizardForm.InnerNotebook.Top:=ScaleY(72);
      WizardForm.InnerNotebook.Width:=ScaleX(417);
      WizardForm.Visible:=True;
    end;
  end;
end;

procedure DeinitializeSetup;
begin
  KillTimer(0,TimerID);
  BASS_Stop;
  BASS_Free;
  MP3List.Free;
  ShowWindow(WizardForm.Handle,0);
  UnloadSkin();
  ssDeInitialize;
end;
