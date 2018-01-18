; -- NewAdvSplash.iss --

; ksiCallNsis demo，support /NOUNLOAD

#include "ksiCallNsis.ish"

[Setup]
AppName=我的程序
AppVerName=我的程序 版本 1.5
DefaultDirName={pf}\我的程序
DefaultGroupName=我的程序
UninstallDisplayIcon={app}\MyProg.exe
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "{#PluginDir}\Nsis\NewAdvSplash.dll"; Flags: dontcopy
Source: "compiler:WizModernImage.bmp"; Flags: dontcopy
Source: "logo.wav"; Flags: dontcopy
Source: "aist.gif"; Flags: dontcopy

[Icons]
Name: "{group}\我的程序"; Filename: "{app}\MyProg.exe"

[code]
{
NewAdvSplash.dll - plug-in that lets you throw 
up a splash screen in NSIS installers with 
fading effects (win2k/xp) and transparency.
At the same time can play wav-mp3 sound file. 

Usage:

1)   newadvsplash::show [/NOUNLOAD] Delay FadeIn FadeOut KeyColor [/BANNER] [/PASSIVE] [/NOCANCEL] FileName

Delay - time (milliseconds) to show image
FadeIn - time to show the fadein scene
FadeOut - time to show the fadeout scene
KeyColor - color used for transparency, could be any RGB value 
   (for ex. R=255 G=100 B=16 -> KeyColor=0xFF6410), 
   use KeyColor=-1 if there is no transparent color at your image.
   If KeyColor=-2 and image type is gif, plug-in attempts to extract 
   transparency color value from the file header. For gif images 
   transparency on the static background works even if KeyColor=-1.
/BANNER - returns control to installer immediatelly after plug-in 
   activation. Not depends on installer page - parent window NULL.
/NOCANCEL - disables 'exit on user click' default behaviour.
/PASSIVE - not forces splash window to foreground.
FileName - splash image filename (with extension!). Bmp, gif and jpg
   image types are supported.

For example:

     newadvsplash::show 3000 0 0 -2 "$PLUGINSDIR\catch.gif"
or
     newadvsplash::show /NOUNLOAD 1000 600 400 0xFF6410 /BANNER "$TEMP\spltmp.bmp"

    Use /NOUNLOAD with /BANNER key - this case plug-in not waits for
    the end of 'show' and returns control to installer. If used in .onInit
    function, /BANNER key requires 'ShowWindow $HWNDPARENT 2' in .onGUIInit


2)   newadvsplash::stop [/WAIT | /FADEOUT]

     Without options terminates banner.
     With /WAIT option waits for the end.
     With /FADEOUT option forces banner close with fade out effect ('Delay' -> 0).


3)   newadvsplash::play /NOUNLOAD [/LOOP] FileName

FileName - sound filename to play (with extension, wav, mp3 ...).
Empty Filename string "" stops sound.
For example:

     newadvsplash::play /NOUNLOAD /LOOP "$PLUGINSDIR\snd.mp3"
     newadvsplash::show 2000 1000 500 -1 "$PLUGINSDIR\iamfat.jpg"


4)   newadvsplash::hwnd /NOUNLOAD

Gets splash window handle.
For example:

     newadvsplash::hwnd /NOUNLOAD
     Pop $0 ; $0 is window handle now

Compatibility:
Basic - Win95 and later.
Fadein/fadeout - win2k/winxp.

Original code - Justin
Converted to a plugin DLL by Amir Szekely (kichik)
Fading and transparency by Nik Medved (brainsucker)
Gif and jpeg support, /BANNER and /CANCEL, mp3 support - Takhir Bedertdinov
}

procedure InitializeWizard();
var
  val: string;
  ival: Integer;
begin
  PDir('{# ksiCallNsis_DLL }');

  InitNsisPlug(0);
  //loop play a wav in background
  CallNsisPlugEx(PDir('NewAdvSplash.dll'),'play', ['/NOUNLOAD','/LOOP',PDir('logo.wav')]);
  
  //show a bmp banner
  CallNsisPlugEx(PDir('NewAdvSplash.dll'),'show', ['/NOUNLOAD','1000','100','500','0x04025C',PDir('WizModernImage.bmp')]);

  //show a gif banner
  //warnning: You will get error when /BANNER without /PASSIVE !!!!
  CallNsisPlugEx(PDir('NewAdvSplash.dll'),'show',['/NOUNLOAD','3000','1000','500','-2','/NOCANCEL','/BANNER','/PASSIVE',PDir('aist.gif')]);
  try
    //get the banner hwnd
    if CallNsisPlugEx(PDir('NewAdvSplash.dll'),'hwnd', ['/NOUNLOAD']) then
      MsgBox('Test for Waiting:' + PopNsisString, mbInformation, MB_OK);
  finally
    //close the banner
    CallNsisPlugEx(PDir('NewAdvSplash.dll'),'stop',['/wait']);
  end;
  FreeNsisPlug();
end;

