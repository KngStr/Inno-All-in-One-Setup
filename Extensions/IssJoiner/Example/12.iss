function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;
end;

function NeedRestart(): Boolean;
begin
  Result := True;
end;

function GetCustomSetupExitCode(): Integer;
begin
  Result := 1;
end;

procedure InitializeWizard();
var
  WLabel1, WLabel2,
  FLabel1, FLabel2: TLabel;
begin
  WizardForm.WelcomeLabel1.Hide;
  WizardForm.WelcomeLabel2.Hide;
  WizardForm.FinishedHeadingLabel.Hide;
  WizardForm.FinishedLabel.Hide;
  WizardForm.WizardBitmapImage.Width := WizardForm.Width;
  WizardForm.WizardBitmapImage.Height := WizardForm.Height;

  WLabel1 := TLabel.Create(WizardForm);
  WLabel1.Left := ScaleX(176);
  WLabel1.Top := ScaleY(16);
  WLabel1.Width := ScaleX(301);
  WLabel1.Height := ScaleY(54);
  WLabel1.AutoSize := False;
  WLabel1.WordWrap := True;
  WLabel1.Font.Size := 12;
  WLabel1.Font.Style := [fsBold];
  WLabel1.Font.Color:= clBlack;
  WLabel1.ShowAccelChar := False;
  WLabel1.Caption := WizardForm.WelcomeLabel1.Caption;
  WLabel1.Transparent := True;
  WLabel1.Parent := WizardForm.WelcomePage;

  WLabel2 :=TLabel.Create(WizardForm);
  WLabel2.Top := ScaleY(76);
  WLabel2.Left := ScaleX(176);
  WLabel2.Width := ScaleX(301);
  WLabel2.Height := ScaleY(234);
  WLabel2.AutoSize := False;
  WLabel2.WordWrap := True;
  WLabel2.Font.Color:= clBlack;
  WLabel2.ShowAccelChar := False;
  WLabel2.Caption := WizardForm.WelcomeLabel2.Caption;
  WLabel2.Transparent := True;
  WLabel2.Parent := WizardForm.WelcomePage;

  WizardForm.WizardBitmapImage2.Width := WizardForm.Width;
  WizardForm.WizardBitmapImage2.Height := WizardForm.Height;

  FLabel1 := TLabel.Create(WizardForm);
  FLabel1.Left := ScaleX(176);
  FLabel1.Top := ScaleY(16);
  FLabel1.Width := ScaleX(301);
  FLabel1.Height := ScaleY(54);
  FLabel1.AutoSize := False;
  FLabel1.WordWrap := True;
  FLabel1.Font.Size := 12;
  FLabel1.Font.Style := [fsBold];
  FLabel1.Font.Color:= clBlack;
  FLabel1.ShowAccelChar := False;
  FLabel1.Caption := WizardForm.FinishedHeadingLabel.Caption;
  FLabel1.Transparent := True;
  FLabel1.Parent := WizardForm.FinishedPage;

  FLabel2 :=TLabel.Create(WizardForm);
  FLabel2.Top := ScaleY(76);
  FLabel2.Left := ScaleX(176);
  FLabel2.Width := ScaleX(301);
  FLabel2.Height := ScaleY(53);
  FLabel2.AutoSize := False;
  FLabel2.WordWrap := True;
  FLabel2.Font.Color:= clBlack;
  FLabel2.ShowAccelChar := False;
  FLabel2.Caption := 'Программа установлена на Ваш компьютер.' #13#13
                     'Нажмите <Завершить>, чтобы выйти из программы установки.';
  FLabel2.Transparent := True;
  FLabel2.Parent := WizardForm.FinishedPage;
end;
