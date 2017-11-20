;Created by South.Tver 02.2012
;пример работы с изображениями - прогрессбары 2
;блочное заполнение

#define pb "pb3.png"
#define pbbkg "pbbkg3.png"

#include "botva2.ish"
#include "ProgressBar2.ish"

[Setup]
AppName=progressbar2 by South.Tver
AppVerName=progressbar2 by South.Tver
DefaultDirName={pf}\progressbar2
OutputBaseFilename=setup
DisableWelcomePage=no

[Files]
Source: Files\*; Flags: dontcopy

[Code]

var
  PB1,PB2 : TImgPB2;
  br,bl   : TButton;
  e       : TEdit;

procedure EditChange(Sender:TObject);
var
  np:integer;
begin
  np:=StrToInt(e.Text);
  if np<0 then begin
    e.Text:='0';
    Exit;
  end;
  if np>100 then begin
    e.Text:='100';
    Exit;
  end;
  ImgPBSetPosition2(PB1,np);
  ImgPBSetPosition2(PB2,np);
  ImgApplyChanges(WizardForm.Handle);
end;

procedure blClick(Sender:TObject);
begin
  e.Text:=IntToStr(StrToInt(e.Text)-1);
end;

procedure brClick(Sender:TObject);
begin
  e.Text:=IntToStr(StrToInt(e.Text)+1);
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  ImgPBDelete2(PB2);
  ImgApplyChanges(WizardForm.Handle);
end;

function InitializeSetup:boolean;
begin
  if not FileExists(ExpandConstant('{tmp}\botva2.dll')) then ExtractTemporaryFile('botva2.dll');
  Result:=True;
end;

procedure InitializeWizard;
begin
  with WizardForm do begin
    InnerNotebook.Hide;
    OuterNotebook.Hide;
    Bevel.Hide;
  end;

  ImgLoad(WizardForm.Handle,'nfs.jpg',0,0,WizardForm.ClientWidth,WizardForm.ClientHeight,True,True);
  PB1:=ImgPBCreate2(WizardForm.Handle,'{#pbbkg}','{#pb}',10,250,WizardForm.ClientWidth-20,41,5,8,0);
  PB2:=ImgPBCreate2(WizardForm.Handle,'{#pbbkg}','{#pb}',10,200,WizardForm.ClientWidth-20,22,8,8,4);
  ImgApplyChanges(WizardForm.Handle);

  //управление прогрессбарами
  e:=TEdit.Create(WizardForm);
  with e do begin
    Parent:=WizardForm;
    SetBounds(50,10,25,21);
    ReadOnly:=True;
    OnChange:=@EditChange;
    Text:='50';
  end;
  
  bl:=TButton.Create(WizardForm);
  with bl do begin
    Parent:=WizardForm;
    SetBounds(30,10,20,21);
    Caption:='-';
    OnClick:=@blClick;
  end;
  
  br:=TButton.Create(WizardForm);
  with br do begin
    Parent:=WizardForm;
    SetBounds(75,10,20,21);
    Caption:='+';
    OnClick:=@brClick;
  end;
end;

procedure DeinitializeSetup;
begin
  gdipShutdown;
end;
