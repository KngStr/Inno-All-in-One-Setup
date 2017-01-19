;Created by South.Tver 02.2010

;пример работы ?кнопками созданными ?флагом IsCheckBtn=True
;?группировкой кнопок, когд?може?быть включена только одна кнопка из группы
;BtnSetChecked, BtnGetChecked, BtnSetText, BtnGetText, BtnSetEvent

#include "botva2.ish"

[Setup]
AppName=GroupCheckButton by South.Tver
AppVerName=GroupCheckButton by South.Tver
DefaultDirName={pf}\GroupCheckButton
OutputBaseFilename=setup
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: Files\*; Flags: dontcopy

[Code]
type
  TGroupBtn = array of HWND;

var
  Group1Btn: TGroupBtn;
  Group2Btn: TGroupBtn;
  Btn:TButton;

procedure Group1BtnClick(hBtn:HWND);
var
  i:integer;
begin
  BtnSetChecked(hBtn,True);
  for i:=0 to GetArrayLength(Group1Btn)-1 do
    if Group1Btn[i]<>hBtn then BtnSetChecked(Group1Btn[i],False);
end;

procedure Group2BtnClick(hBtn:HWND);
var
  i:integer;
begin
  BtnSetChecked(hBtn,True);
  for i:=0 to GetArrayLength(Group2Btn)-1 do
    if Group2Btn[i]<>hBtn then BtnSetChecked(Group2Btn[i],False);
end;

function GetSelectedBtn(a:TGroupBtn):integer;
var
  i:integer;
begin
  for i:=0 to GetArrayLength(a)-1 do
    if BtnGetChecked(a[i]) then Break;
  Result:=i;
end;

procedure BtnClick(Sender:TObject);
var
  ind:integer;
  s:string;
begin
  ind:=GetSelectedBtn(Group1Btn);
  s:='перв? группа, выбран?кнопка - '+#10#13+'индекс = '+IntToStr(ind)+'; хэнд?= '+IntToStr(Group1Btn[ind])+'; текс?= '+BtnGetText(Group1Btn[ind]);
  ind:=GetSelectedBtn(Group2Btn);
  s:=s+#10#13+'втор? группа, выбран?кнопка - '+#10#13+'индекс = '+IntToStr(ind)+'; хэнд?= '+IntToStr(Group2Btn[ind])+'; текс?= '+BtnGetText(Group2Btn[ind]);
  MsgBox(s, mbInformation, MB_OK);
end;

function InitializeSetup:boolean;
begin
  PDir('{# Botva2_Dll }');
  PDir('{# CallbackCtrl_Dll }');
  Result:=True;
end;

procedure InitializeWizard;
var
  i:integer;
begin
  with WizardForm do begin
    InnerNotebook.Hide;
    OuterNotebook.Hide;
    Bevel.Hide;
  end;

  ExtractTemporaryFile('button2.png');

  //перв? группа
  SetArrayLength(Group1Btn,3)
  
  Group1Btn[0]:=BtnCreate(WizardForm.Handle,10,10,160,50,ExpandConstant('{tmp}\button2.png'),18,True);
  BtnSetEvent(Group1Btn[0],BtnClickEventID,WrapBtnCallback(@Group1BtnClick,1));
  BtnSetText(Group1Btn[0],'Group 1 Button 1');

  Group1Btn[1]:=BtnCreate(WizardForm.Handle,10,70,160,50,ExpandConstant('{tmp}\button2.png'),18,True);
  BtnSetEvent(Group1Btn[1],BtnClickEventID,WrapBtnCallback(@Group1BtnClick,1));
  BtnSetText(Group1Btn[1],'Group 1 Button 2');

  Group1Btn[2]:=BtnCreate(WizardForm.Handle,10,130,160,50,ExpandConstant('{tmp}\button2.png'),18,True);
  BtnSetEvent(Group1Btn[2],BtnClickEventID,WrapBtnCallback(@Group1BtnClick,1));
  BtnSetText(Group1Btn[2],'Group 1 Button 3');

  BtnSetChecked(Group1Btn[0],True);
  
  //втор? группа
  SetArrayLength(Group2Btn,5)
  for i:=0 to GetArrayLength(Group2Btn)-1 do begin
    Group2Btn[i]:=BtnCreate(WizardForm.Handle,250,10+60*(i),160,50,ExpandConstant('{tmp}\button2.png'),18,True);
    BtnSetEvent(Group2Btn[i],BtnClickEventID,WrapBtnCallback(@Group2BtnClick,1));
    BtnSetText(Group2Btn[i],'Group 2 Button '+IntToStr(i+1));
  end;
  BtnSetChecked(Group2Btn[GetArrayLength(Group2Btn)-1],True);
  
  Btn:=TButton.Create(WizardForm);
  with Btn do begin
    Parent:=WizardForm;
    SetBounds(10,265,160,25);
    Caption := 'Button Group State'
    OnClick:=@BtnClick;
  end;

end;

procedure DeinitializeSetup();
begin
  gdipShutdown;
end;
