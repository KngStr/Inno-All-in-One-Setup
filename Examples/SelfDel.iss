[Setup]
AppName=My Program
AppVerName=My Program
DefaultDirName={tmp}
OutputBaseFilename=MyProgram
Uninstallable=no
DisableDirPage =yes
DisableProgramGroupPage=true
DisableReadyPage =yes
DisableFinishedPage =yes
OutputDir=userdocs:Inno Setup Examples Output


[CODE]
procedure CurStepChanged(CurStep: TSetupStep);
var
  S: String;
  ErrorCode: Integer;
  DelMe_Bat: String;
begin
  if CurStep=ssDone then
  begin
    S := ':try'+#13#10+'del "'+ExpandConstant('{srcexe}')+'"'+#13#10+'if exist "'+ExpandConstant('{srcexe}')+'" goto try'+#13#10+'del %0';
    DelMe_Bat := ExtractFilePath(ExpandConstant('{tmp}'))+'_delme.bat';
    SaveStringToFile(DelMe_Bat, S, False);
    Exec(DelMe_Bat, '', '', SW_HIDE, ewNoWait, ErrorCode);
  end;
end;