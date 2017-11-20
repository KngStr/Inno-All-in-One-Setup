;Created by South.Tver 02.2010

;т.к. BtnGetText на больших текстах (как в примере BtnPrint.iss) будет прилично тормозить,
;больше не тормозит, но пример оставлю, раз написан
;то вот аналогичный пример без BtnGetText

#include "botva2.ish"

[Setup]
AppName=BtnPrint by South.Tver
AppVerName=BtnPrint by South.Tver
DefaultDirName={pf}\BtnPrint
OutputBaseFilename=setup
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: Files\*; Flags: dontcopy

[Code]
type
  TTimerProc = procedure(HandleW, msg, idEvent, TimeSys: LongWord);

var
  hBtn:HWND;
  CurSimbol:integer;
  TimerID:Longword;
  TestText:ansistring;

function SetTimer(hWnd, nIDEvent, uElapse, lpTimerFunc: LongWord): LongWord; external 'SetTimer@user32.dll stdcall';
function KillTimer(hWnd, nIDEvent: LongWord): LongWord; external 'KillTimer@user32.dll stdcall';
function WrapTimerProc(callback:TTimerProc; paramcount:integer):LongWord; {# CallbackCtrl_External };

procedure OnTimer(HandleW, msg, idEvent, TimeSys: LongWord);
begin
  CurSimbol:=CurSimbol+1;
  if CurSimbol>Length(TestText) then begin
    KillTimer(0, TimerID);
    Exit;
  end;
  BtnSetText(hBtn,PAnsiChar(Copy(TestText,1,CurSimbol)));
end;

procedure BtnClick(hBtn:HWND);
begin
  if not BtnGetChecked(hBtn) then begin
    KillTimer(0, TimerID);
    BtnSetText(hBtn,'');
    CurSimbol:=0;
  end else TimerID:=SetTimer(0, 0, 100, WrapTimerProc(@OnTimer, 4));
end;

function InitializeSetup:boolean;
begin
  PDir('{# Botva2_Dll }');
  PDir('{# CallbackCtrl_Dll }');
  Result:=True;
end;

procedure InitializeWizard;
begin
  with WizardForm do begin
    InnerNotebook.Hide;
    OuterNotebook.Hide;
    Bevel.Hide;
    Width:=700;
    Height:=700;
    NextButton.Top:=ClientHeight-50;
    CancelButton.Top:=ClientHeight-50;
  end;

  hBtn:=BtnCreate(WizardForm.Handle,-50,-50,WizardForm.ClientWidth+100,WizardForm.ClientHeight+100,'button2.png',18,True);
  CurSimbol:=0;

  TestText:='ЛИЦЕНЗИОННОЕ СОГЛАШЕНИЕ '+
            'Эта лицензия действительна только для граждан стран бывшего СССР. '+
            'Граждане других стран обязаны пользоваться shareware-версией '+
            'программы, которую можно бесплатно скачать с сайта '+
            'http://www.ice-graphics.com/ICEReader '+
            'Программа ICE Book Reader Professional Russian Edition '+
            'распространяется как freeware. '+
            'Все авторские права на программу ICE Book Reader Professional Russian '+
            'Edition принадлежат ICE Graphics. '+
            'Граждане стран бывшего СССР имеют право использовать данную версию '+
            'программы ICE Book Reader Professional Russian Edition в '+
            'некоммерческих целях бесплатно. '+
            'Если условия данной лицензии не устраивают попадающих под ее действие '+
            'лиц, они имеют право воспользоваться на общих основаниях лицензией, '+
            'приведенной в файле License.txt. Для коммерческого использования '+
            'программой ICE Book Reader Professional Russian Edition необходимо '+
            'получить письменное разрешение ICE Graphics (support@ice-graphics.com). '+
            'ICE Graphics не гарантирует оперативной технической поддержки. '+
            'ICE Graphics оставляет за собой право отменить действие данной '+
            'лицензии для любой из следующих версий программы ICE Book Reader '+
            'Professional Russian Edition. '+
            'Программа ICE Book Reader Professional Russian Edition '+
            'распространяется свободно, при условии того, что настоящий дистрибутив '+
            'не изменен. Ни одно частное лицо или организация не может брать плату '+
            'за распространение ICE Book Reader Professional Russian Edition без '+
            'письменного разрешения ICE Graphics. '+
            'ПРОГРАММА ICE Book Reader Professional Russian Edition ПОСТАВЛЯЕТСЯ ПО '+
            'ПРИНЦИПУ "КАК ЕСТЬ" ("AS IS"). НИКАКИХ ГАРАНТИЙ НЕ ПРИЛАГАЕТСЯ И НЕ '+
            'ПРЕДУСМАТРИВАЕТСЯ. ВЫ ИСПОЛЬЗУЕТЕ ЭТО ПРОГРАММНОЕ ОБЕСПЕЧЕНИЕ НА СВОЙ '+
            'РИСК. ICE Graphics НЕ БУДЕТ ОТВЕЧАТЬ НИ ЗА КАКИЕ ПОТЕРИ ИЛИ ИСКАЖЕНИЯ '+
            'ДАННЫХ, ЛЮБУЮ УПУЩЕННУЮ ВЫГОДУ В ПРОЦЕССЕ ИСПОЛЬЗОВАНИЯ ИЛИ '+
            'НЕПРАВИЛЬНОГО ИСПОЛЬЗОВАНИЯ ЭТОГО ПРОГРАММНОГО ОБЕСПЕЧЕНИЯ. ';

  BtnSetTextAlignment(hBtn,40,30,balLeft);
  BtnSetFontColor(hBtn,$DAE369,$FF0000,$00FF00,$0000FF);
  BtnSetEvent(hBtn,BtnClickEventID,WrapBtnCallback(@BtnClick,1));
end;

procedure DeinitializeSetup();
begin
  KillTimer(0, TimerID);
  gdipShutdown;
end;

