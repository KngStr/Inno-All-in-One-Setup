var
    Dop: TCheckBox;
    DesktopIcon: TCheckBox;

function MakeDesktopIcon: Boolean;
begin
    Result:=DesktopIcon.Checked;
end;

function InstallDop: Boolean;
begin
    Result:=Dop.Checked;
end;

procedure InitializeWizard();
begin
    dop := TCheckBox.Create(WizardForm);
    with Dop do
    begin
        Parent := WizardForm.SelectDirPage;
        Caption := 'Установить дополнительные программы ';
        Left := ScaleX(0);
        Top := WizardForm.DirEdit.Top+35;
        Width := ScaleX(400);
        Height := ScaleY(15);
        TabOrder := 0;
        Checked := True;
    end;

    DesktopIcon := TCheckBox.Create(WizardForm);
    with DesktopIcon do
    begin
        Parent := WizardForm.SelectDirPage;
        Caption := 'Добавить ярлык на рабочий стол';
        Left := ScaleX(0);
        Top := dop.Top + 35;
        Width := ScaleX(400);
        Height := ScaleY(15);
        TabOrder := 0;
        Checked := True;
    end;
end;
