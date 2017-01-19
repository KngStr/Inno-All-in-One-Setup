#define MyAppName "My Program"
#define MyAppVerName "My Program 1.5"
#define MyAppPublisher "My Company, Inc."
#define MyAppURL "http://www.mycompany.com"

#include "itdownload.ish"

[Setup]
AppName={#MyAppName}
AppVerName={#MyAppVerName}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputBaseFilename=example1
Compression=lzma
SolidCompression=true
CreateAppDir=true
ShowLanguageDialog=yes
OutputDir=userdocs:Inno Setup Examples Output

[Languages]
Name: english; MessagesFile: compiler:Default.isl

[Code]
procedure InitializeWizard();
begin
 itd_init;
 PDir('{#ItDownload_DLL}');

 //Let's download two zipfiles from my website..
 itd_addfile('http://www.sherlocksoftware.org/petz/files/dogz5.zip',expandconstant('{tmp}\dogz5.zip'));
 itd_addfile('http://www.sherlocksoftware.org/petz/files/petz4.zip',expandconstant('{tmp}\petz4.zip'));

 //Start the download after the "Ready to install" screen is shown
 itd_downloadafter(wpReady);
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
 if CurStep=ssInstall then begin //Lets install those files that were downloaded for us
  filecopy(expandconstant('{tmp}\dogz5.zip'),expandconstant('{app}\dogz5.zip'),false);
  filecopy(expandconstant('{tmp}\petz4.zip'),expandconstant('{app}\petz4.zip'),false);
 end;
end;
