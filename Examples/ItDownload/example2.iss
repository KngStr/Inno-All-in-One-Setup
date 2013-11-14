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
OutputBaseFilename=example2
Compression=lzma
SolidCompression=true
CreateAppDir=true
ShowLanguageDialog=yes
OutputDir=userdocs:Inno Setup Examples Output

[Languages]
Name: english; MessagesFile: compiler:Default.isl

[Code]
{ This is a demo of ITD's ability to POST data to a webpage. This allows you to do things like
  collect feedback from users during install
}
var
 inputpage:TInputQueryWizardPage;

procedure InitializeWizard();
var response:string;
begin
 itd_init;
 PDir('{#ItDownload_DLL}');

 inputpage:=CreateInputQueryPage(wpWelcome, 'Post data', 'To test ITD''s posting functionality','Enter a string in the box below to send to the server');
 inputpage.add('String to send:', false);
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var response:ansistring;
begin
 result:=true;
 
 if CurPageID=inputpage.id then begin
   { The PHP script we post our data to is a simple one which just echos back the
     posted data, along with a little message. (It also escapes HTML characters
     so that it cannot be used in a XSS attack against my website.).

     For reference, here's the PHP script that receives the post and replies:
     
     <?PHP
       global $HTTP_RAW_POST_DATA;
       echo "You sent this data to me:\r\n".htmlentities($HTTP_RAW_POST_DATA);
     ?>
   }
   if itd_postpage('http://www.sherlocksoftware.org/innotools/posttest.php', inputpage.values[0], response) then begin
      MsgBox('The server replies:'#13#10+response, mbInformation, MB_OK);
   end else begin
      MsgBox('Couldn''t post data to server', mbError, MB_OK);
      result:=false;
   end;
 end;
end;


