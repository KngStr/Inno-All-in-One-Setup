;Created by South.Tver 09.2010
;пример использования самопальных трэкбаров

#include "botva2.ish"
#include "TrackBar.ish"
#include "ProgressBar.ish"

[Setup]
AppName=TrackBar by South.Tver
AppVerName=TrackBar by South.Tver
DefaultDirName={pf}\TrackBar
OutputBaseFilename=setup
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: Files\*; Flags: dontcopy

[Code]

var
  TB,TB2 : integer;
  L,L2   : TLabel;
  PB1    : TImgPB;

function InitializeSetup:boolean;
begin
  PDir('{# Botva2_Dll}');
  PDir('{# CallbackCtrl_Dll}');
  Result:=True;
end;

procedure TBChangePos(pos:integer);
begin
  L.Caption:=IntToStr(pos);
  ImgPBSetPosition(PB1,pos);
  //ImgApplyChanges(WizardForm.Handle);
end;

procedure TBChangePos2(pos:integer);
begin
  L2.Caption:='текущая позиция = '+IntToStr(pos);
end;

procedure InitializeWizard;
var
  i:integer;
begin
  //скрываем элементы формы
  with WizardForm do begin
    InnerNotebook.Hide;
    OuterNotebook.Hide;
    Bevel.Hide;
  end;
  //лэйблы для отображения инфы
  L:=TLabel.Create(WizardForm);
  with L do begin
    SetBounds(80,140,150,21);
    AutoSize:=True;
    Font.Color:=clWhite;
    Font.Style:=[fsBold];
    Parent:=WizardForm;
    Transparent:=True;
  end;
  L2:=TLabel.Create(WizardForm);
  with L2 do begin
    SetBounds(200,140,150,21);
    AutoSize:=True;
    Font.Color:=clWhite;
    Font.Style:=[fsBold];
    Caption:='текущая позиция = 0';
    Parent:=WizardForm;
    Transparent:=True;
  end;
  
  //фоновая картинка
  ImgLoad(WizardForm.Handle,'nfs.jpg',0,0,WizardForm.ClientWidth,WizardForm.ClientHeight,True,True);
  //прогрессбар
  PB1:=ImgPBCreate(WizardForm.Handle, 'pbbkg.png', 'pb.png', 10, 250, WizardForm.ClientWidth-20, 25);
  //первый трэкбар
  TB:=ImgTBCreate(WizardForm.Handle,'trackbar_bkg.png','trackbar_btn.png',10,170,150,10,7,163,160,18,33,2);
  ImgTBSetChangePosEvent(TB,@TBChangePos); //при измененении позиции трэкбара TB будет выполняться процедура TBChangePos
  ImgTBSetPosition(TB,50);
  //второй трэкбар
  TB2:=ImgTBCreate(WizardForm.Handle,'trackbar_bkg.png','trackbar_btn.png',200,170,150,10,197,353,160,18,33,2);
  ImgTBSetChangePosEvent(TB2,@TBChangePos2); //при измененении позиции трэкбара TB2 будет выполняться процедура TBChangePos2

  ImgApplyChanges(WizardForm.Handle);
end;

procedure DeinitializeSetup;
begin
  gdipShutdown;
end;

