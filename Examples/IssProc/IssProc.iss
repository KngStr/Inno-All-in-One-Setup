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

function NextButtonClick(CurPage: Integer): Boolean;
var
  hWnd: Integer;
  sModuleName: String;
  nCode: Integer;  {IssFindModule returns: 0 if no module found; 1 if cancel pressed; 2 if ignore pressed; -1 if an error occured }
begin
  Result := true;

  if CurPage = wpReady then
  begin
    Result := false;

    PDir('IssProcLanguage.ini');                          { extract extra language file - you don't need to add this line if you are using english only }
    PDir('IssProc.dll');                          { extract extra language file - you don't need to add this line if you are using english only }
    PDir('IssProc.bmp');                                { extract the custom wizard image (you don't need to do this if you are satisfied with the default one) }

    hWnd := StrToInt(ExpandConstant('{wizardhwnd}'));                     { get main wizard handle }
    IssEnableAnyFileInUseCheck(ExpandConstant('{app}'));
    sModuleName :=ExpandConstant('{app}*;*calc.exe;*notepad.exe');        { searched modules, files and folders. Tip: separate multiple modules with semicolon Ex: '*mymodule.dll;*mymodule2.dll;*myapp.exe'}

    IssRegister ('name','key');                                            { use your commercial license before using IssFindModule }
    nCode:=IssFindModule(hWnd,sModuleName,'en',false,true);                { search for module and display files-in-use window if found  }
    //sModuleName:=IntToStr(nCode);
    // MsgBox ( sModuleName, mbConfirmation, MB_YESNO or MB_DEFBUTTON2);

    if nCode=1 then  begin                                                 { cancel pressed or files-in-use window closed }
      PostMessage (WizardForm.Handle, $0010, 0, 0);                     { quit setup, $0010=WM_CLOSE }
    end else if (nCode=0) or (nCode=2) then begin                          { no module found or ignored pressed}
      Result := true;                                                   { continue setup  }
    end;
  end;
end;


function InitializeUninstall(): Boolean;
var
  sModuleName: String;
  nCode: Integer;  {IssFindModule returns: 0 if no module found; 1 if cancel pressed; 2 if ignore pressed; -1 if an error occured }

begin
  Result := false;

  PDir('IssProcLanguage.ini');                          { extract extra language file - you don't need to add this line if you are using english only }
  PDir('IssProc.dll');                          { extract extra language file - you don't need to add this line if you are using english only }
  //PDir('IssProc.bmp');                                { extract the custom wizard image (you don't need to do this if you are satisfied with the default one) }

  sModuleName := ExpandConstant('{app}*;*notepad.exe;*dummy_lib.dll');   { searched module. Tip: separate multiple modules with semicolon Ex: '*mymodule.dll;*mymodule2.dll;*myapp.exe'}
  IssRegister ('name','key');                                    { use your commercial license before using IssFindModule }
  IssEnableAnyFileInUseCheck(ExpandConstant('{app}'));
  nCode:=IssFindModule(0,sModuleName,'enu',false,false); { search for module and display files-in-use window if found  }

  if (nCode=0) or (nCode=2) then begin                    { no module found or ignored pressed}
    Result := true;                                       { continue setup  }
  end;
end;
