; 演示使用多个鼠标事件进行高级界面处理
; 脚本: restools ( http://restools.hanzify.org )

#ifndef IS_ENHANCED
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=Test Mouse Event
AppVersion=1.5
DefaultDirName={pf}\My Application
SolidCompression=yes
Compression=lzma/ultra
PrivilegesRequired=none
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "btn1.bmp"; Flags: dontcopy solidbreak
Source: "btn2.bmp"; Flags: dontcopy solidbreak
Source: "btn3.bmp"; Flags: dontcopy solidbreak
Source: "btn4.bmp"; Flags: dontcopy solidbreak

[Code]
const
  ImgBtnCaption = 'my blog';
var
  ImgButton: TBitmapImage;
  ImgBtnMouseEnter: Boolean;
  ImgBtnMouseDown: Boolean;
  MouseEventList: TNewListBox;
  ButtonEnabled: TNewCheckBox;

procedure DrawBtnCaption(BmpBtn: TBitmap; BtnCaption: String; Enabled: Boolean);
var
  ImgBtnCaptionWidth, ImgBtnCaptionHeight: Integer;
begin
  BmpBtn.Canvas.Brush.Style := bsClear;
  ImgBtnCaptionWidth := BmpBtn.Canvas.TextWidth(BtnCaption);
  ImgBtnCaptionHeight := BmpBtn.Canvas.TextHeight(BtnCaption);
  if Enabled then
    BmpBtn.Canvas.Font.Color := clWindowText
  else
    BmpBtn.Canvas.Font.Color := clGrayText;
  BmpBtn.Canvas.TextOut((BmpBtn.Width-ImgBtnCaptionWidth) div 2, (BmpBtn.Height-ImgBtnCaptionHeight) div 2, BtnCaption);
end;

procedure ImgButtonOnClick(Sender: TObject);
var
  ErrorCode: Integer;
begin
  if not ButtonEnabled.Checked then exit;
  ShellExecAsOriginalUser('open', 'http://restools.hanzify.org/', '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);
  MouseEventList.Items.Append('OnClick');
  MouseEventList.ItemIndex := MouseEventList.Items.Count-1;
end;

procedure ImgButtonOnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X: Integer; Y: Integer);
begin
  if not ButtonEnabled.Checked then exit;
  ImgBtnMouseDown := True;
  with ImgButton do
  begin
    Bitmap.LoadFromFile(ExpandConstant('{tmp}\btn3.bmp'));
    DrawBtnCaption(Bitmap, ImgBtnCaption, ButtonEnabled.Checked);
  end;
  MouseEventList.Items.Append('OnMouseDown');
  MouseEventList.ItemIndex := MouseEventList.Items.Count-1;
end;

procedure ImgButtonOnMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X: Integer; Y: Integer);
begin
  if not ButtonEnabled.Checked then exit;
  ImgBtnMouseDown := False;
  if ImgBtnMouseEnter then
    with ImgButton do
    begin
      Bitmap.LoadFromFile(ExpandConstant('{tmp}\btn1.bmp'));
      DrawBtnCaption(Bitmap, ImgBtnCaption, ButtonEnabled.Checked);
    end;
  MouseEventList.Items.Append('OnMouseUp');
  MouseEventList.ItemIndex := MouseEventList.Items.Count-1;
end;

procedure ImgButtonOnMouseEnter(Sender: TObject);
begin
  if not ButtonEnabled.Checked then exit;
  ImgBtnMouseEnter := True;
  with ImgButton do
  begin
    if ImgBtnMouseDown then
      Bitmap.LoadFromFile(ExpandConstant('{tmp}\btn3.bmp'))
    else
      Bitmap.LoadFromFile(ExpandConstant('{tmp}\btn2.bmp'));
    DrawBtnCaption(Bitmap, ImgBtnCaption, ButtonEnabled.Checked);
  end;
  MouseEventList.Items.Append('OnMouseEnter');
  MouseEventList.ItemIndex := MouseEventList.Items.Count-1;
end;

procedure ImgButtonOnMouseLeave(Sender: TObject);
begin
  if not ButtonEnabled.Checked then exit;
  ImgBtnMouseEnter := False;
  with ImgButton do
  begin
    Bitmap.LoadFromFile(ExpandConstant('{tmp}\btn1.bmp'));
    DrawBtnCaption(Bitmap, ImgBtnCaption, ButtonEnabled.Checked);
  end;
  MouseEventList.Items.Append('OnMouseLeave');
  MouseEventList.ItemIndex := MouseEventList.Items.Count-1;
end;

procedure ButtonEnabledOnClick(Sender: TObject);
begin
  with ImgButton do
  begin
    if ButtonEnabled.Checked then
    begin
      Bitmap.LoadFromFile(ExpandConstant('{tmp}\btn1.bmp'));
      Cursor := crHand;
      ShowHint := True;
    end else begin
      Bitmap.LoadFromFile(ExpandConstant('{tmp}\btn4.bmp'));
      Cursor := crDefault;
      ShowHint := False;
    end;
    DrawBtnCaption(Bitmap, ImgBtnCaption, ButtonEnabled.Checked);
  end;
end;

procedure InitializeWizard();
begin
  WizardForm.OuterNotebook.Hide;
  WizardForm.Bevel.Hide;
  WizardForm.Color := clWhite;

  ExtractTemporaryFile('btn1.bmp');
  ExtractTemporaryFile('btn2.bmp');
  ExtractTemporaryFile('btn3.bmp');
  ExtractTemporaryFile('btn4.bmp');

  ImgButton := TBitmapImage.Create(WizardForm);
  with ImgButton do
  begin
    Hint := 'visit my blog';
    ShowHint := True;
    Cursor := crHand;
    OnClick := @ImgButtonOnClick;
    OnMouseDown := @ImgButtonOnMouseDown;
    OnMouseUp := @ImgButtonOnMouseUp;
    OnMouseEnter := @ImgButtonOnMouseEnter;
    OnMouseLeave := @ImgButtonOnMouseLeave;
    Parent := WizardForm;
    Left := ScaleX(20);
    Top := ScaleY(20);
    AutoSize := True;
    Bitmap.LoadFromFile(ExpandConstant('{tmp}\btn1.bmp'));
    DrawBtnCaption(Bitmap, ImgBtnCaption, True);
  end;
  
  with TNewStaticText.Create(WizardForm) do
  begin
    Caption := 'Mouse Event:';
    Parent := WizardForm;
    Left := ImgButton.Left;
    Top := ImgButton.Top+ScaleY(40);
  end;
  
  MouseEventList := TNewListBox.Create(WizardForm);
  with MouseEventList do
  begin
    Parent := WizardForm;
    Left := ImgButton.Left;
    Top := ImgButton.Top+ScaleY(60);
    Width := ScaleX(150);
    Height := ScaleY(250);
  end;
  
  ButtonEnabled := TNewCheckBox.Create(WizardForm);
  with ButtonEnabled do
  begin
    Parent := WizardForm;
    Left := ScaleX(206);
    Top := ScaleY(32);
    Caption := 'Enable Button';
    Checked := True;
    OnClick := @ButtonEnabledOnClick;
  end;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  WizardForm.NextButton.Hide;
  WizardForm.CancelButton.Caption := 'Close';
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  Confirm := False;
end;


