#include "IssProc.Ish"

[Setup]
AppName=IssProc Dummy Applications
AppVerName=IssProc Dummy Applications
AppPublisher=My Company, Inc.
AppPublisherURL=http://www.mycompany.com
AppSupportURL=http://www.mycompany.com
AppUpdatesURL=http://www.mycompany.com
DefaultDirName={pf}\Dummy Applications
DefaultGroupName=IssProc Dummy Applications
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output

[Languages]
Name: english; MessagesFile: compiler:Default.isl

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked

[Files]
;------ add IssProc.bmp: the custom wizard window image (you don't need to add this if you are satisfied with the default one)
Source: IssProc.bmp; DestDir: {tmp}; Flags: dontcopy
Source: dummy_app\*; DestDir: {app}; Flags: ignoreversion recursesubdirs

[Icons]
Name: {group}\dummy_application v1.0.0.1; Filename: {app}\1.0.0.1\dummy_application.exe
Name: {group}\dummy_application v1.1.0.0; Filename: {app}\1.1.0.0\dummy_application.exe
Name: {group}\dummy dll 1.1.0.0; Filename: {app}\dummy dll 1.1.0.0\dummy_application.exe
Name: {group}\dummy dll 2.0.0.0; Filename: {app}\dummy dll 2.0.0.0\dummy_application.exe
Name: {group}\Uninstall IssProc Dummy Applications; Filename: {uninstallexe}

[Run]
Filename: {app}\1.0.0.1\dummy_application.exe; Description: {cm:LaunchProgram,dummy application v1.0.0.1}; Flags: nowait postinstall skipifsilent
Filename: {app}\1.1.0.0\dummy_application.exe; Description: {cm:LaunchProgram,dummy application v1.1.0.0}; Flags: nowait postinstall skipifsilent
Filename: {app}\dummy dll 1.1.0.0\dummy_application.exe; Description: {cm:LaunchProgram,dummy dll 1.1.0.0}; Flags: nowait postinstall skipifsilent
Filename: {app}\dummy dll 2.0.0.0\dummy_application.exe; Description: {cm:LaunchProgram,dummy dll 2.0.0.0}; Flags: nowait postinstall skipifsilent


[Code]

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;
  //IssRegister ('name','key');                                            { use your commercial license before using IssFindModule }
  //IssEnableAnyFileInUseCheck(ExpandConstant('{app}'));
  if (CurPageID = wpReady) then Result := AutoIssProc(ExpandConstant('*{app}*'), 'chs', false, true);
end;


function InitializeUninstall(): Boolean;
begin
  Result := True;
  //IssRegister ('name','key');                                            { use your commercial license before using IssFindModule }
  //IssEnableAnyFileInUseCheck(ExpandConstant('{app}'));
  Result := AutoIssProc(ExpandConstant('*{app}*'), 'chs', false, true);
end;
