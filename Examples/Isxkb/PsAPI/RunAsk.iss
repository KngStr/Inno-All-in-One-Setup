;
; IS 5.1,5
;
; portion of code Michael Winestock
; http://news.jrsoftware.org/news/innosetup/msg53256.html

;Author: Vincenzo
;Article created: 02/02/06 23:15:19
;Article URL : http://www.vincenzo.net/isxkb/modules.php?name=News&file=article&sid=107

#include "psapi.ish"

[Setup]
AppName=Psapi
AppVerName=Psapi
DisableProgramGroupPage=true
DisableStartupPrompt=true
DefaultDirName={pf}\Psapi
OutputDir=userdocs:Inno Setup Examples Output

[Code]
function InitializeSetup() : Boolean;
begin
   Result := CheckForRunningModules(msgSetupAppRunningError, 'qq.exe', False);
end;

function InitializeUninstall() : Boolean;
begin
   Result := CheckForRunningModules(msgUninstallAppRunningError, 'notepad.exe', False);
end;