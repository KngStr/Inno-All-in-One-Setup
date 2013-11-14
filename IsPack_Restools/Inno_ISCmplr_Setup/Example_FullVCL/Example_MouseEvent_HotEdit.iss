; 演示使用多个鼠标事件进行高级界面处理
; 脚本: restools ( http://restools.hanzify.org )

#ifdef IS_ENHANCED
  #if (Ver < 0x5040000) || (Pos('ee', IS_Ver_Str) < 1)
    #pragma error 'Enhanced edition of Inno Setup (5.4.0.ee4 or higher) is required to compile this script'
  #endif
#else
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

[Code]
var
  EventList: TNewListBox;
  HotShadow: TBitmapImage;
  FocusShadow: TBitmapImage;

procedure HotEditOnEnter(Sender: TObject);
begin
  if TNewEdit(Sender).Tag = 0 then
  begin
    TNewEdit(Sender).Clear;
    TNewEdit(Sender).Font.Color := clWindowText;
    TNewEdit(Sender).Font.Style := [];
    TNewEdit(Sender).Tag := 1;
  end;
  FocusShadow.SetBounds(TNewEdit(Sender).Left-2, TNewEdit(Sender).Top-2, TNewEdit(Sender).Width+4, TNewEdit(Sender).Height+4);
  FocusShadow.Show;
  EventList.Items.Append(TNewEdit(Sender).Name+'.OnEnter');
  EventList.ItemIndex := EventList.Items.Count-1;
end;

procedure HotEditOnExit(Sender: TObject);
begin
  if (TNewEdit(Sender).Tag = 1) and (TNewEdit(Sender).Text = '') then
  begin
    TNewEdit(Sender).Text := 'Please enter your text';
    TNewEdit(Sender).Font.Color := clGrayText;
    TNewEdit(Sender).Font.Style := [];
    TNewEdit(Sender).Tag := 0;
  end;
  FocusShadow.Hide;
  EventList.Items.Append(TNewEdit(Sender).Name+'.OnExit');
  EventList.ItemIndex := EventList.Items.Count-1;
end;

procedure HotEditOnMouseEnter(Sender: TObject);
begin
  HotShadow.SetBounds(TControl(Sender).Left-1, TControl(Sender).Top-1, TControl(Sender).Width+2, TControl(Sender).Height+2);
  HotShadow.Show;
  EventList.Items.Append(TControl(Sender).Name+'.OnMouseEnter');
  EventList.ItemIndex := EventList.Items.Count-1;
end;

procedure HotEditOnMouseLeave(Sender: TObject);
begin
  HotShadow.Hide;
  EventList.Items.Append(TControl(Sender).Name+'.OnMouseLeave');
  EventList.ItemIndex := EventList.Items.Count-1;
end;

procedure InitializeWizard();
begin 
  HotShadow := TBitmapImage.Create(WizardForm);
  HotShadow.Hide;
  HotShadow.Parent := WizardForm;
  HotShadow.BackColor := clBlue;

  FocusShadow := TBitmapImage.Create(WizardForm);
  FocusShadow.Hide;
  FocusShadow.Parent := WizardForm;
  FocusShadow.BackColor := clBlue;

  WizardForm.OuterNotebook.Hide;
  WizardForm.Bevel.Hide;
  
  with TNewEdit.Create(WizardForm) do
  begin
    Name := 'NewEdit1';
    Text := 'Please enter your text';
    Font.Color := clGrayText;
    Font.Size := 10;
    OnEnter := @HotEditOnEnter;
    OnExit := @HotEditOnExit;
    OnMouseEnter := @HotEditOnMouseEnter;
    OnMouseLeave := @HotEditOnMouseLeave;
    Parent := WizardForm;
    BorderStyle := bsNone;
    SetBounds(ScaleX(20), ScaleY(20), ScaleX(200), ScaleY(18));
  end;

  with TNewEdit.Create(WizardForm) do
  begin
    Name := 'NewEdit2';
    Text := 'Please enter your text';
    Font.Color := clGrayText;
    Font.Size := 10;
    OnEnter := @HotEditOnEnter;
    OnExit := @HotEditOnExit;
    OnMouseEnter := @HotEditOnMouseEnter;
    OnMouseLeave := @HotEditOnMouseLeave;
    Parent := WizardForm;
    BorderStyle := bsNone;
    SetBounds(ScaleX(240), ScaleY(20), ScaleX(200), ScaleY(18));
  end;

  with TNewStaticText.Create(WizardForm) do
  begin
    Caption := 'Event:';
    Parent := WizardForm;
    Left := ScaleX(20);
    Top := ScaleY(50);
  end;
  
  EventList := TNewListBox.Create(WizardForm);
  with EventList do
  begin
    Parent := WizardForm;
    Left := ScaleX(20);
    Top := ScaleY(70);
    Width := ScaleX(200);
    Height := ScaleY(250);
  end;
  
  WizardForm.CancelButton.OnMouseEnter := @HotEditOnMouseEnter;
  WizardForm.CancelButton.OnMouseLeave := @HotEditOnMouseLeave;

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


