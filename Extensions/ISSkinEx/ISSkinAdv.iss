; -- Example1.iss --
; Demonstrates copying 3 files and creating an icon.

; SEE THE DOCUMENTATION FOR DETAILS ON CREATING .ISS SCRIPT FILES!

[Setup]
AppName=ISSkin Example
AppVerName=ISSkin Example v1.0
AppVersion=1.0.0.2
AppCopyright=© 1998-2008 Codejock Software
DefaultDirName={pf}\ISSkin
DefaultGroupName=ISSkin
Compression=lzma
SolidCompression=true
WizardImageFile=Styles\Office2007Gray.bmp
WizardSmallImageFile=compiler:WizModernSmallImage-IS.bmp
UninstallDisplayIcon={app}\SkinHelper.exe
OutputDir=.\Output
OutputBaseFilename=SetupOffice2007Silver
VersionInfoVersion=1.0.0.2
VersionInfoCompany=Codejock Software
VersionInfoDescription=ISSkin Example Setup
VersionInfoTextVersion=1, 0, 0, 2

[Files]
; Add the ISSkin DLL used for skinning Inno Setup installations.
Source: ISSkinEx.dll; DestDir: {app}; Flags: dontcopy

; Add the Visual Style resource contains resources used for skinning,
; you can also use Microsoft Visual Styles (*.msstyles) resources.
Source: Styles\Office2007.cjstyles; DestDir: {tmp}; Flags: dontcopy

[Icons]
Name: {group}\Uninstall =ISSkin; Filename: {app}\unins000.exe

; The following code block is used to load the ISS, pass in
; NormalSilver.ini as the second parameter to LoadSkin to use
; the Silver color scheme instead of the default Blue color
; scheme.
[Code]

// Importing ShowWindow Windows API from User32.DLL
function ShowWindow(hWnd: Integer; uType: Integer): Integer;
external 'ShowWindow@user32.dll stdcall';

var DLLHandle:integer;

function InitializeSetup(): Boolean;
var 
	ErrorCode: Integer;
	s1,s2: String;
begin
	result:=True;
	try
		ExtractTemporaryFile('isskinex.dll');
		DLLHandle:=LoadDLL(ExpandConstant('{tmp}\isskinex.dll') , ErrorCode);
		if (DLLHandle > 0) then
    begin
			ExtractTemporaryFile('Office2007.cjstyles');
			s1:=ExpandConstant('{tmp}\Office2007.cjstyles');
			s2:='NormalAqua.ini';
			if not CallDLLProc(DLLHandle,'LoadSkin',CastStringToInteger(s1), CastStringToInteger(s2), ErrorCode) then
			begin
				//    Failed :(
			end;
		end else 
		begin
			// Failed :(
		end;
	except
	end;
end;


procedure DeinitializeSetup();
var
  ErrorCode: Integer;
begin
	try
		if DLLHandle > 0 then
		begin
			ShowWindow(StrToInt(ExpandConstant('{wizardhwnd}')), 0);
			CallDLLProc(DLLHandle,'UnloadSkin',0, 0,ErrorCode);
			FreeDLL(DLLHandle);
			DeleteFile(ExpandConstant('{tmp}\isskinex.dll'));
		end;
	except
	end;
end;
