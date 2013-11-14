
; ISSI EXAMPLE SCRIPT
;
; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive

[ISSI]
; ISSI Languages
#define ISSI_Catalan
#define ISSI_Czech
#define ISSI_Dutch
#define ISSI_English
#define ISSI_French
#define ISSI_German
#define ISSI_Italian
#define ISSI_Russian
#define ISSI_Slovenian
#define ISSI_Swedish

; ISSI Update
#define ISSI_UpdateName "AppName"
#define ISSI_UpdateID "AppID or AppName"
;#define ISSI_UpdateVersion "05010002"

; ISSI Iclude
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
Uninstallable=no
outputBaseFileName=ISSI_Update
