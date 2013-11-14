#define MyAppName "My Program"
#define MyAppVerName "My Program 1.0"
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
OutputBaseFilename=example3 2.0
Compression=lzma
SolidCompression=true
CreateAppDir=true
ShowLanguageDialog=yes
OutputDir=userdocs:Inno Setup Examples Output

; We compare the setup version information here against
; the one on the server to check for a newer version.
VersionInfoVersion=2.0
VersionInfoTextVersion=2.0

[Languages]
Name: english; MessagesFile: compiler:Default.isl

[Code]
{ This demo performs two downloads, one without ITD's GUI, and one with. It checks a website to
  find out what the most recent version of the installer is, and offers to download the new installer
  for the user.
}

procedure ExitProcess(exitCode:integer);
  external 'ExitProcess@kernel32.dll stdcall';

var progress:TOutputProgressWizardPage;

var
 NewInstallerPath:string;

procedure DownloadFinished(downloadPage:TWizardPage);
var ErrorCode:integer;
 (* text:string; *)
begin
 (*
	 Tell the user about the new installer. The message is pretty ugly if
	 NewInstallerPath is left at the default (The {tmp} directory)

	 text:=ITD_GetString(ITDS_Update_WillLaunchWithPath);

	 StringChangeEx(text, '%1', NewInstallerPath, true);

	 MsgBox(text, mbInformation, MB_OK);
 *)

 MsgBox(ITD_GetString(ITDS_Update_WillLaunch), mbInformation, MB_OK);

 if ShellExec('open', NewInstallerPath, '/updated',
   ExtractFilePath(NewInstallerPath), SW_SHOW, ewNoWait, ErrorCode) then
   ExitProcess(1);
end;

{ Compare the version string 'this' against the version string 'that'. A version
  string looks like: 1.3.2.100. Or possibly truncated: 1.3.

  Returns a positive number if this>that, 0 if this=that and a negative number
  if this<that.
}
function CompareVersions(this, that:string):integer;
var thisField, thatField:integer;
begin
 while (length(this)>0) or (length(that)>0) do begin
   if (pos('.',this)>0) then begin
     //Read the first field from the string
     thisField:=StrToIntDef(Copy(this, 1, pos('.',this)-1),0);
     //Remove the first field from the string
     this:=Copy(this, pos('.',this)+1, length(this));
   end else begin
     thisField:=StrToIntDef(this, 0);
     this:='';
   end;

   if (pos('.',that)>0) then begin
     //Read the first field from the string
     thatField:=StrToIntDef(Copy(that, 1, pos('.',that)-1),0);
     //Remove the first field from the string
     that:=Copy(that, pos('.',that)+1, length(that));
   end else begin
     thatField:=StrToIntDef(that, 0);
     that:='';
   end;

   if thisField>thatField then begin
    result:=1;
    exit;
   end else if thisField<thatField then begin
    result:=-1;
    exit;
   end;
 end;

 result:=0;
end;

procedure InitializeWizard();
var
  downloadPage:TWizardpage;
begin
 itd_init;
 PDir('{#ItDownload_DLL}');

 //Where the new installer should be saved to, can be anywhere.
 NewInstallerPath:=ExpandConstant('{tmp}\NewInstaller.exe');

 {Create our own progress page for the initial download of a small
  textfile from the server which says what the latest version is}
 progress:=CreateOutputProgressPage(ITD_GetString(ITDS_Update_Caption),
    ITD_GetString(ITDS_Update_Description));

 //Create the ITD GUI so that we have it if we decide to download a new intaller version
 downloadPage:=itd_downloadafter(wpWelcome);

 {If the download succeeds, we will need to launch the new installer. The
 callback is called if the download is successful.}
 itd_afterSuccess:=@downloadfinished;

 {If the download of the new installer fails, we still want to give the
  user the option of continuing with the original installation}
 itd_setoption('UI_AllowContinue','1');
end;

function NextButtonClick(curPageID:integer):boolean;
var
 list, line:TStringList;
 newavail:boolean;
 i:integer;
 ourVersion:string;
 checkedSuccessfully:boolean;
 text:string;
begin
 result:=true;
 if curPageID=wpWelcome then begin

   //Are we being called by an updating setup? If so, don't ask to check for updates again!
   for i:=1 to ParamCount do begin
    if uppercase(ParamStr(i))='/UPDATED' then begin
     exit;
    end;
   end;

   //Offer to check for a new version for the user..
   if MsgBox(ITD_GetString(ITDS_Update_WantToCheck), mbConfirmation, MB_YESNO) = IDYES then
    begin
      wizardform.show;
      progress.Show;
      progress.SetText(ITD_GetString(ITDS_Update_Checking),'');
      progress.SetProgress(2,10);
      try
        newavail:=false;

        checkedSuccessfully:=false;
        GetVersionNumbersString(expandconstant('{srcexe}'), ourVersion);

        if itd_downloadfile('http://www.sherlocksoftware.org/innotools/latestver.txt',expandconstant('{tmp}\latestver.txt'))=ITDERR_SUCCESS then begin
          { Now read the version from that file and see if it is newer.
            The file has a really simple format:

            2.0,"http://www.sherlocksoftware.org/innotools/example3%202.0.exe"

            The installer version, a comma, and the URL where the new version can be downloaded.
          }
          list:=TStringList.create;
          try
            list.loadfromfile(expandconstant('{tmp}\latestver.txt'));

            if list.count>0 then begin
              line:=TStringList.create;
              try
                line.commatext:=list[0]; //Break down the line into its components

                if line.count>=2 then begin
                checkedSuccessfully:=true;
                if CompareVersions(trim(line[0]), trim(ourVersion))>0 then begin
                  //Version is newer
                    text:=ITD_GetString(ITDS_Update_NewAvailable);

                    StringChangeEx(text, '%1', ourVersion, true); //"Current version" part of the string
                    StringChangeEx(text, '%2', line[0], true); //"New version" part of the string

                    if MsgBox(text, mbConfirmation, MB_YESNO)=IDYES then begin
                      itd_addFile(trim(line[1]), NewInstallerPath);
                    end;
                end else begin
                  MsgBox(ITD_GetString(ITDS_Update_NoNewAvailable), mbInformation, MB_OK);
                end;
                end;
              finally
                line.free;
              end;
            end;
          finally
            list.free;
          end;
        end;

        if not checkedSuccessfully then begin
          text:=ITD_GetString(ITDS_Update_Failed);
		  StringChangeEx(text, '%1', ourVersion, true);
          MsgBox(text, mbInformation, MB_OK);
        end;
      finally
        progress.Hide;
      end;
    end;
  end;
 end;
