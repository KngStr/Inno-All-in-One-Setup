#include "botva2.ish"
#include "CheckListBox.ish"

[Setup]
AppName=CheckListBox by South.Tver
AppVerName=CheckListBox by South.Tver
DefaultDirName={pf}\CheckListBox
OutputBaseFilename=setup
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: Files\*; Flags: dontcopy

[Code]
var
  InfoLabel,Label1:TLabel;
  lb:integer;

procedure lbMove(ci,ii:integer);
var
  s:string;
begin
  if clbIsItemCheckedByIndex(ci,ii) then s:='True' else s:='False';
  InfoLabel.Caption:='Name    = '+ACLB[ci].ItemList[ii].Name+#10#13+
                     'Handle  = '+IntToStr(ACLB[ci].ItemList[ii].Handle)+#10#13+
                     'Level   = '+IntToStr(ACLB[ci].ItemList[ii].Level)+#10#13+
                     'Caption = '+ACLB[ci].ItemList[ii].Caption+#10#13+
                     'Checked = '+s;
end;

procedure lbClick(ci,ii:integer);
var
  s:AnsiString;
begin
  if clbFindItemByName(ci,'CheckBox6Name')=ii then begin
    if clbIsItemCheckedByIndex(ci,ii) then s:='True' else s:='False';
    s:='Click on Item'+#10#13+
       'Name    = '+ACLB[ci].ItemList[ii].Name+#10#13+
       'Handle  = '+IntToStr(ACLB[ci].ItemList[ii].Handle)+#10#13+
       'Level   = '+IntToStr(ACLB[ci].ItemList[ii].Level)+#10#13+
       'Caption = '+ACLB[ci].ItemList[ii].Caption+#10#13+
       'Checked = '+s;
    MsgBox(s, mbInformation, MB_OK);
  end;
end;

procedure HideShowLabelBtnClick(Sender:TObject);
begin
  Label1.Visible:=not Label1.Visible;
  clbRefresh(lb);
end;

procedure HideShowCLBBtnClick(Sender:TObject);
begin
  clbSetVisibility(lb,not clbGetVisibility(lb));
end;

procedure InitializeWizard;
begin
  ExtractTemporaryFile('botva2.dll');
  ExtractTemporaryFile('CallbackCtrl.dll');

  with WizardForm do begin
    Width:=Width+150;
    InnerNotebook.Hide;
    OuterNotebook.Hide;
    Bevel.Hide;
  end;

  Label1:=TLabel.Create(WizardForm);
  with Label1 do begin
    Parent:=WizardForm;
    AutoSize:=False;
    SetBounds(5,140,395,65);
    Font.Color:=clRed;
    Transparent:=True;
    Caption:='asdfasdf asdfasd fasdfasd fasdf asdfas dfasf asdfasd asdfasdf asdfasdf asdfasdf asdfasd fasdfa dsfaf asdfa sdfasdfa asdfasdf asdfasd fasdfasd fasdf asdfas dfasf asdfasd asdfasdf asdfasdf asdfasdf asdfasd fasdfa dsfaf asdfa sdfasdfa';
    WordWrap:=True;
  end;

  with TButton.Create(WizardForm) do begin
    Parent:=WizardForm;
    SetBounds(0,0,100,22);
    Caption:='Hide/Show Label';
    OnClick:=@HideShowLabelBtnClick;
  end;

  with TButton.Create(WizardForm) do begin
    Parent:=WizardForm;
    SetBounds(110,0,150,22);
    Caption:='Hide/Show CheckListBox';
    OnClick:=@HideShowCLBBtnClick;
  end;

  InfoLabel:=TLabel.Create(WizardForm);
  with InfoLabel do begin
    Parent:=WizardForm;
    AutoSize:=False;
    SetBounds(400,30,240,65);
    Font.Name:='Courier';
    Transparent := False;
  end;

  ImgLoad(WizardForm.Handle,'nfs.jpg',0,0,WizardForm.ClientWidth,WizardForm.ClientHeight,True,True);
  ImgApplyChanges(WizardForm.Handle);

  //*******************************************************
  lb:=CheckListBoxCreate(WizardForm,10,160,300,190);

  clbAddChkBoxItem(lb,'CheckBox1Name','CheckBox1Caption',0,False);
  clbAddRadioBtnItem(lb,'RadioButton1Name','RadioButton1Caption',1,True,1);
  clbAddRadioBtnItem(lb,'RadioButton2Name','RadioButton2Caption',1,False,1);

  clbAddChkBoxItem(lb,'CheckBox3Name','CheckBox3Caption',0,False);
  clbAddRadioBtnItem(lb,'RadioButton3Name','RadioButton3Caption',1,True,2);
  clbAddRadioBtnItem(lb,'RadioButton4Name','RadioButton4Caption',1,False,2);

  clbAddChkBoxItem(lb,'CheckBox4Name','CheckBox4Caption',1,False);
  clbAddChkBoxItem(lb,'CheckBox5Name','CheckBox5Caption',1,False);
  clbAddChkBoxItem(lb,'CheckBox6Name','CheckBox6Caption',0,False);
  clbAddChkBoxItem(lb,'CheckBox7Name','CheckBox7Caption',0,False);
  clbAddChkBoxItem(lb,'CheckBox8Name','CheckBox8Caption',0,False);
  clbAddChkBoxItem(lb,'CheckBox9Name','CheckBox9Caption',0,False);
  clbAddChkBoxItem(lb,'CheckBox10Name','CheckBox10Caption',1,False);
  clbAddChkBoxItem(lb,'CheckBox11Name','CheckBox11Caption',1,False);
  clbAddChkBoxItem(lb,'CheckBox12Name','CheckBox12Caption',2,False);
  clbAddChkBoxItem(lb,'CheckBox13Name','CheckBox13Caption',2,True);
  clbAddChkBoxItem(lb,'CheckBox14Name','CheckBox14Caption',1,False);
  clbAddChkBoxItem(lb,'CheckBox15Name','CheckBox15Caption',2,False);
  clbAddChkBoxItem(lb,'CheckBox16Name','CheckBox16Caption',2,False);
  clbAddRadioBtnItem(lb,'RadioButton5Name','RadioButton5Caption',2,False,3);
  clbAddRadioBtnItem(lb,'RadioButton6Name','RadioButton6Caption',2,True,3);

  //выполн€етс€ при наведении курсора на айтемы
  clbSetMouseItemEnterEvent(lb,@lbMove); 
  //выполн€етс€ при клике на айтемы. 
  //в lbClick будем выводить инфу при клике на CheckBox6Name, остальные игнорим
  clbSetItemClickEvent(lb,@lbClick); 
  //*******************************************************
end;        

procedure DeinitializeSetup;
begin
  gdipShutdown;
  //WizardForm надо об€зательно прибить, иначе ошибка вылезет. 
  //или писать ручное прибитие чеклистбоксов и вызывать его здесь
  WizardForm.Free;   
end;