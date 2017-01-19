const
  NeedSize = 3700;

var
NeedSpaceLabel,FreeSpaceLabel: TLabel;
FreeMB, TotalMB: Cardinal;


procedure GetFreeSpaceCaption(Sender: TObject);
var
Path: String;
begin
Path := ExtractFileDrive(WizardForm.DirEdit.Text);
GetSpaceOnDisk(Path, True, FreeMB, TotalMB);
if FreeMB > 1024 then
FreeSpaceLabel.Caption := 'Свободно на выбранном диске: ' + FloatToStr(round(FreeMB/1024*100)/100) + ' GB'
else
FreeSpaceLabel.Caption := 'Свободно на выбранном диске: ' + IntToStr(FreeMB)+ ' MB';
begin
if FreeMB < NeedSize then
begin
WizardForm.NextButton.Enabled:=false;
end else
WizardForm.NextButton.Enabled:=true;
end;
end;

procedure InitializeWizard();
begin
WizardForm.DiskSpaceLabel.Hide;

NeedSpaceLabel := TLabel.Create(WizardForm);
with NeedSpaceLabel do
begin
Parent := WizardForm.SelectDirPage;
Left := ScaleX(0);
Top := ScaleY(198);
Width := ScaleX(209);
Height := ScaleY(13);
Caption := 'Требуется для установки: xxx GB';
end;

FreeSpaceLabel := TLabel.Create(WizardForm);
with FreeSpaceLabel do
begin
Parent := WizardForm.SelectDirPage;
Left := ScaleX(0);
Top := ScaleY(216);
Width := ScaleX(209);
Height := ScaleY(13);
end;


WizardForm.DirEdit.OnChange := @GetFreeSpaceCaption;
WizardForm.DirEdit.Text := WizardForm.DirEdit.Text + #0;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
if  CurPageID = wpSelectDir then
if FreeMB < NeedSize then
begin
WizardForm.NextButton.Enabled:=False
end;
end;
