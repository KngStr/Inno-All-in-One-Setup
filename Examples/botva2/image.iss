;Created by South.Tver 02.2010
;пример работы с изображениями

#include "botva2.ish"

[Setup]
AppName=DrawImageExample by South.Tver
AppVerName=DrawImageExample by South.Tver
DefaultDirName={pf}\ImageExample
OutputBaseFilename=setup
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: Files\*; Flags: dontcopy

[Code]
var
  Btn1,Btn2,Btn3,Btn4,Btn5,Btn6:TButton;
  img,img2,img3:Longint;
  ImgLeft,ImgTop:integer;

procedure Btn1Click(Sender:TObject);
begin
//  img:=ImgLoad(WizardForm.Handle,ExpandConstant('{tmp}\mspaint.png'),ImgLeft,ImgTop,0,0,False,True);
  img:=ImgLoad(WizardForm.Handle,ExpandConstant('{tmp}\mspaint.png'),ImgLeft,ImgTop,100,100,True,True);
  ImgApplyChanges(WizardForm.Handle);
  
  Btn1.Enabled:=False;
  Btn2.Enabled:=True;
  Btn3.Enabled:=True;
  Btn4.Enabled:=True;
  Btn6.Enabled:=True;
end;

procedure Btn2Click(Sender:TObject);
begin
  ImgLeft:=ImgLeft+60;
  ImgTop:=ImgTop+50;
  if (ImgLeft>=WizardForm.ClientWidth-50) or (ImgTop>=WizardForm.ClientHeight-50) then begin
    ImgLeft:=0;
    ImgTop:=0;
  end;
  ImgSetPosition(img,ImgLeft,ImgTop,100,100);
  ImgApplyChanges(WizardForm.Handle);
end;

procedure Btn3Click(Sender:TObject);
begin
  ImgSetVisibility(img,not ImgGetVisibility(img));
  ImgApplyChanges(WizardForm.Handle);
  if ImgGetVisibility(img) then Btn3.Caption:='Hide mspaint.png' else Btn3.Caption:='Show mspaint.png';
end;

procedure Btn4Click(Sender:TObject);
begin
  ImgRelease(img);
  ImgApplyChanges(WizardForm.Handle);
  Btn1.Enabled:=True;
  Btn2.Enabled:=False;
  Btn3.Enabled:=False;
  Btn3.Caption:='Hide mspaint.png';
  Btn4.Enabled:=False;
  Btn6.Enabled:=False;
end;

procedure Btn5Click(Sender:TObject);
begin
  ImgSetVisibility(img2,not ImgGetVisibility(img2));
  ImgSetVisibility(img3,not ImgGetVisibility(img3));
  ImgApplyChanges(WizardForm.Handle);
end;


procedure Btn6Click(Sender:TObject);
begin
  ImgSetVisiblePart(img,50,50,100,100);
  ImgApplyChanges(WizardForm.Handle);
end;


function InitializeSetup:boolean;
begin
  PDir('{# Botva2_Dll }');
  Result:=True;
end;

procedure InitializeWizard;
begin
  with WizardForm do begin
    InnerNotebook.Hide;
    OuterNotebook.Hide;
    Bevel.Hide;
  end;
  
  ExtractTemporaryFile('mspaint.png');
  ImgLeft:=0;
  ImgTop:=0;

  Btn1:=TButton.Create(WizardForm);
  with Btn1 do begin
    Parent:=WizardForm;
    SetBounds(300,10,160,25);
    Caption:='Load mspaint.png'
    OnClick:=@Btn1Click;
  end;

  Btn2:=TButton.Create(WizardForm);
  with Btn2 do begin
    Parent:=WizardForm;
    SetBounds(300,40,160,25);
    Caption:='Remove mspaint.png'
    OnClick:=@Btn2Click;
    Enabled:=False;
  end;

  Btn3:=TButton.Create(WizardForm);
  with Btn3 do begin
    Parent:=WizardForm;
    SetBounds(300,70,160,25);
    Caption:='Hide mspaint.png';
    OnClick:=@Btn3Click;
    Enabled:=False;
  end;

  Btn4:=TButton.Create(WizardForm);
  with Btn4 do begin
    Parent:=WizardForm;
    SetBounds(300,100,160,25);
    Caption:='Delete mspaint.png'
    OnClick:=@Btn4Click;
    Enabled:=False;
  end;

  Btn5:=TButton.Create(WizardForm);
  with Btn5 do begin
    Parent:=WizardForm;
    SetBounds(300,130,160,25);
    Caption:='Change background'
    OnClick:=@Btn5Click;
  end;


  Btn6:=TButton.Create(WizardForm);
  with Btn6 do begin
    Parent:=WizardForm;
    SetBounds(300,160,160,25);
    Caption:='Show part of mspaint.png'
    OnClick:=@Btn6Click;
    Enabled:=False;
  end;

  ExtractTemporaryFile('l4d.jpg');
  ExtractTemporaryFile('nfs.jpg');
  img2:=ImgLoad(WizardForm.Handle,ExpandConstant('{tmp}\l4d.jpg'),0,0,WizardForm.ClientWidth,WizardForm.ClientHeight,True,True);
  img3:=ImgLoad(WizardForm.Handle,ExpandConstant('{tmp}\nfs.jpg'),0,0,WizardForm.ClientWidth,WizardForm.ClientHeight,True,True);
  ImgSetVisibility(img3,False);
  ImgApplyChanges(WizardForm.Handle);

end;

procedure DeinitializeSetup;
begin
  gdipShutDown;
end;

