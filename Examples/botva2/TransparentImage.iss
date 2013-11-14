;Created by South.Tver 02.2011
;пример работы ??прозрачность?изображения

#include "botva2.ish"
#include "TrackBar.ish"

[Setup]
AppName=Transparent Image
AppVerName=Transparent Image
DefaultDirName={pf}\Transparent Image
SolidCompression=yes
Compression=lzma2/ultra64
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: Files\*; DestDir: "{tmp}"; Flags: dontcopy sortfilesbyextension

[Code]
var
  img1,
  img2 : Longint;
  tb   : integer;
  L    : TLabel;

function InitializeSetup:boolean;
begin
  PDir('{# Botva2_Dll }');
  PDir('{# CallbackCtrl_Dll }');

  Result:=True;
end;

procedure TBChangePos(pos:integer);
var
  t:integer;
begin
  t:=pos*255 div 100;
  ImgSetTransparent(img2,t);
  L.Caption:=IntToStr(t);
  //ImgApplyChanges(WizardForm.Handle);
end;

procedure InitializeWizard;
var
  i:integer;
begin
  with WizardForm do begin
    Bevel.Hide;
    InnerNotebook.Hide;
    OuterNotebook.Hide;
    ClientWidth:=500;
    ClientHeight:=550;
    Position:=poScreenCenter;
    NextButton.Width:=0;
    CancelButton.Top:=515;
  end;

  ExtractTemporaryFile('l4d.jpg');
  ExtractTemporaryFile('5.jpg');
  img1:=ImgLoad(WizardForm.Handle,ExpandConstant('{tmp}')+'\l4d.jpg',0,0,0,0,False,True);
  img2:=ImgLoad(WizardForm.Handle,ExpandConstant('{tmp}')+'\5.jpg',0,0,500,500,True,True);
  ImgSetVisiblePart(img2,149,21,500,500);

  L:=TLabel.Create(WizardForm);
  with L do begin
    SetBounds(170,515,50,21);
    AutoSize:=True;
    Font.Style:=[fsBold];
    Parent:=WizardForm;
    Transparent:=True;
  end;

  ExtractTemporaryFile('trackbar_btn.png');
  ExtractTemporaryFile('trackbar_bkg.png');
  TB:=ImgTBCreate(WizardForm.Handle,ExpandConstant('{tmp}\trackbar_bkg.png'),ExpandConstant('{tmp}\trackbar_btn.png'),10,517,150,10,7,163,507,18,33,2);
  ImgTBSetChangePosEvent(TB,@TBChangePos); 
  ImgTBSetPosition(TB,0);

  ImgApplyChanges(WizardForm.Handle);
end;

procedure DeinitializeSetup;
begin
  gdipShutdown;
end;
