//Author      : WLDNA
//Link        : http://www.wldna.com/
//Description :
//Modified    : 2013-11-14 11:40:59
//Tested Inno :
//Usage       : See Examples folder

[Code]
procedure Test_InitializeWizard();
begin
  MsgBox('Message for [Test_InitializeWizard] in {# __FILE__ }', mbInformation, MB_OK);
end;
#expr AddPreInitializeWizard("Test_InitializeWizard")

procedure Test_DeinitializeSetup();
begin
  MsgBox('Message for [Test_DeinitializeSetup] in {# __FILE__ }', mbInformation, MB_OK);
end;
#expr AddPreDeinitializeSetup("Test_DeinitializeSetup")

procedure Test_CurPageChanged(CurPageID: integer);
begin
  MsgBox('Message for [Test_CurPageChanged] in {# __FILE__ }', mbInformation, MB_OK);
end;
#expr AddPreCurPageChanged("Test_CurPageChanged")

procedure Test_CurStepChanged(CurStep: TSetupStep);
begin
  MsgBox('Message for [Test_CurStepChanged] in {# __FILE__ }', mbInformation, MB_OK);
end;
#expr AddPreCurStepChanged("Test_CurStepChanged")

function Test_InitializeSetup(): Boolean;
begin
  Result := MsgBox('Message for [Test_InitializeSetup] in {# __FILE__ }, do you want to install this demo?', mbInformation, MB_YESNO) = IDYES;
end;
#expr AddPreInitializeSetup("Test_InitializeSetup")

function Test_NextButtonClick(CurPageID: integer): Boolean;
begin
  Result := MsgBox('Message for [Test_NextButtonClick] in {# __FILE__ }, do you want to go to next page?', mbInformation, MB_YESNO) = IDYES;
end;
#expr AddPreNextButtonClick("Test_NextButtonClick")

function Test_ShouldSkipPage(PageID: integer): Boolean;
begin
  Result := MsgBox('Message for [Test_ShouldSkipPage]] in {# __FILE__ }, do you want to skip this page?', mbInformation, MB_YESNO) = IDYES;
end;
#expr AddPreShouldSkipPage("Test_ShouldSkipPage")
[/Code]