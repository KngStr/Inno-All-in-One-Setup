
[ ISSI EXAMPLE SCRIPT ]

; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/

; (c) 2005 Jan Albartus / LOGAN Interactive

[Setup]
DefaultDirName={pf}\Extract-Zip-Example

;; NOTE 1: This ISSI function needs to be defined *after* defining the
;; [Setup] section defaultDirName as the UnZipDir defaults to {app}

;; NOTE 2: The unzipped files are not included for [UninstallDelete]
;; at this moment. (Automatically removing all files and folders is
;; to risky, so you need to add them manually)

[ISSI]
;; Zip Files:
#define ISSI_UnZip1 "C:\folder\file.zip"
;#define ISSI_UnZip2 "file1.zip"
;#define ISSI_UnZip3 "file1.zip"
;#define ISSI_UnZip4 "file1.zip"

;; OPTIONAL: Unzip folder, defaults to {app}
;#define ISSI_UnZipDir1 "{app}\FolderName"
;#define ISSI_UnZipDir2 "Folder2"
;#define ISSI_UnZipDir3 "Folder3"
;#define ISSI_UnZipDir4 "Folder4"

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
;CreateAppDir=no
;CreateUninstallRegKey=no
;Uninstallable=no
outputBaseFileName=ISSI_UnZip
