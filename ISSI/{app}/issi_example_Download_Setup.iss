
; ISSI EXAMPLE SCRIPT
;
; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive

; Add BeveledLabel message
; (leave empty for default "Inno Setup" value )
#define ISSI_English
#define ISSI_Download_Title "WinVICE"
#define ISSI_Download_URL "http://members.home.nl/albartus/downloads/WinVICE-1.16-Setup.exe"


; Include ISSI
#include ISSI_IncludePath + "\_issi.isi"

[Setup]
AppName=ISSI Download Example
AppVerName=ISSI Example v1.0
AppVersion=1.0
AppPublisher=LOGAN Interactive
AppPublisherURL=http://www.albartus.com
AppSupportURL=http://www.albartus.com
AppUpdatesURL=http://www.albartus.com
AppCopyright=Jan Albartus
defaultDirName={pf}\WinVICE
defaultGroupName=WinVICE
;CreateAppDir=no
;CreateUninstallRegKey=no
Uninstallable=no
outputBaseFileName=ISSI_Download_Setup
