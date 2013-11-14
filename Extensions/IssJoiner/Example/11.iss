var
  PageNameLabel, PageDescriptionLabel: TLabel;


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
begin
  WizardForm.WelcomeLabel1.Hide;
  WizardForm.WelcomeLabel2.Hide;
  WizardForm.FinishedHeadingLabel.Hide;
  WizardForm.FinishedLabel.Hide;
  WizardForm.WizardBitmapImage.Width := WizardForm.Width;
  WizardForm.WizardBitmapImage.Height := WizardForm.Height;

  PageNameLabel := TLabel.Create(WizardForm);
  with PageNameLabel do
  begin
    Left := ScaleX(10);
    Top := ScaleY(10);
    Width := ScaleX(300);
    Height := ScaleY(14);
    AutoSize := False;
    WordWrap := True;
    Font.Color := clWhite;
    Font.Style := [fsBold];
    ShowAccelChar := False;
    Transparent := True;
    Parent := WizardForm.MainPanel;
  end;

  PageDescriptionLabel := TLabel.Create(WizardForm);
  with PageDescriptionLabel do
  begin
    Left := ScaleX(15);
    Top := ScaleY(25);
    Width := ScaleX(475);
    Height := ScaleY(30);
    AutoSize := False;
    WordWrap := True;
    Font.Color := clWhite;
    ShowAccelChar := False;
    Transparent := True;
    Parent := WizardForm.MainPanel;
  end;

  with WizardForm do
  begin
    PageNameLabel.Hide;
    PageDescriptionLabel.Hide;
    with MainPanel do
    begin
      with WizardSmallBitmapImage do
      begin
        Left := ScaleX(0);
        Top := ScaleY(0);
        Width := Mainpanel.Width;
        Height := MainPanel.Height;
      end;
    end;
  end;
end;


procedure CurPageChanged(CurPageID: Integer);
begin
  PageNameLabel.Caption := WizardForm.PageNameLabel.Caption;
  PageDescriptionLabel.Caption := WizardForm.PageDescriptionLabel.Caption;
end;
