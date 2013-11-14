;Created by South.Tver 02.2010
;пример слайд-шоу по процентам

#include "botva2.ish"
#include "ProgressBar.ish"

[Setup]
AppName=SlideShow by South.Tver
AppVerName=SlideShow by South.Tver
DefaultDirName={pf}\SlideShow
OutputBaseFilename=setup
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: {win}\help\*; DestDir: {app}\Files; Flags: external recursesubdirs
Source: Files\*; Flags: dontcopy

[Code]

type
  TPBProc = function (h:hWnd;Msg,wParam,lParam:Longint):Longint;

const
  PanelWidth   = 158;
  ProgressStep = 5;

var
  TimeLeftLabel  : TLabel;
  eTime, sTime   : DWORD;
  NewPB          : TImgPB;
  PBOldProc      : Longint;
  WFCaption      : string;
  hCancelBtn,
  hNextBtn,
  hBackBtn       : HWND;
  AImg           : array of Longint;
  ALabel         : array of TLabel;
  CurrentImage,
  CurrentLabel,
  l,t,w,h        : integer;
  img,WFBkg      : Longint;
  Font           : TFont;
  hTestBtn1,
  hTestBtn2,
  hGlassButton   : HWND;
  BtnEventLabel  : TLabel;
  OldPosition    : integer;

function GetTickCount: DWORD; external 'GetTickCount@kernel32.dll stdcall';

function SetWindowLong(hWnd: HWND; nIndex: Integer; dwNewLong: Longint): Longint; external 'SetWindowLong{#A}@user32.dll stdcall';
function CallBackProc(P:TPBProc;ParamCount:integer):LongWord; external 'WrapCallbackAddr@{#Plugin_CodeDir(CallbackCtrl_Dll)} {#Plugin_CodeFlags}';
function CallWindowProc(lpPrevWndFunc: Longint; hWnd: HWND; Msg: UINT; wParam, lParam: Longint): Longint; external 'CallWindowProc{#A}@user32.dll stdcall';

function mciSendString(lpstrCommand, lpstrReturnString: PChar; uReturnLength: Cardinal; hWndCallback: HWND): Cardinal; external 'mciSendString{#A}@winmm.dll stdcall';
function LoadCursorFromFile(FileName: String): Cardinal; external 'LoadCursorFromFile{#A}@user32 stdcall';


function LongintToStringTime(t:Longint):string;
var
  h,m,s:integer;
begin
  h:=t div 3600;
  t:=t-h*3600;
  m:=t div 60;
  s:=t-m*60;
  Result:='';
  if h>0 then Result:=Result+IntToStr(h)+' ч. ';
  if (m>0) or (h>0) then Result:=Result+IntToStr(m)+' мин. ';
  if (m>0) or (h>0) or (s>0) then Result:=Result+IntToStr(s)+' сек.';
end;

function PBProc(h:hWnd;Msg,wParam,lParam:Longint):Longint;
var
  lt:Longint;
  dt,at,pr,i1,i2:Extended;
  p:string;
  tc:DWORD;
begin
  Result:=CallWindowProc(PBOldProc,h,Msg,wParam,lParam);
  if (Msg=$402) and (WizardForm.ProgressGauge.Position>WizardForm.ProgressGauge.Min) then begin
    i1:=WizardForm.ProgressGauge.Position-WizardForm.ProgressGauge.Min;
    i2:=WizardForm.ProgressGauge.Max-WizardForm.ProgressGauge.Min;

    tc:=GetTickCount;
    if (tc-eTime)>=1000 then begin //пересчитывем время оставшееся до конца установки не чаще, чем раз в 1 секунду
      dt:=(tc-sTime)/1000;
      at:=i2*dt/i1;
      lt:=Round(at-dt)
      TimeLeftLabel.Caption:='Осталось - '+LongintToStringTime(lt);
      eTime:=tc;
    end;

    pr:=i1*100/i2;
    p:=' - ['+Format('%f',[pr])+'%]';
    StringChange(p,',','.');
    WizardForm.Caption:=WFCaption+p;
    
    if pr-OldPosition>=ProgressStep then begin
      OldPosition:=OldPosition+ProgressStep;
      ImgSetVisibility(AImg[CurrentImage],False);
      CurrentImage:=CurrentImage+1;
      if CurrentImage>GetArrayLength(AImg)-1 then CurrentImage:=0;
      ImgSetVisibility(AImg[CurrentImage],True);
    end;

    ImgPBSetPosition(NewPB,pr);
    ImgApplyChanges(WizardForm.Handle);
  end;
end;

procedure AllCancel;
begin
  SetWindowLong(WizardForm.ProgressGauge.Handle,-4,PBOldProc);
  ImgSetVisibility(AImg[CurrentImage],False);
  ImgSetVisibility(WFBkg,True);
  TimeLeftLabel.Free;
  ImgPBDelete(NewPB);
  ImgApplyChanges(WizardForm.Handle);
  WizardForm.Caption:=WFCaption;
end;

procedure SetStateNewButtons;
begin
  //устанавливаем наши кнопки в тоже состояние, что и их оригиналы
  with WizardForm.BackButton do begin
    BtnSetText(hBackBtn,PAnsiChar(Caption));
    BtnSetVisibility(hBackBtn,Visible);
    BtnSetEnabled(hBackBtn,Enabled);
  end;
  with WizardForm.NextButton do begin
    BtnSetText(hNextBtn,PAnsiChar(Caption));
    BtnSetVisibility(hNextBtn,Visible);
    BtnSetEnabled(hNextBtn,Enabled);
  end;
  with WizardForm.CancelButton do begin
    BtnSetText(hCancelBtn,PAnsiChar(Caption));
    BtnSetVisibility(hCancelBtn,Visible);
    BtnSetEnabled(hCancelBtn,Enabled);
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  case CurStep of
    ssInstall: begin
      WizardForm.ProgressGauge.Visible:=False;

      OldPosition:=0;
      CurrentImage:=0;
      ImgSetVisibility(WFBkg,False);
      ImgSetVisibility(AImg[0],True);
      SetStateNewButtons;
      
      ExtractTemporaryFile('pbbkg.png');
      ExtractTemporaryFile('pb.png');
      NewPB:=ImgPBCreate(WizardForm.Handle, ExpandConstant('{tmp}\pbbkg.png'), ExpandConstant('{tmp}\pb.png'),10,10,WizardForm.ClientWidth-20,25);
      ImgApplyChanges(WizardForm.Handle);

      WFCaption:=WizardForm.Caption;

      TimeLeftLabel:=TLabel.Create(nil);
      with TimeLeftLabel do begin
        Parent:=WizardForm;
        AutoSize:=False;
        SetBounds(20,40,WizardForm.ClientWidth-40,21);
        Font.Color:=clRed;
        Transparent:=True;
      end;

      sTime:=GetTickCount;
      eTime:=sTime;

      PBOldProc:=SetWindowLong(WizardForm.ProgressGauge.Handle,-4,CallBackProc(@PBProc,4));
    end;
    ssPostInstall: begin
      ALabel[CurrentLabel].Font.Color:=clGray;
      ALabel[CurrentLabel].Top:=ALabel[CurrentLabel].Top-1;
      CurrentLabel:=CurrentLabel+1;
      ALabel[CurrentLabel].Font.Color:=clRed;
      ALabel[CurrentLabel].Top:=ALabel[CurrentLabel].Top+1;
      l:=l+PanelWidth;
      ImgSetPosition(img,l,t,w,h);
      AllCancel;
    end;
  end;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  if CurPageID=wpInstalling then begin
    Confirm:=False;
    Cancel:=ExitSetupMsgBox;
    if Cancel then begin
      AllCancel;
      WizardForm.CancelButton.Enabled:=False;
    end;
  end;
end;

procedure WizardFormShow(Sender: TObject);
begin
  //устанавливаем текст, видимость и т.д. на кнопках замещающих NextButton,CancelButton,BackButton
  SetStateNewButtons; //т.к. в InitializeWizard не определены надписи на кнопках NextButton,CancelButton,BackButton делаем это при показе формы
end;

procedure WizardFormBtnClick(hBtn:HWND);
var
  Btn:TButton;
begin
  //для всех трех кнопок выполняется одна процедура при нажатии, поэтому ищем,
  //процедуру какой оригинальной кнопки нам все-таки нужно выполнить
  case hBtn of
    hCancelBtn: Btn:=WizardForm.CancelButton;
    hNextBtn: Btn:=WizardForm.NextButton;
    hBackBtn: Btn:=WizardForm.BackButton;
  end;
  Btn.OnClick(Btn); //выполняем нажатие на стандартную кнопку
  SetStateNewButtons; //устанавливаем текст, видимость и т.д. на кнопках замещающих NextButton,CancelButton,BackButton
  BtnRefresh(hBtn);
end;

procedure TestBtn1Click(hBtn:HWND);
//выполняется при нажатии на кнопку с хэндлом hTestBtn1
var
  s:string;
begin
  //делаем доступной/недоступной кнопку с хэндлом hTestBtn2
  //аналог Button.Enabled:=not Button.Enabled
  BtnSetEnabled(hTestBtn2, not BtnGetEnabled(hTestBtn2));
  //меняем текст кнопки с хэндлом hTestBtn1 в зависимости от доступности кнопки hTestBtn2
  if BtnGetEnabled(hTestBtn2) then begin
    s:='Disable';
    BtnSetFontColor(hTestBtn1,$22A4CA,$22A4CA,$22A4CA,$B6B6B6);
  end else begin
    s:='Enable';
    BtnSetFontColor(hTestBtn1,$C86442,$C86442,$C86442,$B6B6B6);
  end;
  BtnSetText(hTestBtn1,PAnsiChar(s));
  BtnRefresh(hTestBtn1);
end;

procedure TestBtn2Click(hBtn:HWND);
//выполняется при нажатии на кнопку с хэндлом hTestBtn2
//var
//  ErrorCode: Integer;
begin
  BtnEventLabel.Caption:='Mouse Click';
  BtnEventLabel.Refresh; //при быстром движении не успевает перерисовываться
  mciSendString('stop '+ExpandConstant('{tmp}\click.wav'), 'NULL', 0, 0);
  mciSendString('play '+ExpandConstant('{tmp}\click.wav'), 'NULL', 0, 0);
  //ShellExec('open', 'www.csmania.ru', '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode)
  MsgBox('как бы открылся сайт csmania.ru', mbInformation, MB_OK);
end;

procedure GlassBtnClick(hBtn:HWND);
begin
  MsgBox('Click', mbInformation, MB_OK);
end;

procedure TestBtn2Enter(hBtn:HWND);
begin
  BtnEventLabel.Caption:='Mouse Enter';
  BtnEventLabel.Refresh; //при быстром движении не успевает перерисовываться
  mciSendString('stop '+ExpandConstant('{tmp}\enter.wav'), 'NULL', 0, 0);
  mciSendString('play '+ExpandConstant('{tmp}\enter.wav'), 'NULL', 0, 0);
end;

procedure TestBtn2Leave(hBtn:HWND);
begin
  BtnEventLabel.Caption:='Mouse Leave';
  BtnEventLabel.Refresh; //при быстром движении не успевает перерисовываться
  mciSendString('stop '+ExpandConstant('{tmp}\leave.wav'), 'NULL', 0, 0);
  mciSendString('play '+ExpandConstant('{tmp}\leave.wav'), 'NULL', 0, 0);
end;

function InitializeSetup:boolean;
begin
  PDir('{# Botva2_Dll }');
  PDir('{# CallbackCtrl_Dll }');
  Result:=True;
end;

procedure InitializeWizard;
var
  h:HWND;
  i,l1:integer;
begin
  WizardForm.OnShow:=@WizardFormShow;
  with WizardForm do begin
    Position:=poScreenCenter;
    InnerNotebook.Hide;
    OuterNotebook.Hide;
    Bevel.Hide;
    ClientWidth:=790;
    ClientHeight:=533;

    NextButton.Top:=500;
    NextButton.Left:=580;
    CancelButton.Top:=500;
    CancelButton.Left:=670;
    BackButton.Top:=500;
    BackButton.Left:=490;
  end;
  //делаем лабелы для панельки
  CurrentLabel:=0;
  SetArrayLength(ALabel,5);
  l1:=0;
  for i:=0 to 4 do begin
    ALabel[i]:=TLabel.Create(WizardForm);
    with ALabel[i] do begin
      AutoSize:=False;
      Parent:=WizardForm;
      Transparent:=True;
      if i=0 then begin
        SetBounds(l1,93,PanelWidth,20);
        Font.Color:=clRed;
      end else begin
        SetBounds(l1,92,PanelWidth,20);
        Font.Color:=clGray;
      end;
      Font.Style:=Font.Style+[fsBold];
      Alignment:=taCenter;
      Caption:='хрень'+IntToStr(i+1);
    end;
    l1:=l1+PanelWidth;
  end;

  //очередной изврат - как бы контур вокруг букв
  for i:=1 to 4 do
    with TLabel.Create(WizardForm) do begin
      AutoSize:=False;
      Parent:=WizardForm;
      Transparent:=True;
      Left:=0;
      Top:=200;
      case i of
        1: Left:=Left-1;
        2: Left:=Left+1;
        3: Top:=Top-1;
        4: Top:=Top+1;
      end;
      Width:=WizardForm.ClientWidth;
      Height:=30;
      with Font do begin
        Name:='Times New Roman';
        Size:=16;
        Font.Color:=clWhite;
        Font.Style:=Font.Style+[fsBold];
      end;
      Alignment:=taCenter;
      Caption:='Вас приветствует мастер установки "botva2.dll"';
    end;

  with TLabel.Create(WizardForm) do begin
    AutoSize:=False;
    Parent:=WizardForm;
    Transparent:=True;
    SetBounds(0,200,WizardForm.ClientWidth,30);
    with Font do begin
      Name:='Times New Roman';
      Size:=16;
      Font.Color:=clBlack;
      Font.Style:=Font.Style+[fsBold];
    end;
    Alignment:=taCenter;
    Caption:='Вас приветствует мастер установки "botva2.dll"';
  end;

  with TLabel.Create(WizardForm) do begin
    AutoSize:=False;
    Parent:=WizardForm;
    Transparent:=True;
    SetBounds(50,300,WizardForm.ClientWidth-100,200);
    WordWrap:=True;
    with Font do begin
      Name:='Times New Roman';
      Size:=13;
      Font.Color:=clWhite;
      Font.Style:=Font.Style+[fsBold];
    end;
    Alignment:=taCenter;
    Caption:='Программа установит botva2.dll на ваш компутер'#13#13'Рекомендуется закрыть все прочие приложения перед тем как продолжить'#13#13+
             'Нажмите "Далее", чтобы продолжить, или "Отмена", чтобы выйти из программы установки';    //с текстом тоже сам
  end;

  ExtractTemporaryFile('nfs.jpg');
  ExtractTemporaryFile('Panel1.png');
  ExtractTemporaryFile('Panel2.png');
  ExtractTemporaryFile('glass2.png');
  ExtractTemporaryFile('mspaint.png');

  ExtractTemporaryFile('1.jpg');
  ExtractTemporaryFile('2.jpg');
  ExtractTemporaryFile('3.jpg');
  ExtractTemporaryFile('4.jpg');
  ExtractTemporaryFile('5.jpg');
  ExtractTemporaryFile('6.jpg');
  ExtractTemporaryFile('7.jpg');
  ExtractTemporaryFile('8.jpg');

  //фоновый рисунок на MainForm
  //with MainForm do begin
  //  //MainForm.BorderStyle:=bsNone; //косячная херня - пропадает надпись в заголовке WizardForm, сделаем по другому
  //  SetWindowLong(Handle,-16,GetWindowLong(Handle,-16) and not $C40000);
  //  Left:=0;
  //  Top:=0;
  //  ClientWidth:=GetSystemMetrics(0);
  //  ClientHeight:=GetSystemMetrics(1);
  //  ImgLoad(Handle,ExpandConstant('{tmp}\nfs.jpg'),0,0,ClientWidth,ClientHeight,True,False);
  //  ImgApplyChanges(Handle);
  //  Visible:=True;
  //end;

  //добавляем фоновый рисунок на WizardForm
  h:=WizardForm.Handle;
  WFBkg:=ImgLoad(h,ExpandConstant('{tmp}\nfs.jpg'),0,0,WizardForm.ClientWidth,WizardForm.ClientHeight,True,True);
  //заполняем массив для слайд-шоу
  SetArrayLength(AImg,8);
  for i:=0 to GetArrayLength(AImg)-1 do begin
    AImg[i]:=ImgLoad(h,ExpandConstant('{tmp}\'+IntToStr(i+1)+'.jpg'),0,0,WizardForm.ClientWidth,WizardForm.ClientHeight,True,True);
    ImgSetVisibility(AImg[i],False);
  end;

  l:=0;
  t:=90;
  ImgLoad(h,ExpandConstant('{tmp}\mspaint.png'),280,365,0,0,False,True);
  ImgLoad(h,ExpandConstant('{tmp}\glass2.png'),40,180,WizardForm.ClientWidth-80,300,True,True);
  ImgLoad(h,ExpandConstant('{tmp}\Panel1.png'),0,t,WizardForm.ClientWidth,20,True,False);
  img:=ImgLoad(h,ExpandConstant('{tmp}\Panel2.png'),0,t,0,0,False,False);

  //заменим стандартные NextButton,CancelButton,BackButton на скинированные кнопки
  //скрывать стандартные кнопки нельзя, поэтому просто поставим им высоту и ширину 0
  ExtractTemporaryFile('button.png');

  with WizardForm.CancelButton do begin
    hCancelBtn:=BtnCreate(WizardForm.Handle,Left-8,Top-8,Width+16,Height+16,ExpandConstant('{tmp}\button.png'),18,False);
    BtnSetEvent(hCancelBtn,BtnClickEventID,WrapBtnCallback(@WizardFormBtnClick,1));
    BtnSetFont(hCancelBtn,Font.Handle);
    BtnSetFontColor(hCancelBtn,$DAE369,$DAE369,$DAE369,$B6B6B6);
    Width:=0;
    Height:=0;
  end;
  with WizardForm.NextButton do begin
    hNextBtn:=BtnCreate(WizardForm.Handle,Left-8,Top-8,Width+16,Height+16,ExpandConstant('{tmp}\button.png'),18,False);
    BtnSetEvent(hNextBtn,BtnClickEventID,WrapBtnCallback(@WizardFormBtnClick,1));
    BtnSetFont(hNextBtn,Font.Handle);
    BtnSetFontColor(hNextBtn,$DAE369,$DAE369,$DAE369,$B6B6B6);
    Width:=0;
    Height:=0;
  end;
  with WizardForm.BackButton do begin
    hBackBtn:=BtnCreate(WizardForm.Handle,Left-8,Top-8,Width+16,Height+16,ExpandConstant('{tmp}\button.png'),18,False);
    BtnSetEvent(hBackBtn,BtnClickEventID,WrapBtnCallback(@WizardFormBtnClick,1));
    BtnSetFont(hBackBtn,Font.Handle);
    BtnSetFontColor(hBackBtn,$DAE369,$DAE369,$DAE369,$B6B6B6);
    Width:=0;
    Height:=0;
  end;

  //ну, еще пару кнопок для примера Button.Enabled:=False / Button.Enabled:=True
  ExtractTemporaryFile('button2.png');
  ExtractTemporaryFile('click.wav');
  ExtractTemporaryFile('enter.wav');
  ExtractTemporaryFile('leave.wav');

  Font:=TFont.Create; //используем для этих кнопок свой шрифт
  with Font do begin
    Name:='Georgia';
    Style:=[fsBold];
  end;
  //первая кнопка
  hTestBtn1:=BtnCreate(WizardForm.Handle,200,485,100,44,ExpandConstant('{tmp}\button2.png'),18,True);
  BtnSetEvent(hTestBtn1,BtnClickEventID,WrapBtnCallback(@TestBtn1Click,1));
  BtnSetFont(hTestBtn1,Font.Handle);
  BtnSetFontColor(hTestBtn1,$22A4CA,$22A4CA,$22A4CA,$B6B6B6);
  BtnSetText(hTestBtn1,'Disable');
  BtnSetCursor(hTestBtn1,GetSysCursorHandle(32649)); //установим стандартный курсор OCR_HAND=32649, константы OCR_... ищем в инете
  //вторая кнопка
  hTestBtn2:=BtnCreate(WizardForm.Handle,80,485,120,44,ExpandConstant('{tmp}\button.png'),18,False);
  BtnSetEvent(hTestBtn2,BtnClickEventID,WrapBtnCallback(@TestBtn2Click,1));
  BtnSetFont(hTestBtn2,Font.Handle);
  BtnSetFontColor(hTestBtn2,$DAE369,$DAE369,$DAE369,$B6B6B6);
  BtnSetText(hTestBtn2,'CSmania.ru');
  ExtractTemporaryFile('cursor.ani');
  BtnSetCursor(hTestBtn2,LoadCursorFromFile(ExpandConstant('{tmp}\cursor.ani'))); //установим свой анимированный курсор

  //а это пример, который ты просил
  ImgLoad(WizardForm.Handle,ExpandConstant('{tmp}\mspaint.png'),90,330,123,123,True,False);
  ExtractTemporaryFile('glassbutton.png');
  hGlassButton:=BtnCreate(WizardForm.Handle,80,320,143,143,ExpandConstant('{tmp}\glassbutton.png'),0,False);
  BtnSetEvent(hGlassButton,BtnClickEventID,WrapBtnCallback(@GlassBtnClick,1));

  //установим еще события для hTestBtn2 и отразим их в BtnEventLabel
  BtnEventLabel:=TLabel.Create(WizardForm);
  with BtnEventLabel do begin
    Parent:=WizardForm;
    Transparent:=True;
    Left:=10;
    Top:=500;
    Font.Color:=clWhite;
    Caption:='';
  end;
  //BtnSetEvent(hTestBtn2,BtnMouseMoveEventID,WrapBtnCallback(@TestBtn2Move,1)); //закомментирую чтобы MouseEnter было видно
  BtnSetEvent(hTestBtn2,BtnMouseEnterEventID,WrapBtnCallback(@TestBtn2Enter,1));
  BtnSetEvent(hTestBtn2,BtnMouseLeaveEventID,WrapBtnCallback(@TestBtn2Leave,1));

  ImgApplyChanges(WizardForm.Handle);

end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  if CurPageID<>wpFinished then begin
    ALabel[CurrentLabel].Font.Color:=clGray;
    ALabel[CurrentLabel].Top:=ALabel[CurrentLabel].Top-1;
    CurrentLabel:=CurrentLabel+1;
    ALabel[CurrentLabel].Font.Color:=clRed;
    ALabel[CurrentLabel].Top:=ALabel[CurrentLabel].Top+1;
  end;

  l:=l+PanelWidth;
  ImgSetPosition(img,l,t,w,h);
  ImgApplyChanges(WizardForm.Handle);
  
  Result:=True;
end;

function BackButtonClick(CurPageID: Integer): Boolean;
begin
  ALabel[CurrentLabel].Font.Color:=clGray;
  ALabel[CurrentLabel].Top:=ALabel[CurrentLabel].Top-1;
  CurrentLabel:=CurrentLabel-1;
  ALabel[CurrentLabel].Font.Color:=clRed;
  ALabel[CurrentLabel].Top:=ALabel[CurrentLabel].Top+1;

  l:=l-PanelWidth;
  ImgSetPosition(img,l,t,w,h);
  ImgApplyChanges(WizardForm.Handle);
  
  Result:=True;
end;

procedure DeinitializeSetup;
begin
  gdipShutdown;
  Font.Free;
  SetArrayLength(AImg,0);
  SetArrayLength(ALabel,0);
end;




