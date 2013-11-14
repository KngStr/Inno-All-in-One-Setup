
; ISSI EXAMPLE SCRIPT
;
; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive

; This example shows you how to detect Microsoft .NET Framework

; Set inclusion for languages:
#define ISSI_Languages


; Detect MicroSoft .NET Framework: (Valid options "1.1" and "2.0"
#define ISSI_NetDetect "2.0"




; Include ISSI:
#include ISSI_IncludePath + "\_issi.isi"

[Setup]
AppName=ISSI Example .NET detect
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
outputBaseFileName=ISSI_Net_Detect
