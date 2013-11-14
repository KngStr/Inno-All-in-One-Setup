; -- UninstallCodeDll.iss --
;
; This script shows how to call DLL functions at uninstall time from a [Code] section.

[Setup]
AppName=My Program
AppVerName=My Program version 1.5
DefaultDirName={pf}\My Program
DisableProgramGroupPage=yes
UninstallDisplayIcon={app}\MyProg.exe
OutputDir=userdocs:Inno Setup Examples Output

[Files]
; Install our DLL to {app} so we can access it at uninstall time
Source: "MyDll.dll"; DestDir: "{app}"

[Code]
const
  MB_ICONINFORMATION = $40;

// Importing our custom DLL function
procedure MyDllFunc(hWnd: Integer; lpText, lpCaption: String; uType: Cardinal);
external 'MyDllFunc@{app}\MyDll.dll stdcall uninstallonly';

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  // Call our function just before the actual uninstall process begins
  if CurUninstallStep = usUninstall then
  begin
    MyDllFunc(0, 'Hello from custom DLL function', 'MyDllFunc', MB_OK or MB_ICONINFORMATION);
    
    // Now that we're finished with it, unload MyDll.dll from memory.
    // We have to do this so that the uninstaller will be able to remove the DLL and the {app} directory.
    UnloadDLL(ExpandConstant('{app}\MyDll.dll'));
  end;
end;
