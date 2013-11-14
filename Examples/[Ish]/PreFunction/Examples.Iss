//Author      : WLDNA
//Link        : http://www.wldna.com/
//Description :
//Modified    : 2013-11-14 11:40:59
//Tested Inno :
//Usage       : See Examples folder

#include "PreFunc.iss"
#define MyAppName "Ish Examples"

[Setup]
AppName={#MyAppName}
AppVersion=1.0
CreateAppDir=false
OutputDir=userdocs:Inno Setup Examples Output

[code]
function InitializeSetup(): Boolean;
begin
  Result := {# PreInitializeSetup };
end;

procedure InitializeWizard();
begin
  {# PreInitializeWizard }
end;

procedure DeinitializeSetup();
begin
  {# PreDeinitializeSetup }
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  {# PreCurPageChanged }
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  {# PreCurStepChanged }
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := {# PreNextButtonClick };
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  Result := {# PreShouldSkipPage };
end;

