
; ISSI EXAMPLE SCRIPT
;
; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive

[ISSI]
;; ISSI Languages
#define ISSI_Dutch
#define ISSI_English
#define ISSI_French
#define ISSI_German

;; ISSI AppName
#define ISSI_AppName "ISSI AppName Example"
#define ISSI_AppPublisher "LOGAN Interactive"

#define ISSI_AppVersionMayor 5
#define ISSI_AppVersionMinor 1
#define ISSI_AppVersionRelease 0
#define ISSI_AppVersionBuild 0
;;OR
;#define ISSI_AppVersion "5.1.0.0"


;; OPTIONAL: use a template for default dir and program group
;#define ISSI_AppTemplate 5

;; OPTIONAL: add all files in this folder to setup {app folder}:
#define ISSI_AppFilesFolder ISSI_IncludePath + "\issi_example_Images"

;; OPTIONAL: create a start menu entry:
;#define ISSI_AppStart "myApp.exe"

;; OPTIONAL: set AppStart icon
;#define ISSI_AppIcon ISSI_IncludePath + "\issi_example_Images\issi.ico"


;; NOTE: ISSI About uses the version, name and year of ISSI_AppName
#define ISSI_AboutButton

;; REQUIRED: ISSI Iclude
#include ISSI_IncludePath + "\_issi.isi"

[Setup]
CreateAppDir=no
CreateUninstallRegKey=no
Uninstallable=no


