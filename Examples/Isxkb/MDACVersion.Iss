#include "SysVers.Ish"
#include "VerFunc.Ish"

[Setup]
AppName=MDAC
AppVerName=MDAC
DefaultDirName={pf}\MDAC
DisableStartupPrompt=true
Uninstallable=false
DisableDirPage=true
OutputDir=userdocs:Inno Setup Examples Output

[Code]

function InitializeSetup(): Boolean;
begin
  if CompareVersion( GetMDACVersion(), '2.60') < 0 then
  begin
    MsgBox( 'There is MDAC version: ' + GetMDACVersion() +
      ' it is necessary to install version 2.60.',  mbInformation, MB_OK );
    Result := false;
  end
  else
    Result := true;
end;

procedure InitializeWizard();
begin
  WizardForm.Caption := 'There is MDAC version: ' +  GetMDACVersion();
end;
