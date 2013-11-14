;InnoSetupVersion=5.4.2 (Unicode)

[Setup]
AppName=Inno Script Studio
AppVersion=1.0.0.24
DefaultDirName={pf}\Inno Script Studio
DefaultGroupName=Inno Script Studio
OutputBaseFilename=ISStudio_Latest
Compression=lzma
LicenseFile=embedded\License.rtf
WizardImageFile=embedded\WizardImage.bmp
WizardSmallImageFile=embedded\WizardSmallImage.bmp

[Files]
Source: "{tmp}\iswin7.dll"; DestDir: "{tmp}"; MinVersion: 0.0,5.0; Flags: deleteafterinstall dontcopy 
Source: "{app}\ISStudio.exe"; DestDir: "{app}"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Constants.ini"; DestDir: "{app}"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Plugins\ISS_Insert_Color_Plugin.dll"; DestDir: "{app}\Plugins"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Plugins\_ISS_Example_Plugin.dll"; DestDir: "{app}\Plugins"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Languages\french.lng"; DestDir: "{app}\Languages"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Languages\russian.lng"; DestDir: "{app}\Languages"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Languages\Extended Hints\1033.ini"; DestDir: "{app}\Languages\Extended Hints"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Languages\Extended Hints\1049.ini"; DestDir: "{app}\Languages\Extended Hints"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Languages\Extended Hints\Blank.ini"; DestDir: "{app}\Languages\Extended Hints"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\License.rtf"; DestDir: "{app}"; MinVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\Version History.rtf"; DestDir: "{app}"; MinVersion: 0.0,5.0; Flags: ignoreversion 

[Dirs]
Name: "{app}\Plugins"; 
Name: "{app}\Skins"; 
Name: "{app}\Languages"; 
Name: "{app}\Languages\Extended Hints"; 
Name: "{app}\Styles"; 

[Registry]
Root: HKCU; Subkey: "Software\Kymoto Solutions\Inno Script Studio\Toolbars"; Check: "IsUpgrade"; MinVersion: 0.0,5.0; Flags: deletekey 

[Run]
Filename: "{app}\ISStudio.exe"; Description: "{cm:LaunchProgram,Inno Script Studio}"; Check: "not IsUpgrade"; MinVersion: 0.0,5.0; 
Filename: "{app}\ISStudio.exe"; Parameters: "/ASSOC"; StatusMsg: "{cm:AssocingFileExtension,Inno Setup,.iss}"; Tasks: "issfileassociation"; MinVersion: 0.0,5.0; 

[UninstallRun]
Filename: "{app}\ISStudio.exe"; Parameters: "/UNASSOC"; RunOnceId: "RemoveISSAssoc"; MinVersion: 0.0,5.0; 

[Icons]
Name: "{group}\Inno Script Studio"; Filename: "{app}\ISStudio.exe"; MinVersion: 0.0,5.0; 
Name: "{group}\{cm:ProgramOnTheWeb,Inno Script Studio}"; Filename: "http://www.kymoto.org"; MinVersion: 0.0,5.0; 
Name: "{group}\{cm:LicenseFile,Inno Script Studio}"; Filename: "{app}\License.rtf"; MinVersion: 0.0,5.0; 
Name: "{group}\{cm:VersionHistory,Inno Script Studio}"; Filename: "{app}\Version History.rtf"; MinVersion: 0.0,5.0; 
Name: "{commondesktop}\Inno Script Studio"; Filename: "{app}\ISStudio.exe"; Tasks: "desktopicon"; MinVersion: 0.0,5.0; 
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\Inno Script Studio"; Filename: "{app}\ISStudio.exe"; Tasks: "quicklaunchicon"; MinVersion: 0.0,5.0; 

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; MinVersion: 0.0,5.0; 
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; MinVersion: 0.0,5.0; OnlyBelowVersion: 0.0,6.01; 
Name: "issfileassociation"; Description: "{cm:AssocFileExtension,Inno Script Studio,.iss}"; GroupDescription: "{cm:ISSFileAssociationGroup}"; MinVersion: 0.0,5.0; 
Name: "deletetoolbardata"; Description: "{cm:ResetToolbars, Inno Script Studio}"; GroupDescription: "{cm:ResetToolbarsGroup}"; Check: "IsUpgrade"; MinVersion: 0.0,5.0; 

[CustomMessages]
english.NameAndVersion=%1 version %2
english.AdditionalIcons=Additional icons:
english.CreateDesktopIcon=Create a &desktop icon
english.CreateQuickLaunchIcon=Create a &Quick Launch icon
english.ProgramOnTheWeb=%1 on the Web
english.UninstallProgram=Uninstall %1
english.LaunchProgram=Launch %1
english.AssocFileExtension=&Associate %1 with the %2 file extension
english.AssocingFileExtension=Associating %1 with the %2 file extension...
LicenseFile=%1 License
VersionHistory=%1 Version History
ISSFileAssociationGroup=File Associations:
ResetToolbars=Reset %1 Toolbars to Default
ResetToolbarsGroup=Reset Application Toolbars:

[Languages]
; These files are stubs
; To achieve better results after recompilation, use the real language files
Name: "english"; MessagesFile: "embedded\english.isl"; 
