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
OutputBaseFilename=example4
Compression=lzma
SolidCompression=true
CreateAppDir=true
ShowLanguageDialog=yes
OutputDir=userdocs:Inno Setup Examples Output

[Languages]
Name: en; MessagesFile: compiler:Default.isl
Name: fr; MessagesFile: compiler:Languages\French.isl
Name: nl; MessagesFile: compiler:Languages\Dutch.isl
Name: ptbr; MessagesFile: compiler:Languages\BrazilianPortuguese.isl

[Code]
{ EXAMPLE 4

  In this example, a translation for the UI is read from a file. If the
  language name from the [Languages] section matches the one in the filename
  of an ITD language file, it is used. Otherwise, English is used.
}

{Load the ITD language file that corresponds to Inno's selected
 language}
procedure LoadITDLang;
var lang:string;
begin
 lang:=ExpandConstant('{language}');

 try
   ExtractTemporaryFile('itd_'+lang+'.ini');

   ITD_LoadStrings(expandconstant('{tmp}\itd_'+lang+'.ini'));
 except
   {We get here if the selected language wasn't included in the
    set of ITD translation files. In this case, just use ITD's
    built in translation file (English), by not loading anything.

    Note that the exception will still appear while debugging -
    you can turn this off in Inno Setup Compiler options
    ("Pause on exceptions"), or just ignore it. It doesn't appear
    at runtime.}
 end;
end;

procedure InitializeWizard();
begin
  itd_init;
  PDir('{#ItDownload_DLL}');

  LoadITDLang;

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
