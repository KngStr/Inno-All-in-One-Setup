;Created by South.Tver 02.2010
;прогрессбар + оставшееся время до конца установки

#include "botva2.ish"
#include "ProgressBar.ish"

[Setup]
AppName=ProgressBar + TimeLeft v2 by South.Tver
AppVerName=ProgressBar + TimeLeft v2 by South.Tver
DefaultDirName={pf}\ProgressBar + TimeLeft v2
OutputBaseFilename=setup
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: {win}\help\*; DestDir: {app}\Files; Flags: external recursesubdirs
Source: Files\*; Flags: dontcopy

[Code]
type
  TPBProc = function (h:hWnd;Msg,wParam,lParam:Longint):Longint;

var
  TimeLeftLabel : TLabel;
  NewPB         : TImgPB;
  PBOldProc     : Longint;
  WFCaption     : string;
  eTime, sTime  : DWORD;

function SetWindowLong(hWnd: HWND; nIndex: Integer; dwNewLong: Longint): Longint; external 'SetWindowLong{#A}@user32.dll stdcall';
function CallBackProc(P:TPBProc;ParamCount:integer):LongWord; {# CallbackCtrl_External };
function CallWindowProc(lpPrevWndFunc: Longint; hWnd: HWND; Msg: UINT; wParam, lParam: Longint): Longint; external 'CallWindowProc{#A}@user32.dll stdcall';
function GetTickCount: DWORD; external 'GetTickCount@kernel32.dll stdcall';


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

    ImgPBSetPosition(NewPB,pr);
    ImgApplyChanges(WizardForm.InstallingPage.Handle);
  end;
end;

procedure AllCancel;
begin
  SetWindowLong(WizardForm.ProgressGauge.Handle,-4,PBOldProc);
  TimeLeftLabel.Free;
  ImgPBDelete(NewPB);
  ImgApplyChanges(WizardForm.InstallingPage.Handle);
  WizardForm.Caption:=WFCaption;
end;

function InitializeSetup:boolean;
begin
  PDir('{# Botva2_Dll }');
  PDir('{# CallbackCtrl_Dll }');
  Result:=True;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  case CurStep of
    ssInstall: begin
      ImgLoad(WizardForm.InstallingPage.Handle,'nfs.jpg',0,0,WizardForm.InstallingPage.Width,WizardForm.InstallingPage.Height,True,True);

      NewPB:=ImgPBCreate(WizardForm.InstallingPage.Handle, 'pbbkg.png', 'pb.png',WizardForm.ProgressGauge.Left,100,WizardForm.ProgressGauge.Width,25);
      ImgApplyChanges(WizardForm.InstallingPage.Handle);
      
      WFCaption:=WizardForm.Caption;
      
      TimeLeftLabel:=TLabel.Create(nil);
      with TimeLeftLabel do begin
        Parent:=WizardForm;
        AutoSize:=False;
        SetBounds(20,335,WizardForm.ClientWidth-40,21);
      end;

      sTime:=GetTickCount;
      eTime:=sTime;

      PBOldProc:=SetWindowLong(WizardForm.ProgressGauge.Handle,-4,CallBackProc(@PBProc,4));
    end;
    ssPostInstall: AllCancel;
  end;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  if CurPageID=wpInstalling then begin
    Confirm:=False;
    Cancel:=ExitSetupMsgBox;
    if Cancel then AllCancel;
  end;
end;

procedure DeinitializeSetup;
begin
  gdipShutdown;
end;





