;
; Author: Vincenzo Giordano
; email: isxkb@vincenzo.net
;
; This script shows how to call psvince.dll and detect if a module
; is loaded in memory or not so you can detect if a program is running

#include "PSVince.Ish"

[Setup]
AppName=PSVince
AppVerName=PSVince 1.0
DisableProgramGroupPage=true
DisableStartupPrompt=true
OutputDir=userdocs:Inno Setup Examples Output
OutputBaseFilename=testpsvince
Uninstallable=false
DisableDirPage=true
DefaultDirName={pf}\PSVince

[Code]
function InitializeSetup(): Boolean;
begin
  PDir('{#PSVince_Dll}');

  // check if notepad is running
  if IsModuleLoaded( 'notepad.exe' ) then
  begin
    MsgBox( 'Notepad is running, please close it and run again setup.',
             mbError, MB_OK );
    Result := false;
  end
  else
  begin
    MsgBox( 'Notepad is not running, please close it and run again setup.',
             mbInformation, MB_OK );
    Result := true;
  end;
end;

