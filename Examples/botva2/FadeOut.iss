;хрен знает что за пример
;хрен знает когда сделан и для чего
;автор South.Tver
;валялся, вот и положил до кучи

#include "botva2.ish"

#define FormPic "form.tif"
#define CloseBtnPic "closebtn.png"
#define MinimizeBtnPic "minimizebtn.png"
#define PrevBtnPic "prevbtn.png"
#define NextBtnPic "nextbtn.png"
#define BkgPicCount 3

[Setup]
AppName=FadeOut Effect
AppVerName=FadeOut Effect
DefaultDirName={pf}\FadeOut_Effect
SolidCompression=yes
Compression=lzma2/ultra64
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: Files\*; DestDir: "{tmp}"; Flags: dontcopy sortfilesbyextension

[Code]
type
  TMsg = record
    hwnd: HWND;
    message: UINT;
    wParam: Longint;
    lParam: Longint;
    time: DWORD;
    pt: TPoint;
  end;

var
  hMinimizeBtn,
  hCloseBtn,
  hPrevBtn,
  hNextBtn      : HWND;
  AImg          : array of Longint;
  CurImg        : integer;
  InWork        : boolean;
  TimeLabel,
  FrameCnt      : TLabel;
  StepEdit      : TNewEdit;
  
function ReleaseCapture(): Longint; external 'ReleaseCapture@user32.dll stdcall';
function SetLayeredWindowAttributes(hwnd: hWnd; crKey: TColor; bAlpha: byte; dwFlags: DWORD): Boolean; external 'SetLayeredWindowAttributes@user32.dll stdcall';
function GetWindowLong(Wnd: HWnd; Index: Integer): Longint; external 'GetWindowLongA@user32.dll stdcall';
function SetWindowLong(Wnd: HWnd; Index: Integer; NewLong: Longint): Longint; external 'SetWindowLongA@user32.dll stdcall';
function GetTickCount: DWord; external 'GetTickCount@kernel32 stdcall';

function PeekMessage(var lpMsg: TMsg; hWnd: HWND; wMsgFilterMin, wMsgFilterMax, wRemoveMsg: UINT): BOOL; external 'PeekMessageA@user32.dll stdcall';
function TranslateMessage(const lpMsg: TMsg): BOOL; external 'TranslateMessage@user32.dll stdcall';
function DispatchMessage(const lpMsg: TMsg): Longint; external 'DispatchMessageA@user32.dll stdcall';

procedure AppProcessMessages;
var
  Msg: TMsg;
begin
  while PeekMessage(Msg, WizardForm.Handle,0,0,1) do begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

function LongintToStringTime(t:Longint):string;
var
  h,m,s,ms:integer;
begin
  h:=t div 3600000;
  t:=t-h*3600000;
  m:=t div 60000;
  t:=t-m*60000;
  s:=t div 1000;
  ms:=t-s*1000;
  Result:='';
  if h>0 then Result:=Result+IntToStr(h)+ExpandConstant(' ч. ');
  if (m>0) or (h>0) then Result:=Result+IntToStr(m)+ExpandConstant(' мин. ');
  if (m>0) or (h>0) or (s>0) then Result:=Result+IntToStr(s)+ExpandConstant(' сек. ');
  if (m>0) or (h>0) or (s>0) or (ms>0) then Result:=Result+IntToStr(ms)+ExpandConstant(' мс');
end;

function GetStep:integer;
begin
  Result:=-1;
  try
    Result:=StrToInt(StepEdit.Text);
    if (Result<1) or (Result>255) then begin
      Result:=-1;
      MsgBox('Не тупи', mbConfirmation, MB_OK);
    end;
  except
    MsgBox('Не тупи', mbConfirmation, MB_OK);
  end;
end;

procedure ImgFadeOut(ShowImg,HideImg:Longint;IsShow:boolean);
var
  frame,i,step:integer;
begin
  step:=GetStep;
  if step=-1 then Exit;
  frame:=1;
  if IsShow then begin
    i:=0;
    while True do begin
      if i>255 then i:=255;
      ImgSetTransparent(ShowImg,i);
      if i=0 then ImgSetVisibility(ShowImg,True);
      if i=255 then ImgSetVisibility(HideImg,False);
      ImgApplyChanges(WizardForm.Handle);
      FrameCnt.Caption:='Frame - '+IntToStr(frame);
      AppProcessMessages;
      //Sleep(60);
      if i=255 then Break;
      i:=i+step;
      frame:=frame+1;
    end;
  end else begin
    ImgSetTransparent(ShowImg,255);
    ImgSetVisibility(ShowImg,True);
    i:=255;
    while True do begin
      if i<0 then i:=0;
      ImgSetTransparent(HideImg,i);
      if i=0 then ImgSetVisibility(HideImg,False);
      ImgApplyChanges(WizardForm.Handle);
      FrameCnt.Caption:='Frame - '+IntToStr(frame);
      AppProcessMessages;
      //Sleep(60);
      if i=0 then Break;
      i:=i-step;
      frame:=frame+1;
    end;
  end;
end;

procedure ChangeBkgImage(hBtn:HWND);
var
  NextImg:Longint;
  stc:DWORD;
begin
  if InWork then Exit;
  InWork:=True;
  stc:=GetTickCount;
  case hBtn of
    hNextBtn: begin
      NextImg:=CurImg+1;
      if NextImg>GetArrayLength(AImg)-1 then NextImg:=0;
    end;
    hPrevBtn: begin
      NextImg:=CurImg-1;
      if NextImg<0 then NextImg:=GetArrayLength(AImg)-1;
    end;
  end;
  if NextImg>CurImg then ImgFadeOut(AImg[NextImg],AImg[CurImg],True) else ImgFadeOut(AImg[NextImg],AImg[CurImg],False);
  CurImg:=NextImg;
  TimeLabel.Caption:='Time - '+LongintToStringTime(GetTickCount-stc);
  InWork:=False;
end;

procedure NextBtnClick(hBtn:HWND);
begin
  ChangeBkgImage(hBtn);
end;

procedure PrevBtnClick(hBtn:HWND);
begin
  ChangeBkgImage(hBtn);
end;

procedure CloseBtnClick(hBtn:HWND);
begin
  WizardForm.Close;
end;

procedure MinimizeBtnClick(hBtn:HWND);
begin
  SendMessage(WizardForm.Handle,$0112,61472,0);
end;

procedure LabelOnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(WizardForm.Handle,$0112,$F012,0)
end;

procedure InitializeWizard;
var
  i:integer;
begin
  with WizardForm do begin
    BorderStyle:=bsNone;
    Bevel.Hide;
    InnerNotebook.Hide;
    OuterNotebook.Hide;
    Width:=640;
    Height:=240;
    Position:=poScreenCenter;
  end;

  hCloseBtn:=BtnCreate(WizardForm.Handle,556,5,22,22,'{#CloseBtnPic}',3,False);
  BtnSetEvent(hCloseBtn,BtnClickEventID,WrapBtnCallback(@CloseBtnClick,1));

  hMinimizeBtn:=BtnCreate(WizardForm.Handle,529,5,22,22,'{#MinimizeBtnPic}',3,False);
  BtnSetEvent(hMinimizeBtn,BtnClickEventID,WrapBtnCallback(@MinimizeBtnClick,1));

  hPrevBtn:=BtnCreate(WizardForm.Handle,20,95,40,50,'{#PrevBtnPic}',5,False);
  BtnSetEvent(hPrevBtn,BtnClickEventID,WrapBtnCallback(@PrevBtnClick,1));

  hNextBtn:=BtnCreate(WizardForm.Handle,580,95,40,50,'{#NextBtnPic}',5,False);
  BtnSetEvent(hNextBtn,BtnClickEventID,WrapBtnCallback(@NextBtnClick,1));

  with TLabel.Create(WizardForm) do begin
    Parent:=WizardForm;
    AutoSize:=False;
    Top:=8;
    Left:=0;
    Width:=WizardForm.Width;
    Alignment:=taCenter;
    Transparent:=True;
    Font.Color:=$EEEEEE;
    Font.Style:=[fsBold];
    Caption:=WizardForm.Caption;
    OnMouseDown:=@LabelOnMouseDown;
  end;

  TimeLabel:=TLabel.Create(WizardForm);
  with TimeLabel do begin
    Parent:=WizardForm;
    Transparent:=True;
    Left:=420;
    Top:=40;
    Font.Size:=10;
    Caption:='Time -';
  end;
  FrameCnt:=TLabel.Create(WizardForm);
  with FrameCnt do begin
    Parent:=WizardForm;
    Transparent:=True;
    Left:=TimeLabel.Left;
    Top:=60;
    Font.Size:=10;
    Caption:='Frame -';
  end;

  with TLabel.Create(WizardForm) do begin
    Parent:=WizardForm;
    Transparent:=True;
    Left:=90;
    Top:=215;
    Caption:='Step transparency (1-255)';
  end;
  StepEdit:=TNewEdit.Create(WizardForm);
  with StepEdit do begin
    Parent:=WizardForm;
    SetBounds(225,212,25,21);
    MaxLength:=3;
    Text:='11';
  end;

  ImgLoad(WizardForm.Handle,'{#FormPic}',0,0,0,0,False,True);
 
  SetArrayLength(AImg,{#BkgPicCount});
  for i:=0 to GetArrayLength(AImg)-1 do begin
    AImg[i]:=ImgLoad(WizardForm.Handle,'1' + IntToStr(i+1)+'.jpg',90,34,459,170,True,True);
    if i>0 then ImgSetVisibility(AImg[i],False);
  end;
  ImgApplyChanges(WizardForm.Handle);
  CurImg:=0;

  SetWindowLong(WizardForm.Handle,-20,GetWindowLong(WizardForm.Handle,-20) or $80000);
  SetLayeredWindowAttributes(WizardForm.Handle,$00FF00,255,1);

  InWork:=False;
end;

function InitializeSetup:boolean;
begin
  if not FileExists(ExpandConstant('{tmp}\botva2.dll')) then ExtractTemporaryFile('botva2.dll');
  if not FileExists(ExpandConstant('{tmp}\innocallback.dll')) then ExtractTemporaryFile('CallbackCtrl.dll');
  Result:=True;
end;

procedure DeinitializeSetup;
begin
  gdipShutdown;
  SetArrayLength(AImg,0);
end;
