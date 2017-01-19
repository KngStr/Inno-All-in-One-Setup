;Created by South.Tver 02.2010
;пример работы с изображениями - прогрессбары

#include "botva2.ish"
#include "ProgressBar.ish"

[Setup]
AppName=progressbar by South.Tver
AppVerName=progressbar by South.Tver
DefaultDirName={pf}\progressbar
OutputBaseFilename=setup
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: Files\*; Flags: dontcopy

[Code]

var
  PB1,PB2 : TImgPB;
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
  ImgPBSetPosition(PB1,np);
  ImgPBSetPosition(PB2,np);
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
  ImgPBDelete(PB2);
  ImgApplyChanges(WizardForm.Handle);
end;

function InitializeSetup:boolean;
begin
  PDir('{# Botva2_Dll }');
  Result:=True;
end;

procedure InitializeWizard;
begin
  ExtractTemporaryFile('nfs.jpg');
  ExtractTemporaryFile('pbbkg.png');
  ExtractTemporaryFile('pb.png');
  ExtractTemporaryFile('pbbkg2.png');
  ExtractTemporaryFile('pb2.png');

  with WizardForm do begin
    InnerNotebook.Hide;
    OuterNotebook.Hide;
    Bevel.Hide;
  end;

  ImgLoad(WizardForm.Handle,ExpandConstant('{tmp}\nfs.jpg'),0,0,WizardForm.ClientWidth,WizardForm.ClientHeight,True,True);
  PB1:=ImgPBCreate(WizardForm.Handle, ExpandConstant('{tmp}\pbbkg.png'), ExpandConstant('{tmp}\pb.png'), 10, 250, WizardForm.ClientWidth-20, 25);
  PB2:=ImgPBCreate(WizardForm.Handle, ExpandConstant('{tmp}\pbbkg2.png'), ExpandConstant('{tmp}\pb2.png'), 10, 285, WizardForm.ClientWidth-20, 25);
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

