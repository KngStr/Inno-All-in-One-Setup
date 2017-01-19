#define MyAppName "My Program"
#define MyAppVerName "My Program 1.5"
#define MyAppPublisher "My Company, Inc."
#define MyAppURL "http://www.mycompany.com"

#include "itdownload.ish"
#include "ittray.ish"

[Setup]
AppName={#MyAppName}
AppVerName={#MyAppVerName}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputBaseFilename=example5
Compression=lzma
SolidCompression=true
CreateAppDir=true
ShowLanguageDialog=yes
OutputDir=userdocs:Inno Setup Examples Output

[Languages]
Name: english; MessagesFile: compiler:Default.isl

[Code]
{
	Example 5

	This example demonstrates how to integrate InnoTools Downloader with
	InnoTools Tray to have setup minimize to the tray while downloading.

	You must have InnoTools Tray installed to compile this example.
}

procedure MyITDEventHandler(event:integer);
begin
 {Extend ITD's default handling of events to include
  handling for a tray icon}

 case event of
  ITD_Event_DownloadPageEntered:begin

      //Only enable minimizing to tray from the download page
	  ITT_SetMinimizesToTray(true);

	  ITT_MinimizeToTray();

	  ITT_ShowBalloon('Setup is downloading additional files...',
	  'You can continue to use your computer while setup '+
	  'is downloading files.',10);
  end;

  ITD_Event_DownloadPageLeft:begin
	ITT_SetMinimizesToTray(false);

	if ITT_IsInTray then begin

		{ITT_ShowBalloon('Setup has finished downloading files',
		   'Click here to continue installation',10);}

		ITT_RestoreFromTray;

	end;
  end;

  ITD_Event_DownloadFailed:begin
	ITT_RestoreFromTray; //Get the user to do something about the error
  end;

 end;
end;

{Contributed by Hilbrand Edskes. Sets the HTTP agent
 that ITD uses to a custom one which includes information
 about which version of Windows that the customer is using.

 Great for tracking the popularity of your software on different
 platforms! (If you want to send more detailed information,
 then consider posting a string to your server as in
 Example2.iss)
}
procedure SetCustomUserAgent();
var UA:String;
begin
  // Create User Agent String and include system information and version
  UA:='InnoTools Downloader '+ITD_GetOption('ITD_Version')+' (Windows ';
  if UsingWinNT then UA:=UA + 'NT ';
  if IsWin64 then UA:=UA + 'x64 ';
  UA:=UA + GetWindowsVersionString + ')';
  // Changes the "agent" field used in HTTP requests
  ITD_SetOption('ITD_Agent', UA);
end;

procedure InitializeWizard();
begin
  PDir('{#ItDownload_DLL}');
  PDir('{#ItTray_DLL}');
  itd_init;
  itt_init; //Important! Create (but don't display yet) the tray icon

  ITT_SetHint('Downloading files...');

  itd_EventHandler:=@MyITDEventHandler;

  //Let's download two zipfiles from my website..
  itd_addfile('http://www.sherlocksoftware.org/petz/files/dogz5.zip',expandconstant('{tmp}\dogz5.zip'));
  itd_addfile('http://www.sherlocksoftware.org/petz/files/petz4.zip',expandconstant('{tmp}\petz4.zip'));

  {While we're at it, let's change the default appearance
  from the "simple mode" to the "detailed mode" that appears
  when you click the "Details" button}
  itd_setoption('UI_DetailedMode', '1');

  {And let's change the agent string that is used to identify
  the "browser" that is making HTTP requests}
  SetCustomUserAgent;

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
