
; ISSI EXAMPLE SCRIPT
;
; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive
;
; To extract the Inno Setup Script you send the
; ISSI_ScriptBackup_Key via parameter like this:
; setup.exe /somekeyword

[ISSI]
#define ISSI_English
#define ISSI_ScriptBackup "issi_example_Script_Backup.iss"
#define ISSI_ScriptBackup_Key "somekeyword"

#include ISSI_IncludePath + "\_issi.isi"

[Setup]
AppName=ISSI Example
AppVerName=ISSI Example v1.0
AppVersion=1.0
AppPublisher=LOGAN Interactive
AppPublisherURL=http://www.albartus.com
AppSupportURL=http://www.albartus.com
AppUpdatesURL=http://www.albartus.com
AppCopyright=Jan Albartus
CreateAppDir=no
CreateUninstallRegKey=no
Uninstallable=no
outputBaseFileName=ISSI_ScriptBackup
