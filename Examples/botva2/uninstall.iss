;Created by South.Tver 02.2010
;пример "скинирования" анинсталла

#Define Plugin_UnInst True
#Define Plugin_UnInst_Dir "UninsFiles"

#include "botva2.ish"
#include "ProgressBar.ish"

[Setup]
AppName=Uninstall by South.Tver
AppVerName=Uninstall by South.Tver
DefaultDirName={pf}\ImgUninstall
OutputBaseFilename=setup
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: {win}\help\*; DestDir: {app}\Files; Flags: external recursesubdirs
Source: {fonts}\*; DestDir: {app}\Files; Flags: external recursesubdirs

Source: Files\*; Flags: dontcopy
Source: Files\*; DestDir:{app}\{#Plugin_UnInst_Dir}

[Code]

type
  TPBProc = function (h:hWnd;Msg,wParam,lParam:Longint):Longint;

var
  UninstPB: TImgPB;
  UninstPBOldProc:Longint;
  UFCaption:string;
  
function SetWindowLong(hWnd: HWND; nIndex: Integer; dwNewLong: Longint): Longint; external 'SetWindowLong{#A}@user32.dll stdcall';
function CallWindowProc(lpPrevWndFunc: Longint; hWnd: HWND; Msg: UINT; wParam, lParam: Longint): Longint; external 'CallWindowProc{#A}@user32.dll stdcall';
function CallBackProc(P:TPBProc;ParamCount:integer):LongWord; {# CallbackCtrl_External };

function UninstPBProc(h:hWnd;Msg,wParam,lParam:Longint):Longint;
var
  pr,i1,i2:Extended;
  p:string;
begin
  if Msg=$2 then SetWindowLong(h,-4,UninstPBOldProc);

  Result:=CallWindowProc(UninstPBOldProc,h,Msg,wParam,lParam);
  
  if (Msg=$402) and (UninstallProgressForm.ProgressBar.Position>UninstallProgressForm.ProgressBar.Min) then begin
    i1:=UninstallProgressForm.ProgressBar.Position-UninstallProgressForm.ProgressBar.Min;
    i2:=UninstallProgressForm.ProgressBar.Max-UninstallProgressForm.ProgressBar.Min;
    pr:=(i1*100)/i2;
    p:=' - ['+Format('%f',[pr])+'%]';
    StringChange(p,',','.');

    UninstallProgressForm.Caption:=UFCaption+p;

    ImgPBSetPosition(UninstPB,pr);
    ImgApplyChanges(UninstallProgressForm.InstallingPage.Handle);
  end;
end;

function InitializeUninstall(): Boolean;
begin
  PDir('{# Botva2_Dll }');
  PDir('{# CallbackCtrl_Dll }');
  
  PDir('nfs.jpg');
  PDir('pb.png');
  PDir('pbbkg.png');
  Result:=True;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  if CurUninstallStep=usUninstall then begin
    UninstallProgressForm.ProgressBar.Hide;
    ImgLoad(UninstallProgressForm.InstallingPage.Handle,ExpandConstant('{tmp}\nfs.jpg'),0,0,UninstallProgressForm.InstallingPage.Width,UninstallProgressForm.InstallingPage.Height,True,True);
    UninstPB:=ImgPBCreate(UninstallProgressForm.InstallingPage.Handle, ExpandConstant('{tmp}\pbbkg.png'), ExpandConstant('{tmp}\pb.png'),UninstallProgressForm.ProgressBar.Left,100,UninstallProgressForm.ProgressBar.Width,25);
    ImgApplyChanges(UninstallProgressForm.InstallingPage.Handle);
    UFCaption:=UninstallProgressForm.Caption;
    UninstPBOldProc:=SetWindowLong(UninstallProgressForm.ProgressBar.Handle,-4,CallBackProc(@UninstPBProc,4));
  end;
end;

procedure DeinitializeUninstall;
begin
  gdipShutdown;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  ResultCode: Integer;
begin
  if CurStep = ssDone then Exec(ExpandConstant('{uninstallexe}'), '', '', SW_SHOW, ewNoWait, ResultCode);
end;

