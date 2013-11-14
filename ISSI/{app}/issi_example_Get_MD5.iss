
; ISSI EXAMPLE SCRIPT
;
; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive
;
; This Example demonstrates the various uses for the
; ISSI_GetMD5Of... functions.


[ISSI]
;; This activates Inno Setup's Serial (+Userpage)
;; without storing the Serial itself inside the setup
#define ISSI_GetMD5OfSerial "Serial"

;; Get MD5 from string for use in custom code
#define ISSI_GetMD5OfString "ISSI Example"

;; Get MD5 from file for use in custom code
;#define ISSI_GetMD5OfFile "C:\Documents and Settings\file.ext"

;; This activates Inno Setup's Password protection (only usefull if encryption is unavailable)
;; without storing the Password itself inside the setup
;; A better way is to set [Setup] Encryption=yes Password=yourpassword
#define ISSI_GetMD5OfPassword "Password"

;; ISSI Iclude
#include ISSI_IncludePath + "\_issi.isi"

[Setup]
AppName=ISSI Example
AppVerName={#ISSI_GetMD5OfString}
AppVersion=1.0
AppPublisher=LOGAN Interactive
AppPublisherURL=http://www.albartus.com
AppSupportURL=http://www.albartus.com
AppUpdatesURL=http://www.albartus.com
AppCopyright=Jan Albartus
CreateAppDir=no
CreateUninstallRegKey=no
Uninstallable=no
outputBaseFileName=ISSI_Get MD5
