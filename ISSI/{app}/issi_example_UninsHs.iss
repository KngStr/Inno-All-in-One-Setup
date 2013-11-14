
;; ISSI EXAMPLE SCRIPT

;; LOGAN's Inno Setup Script Includes (ISSI)
;; http://www.albartus.com/issi/
;; (c) 2005 Jan Albartus / LOGAN Interactive

;; UninsHs for Inno Setup by Han-soft Software
;; http://www.han-soft.com/uninshs.php
;; (c) 2005 Han-soft Software

;; DESCRIPTION: UninsHs is an extension program for Inno Setup allows you to add repair,
;; modify and remove support to your applications with minimal effort.
;; It is very small because use Assemble. Please read the readme file included in the package
;; for further instructions on how to use UninsHs with your own application setups.
;; UninsHs-Readme.txt can be found in the ISSI Include subfolder: "ISSI\Include\UninsHs-Readme.txt"

;; If you use ISSI_UninsHs you have to remember the following:
;;
;; -- In you use any components which does not have a "Fixed" flag,
;;    you have to edit the [Components] and [InstallDelete] sections.
;;
;; -- Delete the old line that creates an uninstall icon in the start menu:
;;    Name: "{group}\Uninstall AppName"; Filename: "{uninstallexe}"


;; Note: If you use UninsHs in any of your applications, it is
;; required that you send me a email to: support@han-soft.com


;[Components]
;; NOTE: Add "DisableNoUninstallWarning" flag to your components which does not have a "Fixed" flag, Example:
;Name: "help"; Description: "Help Files"; Types: full; Flags: DisableNoUninstallWarning

;[InstallDelete]
;; NOTE: Add lines to delete the files which do not have a "Fixed" flag in [Components], Example:
;Type: Files; Name "{app}\Help.hlp"

;Note: Do not delete the UninsHs.dat and UninsHs.exe


[ISSI]
;; Activate [Languages] to be used:
#define ISSI_English
#define ISSI_German
#define ISSI_Dutch
#define ISSI_French

;; Activate ISSI_UninsHs and set AppName:
#define ISSI_UninsHs_AppName "ISSI Example"

;; OPTIONAL: Set AppId.
;; UNDEFINED: If undefined, it defaults to ISSI_UninsHs_AppName
;#define ISSI_UninsHs_AppId "AppId"

;; OPTIONAL: Include setup.exe (external) into installation {app} folder
;; UNDEFINED: use original setup.exe location for MODIFY / REPAIR
;; NOTE: Required diskspace increases the size of your setup
#define ISSI_UninsHs_IncludeSetup

;; REQUIRED: Include ISSI
#include ISSI_IncludePath + "\_issi.isi"

;; INFO:
;; Because the original setup.exe is required for modify / repair it should
;; be available to the UninsHs. Including the original setup makes sure
;; it does not get deleted / moved by the enduser because they think they
;; do not need the file anymore after installation. This makes your disk space
;; required increase.

;; I think it is wise to include your setup.exe into the installation
;; if one of the following conditions is met:
;; - Your setup is not delivered on media (Floppy, CD-ROM)
;; - Your setup is quite small
;; - Your setup is offered as download

[Setup]
AppName=ISSI Example
AppVerName=ISSI Example v1.0
AppVersion=1.0
AppPublisher=LOGAN Interactive
AppPublisherURL=http://www.albartus.com
AppSupportURL=http://www.albartus.com
AppUpdatesURL=http://www.albartus.com
AppCopyright=Jan Albartus
outputBaseFileName=ISSI_UninsHs
DefaultDirName={pf}\ISSI_UninsHs Example
DefaultGroupName=ISSI_UninsHs Example



;; Here are the supported languages by UninsHs:
;; English(en) ;; Simplified Chinese(chs)
;; Traditional Chinese(cht) ;; Spanish(es)
;; Swedish(se) ;; French(fr) ;; Russian(ru)
;; Hungarian(hu) ;; Portuguese-Brazil(br)
;; Italian(it) ;; German(de) ;; Romanian(ro)
;; Turkish(tk) ;; Portuguese-Portugal(pt)
;; Norwegian-Bokmal(no) ;; Czech(cz)
;; Polish(pl) ;; Dutch(nl)

