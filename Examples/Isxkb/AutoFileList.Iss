[Setup]
AppName=Test
AppId=Test
AppVerName=Test 1.0
DefaultDirName={tmp}
DefaultGroupName=Test
OutputBaseFilename=Test Install
OutputDir=userdocs:Inno Setup Examples Output
Uninstallable=no

[Files]
Source: AutoFileList.Iss; DestDir: {app}
Source: compiler:Examples\*; DestDir: {app}

;Always include autoProcessScript.iss after the [Files] section.
#include "autoProcessScript.iss"
#include "setupFileList.iss"

[Code]
function InitializeSetup() : Boolean;
var
  entry    : Integer;
  listLen  : Integer;
  fileList : TSetupFileList;
begin
  Result   := False;
  fileList := GetSetupFileList();
  listLen  := GetArrayLength(fileList);

  for entry := 0 to listLen - 1 do
  begin
      MsgBox('Name:    ' + fileList[entry].Name + #13#10 +
             'DestDir: ' + fileList[entry].DestDir + #13#10 +
             'Version: ' + fileList[entry].Version + #13#10,
             mbInformation, MB_OK);
  end;
end;
[/Code]

