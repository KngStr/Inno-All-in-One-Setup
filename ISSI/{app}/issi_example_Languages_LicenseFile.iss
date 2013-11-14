
; ISSI EXAMPLE SCRIPT
;
; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive

; This example shows you how to add License File(s)

[ISSI]
;; Include ALL languages
;#define ISSI_Languages "license.txt"
;;OR
;; include Individual ISSI Languages plus license files
;#define ISSI_Dutch "license.txt"
;#define ISSI_English "license.txt"
;#define ISSI_French "license.txt"
;#define ISSI_German "license.txt"

;; To add info before, info after file:
#define ISSI_Languages ISSI_IncludePath + "\license.txt;InfoBeforeFile:" + ISSI_IncludePath + "\readme.txt"

;; Add additional ISSI functions
#define ISSI_LicensePrint

;; Include ISSI (required)
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
outputBaseFileName=ISSI_Languages_LicenseFile

