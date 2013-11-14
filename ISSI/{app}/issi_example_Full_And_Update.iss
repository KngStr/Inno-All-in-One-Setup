
; ISSI EXAMPLE SCRIPT
;
; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive


[USER]
;; User defined trigger for generating an update, leave remarked for full setup.
#define UpdateSetup

[Setup]
AppName=ISSI Example
AppVerName=ISSI Example v1.0
AppVersion=1.1
AppID=ISSI Example 1
AppPublisher=LOGAN Interactive
AppPublisherURL=http://www.albartus.com
AppSupportURL=http://www.albartus.com
AppUpdatesURL=http://www.albartus.com
AppCopyright=Jan Albartus
DefaultDirName={pf}\ISSI Example
outputBaseFileName=ISSI_Full_And_Update
;CreateAppDir=no
;Uninstallable=no

[Files]
;; If update setup needs to be generated ISSI_Udate is included
;; It uses setupSettings so this must be below the [Setup] section
#if defined UpdateSetup
  #define ISSI_UpdateName setupSetting("AppName")
  #define ISSI_UpdateID setupSetting("AppID")
  #define ISSI_UpdateVersion setupSetting("AppVersion")
#else
  ;; Else Write new _version.ini
  #expr writeIni (sourcePath+"_version.ini",setupSetting("AppID"),"version",setupSetting("AppVersion"))
  ;; Include _Version.ini into setup
  Source: "{#sourcePath}_version.ini"; DestDir: {app}; DestName: "_version.ini"; Flags: ignoreversion
  ;; Delete _version.ini
  #expr deleteFile (sourcePath+"\_version.ini")
#endif

#if !defined UpdateSetup
;; Here you put your [file] entries that have not been changed scince your (full) initial setup
#endif
;; Every [file] entrie that has changes scince the full release is moved outside the #if/#endif

[Icons]
#if !defined UpdateSetup
;; Here you put your shortcut entries that have not been changed scince your (full) initial setup
#endif

;; ETC.

[ISSI Main]
;; ISSI Languages
#define ISSI_Dutch
#define ISSI_English
#define ISSI_French
#define ISSI_German

;; ISSI Iclude (Required)
#include ISSI_IncludePath + "\_issi.isi"


