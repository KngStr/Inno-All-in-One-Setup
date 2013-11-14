
; ISSI EXAMPLE SCRIPT
;
; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive

; This example shows you how to add a About Button
; Because we did not define ISSI_AppName etc. the inclusion
; happens under the [setup] section so ISSI can use the entries
; from the [setup] section itself.

[Example Version]
1.1 added [CustomMessages] example & info
1.0 Initial example

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
outputBaseFileName=ISSI_About_Button
[ISSI]
; ISSI Languages
#define ISSI_Dutch
#define ISSI_English
#define ISSI_French
#define ISSI_German

;; If you want to enter custom texts
;; depending on the language, use:

;; ISSI About
#define ISSI_About "{cm:issiAbout}"
[CustomMessages]
en.issiAbout=English Example text.
fr.issiAbout=Texte français d'exemple.
nl.issiAbout=Nederlands Voorbeeld tekst.
de.issiAbout=Deutscher Beipiel tekst.

;; If you want to show version info
;; (multilingual support), use:

;#define ISSI_About "NameAndVersionDate"
;#define ISSI_AppVersion "1.0"



; ISSI Iclude
#include ISSI_IncludePath + "\_issi.isi"


