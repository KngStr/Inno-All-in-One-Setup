; 演示如何使用增强的主体安装程序和增强的编译器。
; 脚本: restools ( http://restools.hanzify.org )
; 这里将会演示所有增强功能并提供相关解释。

; 其他更多的 VCL 属性和函数，具体请查看“Support Classes.txt”

#ifndef IS_ENHANCED
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=My Application
AppVersion=1.5
DefaultDirName={pf}\My Application
SolidCompression=yes
Compression=lzma/ultra
PrivilegesRequired=none
OutputDir=userdocs:Inno Setup Examples Output

[Files]                               
Source: "btnimage.bmp"; Flags: dontcopy solidbreak
Source: "BGImage.bmp"; Flags: dontcopy solidbreak

[code]
function SetCapture(hWnd: HWND): HWND; external 'SetCapture@user32.dll stdcall';

var
  CheckListBox, CheckListBox2: TNewCheckListBox;
  Info: TLabel;
  BGBitmapImage: TBitmapImage;
  btnImgFile, BGImgFile: String;
  BorderWidth: Integer;

procedure ItemMouseMove(Sender: TObject; X, Y: Integer; Index: Integer; Area: TItemArea);
var
  AreaStr: String;
begin
  if Index = -1 then
  begin
    Info.Caption := 'Position your mouse over a component to see its description.';
    Info.Enabled := False;
    SetCapture(0);
  end else begin
    case Area of
    iaButton: AreaStr := 'Button';
    iaCheckmark: AreaStr := 'Checkmark';
    iaItem: AreaStr := 'Item';
    iaSubItem: AreaStr := 'SubItem';
    else AreaStr := 'Other';
    end;
    Info.Caption := 'AbsIndex: ' + IntToStr(Index) + #13 + 'Area: ' + AreaStr + #13
         + 'Captin: ' + CheckListBox.ItemCaption[Index] + #13 + 'SubCaption: '
         + CheckListBox.ItemSubItem[Index];
    Info.Enabled := True;
    SetCapture(CheckListBox.Handle);
  end;
end;

procedure ButtonOnClick(Sender: TObject);
begin
  // 绝对项数，不受收缩或展开子项的影响。
  MsgBox('CheckListBox.ItemCount: ' + IntToStr(CheckListBox.ItemCount), mbInformation, MB_OK);
end;

procedure Button2OnClick(Sender: TObject);
begin
  // 当前绝对索引，不受收缩或展开子项的影响。
  MsgBox('CheckListBox.AbsItemIndex: ' + IntToStr(CheckListBox.AbsItemIndex), mbInformation, MB_OK);
end;

procedure Button3OnClick(Sender: TObject);
begin
  // 展开或者收缩子项
  if CheckListBox.AbsItemIndex > -1 then
    CheckListBox.ItemExpanded[CheckListBox.AbsItemIndex] := not CheckListBox.ItemExpanded[CheckListBox.AbsItemIndex];
end;

procedure Button4OnClick(Sender: TObject);
begin
#ifdef UNICODE
  WizardForm.DoubleBuffered := True;
#endif
  // 载入指定的按钮图片
  if btnImgFile = '' then
  begin
    btnImgFile := ExpandConstant('{tmp}\btnimage.bmp');
    CheckListBox.LoadBtnBmpFromFile(btnImgFile);
    CheckListBox2.LoadBtnBmpFromFile(btnImgFile);
  end else
  begin
    btnImgFile := '';
    CheckListBox.LoadBtnBmpFromFile('');
    CheckListBox2.LoadBtnBmpFromFile('');
  end;
#ifdef UNICODE
  CheckListBox.Repaint;
  CheckListBox2.Repaint;
  WizardForm.DoubleBuffered := False;
#endif
end;

procedure Button5OnClick(Sender: TObject);
begin
  // 载入 NewCheckListbox 背景图
  if BGImgFile = '' then
  begin
    BGImgFile := ExpandConstant('{tmp}\BGImage.bmp');     
    CheckListBox.LoadBGBmpFromFile(BGImgFile, CheckListBox.Left+BorderWidth, CheckListBox.Top+BorderWidth);
    CheckListBox2.LoadBGBmpFromFile(BGImgFile, CheckListBox2.Left, CheckListBox2.Top);
  end else
  begin
    BGImgFile := '';
    CheckListBox.LoadBGBmpFromFile('', 0, 0);
    CheckListBox2.LoadBGBmpFromFile('', 0, 0);
  end;
end;

procedure WizardBGCheckOnClick(Sender: TObject);
begin
  if TNewCheckBox(Sender).Checked then
    BGBitmapImage.Bitmap.LoadFromFile(ExpandConstant('{tmp}\BGImage.bmp'))
  else
    BGBitmapImage.Bitmap.Assign(nil);
end;

procedure CheckListBox2_OnClickCheck(Sender: TObject);
begin
  case CheckListBox2.AbsItemIndex of
    1: CheckListBox.TreeViewStyle := CheckListBox2.Checked[1];
    2: CheckListBox.Showroot := CheckListBox2.Checked[2];
    3: CheckListBox.ItemHeightFixed := CheckListBox2.Checked[3];
    4: CheckListBox.HideSelection := CheckListBox2.Checked[4];
  end;
end;

procedure InitializeWizard();
var
  Button: TNewButton;
  InfoBevel: TBevel;
  WizardBGCheck: TNewCheckbox;
begin
  ExtractTemporaryFile('btnimage.bmp');
  ExtractTemporaryFile('BGImage.bmp');

  BGBitmapImage := TBitmapImage.Create(WizardForm);
  BGBitmapImage.Parent := WizardForm;
  BGBitmapImage.Align := alClient;
  BGBitmapImage.SendToBack;

	WizardForm.OuterNotebook.Hide;
	WizardForm.NextButton.Hide;

  CheckListBox := TNewCheckListBox.Create(WizardForm);
  CheckListBox.Parent := WizardForm;
  CheckListBox.SetBounds(ScaleX(10), ScaleY(10), WizardForm.InnerPage.Width - ScaleX(155), WizardForm.InnerPage.Height - ScaleY(40));
  BorderWidth := (CheckListBox.Width-CheckListBox.ClientWidth) div 2;
  CheckListBox.Flat := True;
  CheckListBox.AddCheckBoxEx('CheckBox___0_1', 'c01 00', 0, True, True, True, True, nil, True);
  CheckListBox.AddRadioButtonEx('radiobutton1_1 (aaa bbb ccc ddd eee fff ggg hhh iii jjj kkk lll mmm nnn ooo ppp)', 'r11 01', 1, True, True, nil, False);
  CheckListBox.AddRadioButtonEx('radiobutton2_1', 'r21 02', 2, True, True, nil, True);
  CheckListBox.AddRadioButtonEx('radiobutton2_2', 'r22 03', 2, True, True, nil, True);
  CheckListBox.AddRadioButtonEx('radiobutton3_1', 'r31 04', 3, True, True, nil, True);
  CheckListBox.AddRadioButtonEx('radiobutton3_2', 'r32 05', 3, True, True, nil, True);
  CheckListBox.AddCheckBoxEx('CheckBox___2_3', 'c23 06', 2, True, True, False, True, nil, True);
  CheckListBox.AddRadioButtonEx('radiobutton1_2', 'r12 07', 1, False, True, nil, True);
  CheckListBox.AddCheckBoxEx('CheckBox___1_3 (aaa bbb ccc ddd eee fff ggg hhh iii jjj kkk lll mmm nnn ooo ppp qqq rrr sss ttt uuu vvv www)', 'c13 08', 1, True, True, False, True, nil, True);
  CheckListBox.AddCheckBoxEx('CheckBox___2_4', 'c24 09', 2, True, True, False, True, nil, True);
  CheckListBox.AddCheckBoxEx('CheckBox___2_5', 'c25 10', 2, True, True, False, True, nil, True);
  CheckListBox.AddRadioButtonEx('radiobutton1_4', 'r14 11', 1, False, True, nil, True);
  CheckListBox.AddRadioButtonEx('radiobutton1_5', 'r15 12', 1, False, True, nil, True);
  CheckListBox.AddGroupEx('group__________1_6', 'g16 13', 1, nil, True);
  CheckListBox.AddRadioButtonEx('radiobutton2_6', 'r26 14', 2, True, True, nil, True);
  CheckListBox.AddRadioButtonEx('radiobutton2_7', 'r27 15', 2, False, True, nil, True);
  CheckListBox.AddCheckBoxEx('CheckBox___2_8', 'r28 16', 2, True, True, False, True, nil, True);
  CheckListBox.AddCheckBoxEx('CheckBox___0_2', 'c02 17', 0, True, True, False, True, nil, True);
  CheckListBox.AddCheckBoxEx('CheckBox___1_7', 'c17 18', 1, True, True, False, True, nil, True);
  CheckListBox.AddCheckBoxEx('CheckBox___1_8', 'c18 19', 1, True, True, False, True, nil, True);
  CheckListBox.AddCheckBoxEx('CheckBox___0_3', 'c03 20', 0, True, True, False, True, nil, True);
  CheckListBox.OnItemMouseMove := @ItemMouseMove;

  CheckListBox2 := TNewCheckListBox.Create(WizardForm);
  CheckListBox2.Parent := WizardForm;
  CheckListBox2.SetBounds(WizardForm.InnerPage.Width - ScaleX(135), ScaleY(10), ScaleX(120), ScaleY(80));
  CheckListBox2.BorderStyle := bsNone;
  CheckListBox2.ParentColor := True;
  CheckListBox2.ShowLines := False;
  CheckListBox2.WantTabs := True;
  CheckListBox2.AddGroupEx('Property', '', 0, nil, True);
  CheckListBox2.AddCheckBoxEx('TreeViewStyle', '', 0, False, True, False, True, nil, True);
  CheckListBox2.AddCheckBoxEx('Showroot', '', 0, True, True, False, True, nil, True);
  CheckListBox2.AddCheckBoxEx('ItemHeightFixed', '', 0, False, True, False, True, nil, True);
  CheckListBox2.AddCheckBoxEx('HideSelection', '', 0, True, True, False, True, nil, True);
  CheckListBox2.OnClickCheck := @CheckListBox2_OnClickCheck;
  CheckListBox2.ItemHeightFixed := True;

  Button := TNewButton.Create(WizardForm);
  Button.Parent := WizardForm;
  Button.SetBounds(ScaleX(10), WizardForm.InnerPage.Height - ScaleY(25), ScaleX(65), ScaleY(23));
  Button.Caption := 'ItemCount';
  Button.OnClick := @ButtonOnClick;

  Button := TNewButton.Create(WizardForm);
  Button.Parent := WizardForm;
  Button.SetBounds(ScaleX(80), WizardForm.InnerPage.Height - ScaleY(25), ScaleX(80), ScaleY(23));
  Button.Caption := 'AbsItemIndex';
  Button.OnClick := @Button2OnClick;

  Button := TNewButton.Create(WizardForm);
  Button.Parent := WizardForm;
  Button.SetBounds(ScaleX(165), WizardForm.InnerPage.Height - ScaleY(25), ScaleX(100), ScaleY(23));
  Button.Caption := 'not ItemExpanded';
  Button.OnClick := @Button3OnClick;

  Button := TNewButton.Create(WizardForm);
  Button.Parent := WizardForm;
  Button.SetBounds(ScaleX(270), WizardForm.InnerPage.Height - ScaleY(25), ScaleX(90), ScaleY(23));
  Button.Caption := 'Load BtnImage';
  Button.OnClick := @Button4OnClick;

  Button := TNewButton.Create(WizardForm);
  Button.Parent := WizardForm;
  Button.SetBounds(ScaleX(365), WizardForm.InnerPage.Height - ScaleY(25), ScaleX(90), ScaleY(23));
  Button.Caption := 'Load BGImage';
  Button.OnClick := @Button5OnClick;

  InfoBevel := TBevel.Create(WizardForm);
  InfoBevel.Parent := WizardForm;
  InfoBevel.Shape := bsFrame;
  InfoBevel.SetBounds(WizardForm.InnerPage.Width - ScaleX(135), ScaleY(100), ScaleX(125), ScaleY(180));

  Info := TLabel.Create(WizardForm);
  Info.Parent := WizardForm;
  Info.AutoSize := False;
  Info.WordWrap := true;
  Info.Caption := 'Position your mouse over a component to see its description.';
  Info.SetBounds(InfoBevel.Left+ScaleX(6), InfoBevel.Top+ScaleY(6), InfoBevel.Width-ScaleX(12), InfoBevel.Height - ScaleY(12));
  Info.Enabled := False;
  Info.Transparent := True;

  WizardBGCheck := TNewCheckbox.Create(WizardForm);
  WizardBGCheck.Parent := WizardForm;
  WizardBGCheck.SetBounds(ScaleX(20), WizardForm.CancelButton.Top+3, ScaleX(150), WizardBGCheck.Height);
  WizardBGCheck.Caption := 'WizardForm Background';
  WizardBGCheck.OnClick := @WizardBGCheckOnClick;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  WizardForm.Caption := 'TNewCheckListBox Demo';
  WizardForm.NextButton.Hide;
  WizardForm.CancelButton.Caption := 'Close';
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := False;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  Confirm := False;
end;



