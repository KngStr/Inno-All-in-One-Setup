UninsHs 2.1 for Inno Setup Readme
=================================

Thank you for choosing an Han-soft Software prouduct! This extension for Inno 
Setup allows you to easily add "Repair/Modify/Remove" options to your installed
applications.. It is very small because it uses Assemble.

Note: You are required to send me a email if you use UninsHs in any of your app-
lications.

You will find below information on how to use UninsHs with your own application
setups:


 0. Prepartory step
===================

  * Copy the file UninsHs.exe to your application setup directory. 


 1. [Languages] section
=======================

  * Add this line:

    Name: en; MessagesFile: compiler:Default.isl

  * If you want to support other languages - French, for example, add this line
    too:

    Name: fr; MessagesFile: compiler:French.isl

  * Here are the supported languages: 

    English(en), Simplified Chinese(chs), Traditional Chinese(cht), Deutsch(de),
    Swedish(se), Indonesian(in), Portuguese - Brasil(br), Polish(pl), Dutch(nl),
    Italian(it), Spanish(es), Portuguese - Portugal(pt),  Japanese(jp),
    French(fr), Russian(ru), Ukrainian(uk), Hungarian(hu), Romania(ro),
    Greek(gr), Danish(da), Turkish(tr), Czech(cz), Finnish(fi), Norwegian(no)
    
  * For another language, please translate the Language Resource section at the
    end of this file, save it as a text file, and then send it to me.


 2. [Files] section
===================

  * Add this line ( If the DestDir of UninsHs is not {app}, please change the
    {app} to your directory ):

    Source: "UninsHs.exe"; DestDir: "{app}"; Flags: restartreplace
    

 3. [Setup] section
===================

  * For Inno Setup 4.2.4 or later, add this line ( If the DestDir of UninsHs is
    not {app} in [Files] section, please change the {app} to your directory ):
    
    ; Customize this line with your AppId ( If you don't use AppId, customize
      the AppId with your AppName ), and customize the parameters, see also the 
      "Command line options".

    AppModifyPath="{app}\UninsHs.exe" /m0=AppId


 4. [Icons] section
===================

  * Delete this old line that creates an uninstall icon in the start menu:

    Name: "{group}\Uninstall AppName"; Filename: "{uninstallexe}"

  * Add this line if you want an uninstall icon in the start menu
    ( If the DestDir of UninsHs is not {app} in [Files] section, please change
    the {app} to your directory ):
 
    ; Customize this line with your AppName and AppId (If you don't use AppId,
      customize the AppId with your AppName ), and customize the parameters, see
      also the "Command line options".

    Name: "{group}\Uninstall AppName"; \
       Filename: "{app}\UninsHs.exe"; Parameters: /u0=AppId


 5. [Run] section
=================

  * Add this line ( If the DestDir of UninsHs is not {app} in [Files] section,
    please change the {app} to your directory ):

    ; Customize this line with your AppId ( If you don't use AppId, customize
      the AppId with your AppName ), and customize the parameters, see also the
      "Command line options".

    Filename: {app}\UninsHs.exe; \
       Parameters: /r0=AppId,{language},{srcexe}; Flags: runminimized

  * Or if you want to copy your installation package to a specified directory
    for repair or modify, please use this line ( If the DestDir of UninsHs is
    not {app} in [Files] section, please change the {app} to your directory ):

    ; Customize this line with your AppId ( If you don't use AppId, customize
      the AppId with your AppName ), and customize the YourDirFile with your
      specified directory and filename. also you can customize the parameters,
      see also the "Command line options".

    Filename: {app}\UninsHs.exe; \
      Parameters: /r0=AppId,{language},{srcexe},YourDirFile; \
      Flags: runminimized runhidden nowait

    ;Note: You need to create the directory by yourself, 
    
    ;Example:

     [Dir]
        Name: "{userappdata}\$H$"; \
           Attribs: hidden; Flags: uninsalwaysuninstall
     [Run]
        Filename: "{app}\UninsHs.exe"; \
          Parameters: /r0=MyAppId,{language},{srcexe},{userappdata}\$H$\i.exe; \
          WorkingDir: "{app}"; \
          Flags: nowait runhidden runminimized skipifdoesntexist
     [UninstallDelete]
        Type: filesandordirs; Name: "{userappdata}\$H$"


 6. [InstallDelete] section
===========================

  * Add lines to delete the files which do not have a "Fixed" flag in the
    [Components] section:

  ; Example:

  Type: Files; Name "{app}\Help.hlp"

  Note: Do not delete the UninsHs.exe


 7. [Components] section
========================

  * Add "DisableNoUninstallWarning" flag to your component which does not have a
    "Fixed" flag:

  ; Example:

  Name: "help"; \
    Description: "Help Files"; Types: full; Flags: DisableNoUninstallWarning


 8. [Code] section
==================

  * Add the appropriate functions for your version of Inno Setup:

  ; For Inno Setup 4.x:

    function SkipCurPage(CurPage: Integer): Boolean;
    begin
      if Pos('/SP-', UpperCase(GetCmdTail)) > 0 then
        case CurPage of
          wpLicense, wpPassword, wpInfoBefore, wpUserInfo,
          wpSelectDir, wpSelectProgramGroup, wpInfoAfter:
            Result := True;
        end;
    end;

  ; For Inno Setup 5.x:
    
    function ShouldSkipPage(CurPage: Integer): Boolean;
    begin
      if Pos('/SP-', UpperCase(GetCmdTail)) > 0 then
        case CurPage of
          wpLicense, wpPassword, wpInfoBefore, wpUserInfo,
          wpSelectDir, wpSelectProgramGroup, wpInfoAfter:
            Result := True;
        end;
    end;

  * If you want to skip the welcome wizard page when modify, add these const and
    procedures:
   
  ; For Inno Setup 4.x and 5.x:

    const
      WM_LBUTTONDOWN = 513;
      WM_LBUTTONUP = 514;

    procedure InitializeWizard();
    begin
      if (Pos('/SP-', UpperCase(GetCmdTail)) > 0) then
      begin
        PostMessage(WizardForm.NextButton.Handle,WM_LBUTTONDOWN,0,0);
        PostMessage(WizardForm.NextButton.Handle,WM_LBUTTONUP,0,0);
      end;
    end;

    procedure CurPageChanged(CurPageID: Integer);
    begin
      if (Pos('/SP-', UpperCase(GetCmdTail)) > 0) and
        (CurPageID = wpSelectComponents) then
        WizardForm.BackButton.Visible := False;
    end;


 9. Congratulations!
====================

  * Compile your setup script and watch the new uninstall at work! 
  * If it doesn't work, email me.


Command line options
====================

  1, Register UninsHs when install:

    UninsHs /r=<MyAppId>|<AppName>,{language},{srcexe}[,Save_Path_FileName]

      MyAppId:
        Your AppId be defined in [Setup] section, if you don't use it, please
        specify the AppName instead of the AppId.

      AppName:
        Your AppName be defined in [Setup] section, if you use AppId, please
        specify the AppId instead of the AppName.

      Save_Path_FileName:
        Copy installation package to a specified directory and filename for
        repair or modify.

  2, Start the UninsHs:

    UninsHs /<Default Item>[Hide Items]=<MyAppId>|<AppName>

      Default item:

         m: Modify
         f: Repair
         u: Remove

      Hide items:

         0: Don't hide any items(by default)
         1: Hide the Modify item
         2: Hide the Repair item
         3: Hide the Modify and Repair items

      MyAppId:
        Your AppId be defined in [Setup] section, if you don't use it, please
        specify the AppName instead of the AppId.

      AppName:
        Your AppName be defined in [Setup] section, if you use AppId, please
        specify the AppId instead of the AppName.

  Note: Delete all space around the commas and equal mark.


Thanks
====== 

Aaron Chan
aerodynamica@idz.net
http://www.aerodynamica.tk/

* Version 2.x:
English by Cord Schneider (cords@ezpurse.co.uk)
English by Gavin Lawrence (info@broadcast.co.uk)
Indonesian by Atma Suwanda (ats76id@yahoo.com)
German by Lutz Löffler
Swedish by Johan Petersson (support@codeaero.com)
Portuguese(Brasil) by Evandro da Silva Amparo (edsamparo@gmail.com)
Polish by Zielinski Krystian (krystian.zielinski@oce.com.pl)
Spanish by Miguel Angel Blazquez Pajuelo (mi_blazquez@hotmail.com)
Spanish by Antonio Liberal (aliberal@safer.es)
Dutch by K.v.d.Wissel (k.vd.wissel@hccnet.nl)
Portuguese(Portugal) by Jos?Sousa (jjss@aeiou.pt)
French by Nicolas Polychronopoulos (nicolas.polychronopoulos@bi-sam.com)
French by N¨¦o (neojudgment@hotmail.com)
Japanese by warmheartedpc (warmheartedpc@smile.ocn.ne.jp)
Italian by Gabriele Bertolucci (ellipsys@virgilio.it)
Russian by Oleksandr Senyuk (oleksandr@securstar.com)
Russian by Sergey Shishmintzev (sergey@michint.kiev.ua)
Ukrainian by Oleksandr Senyuk (oleksandr@securstar.com)
Ukrainian by Sergey Shishmintzev (sergey@michint.kiev.ua)
Hungarian by Gabor Keve (gabor.keve@it-worx.hu)
Romanian by Doru Constantin (doru.constantin@mails.ro)
Greek by Kostas Papadoulas (gaspap@gmail.com)
Danish by Michael B. Hansen (michael@berantzino.net)
Turkish by Badboy (badboyturk@gmail.com)
Czech by Vladimir Fux
Finnish by Matti Räihä (matti.raiha@pp.inet.fi)
Norwegian by Geir_Åge_Hovland (gaah@sundrytools.com)

* Version 1.x:
English by Cord Schneider (cords@ezpurse.co.uk)
English by Gavin Lawrence (info@broadcast.co.uk)
Indonesian by Atma Suwanda (ats76id@yahoo.com)
German by Florian Geib (info@scriptsoft.de)
German by Jonny Kwekkeboom (HiSoft2000@t-online.de)
German by Gru? Eckhart_Wörner (inno.setup@ewsoftware.de)
Swedish by Peter Thornqvist (peter3@peter3.com)
Portuguese(Brazil) by Fábio Vilardo (fabio@infovs.com.br)
Portuguese (Brazilian) by Rafael
Polish by Andrzej Rudnik (arudnik@beep.pl)
Spanish by Antonio Liberal (aliberal@safer.es)
Dutch by Pleun van der Lugt (info@acdbv.nl)
Portuguese (Portugal) by Jose Simoes (jose.simoes@eclo.pt)
French by Michel Dessaintes (michel.dessaintes@free.fr)
French by Pierre Y.(pierre@levosgien.net)
Japanese by deng tianyu (d-tou@jmc.ne.jp)
Italian by Nando Dessena (nandod@dedonline.com)
Russian by Anatoly Smaznov aka javum (longhorn@ngs.ru)
Hungarian by KAMI (acemcp@freemail.hu)
Romanian by alex alex (alex1g1alex@hotmail.com)
Turkish by PPS Automation (ts@ppsautomation.com)
Czech by Vojt¨§ch V¨ªt (vojta.vit@seznam.cz)
Czech by Pavel Lang (langpa@seznam.cz)
Norwegian (bokmal) by Jostein Chr. Andersen (jostein@josander.net)

Brian Kane (Bkane@bju.edu) Proof read and correct the Readme.txt file.


Contact Author
==============

HAN JINGYU
support@han-soft.com
http://www.han-soft.com


History
=======

2.1(2006-01-15): UninsHs 2.1.0.88 has been released, the Alt-F4, Up, Down keys
                 are supported now, and ability to hide the Modify and(or)
                 Repair item(s).

2.0(2005-05-11): The UninsHs.dat is deleted, now you can save your installation
                 package to specified directory for repair and modify, minor
                 tweaks.

1.6(2004-04-09): Now you can add or remove components when run "Modify".

1.5(2004-02-18): You can use it in sub-directory of installation directory.

1.4(2003-11-11): If use AppId, change the uninstall registry key to AppId. If
                 language is not defined or default, use English.

1.3(2003-10-12): Change the width of radio options.

1.2(2003-09-06): Get repair/modify path from UninsHs.exe command line.

1.1(2003-08-17): Display at center of screen when start. Add to support 4 or 8
                 bits color for icons and logo bitmap.

1.0(2003-08-15): Original version.


Language Resource
=================

en 5000                                           //en: Abbreviation for English
begin
    0x00000001L                                   //Font Charset = 1
    0xFFFFFFF5L                                   //Font Height = -11
    "MS Sans Serif\0\0"                           //Font Face Name
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
    "The repair operation is complete! You need to restart your computer, "
        "Please click the <Close> button to close the dialog.\0\0"
    "The repair operation is failed! Click the <Close> button to close "
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


================================================================================
$Rev: 276 $  $Id: Readme.txt 276 2008-03-12 03:25:41Z hanjy $

