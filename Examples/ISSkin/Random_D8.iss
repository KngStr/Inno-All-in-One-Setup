//Author      : WLDNA
//Link        : http://www.wldna.com/
//Description :
//Modified    : 2013-11-14 11:40:59
//Tested Inno :
//Usage       : See Examples folder

#include "IsSkin.ish"

[Setup]
AppName=ISSkin Example
AppVerName=ISSkin Example v1.0
AppVersion=1.0.0.2
AppCopyright=?1998-2008 Codejock Software
DefaultDirName={pf}\ISSkin
DefaultGroupName=ISSkin
Compression=lzma
SolidCompression=true
OutputDir=userdocs:Inno Setup Examples Output

[Icons]
Name: {group}\Uninstall =ISSkin; Filename: {app}\unins000.exe

;Skins list to show
[CustomMessages]
Skins=Codejock%nISSkinEx%nOffice2007%nSakura%nVista

[Files]
; Add the Visual Style resource contains resources used for skinning,
; you can also use Microsoft Visual Styles (*.msstyles) resources.
Source: {#ExtendDir}\ISSkin\Styles\*.cjstyles; DestDir: {tmp}; Flags: dontcopy

[Code]
function InitializeSetup(): Boolean;
begin
	PDir('{# ISSkin_Dll }');
	
  RandomSkin(CustomMessage('Skins'));

	Result := True;
end;

procedure DeinitializeSetup();
begin
  DeinitSkin;
end;
