//Author      : KngStr
//Link        : http://www.kngstr.com/
//Description :
//Modified    : 2013-11-14 11:40:59
//Tested Inno :
//Usage       : See Examples folder


;Define switch that plugin will be used by uninstaller.
#Define Plugin_UnInst True
;Define the path plugins stored
#Define Plugin_UnInst_Dir "UninsFiles"
;Include some Inno Setup HeaderFile
#include "ISTask.Ish"
;Define switch to off
#Define Plugin_UnInst False

#define MyAppName "Ish Examples"

[Setup]
AppName={#MyAppName}
AppVersion=1.0
CreateAppDir=false
OutputDir=userdocs:Inno Setup Examples Output

[code]
function InitializeSetup(): Boolean;
begin
  //Extract the dll that functions import from.
  {# AutoPDirs };

  //Then you can call functions or procedures form the dll
  ......
  //
end;

