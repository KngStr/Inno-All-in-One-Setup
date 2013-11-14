UninsHs 1.6 for Inno Setup Readme
=================================

Thank you for choosing an Han-soft Software prouduct! This extension program for
Inno Setup, allows you to add repair, modify and remove support to your applica-
tions with minimal effort. It is very small because it uses Assemble.

Note: You are required to send me a email if you use UninsHs in any of your
      applications.

You will find below information on how to use UninsHs with your own application setups:

 0. Prepartory step
===================

  * Copy the file UninsHs.exe to your application setup directory. 


 1. [Languages] section
=======================

  * Add this line:

    Name: en; MessagesFile: compiler:Default.isl

  * If you want to support other languages - French, for example, add this line too:

    Name: fr; MessagesFile: compiler:French.isl

  * Here are the supported languages: 

    English(en), Simplified Chinese(chs), Traditional Chinese(cht), Spanish(es),
    Swedish(se), French(fr), Russian(ru), Hungarian(hu), Portuguese-Brazil(br),
    Italian(it), German(de), Romanian(ro), Turkish(tk), Portuguese-Portugal(pt),
    Norwegian-Bokmal(no), Czech(cz), Polish(pl), Dutch(nl)

  * For another language, please translate the Language Resource section at the end
    of this file, save it as a text file, and then send it to me.


 2. [Files] section
===================

  * Add this line ( If the DestDir of UninsHs is not {app}, please change the
    {app} to your directory ):

    Source: "UninsHs.exe"; DestDir: "{app}"; Flags: ignoreversion restartreplace


 3. [Icons] section
===================

  * Delete this old line that creates an uninstall icon in the start menu:

    Name: "{group}\Uninstall AppName"; Filename: "{uninstallexe}"

  * Add this line if you want an uninstall icon in the start menu ( If the
    DestDir of UninsHs is not {app} in [Files] section, please change the {app}
    to your directory ):
 
    ; Customize this line with your AppName

    Name: "{group}\Uninstall AppName"; Filename: "{app}\UninsHs.exe"


 4. [UninstallDelete] section
=============================
 
  * Add this line ( If the DestDir of UninsHs is not {app} in [Files] section,
    please change the {app} to your directory ):

    Type: filesandordirs; Name: "{app}\UninsHs.dat"


 5. [Ini] section
=================

  * Add these lines ( If the DestDir of UninsHs is not {app} in [Files] section,
    please change the {app} to your directory ):

    ; Customize this line with your AppName

    FileName: "{app}\UninsHs.dat"; Section: "Common"; Key: "Software";    String: "AppName"

    ; If the repair and modify does not work, please change the {srcexe} in this
      line to your Installation name

    FileName: "{app}\UninsHs.dat"; Section: "Common"; Key: "Install";     String: "{srcexe}"

    FileName: "{app}\UninsHs.dat"; Section: "Common"; Key: "Language";    String: "{language}"
    FileName: "{app}\UninsHs.dat"; Section: "Common"; Key: "Remove";      String: "{uninstallexe}"
    FileName: "{app}\UninsHs.dat"; Section: "Common"; Key: "Group";       String: "{groupname}"
    FileName: "{app}\UninsHs.dat"; Section: "Common"; Key: "Components";  String: "{code:ComponentList|x}"

  * If you use AppId, add this line, and customize this line with your AppId
    ( If the DestDir of UninsHs is not {app} in [Files] section, please change
    the {app} to your directory )

    FileName: "{app}\UninsHs.dat"; Section: "Common"; Key: "Uninstall";   String: "AppId"

  * If the DestDir of UninsHs is not {app} in [Files] section, add this line and
    change the first {app} to your directory, the second {app} should not be changed.

    FileName: "{app}\UninsHs.dat"; Section: "Common"; Key: "Dir";         String: "{app}"


 6. [Run] section
=================

  * Add these lines ( If the DestDir of UninsHs is not {app} in [Files] section,
    please change the {app} to your directory ):

    Filename: {app}\UninsHs.exe; Parameters: /r; Flags: runminimized


 7. [InstallDelete]
===================

  * Add lines to delete the files which do not have a "Fixed" flag in [Components]

  ; Example

  Type: Files; Name "{app}\Help.hlp"

  Note: Do not delete the UninsHs.dat and UninsHs.exe


 8. [Components]
================

  * Add "DisableNoUninstallWarning" flag to your component which does not have a "Fixed"
    flag

  ; Example

  Name: "help"; Description: "Help Files"; Types: full; Flags: DisableNoUninstallWarning


 9. [Code] section
==================

  * Add the appropriate functions for your version of Inno Setup

  ;For Inno Setup 4.x:

    function ComponentList(Default: string):string;
    begin
      Result := WizardSelectedComponents(False);
    end;

    function SkipCurPage(CurPage: Integer): Boolean;
    begin
      if Pos('/SP-', UpperCase(GetCmdTail)) > 0 then
        case CurPage of
          wpWelcome, wpLicense, wpPassword, wpInfoBefore, wpUserInfo,
          wpSelectDir, wpSelectProgramGroup, wpInfoAfter:
            Result := True;
        end;
    end;

  ;For Inno Setup 5.x:
    
    function ComponentList(Default: string):string;
    begin
      Result := WizardSelectedComponents(False);
    end;

    function ShouldSkipPage(CurPage: Integer): Boolean;
    begin
      if Pos('/SP-', UpperCase(GetCmdTail)) > 0 then
        case CurPage of
          wpWelcome, wpLicense, wpPassword, wpInfoBefore, wpUserInfo,
          wpSelectDir, wpSelectProgramGroup, wpInfoAfter:
            Result := True;
        end;
    end;

10. Congratulations!
====================

  * Compile your setup script and watch the new uninstall at work! 
  * If it doesn't work, email me.


Thanks
====== 

Aaron Chan
aerodynamica@idz.net
http://www.aerodynamica.tk/

English by Cord Schneider (Mail:cords@ezpurse.co.uk Site:http://ezpurse.co.uk/)
German by Florian Geib (Mail:info@scriptsoft.de Site:http://www.winspeedup.com)
German by Jonny Kwekkeboom (Mail:HiSoft2000@t-online.de)
German by Gru? Eckhart_Wörner (Mail:inno.setup@ewsoftware.de)
Swedish by Peter Thornqvist (Mail:peter3@peter3.com Site:http://jvcl.sourceforge.net)
French by Michel Dessaintes (Mail:michel.dessaintes@free.fr)
French by Pierre Y.(pierre@levosgien.net)
Russian by Anatoly Smaznov aka javum (longhorn@ngs.ru)
Hungarian by KAMI (acemcp@freemail.hu)
Italian by Nando Dessena (nandod@dedonline.com)
Spanish by Antonio Liberal (aliberal@safer.es http://www.safer.es)
Portuguese(Brazil) by Fábio Vilardo (fabio@infovs.com.br)
English by Gavin Lawrence (info@broadcast.co.uk)
Romanian by alex alex (alex1g1alex@hotmail.com)
Turkish by PPS Automation (ts@ppsautomation.com)
Portuguese (Portugal) by Jose Simoes (jose.simoes@eclo.pt)
Norwegian (bokmal) by Jostein Chr. Andersen (jostein@josander.net http://www.josander.net/en/contact/)
Portuguese (Brazilian) by Rafael
Czech by Vojt¨§ch V¨ªt (vojta.vit@seznam.cz)
Polish by Andrzej Rudnik (arudnik@beep.pl  http://www.winace.prv.pl)
Pleun van der Lugt (info@acdbv.nl)
Pavel Lang (langpa@seznam.cz)
Brian Kane (Bkane@bju.edu) Proof read and correct the Readme.txt file.

Contact Author
==============

HAN JINGYU
hanjy@han-soft.com
http://www.han-soft.com/uninshs

History
=======

1.6(2004-04-09): Now you can add or remove components when run "Modify".

1.5(2004-02-18): You can use it in sub-directory of installation directory.

1.4(2003-11-11): If use AppId, change the uninstall registry key to AppId.
                 If language is not defined or default, use English.

1.3(2003-10-12): Change the width of radio options.

1.2(2003-09-06): Get repair/modify path from UninsHs.exe command line.

1.1(2003-08-17): Display at center of screen when start.
                 Add to support 4 or 8 bits color for icons and logo bitmap.

1.0(2003-08-15): Original version.


Language Resource
=================

5000 en                                //en: Abbreviation for English
begin
    0x00000001L                        //Font Charset = 1
    0xFFFFFFF5L                        //Font Height = -11
    "MS Sans Serif\0\0"                //Font Face Name
    "%s Program Maintenance\0\0"
    "%s Program Maintenance\0\0"
    "Modify, repair, or remove the program.\0\0"
    "Change which program features are installed. This option displays the "
        "Custom Selection dialog in which you can change the way features "
        "are installed.\0\0"
    "Repair errors in the program. This option fixes missing or corrupt files, "
        "shortcuts, and registry entries.\0\0"
    "Remove this program from your computer.\0\0"
    "Open File\0\0"
    "The source setup file cannot be found! Please select the appropriate file "
        "or cancel the uninstall.\0\0"
    "The source uninstall file cannot be found! Please select the appropriate "
        "file or cancel the uninstall.\0\0"
    "Warning\0\0"
    "Please wait while the program is being repaired...\0\0"
    "The repair operation is complete! Click the <Close> button to close "
        "the dialog.\0\0"
    "Click the <Next> button to remove the program from your computer.\0\0"
    "< &Previous\0\0"
    "&Next >\0\0"
    "&Cancel\0\0"
    "&Close\0\0"
    "&Modify\0\0"
    "Re&pair\0\0"
    "&Remove\0\0"
    "Executable Files (*.exe)\0*.exe\0All Files (*.*)\0*.*\0\0"
end


