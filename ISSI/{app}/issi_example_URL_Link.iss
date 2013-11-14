
; ISSI EXAMPLE SCRIPT
;
; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive


[CustomMessages]
;; Multilingual ISSI_Url
;en.issiUrl=http://www.albartus.com/issi/
;fr.issiUrl=http://www.albartus.com/issi/
;nl.issiUrl=http://www.albartus.com/issi/
;de.issiUrl=http://www.albartus.com/issi/
;; Multilingual ISSI_UrlText
;en.issiUrlText=ISSI Online Manual
;fr.issiUrlText=ISSI Manuel En ligne
;nl.issiUrlText=ISSI Online Handleiding
;de.issiUrlText=ISSI On-line-Handbuch

[ISSI]
;; Create a link to a web page in the Setup Wizard using multilingual custom messages:
;#define ISSI_URL
;#define ISSI_UrlText

;; *OR* Create a link to a web page in the Setup Wizard using fixed messages
;#define ISSI_URL "http://members.home.nl/inno/"
;#define ISSI_UrlText "ISSI Online Documentation"

;; *OR*  use multilingual ProgramOnTheWeb custom message
#define ISSI_URL "http://www.albartus.com/issi/"
#define ISSI_UrlText "{cm:ProgramOnTheWeb,ISSI}"


;; ISSI Languages
#define ISSI_Dutch
#define ISSI_English
#define ISSI_French
#define ISSI_German

;; ISSI Iclude (Required)
#include ISSI_IncludePath + "\_issi.isi"

;; Rest of the setup
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
outputBaseFileName=ISSI_URL_Link




