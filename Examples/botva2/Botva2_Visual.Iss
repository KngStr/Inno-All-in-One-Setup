//Author      : KngStr
//Link        : http://www.kngstr.com/
//Description :
//Modified    : 2013-11-14 11:40:59
//Tested Inno :
//Usage       : See Examples folder

//引用窗体拖放
#include "AllMove.Ish"

#include "botva2.ish"
#include "ProgressBar.ish"

#include "Botva2_Visual.Ish"

[Setup]
AppName=Botva2_Visual.Ish - Demo by WLDNA
AppVersion=1.0
;AppVerName=GroupCheckButton by South.Tver
DefaultDirName={tmp}\xx\
Uninstallable=no
OutputBaseFilename=setup
OutputDir=userdocs:Inno Setup Examples Output
DirExistsWarning=no

[Files]
Source: Files\*; Flags: dontcopy
Source: {win}\help\*; DestDir: {app}; Flags:  createallsubdirs recursesubdirs skipifsourcedoesntexist external;


[Code]
var
  GroupBtn1: TGroupBtn;
  GroupBtn2: TGroupBtn;

{ RedesignWizardFormBegin } // 不要删除这一行代码。
// 不要修改这一段代码，它是自动生成的。
var
  Bevel2: TBevel;
  Panel3: TPanel;
  NewCheckBox3: TNewCheckBox;
  NewCheckBox2: TNewCheckBox;
  NewCheckBox1: TNewCheckBox;
  NewCheckBox4: TNewCheckBox;
  Panel2: TPanel;
  NewRadioButton4: TNewRadioButton;
  NewRadioButton3: TNewRadioButton;
  NewRadioButton2: TNewRadioButton;
  NewRadioButton1: TNewRadioButton;
  Panel4: TPanel;
  NewRadioButton5: TNewRadioButton;
  NewRadioButton6: TNewRadioButton;
  NewRadioButton7: TNewRadioButton;
  NewRadioButton8: TNewRadioButton;
  PasswordEdit1: TPasswordEdit;
  NewButton1: TNewButton;
  NewButton2: TNewButton;
  NewButton3: TNewButton;
  NewButton4: TNewButton;

procedure ButtonClick(Sender: TObject); forward;
procedure NewButton3Click(Sender: TObject); forward;
procedure NewButton4Click(Sender: TObject); forward;

procedure RedesignWizardForm;
begin
  with WizardForm.WizardBitmapImage do
  begin
    Width := ScaleX(0);
  end;

  { Bevel2 }
  Bevel2 := TBevel.Create(WizardForm);
  with Bevel2 do
  begin
    Name := 'Bevel2';
    Parent := WizardForm.WelcomePage;
    Left := ScaleX(240);
    Top := ScaleY(1);
    Width := ScaleX(3);
    Height := ScaleY(311);
    Shape := bsLeftLine;
  end;

  with WizardForm.WelcomeLabel2 do
  begin
    Width := ScaleX(0);
  end;

  with WizardForm.WelcomeLabel1 do
  begin
    Width := ScaleX(0);
  end;

  { Panel3 }
  Panel3 := TPanel.Create(WizardForm);
  with Panel3 do
  begin
    Name := 'Panel3';
    Parent := WizardForm.WelcomePage;
    Left := ScaleX(8);
    Top := ScaleY(8);
    Width := ScaleX(209);
    Height := ScaleY(143);
    BevelOuter := bvLowered;
    Caption := '';
  end;

  { NewCheckBox3 }
  NewCheckBox3 := TNewCheckBox.Create(WizardForm);
  with NewCheckBox3 do
  begin
    Name := 'NewCheckBox3';
    Parent := Panel3;
    Left := ScaleX(16);
    Top := ScaleY(70);
    Width := ScaleX(97);
    Height := ScaleY(17);
    OnClick := @ButtonClick;
  end;

  { NewCheckBox2 }
  NewCheckBox2 := TNewCheckBox.Create(WizardForm);
  with NewCheckBox2 do
  begin
    Name := 'NewCheckBox2';
    Parent := Panel3;
    Left := ScaleX(16);
    Top := ScaleY(37);
    Width := ScaleX(97);
    Height := ScaleY(17);
    OnClick := @ButtonClick;
  end;

  { NewCheckBox1 }
  NewCheckBox1 := TNewCheckBox.Create(WizardForm);
  with NewCheckBox1 do
  begin
    Name := 'NewCheckBox1';
    Parent := Panel3;
    Left := ScaleX(16);
    Top := ScaleY(5);
    Width := ScaleX(97);
    Height := ScaleY(17);
    OnClick := @ButtonClick;
  end;

  { NewCheckBox4 }
  NewCheckBox4 := TNewCheckBox.Create(WizardForm);
  with NewCheckBox4 do
  begin
    Name := 'NewCheckBox4';
    Parent := Panel3;
    Left := ScaleX(16);
    Top := ScaleY(114);
    Width := ScaleX(97);
    Height := ScaleY(17);
    OnClick := @ButtonClick;
  end;

  NewCheckBox3.TabOrder := 0;
  NewCheckBox2.TabOrder := 1;
  NewCheckBox1.TabOrder := 2;
  NewCheckBox4.TabOrder := 3;

  { Panel2 }
  Panel2 := TPanel.Create(WizardForm);
  with Panel2 do
  begin
    Name := 'Panel2';
    Parent := WizardForm.WelcomePage;
    Left := ScaleX(8);
    Top := ScaleY(163);
    Width := ScaleX(209);
    Height := ScaleY(137);
    BevelOuter := bvLowered;
    Caption := '';
  end;

  { NewRadioButton4 }
  NewRadioButton4 := TNewRadioButton.Create(WizardForm);
  with NewRadioButton4 do
  begin
    Name := 'NewRadioButton4';
    Parent := Panel2;
    Left := ScaleX(8);
    Top := ScaleY(112);
    Width := ScaleX(113);
    Height := ScaleY(17);
    OnClick := @ButtonClick;
  end;

  { NewRadioButton3 }
  NewRadioButton3 := TNewRadioButton.Create(WizardForm);
  with NewRadioButton3 do
  begin
    Name := 'NewRadioButton3';
    Parent := Panel2;
    Left := ScaleX(8);
    Top := ScaleY(78);
    Width := ScaleX(113);
    Height := ScaleY(17);
    OnClick := @ButtonClick;
  end;

  { NewRadioButton2 }
  NewRadioButton2 := TNewRadioButton.Create(WizardForm);
  with NewRadioButton2 do
  begin
    Name := 'NewRadioButton2';
    Parent := Panel2;
    Left := ScaleX(8);
    Top := ScaleY(45);
    Width := ScaleX(113);
    Height := ScaleY(17);
    OnClick := @ButtonClick;
  end;

  { NewRadioButton1 }
  NewRadioButton1 := TNewRadioButton.Create(WizardForm);
  with NewRadioButton1 do
  begin
    Name := 'NewRadioButton1';
    Parent := Panel2;
    Left := ScaleX(8);
    Top := ScaleY(11);
    Width := ScaleX(113);
    Height := ScaleY(17);
    OnClick := @ButtonClick;
  end;

  NewRadioButton4.TabOrder := 0;
  NewRadioButton3.TabOrder := 1;
  NewRadioButton2.TabOrder := 2;
  NewRadioButton1.TabOrder := 3;

  { Panel4 }
  Panel4 := TPanel.Create(WizardForm);
  with Panel4 do
  begin
    Name := 'Panel4';
    Parent := WizardForm.WelcomePage;
    Left := ScaleX(266);
    Top := ScaleY(8);
    Width := ScaleX(217);
    Height := ScaleY(143);
    BevelOuter := bvLowered;
    Caption := '';
  end;

  { NewRadioButton5 }
  NewRadioButton5 := TNewRadioButton.Create(WizardForm);
  with NewRadioButton5 do
  begin
    Name := 'NewRadioButton5';
    Parent := Panel4;
    Left := ScaleX(8);
    Top := ScaleY(112);
    Width := ScaleX(113);
    Height := ScaleY(17);
    OnClick := @ButtonClick;
  end;

  { NewRadioButton6 }
  NewRadioButton6 := TNewRadioButton.Create(WizardForm);
  with NewRadioButton6 do
  begin
    Name := 'NewRadioButton6';
    Parent := Panel4;
    Left := ScaleX(8);
    Top := ScaleY(78);
    Width := ScaleX(113);
    Height := ScaleY(17);
    OnClick := @ButtonClick;
  end;

  { NewRadioButton7 }
  NewRadioButton7 := TNewRadioButton.Create(WizardForm);
  with NewRadioButton7 do
  begin
    Name := 'NewRadioButton7';
    Parent := Panel4;
    Left := ScaleX(8);
    Top := ScaleY(45);
    Width := ScaleX(113);
    Height := ScaleY(17);
    OnClick := @ButtonClick;
  end;

  { NewRadioButton8 }
  NewRadioButton8 := TNewRadioButton.Create(WizardForm);
  with NewRadioButton8 do
  begin
    Name := 'NewRadioButton8';
    Parent := Panel4;
    Left := ScaleX(8);
    Top := ScaleY(11);
    Width := ScaleX(113);
    Height := ScaleY(17);
    OnClick := @ButtonClick;
  end;

  NewRadioButton5.TabOrder := 0;
  NewRadioButton6.TabOrder := 1;
  NewRadioButton7.TabOrder := 2;
  NewRadioButton8.TabOrder := 3;

  { PasswordEdit1 }
  PasswordEdit1 := TPasswordEdit.Create(WizardForm);
  with PasswordEdit1 do
  begin
    Name := 'PasswordEdit1';
    Parent := WizardForm.WelcomePage;
    Left := ScaleX(266);
    Top := ScaleY(163);
    Width := ScaleX(217);
    Height := ScaleY(21);
  end;

  { NewButton1 }
  NewButton1 := TNewButton.Create(WizardForm);
  with NewButton1 do
  begin
    Name := 'NewButton1';
    Parent := WizardForm.WelcomePage;
    Left := ScaleX(266);
    Top := ScaleY(203);
    Width := ScaleX(107);
    Height := ScaleY(41);
    OnClick := @ButtonClick;
  end;

  { NewButton2 }
  NewButton2 := TNewButton.Create(WizardForm);
  with NewButton2 do
  begin
    Name := 'NewButton2';
    Parent := WizardForm.WelcomePage;
    Left := ScaleX(266);
    Top := ScaleY(259);
    Width := ScaleX(107);
    Height := ScaleY(41);
    OnClick := @ButtonClick;
  end;

  Panel3.TabOrder := 2;
  Panel2.TabOrder := 3;
  Panel4.TabOrder := 4;
  PasswordEdit1.TabOrder := 5;
  NewButton1.TabOrder := 6;
  NewButton2.TabOrder := 7;

  with WizardForm.MainPanel do
  begin
    Visible := False;
  end;

  { NewButton3 }
  NewButton3 := TNewButton.Create(WizardForm);
  with NewButton3 do
  begin
    Name := 'NewButton3';
    Parent := WizardForm;
    Left := ScaleX(8);
    Top := ScaleY(326);
    Width := ScaleX(75);
    Height := ScaleY(25);
    Caption := 'Enable Skin';
    OnClick := @NewButton3Click;
  end;

  { NewButton4 }
  NewButton4 := TNewButton.Create(WizardForm);
  with NewButton4 do
  begin
    Name := 'NewButton4';
    Parent := WizardForm;
    Left := ScaleX(96);
    Top := ScaleY(326);
    Width := ScaleX(75);
    Height := ScaleY(25);
    Caption := 'AllMouseMove';
    OnClick := @NewButton4Click;
  end;

  NewButton3.TabOrder := 5;
  NewButton4.TabOrder := 6;

{ ReservationBegin }
  // 这一部分是提供给你的，你可以在这里输入一些补充代码。

{ ReservationEnd }
end;
// 不要修改这一段代码，它是自动生成的。
{ RedesignWizardFormEnd } // 不要删除这一行代码。

procedure NewButton4Click(Sender: TObject);
begin
  NewButton4.Enabled := False;

#ifdef _ALLMOVE_ISH_
  AllMouseMove();
  NewMoveLbl(Panel2);
  NewMoveLbl(Panel3);
  NewMoveLbl(Panel4);
#endif
end;

//可视化支持头文件的，所有演示……
procedure NewButton3Click(Sender: TObject);
var
  h: HWND;
begin
  if TButton(Sender).Caption = 'Enable Skin' then
  begin
    TButton(Sender).Caption := 'Hide Skin';

    AllBackImg(True, PDir('hz.jpg'));

    //2011-05-16
    //Botva2 plugin doesn't support TPanel
//    BackImg(WizardForm.MainPanel, WizardForm, True, PDir('hz.jpg'));
//    BackImg(Panel2, WizardForm.WelcomePage, True, PDir('hz.jpg'));
//    BackImg(Panel3, WizardForm.WelcomePage, True, PDir('hz.jpg'));
//    BackImg(Panel4, WizardForm.WelcomePage, True, PDir('hz.jpg'));

    TransChkImg(NewCheckBox1, PDir('CheckBox.png'), 12, 12, 5, @ImgBtnClick);
    TransChkImg(NewCheckBox2, PDir('CheckBox.png'), 25, 25, 5, @ImgBtnClick);
    TransChkImg(NewCheckBox3, PDir('CheckBox.png'), 34, 34, 5, @ImgBtnClick);
    TransChkImg(NewCheckBox4, PDir('CheckBox.png'), 43, 43, 5, @ImgBtnClick);

    GroupBtn1.AllowCancel := True;
    TransGrpBtnImg(GroupBtn1, [NewRadioButton1, NewRadioButton2, NewRadioButton3, NewRadioButton4],
      PDir('CheckBox.png'), 9, 9, 5, @ImgGroupBtnClick);
    TransGrpBtnImg(GroupBtn2, [NewRadioButton5, NewRadioButton6, NewRadioButton7, NewRadioButton8],
      PDir('CheckBox.png'), 28, 28, 5, @ImgGroupBtnClick);

    //Process buttons
    TransBtnImg(NewButton1, PDir('button.png'), 0, @ImgBtnClick);
    BtnSetFontColor(ImgBtn.hBtns[NewButton1.Tag], $DAE369, $DAE369, $DAE369, $B6B6B6);

    TransBtnImg(NewButton2, PDir('button.png'), 0, @ImgBtnClick);
    BtnSetFontColor(ImgBtn.hBtns[GetArrayLength(ImgBtn.hBtns) - 1], $DAE369, $DAE369, $DAE369, $B6B6B6);

    h := TransBtnImg(NewButton3, PDir('button.png'), 0, @ImgBtnClick);
    BtnSetFontColor(h, $DAE369, $DAE369, $DAE369, $B6B6B6);

    h := TransBtnImg(NewButton4, PDir('button.png'), 0, @ImgBtnClick);
    BtnSetFontColor(h, $DAE369, $DAE369, $DAE369, $B6B6B6);

    with WizardForm do
    begin
      h := TransBtnImg(CancelButton, PDir('button.png'), 0, @ImgBtnClick);
      BtnSetFontColor(h, $DAE369, $DAE369, $DAE369, $B6B6B6);

      h := TransBtnImg(NextButton, PDir('button.png'), 0, @ImgBtnClick);
      BtnSetFontColor(h, $DAE369, $DAE369, $DAE369, $B6B6B6);

      h := TransBtnImg(BackButton, PDir('button.png'), 0, @ImgBtnClick);
      BtnSetFontColor(h, $DAE369, $DAE369, $DAE369, $B6B6B6);
    end;
  end
  else if TButton(Sender).Caption = 'Hide Skin' then
  begin
    TButton(Sender).Caption := 'Show Skin';
  end
  else if TButton(Sender).Caption = 'Show Skin' then
  begin
    TButton(Sender).Caption := 'Hide Skin';
  end;
end;

procedure ButtonClick(Sender: TObject);
begin
  MsgBox('[' + TButtonControl(Sender).Name + '] has been clicked!', mbInformation, MB_OK);
end;

function InitializeSetup: boolean;
begin
  {# AutoPDirs }

  Result := True;
end;

procedure InitializeWizard;
begin
  RedesignWizardForm;
end;

procedure DeinitializeSetup();
begin
  FreeImgBtn();
  FreeGroupBtn();

  gdipShutdown;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if NewButton3.Caption <> 'Enable Skin' then UpdateAllBtns();
end;

//从这里开始是，从插件示例文件直接拿出来的，进度条部分的，不想要，删除即可，呵呵
type
  TPBProc = function(h: hWnd; Msg, wParam, lParam: Longint): Longint;

var
  NewPB          : TImgPB;
  PBOldProc      : Longint;

function SetWindowLong(hWnd: HWND; nIndex: Integer; dwNewLong: Longint): Longint; external 'SetWindowLong{#A}@user32.dll stdcall';

function CallBackProc(P: TPBProc; ParamCount: integer): LongWord; {# CallbackCtrl_External };
function CallWindowProc(lpPrevWndFunc: Longint; hWnd: HWND; Msg: UINT; wParam, lParam: Longint): Longint; external 'CallWindowProc{#A}@user32.dll stdcall';

function PBProc(h: hWnd; Msg, wParam, lParam: Longint): Longint;
var
  pr, i1, i2: Extended;
begin
  Result := CallWindowProc(PBOldProc, h, Msg, wParam, lParam);
  if (Msg = $402) and (WizardForm.ProgressGauge.Position > WizardForm.ProgressGauge.Min) then
    with WizardForm.ProgressGauge do
    begin
      i1 := Position - Min;
      i2 := Max - Min;

      pr := i1 * 100 / i2;
      ImgPBSetPosition(NewPB, pr);
      ImgApplyChanges(Parent.Handle);
    end;
end;

procedure AllCancel;
begin
  with WizardForm.ProgressGauge do
  begin
    SetWindowLong(Handle, -4, PBOldProc);
    ImgPBDelete(NewPB);
    ImgApplyChanges(Parent.Handle);
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  case CurStep of
    ssInstall:
    begin
      with WizardForm.ProgressGauge do
      begin
        Visible := False;
        NewPB := ImgPBCreate(Parent.Handle, PDir('pbbkg.png'), PDir('pb.png'), Left, Top, Width, Height);
        ImgApplyChanges(Parent.Handle);

        PBOldProc := SetWindowLong(Handle, -4, CallBackProc(@PBProc, 4));
      end;
    end;
    ssPostInstall:
    begin
      AllCancel;
    end;
  end;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  if CurPageID = wpInstalling then
  begin
    Confirm := False;
    Cancel := ExitSetupMsgBox;
    if Cancel then AllCancel;
  end;
end;

[ISFormDesigner]
WizardForm=FF0A005457495A415244464F524D003010860E000054504630F10B5457697A617264466F726D0A57697A617264466F726D0C436C69656E744865696768740368010B436C69656E74576964746803F1010C4578706C696369744C65667402000B4578706C69636974546F7002000D4578706C69636974576964746803F9010E4578706C696369744865696768740383010D506978656C73506572496E636802600A54657874486569676874020D00F10C544E65774E6F7465626F6F6B0D4F757465724E6F7465626F6F6B00F110544E65774E6F7465626F6F6B506167650B57656C636F6D65506167650D4578706C69636974576964746803F1010E4578706C6963697448656967687403390100F10C544269746D6170496D6167651157697A6172644269746D6170496D61676505576964746802000D4578706C69636974576964746802000000F202010654426576656C06426576656C32044C65667403F00003546F700201055769647468020306486569676874033701055368617065070A62734C6566744C696E650000F10E544E6577537461746963546578740D57656C636F6D654C6162656C3205576964746802000D4578706C69636974576964746802000000F10E544E6577537461746963546578740D57656C636F6D654C6162656C3105576964746802000D4578706C69636974576964746802000000065450616E656C0650616E656C33044C656674020803546F70020805576964746803D10006486569676874038F000A426576656C4F75746572070962764C6F7765726564085461624F726465720202000C544E6577436865636B426F780C4E6577436865636B426F7833044C656674021003546F70024605576964746802610648656967687402110743617074696F6E060C4E6577436865636B426F7833085461624F726465720200074F6E436C69636B070B427574746F6E436C69636B00000C544E6577436865636B426F780C4E6577436865636B426F7832044C656674021003546F70022505576964746802610648656967687402110743617074696F6E060C4E6577436865636B426F7832085461624F726465720201074F6E436C69636B070B427574746F6E436C69636B00000C544E6577436865636B426F780C4E6577436865636B426F7831044C656674021003546F70020505576964746802610648656967687402110743617074696F6E060C4E6577436865636B426F7831085461624F726465720202074F6E436C69636B070B427574746F6E436C69636B00000C544E6577436865636B426F780C4E6577436865636B426F7834044C656674021003546F70027205576964746802610648656967687402110743617074696F6E060C4E6577436865636B426F7834085461624F726465720203074F6E436C69636B070B427574746F6E436C69636B000000065450616E656C0650616E656C32044C656674020803546F7003A30005576964746803D100064865696768740389000A426576656C4F75746572070962764C6F7765726564085461624F726465720203000F544E6577526164696F427574746F6E0F4E6577526164696F427574746F6E34044C656674020803546F70027005576964746802710648656967687402110743617074696F6E060F4E6577526164696F427574746F6E34085461624F726465720200074F6E436C69636B070B427574746F6E436C69636B00000F544E6577526164696F427574746F6E0F4E6577526164696F427574746F6E33044C656674020803546F70024E05576964746802710648656967687402110743617074696F6E060F4E6577526164696F427574746F6E33085461624F726465720201074F6E436C69636B070B427574746F6E436C69636B00000F544E6577526164696F427574746F6E0F4E6577526164696F427574746F6E32044C656674020803546F70022D05576964746802710648656967687402110743617074696F6E060F4E6577526164696F427574746F6E32085461624F726465720202074F6E436C69636B070B427574746F6E436C69636B00000F544E6577526164696F427574746F6E0F4E6577526164696F427574746F6E31044C656674020803546F70020B05576964746802710648656967687402110743617074696F6E060F4E6577526164696F427574746F6E31085461624F726465720203074F6E436C69636B070B427574746F6E436C69636B000000065450616E656C0650616E656C34044C656674030A0103546F70020805576964746803D90006486569676874038F000A426576656C4F75746572070962764C6F7765726564085461624F726465720204000F544E6577526164696F427574746F6E0F4E6577526164696F427574746F6E35044C656674020803546F70027005576964746802710648656967687402110743617074696F6E060F4E6577526164696F427574746F6E35085461624F726465720200074F6E436C69636B070B427574746F6E436C69636B00000F544E6577526164696F427574746F6E0F4E6577526164696F427574746F6E36044C656674020803546F70024E05576964746802710648656967687402110743617074696F6E060F4E6577526164696F427574746F6E36085461624F726465720201074F6E436C69636B070B427574746F6E436C69636B00000F544E6577526164696F427574746F6E0F4E6577526164696F427574746F6E37044C656674020803546F70022D05576964746802710648656967687402110743617074696F6E060F4E6577526164696F427574746F6E37085461624F726465720202074F6E436C69636B070B427574746F6E436C69636B00000F544E6577526164696F427574746F6E0F4E6577526164696F427574746F6E38044C656674020803546F70020B05576964746802710648656967687402110743617074696F6E060F4E6577526164696F427574746F6E38085461624F726465720203074F6E436C69636B070B427574746F6E436C69636B0000000D5450617373776F7264456469740D50617373776F72644564697431044C656674030A0103546F7003A30005576964746803D900064865696768740215085461624F7264657202050454657874060D50617373776F7264456469743100000A544E6577427574746F6E0A4E6577427574746F6E31044C656674030A0103546F7003CB00055769647468026B0648656967687402290743617074696F6E060A4E6577427574746F6E31085461624F726465720206074F6E436C69636B070B427574746F6E436C69636B00000A544E6577427574746F6E0A4E6577427574746F6E32044C656674030A0103546F70030301055769647468026B0648656967687402290743617074696F6E060A4E6577427574746F6E32085461624F726465720207074F6E436C69636B070B427574746F6E436C69636B000000F110544E65774E6F7465626F6F6B5061676509496E6E6572506167650D4578706C69636974576964746803F1010E4578706C6963697448656967687403390100F10C544E65774E6F7465626F6F6B0D496E6E65724E6F7465626F6F6B00F110544E65774E6F7465626F6F6B506167650B4C6963656E7365506167650D4578706C69636974576964746803A1010E4578706C6963697448656967687403ED000000F110544E65774E6F7465626F6F6B506167650C50617373776F7264506167650D4578706C69636974576964746803A1010E4578706C6963697448656967687403ED000000F110544E65774E6F7465626F6F6B506167650E496E666F4265666F7265506167650D4578706C69636974576964746803A1010E4578706C6963697448656967687403ED000000F110544E65774E6F7465626F6F6B506167650C55736572496E666F506167650D4578706C69636974576964746803A1010E4578706C6963697448656967687403ED000000F110544E65774E6F7465626F6F6B506167650D53656C656374446972506167650D4578706C69636974576964746803A1010E4578706C6963697448656967687403ED000000F110544E65774E6F7465626F6F6B506167651453656C656374436F6D706F6E656E7473506167650D4578706C69636974576964746803A1010E4578706C6963697448656967687403ED000000F110544E65774E6F7465626F6F6B506167651653656C65637450726F6772616D47726F7570506167650D4578706C69636974576964746803A1010E4578706C6963697448656967687403ED000000F110544E65774E6F7465626F6F6B506167650F53656C6563745461736B73506167650D4578706C69636974576964746803A1010E4578706C6963697448656967687403ED000000F110544E65774E6F7465626F6F6B50616765095265616479506167650D4578706C69636974576964746803A1010E4578706C6963697448656967687403ED000000F110544E65774E6F7465626F6F6B506167650D507265706172696E67506167650D4578706C69636974576964746803A1010E4578706C6963697448656967687403ED000000F110544E65774E6F7465626F6F6B506167650E496E7374616C6C696E67506167650D4578706C69636974576964746803A1010E4578706C6963697448656967687403ED000000F110544E65774E6F7465626F6F6B506167650D496E666F4166746572506167650D4578706C69636974576964746803A1010E4578706C6963697448656967687403ED00000000F1065450616E656C094D61696E50616E656C0756697369626C6508000000F110544E65774E6F7465626F6F6B506167650C46696E6973686564506167650D4578706C69636974576964746803F1010E4578706C696369744865696768740339010000000A544E6577427574746F6E0A4E6577427574746F6E33044C656674020803546F70034601055769647468024B0648656967687402190743617074696F6E060B456E61626C6520536B696E085461624F726465720205074F6E436C69636B070F4E6577427574746F6E33436C69636B00000A544E6577427574746F6E0A4E6577427574746F6E34044C656674026003546F70034601055769647468024B0648656967687402190743617074696F6E060C416C6C4D6F7573654D6F7665085461624F726465720206074F6E436C69636B070F4E6577427574746F6E34436C69636B000000

;#expr savetofile(SourcePath + 'Test_Visual.Iss')