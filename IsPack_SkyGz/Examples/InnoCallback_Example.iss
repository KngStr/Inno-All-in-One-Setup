[Setup]
AppName=My Program
AppVerName=My Program 1.5
AppPublisher=My Company, Inc.
AppPublisherURL=http://www.mycompany.com
AppSupportURL=http://www.mycompany.com
AppUpdatesURL=http://www.mycompany.com
CreateAppDir=no
OutputBaseFilename=setup
Compression=lzma
SolidCompression=true
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: InnoCallback.dll; DestDir: {tmp}; Flags: dontcopy

[Code]
(*
Inno Tools InnoCallback
Copyright (C) Sherlock Software 2006
Version 0.1 Alpha

This example shows how you can create a stdcall callback that external DLLs can call.
In this example, we will create a timer using the Windows API. Windows will call our
callback where we will randomly change the background color of the Welcome page.

Contact:
 The author, Nicholas Sherlock, at nick@sherlocksoftware.org. Comments, questions and suggestions welcome.

Website:
 http://www.sherlocksoftware.org
*)

type
 TTimerProc=procedure(h:longword; msg:longword; idevent:longword; dwTime:longword);
 TMyCallback=function(a,b,c:integer):integer;

function WrapTimerProc(callback:TTimerProc; paramcount:integer):longword;
  external 'InnoCallback@files:innocallback.dll stdcall';

function WrapMyCallback(callback:TMyCallBack; paramcount:integer):longword;
  external 'InnoCallback@files:innocallback.dll stdcall';

function SetTimer(hWnd: longword; nIDEvent, uElapse: longword; lpTimerFunc: longword): longword;
  external 'SetTimer@user32.dll stdcall';

//Note, we musn't declare our routine as Stdcall
procedure mytimerproc(h:longword; msg:longword; idevent:longword; dwTime:longword);
begin
	pagefromid(wpWelcome).surface.color:=random($FFFFFF);
end;

{This callback isn't used in this example, but it shows how you should
 duplicate the Wrap() procedures to wrap different functions}
function mycallback(a,b,c:integer):integer;
begin
   result:=a*b*c;
end;

function InitializeSetup:boolean;
var timercallback,callback:longword;
begin
 timercallback:=WrapTimerProc(@mytimerproc,4); //Our proc has 4 arguments
 callback:=WrapMyCallback(@mycallback,3); //Our proc has 3 arguments

 settimer(0,0,1000,timercallback); //Create a timer and give it our callback as an argument

 result:=true; //keep loading setup..
end;
