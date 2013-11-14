; -- Example1.iss --
; Demonstrates copying 3 files and creating an icon.

; SEE THE DOCUMENTATION FOR DETAILS ON CREATING .ISS SCRIPT FILES!

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
WizardImageFile={#ExtendDir}\Graphics\Wizard\Office2007Gray.bmp
WizardSmallImageFile=compiler:WizModernSmallImage-IS.bmp
UninstallDisplayIcon={app}\SkinHelper.exe
OutputDir=userdocs:Inno Setup Examples Output
OutputBaseFilename=SetupOffice2007Silver
VersionInfoVersion=1.0.0.2
VersionInfoCompany=Codejock Software
VersionInfoDescription=ISSkin Example Setup
VersionInfoTextVersion=1, 0, 0, 2

[Files]
; Add the Visual Style resource contains resources used for skinning,
; you can also use Microsoft Visual Styles (*.msstyles) resources.
Source: {#ExtendDir}\ISSkin\Styles\Office2007.cjstyles; DestDir: {tmp}; Flags: dontcopy

[Icons]
Name: {group}\Uninstall =ISSkin; Filename: {app}\unins000.exe

; The following code block is used to load the ISS, pass in
; an empty string ('') as the second parameter to LoadSkin to use
; the Blue color scheme, this is the default color scheme for
; Office2007.cjstyles.
[Code]
function InitializeSetup(): Boolean;
begin
	PDir('{#ISSkin_Dll}');
  InitSkin('Office2007', 'NormalSilver.ini');
	Result := True;
end;

procedure DeinitializeSetup();
begin
  DeinitSkin
end;

