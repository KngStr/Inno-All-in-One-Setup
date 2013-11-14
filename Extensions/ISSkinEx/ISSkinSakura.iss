; restools
; My BLOG: http://restools.hanzify.org

[Setup]
AppName=ISSkin Example
AppVersion=1.0
DefaultDirName={pf}\ISSkin
SolidCompression=true
WizardImageFile=.\Styles\SakuraWizard.bmp
WizardSmallImageFile=.\Styles\SakuraSmall.bmp
OutputDir=.\Output
OutputBaseFilename=ISSkinSakura

[Files]
; Add the ISSkin DLL used for skinning Inno Setup installations.
Source: ISSkinEx.dll; DestDir: {app}; Flags: dontcopy

; Add the Visual Style resource contains resources used for skinning,
; you can also use Microsoft Visual Styles (*.msstyles) resources.
Source: ".\Styles\Sakura.cjstyles"; Flags: dontcopy

[Code]
// Importing LoadSkin API from ISSkin.DLL
procedure LoadSkin(lpszPath: String; lpszIniFileName: String);
external 'LoadSkin@files:isskinex.dll stdcall';

// Importing UnloadSkin API from ISSkin.DLL
procedure UnloadSkin();
external 'UnloadSkin@files:isskinex.dll stdcall';

// Importing ShowWindow Windows API from User32.DLL
function ShowWindow(hWnd: Integer; uType: Integer): Integer;
external 'ShowWindow@user32.dll stdcall';

function GetClassLong(Wnd: HWnd; Index: Integer): Longint;
external 'GetClassLongA@user32.dll stdcall';
function SetClassLong(Wnd: HWnd; Index: Integer; NewLong: Longint): Longint;
external 'SetClassLongA@user32.dll stdcall';

function InitializeSetup(): Boolean;
begin
	ExtractTemporaryFile('Sakura.cjstyles');
	LoadSkin(ExpandConstant('{tmp}\Sakura.cjstyles'), '');
	Result := True;
end;

procedure DeinitializeSetup();
begin
	// Hide Window before unloading skin so user does not get
	// a glimse of an unskinned window before it is closed.
	ShowWindow(StrToInt(ExpandConstant('{wizardhwnd}')), 0);
	UnloadSkin();
end;

function CheckWin32Version(AMajor: Integer; AMinor: Integer): Boolean;
var
  WinVer: TWindowsVersion;
begin
  GetWindowsVersionEx(WinVer);
  Result := (WinVer.Major > AMajor) or
            ((WinVer.Major = AMajor) and
             (WinVer.Minor >= AMinor));
end;

procedure InitializeWizard();
begin
  WizardForm.WizardBitmapImage.Height := WizardForm.WelcomePage.Height;
  if CheckWin32Version(5, 1) and (not CheckWin32Version(6, 0)) then
    SetClassLong(WizardForm.Handle, -26, GetClassLong(WizardForm.Handle, -26) or $20000);
end;
