
; ISSI EXAMPLE SCRIPT
;
; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive
;
; This example shows the use of the Serial Key Generator

[ISSI]

;; Activation of Serial Generation
#define ISSI_GenerateSerial

;; (Dafault is "Capitals" + "Numbers")
;; #define ISSI_GenerateSerial "Numbers"
;; #define ISSI_GenerateSerial "All"
;; #define ISSI_GenerateSerial "Capitals"
;; #define ISSI_GenerateSerial "Letters"

;; OPTIONAL: Generate groups of these lengths (Defaults to 5)
;#define ISSI_GenerateSerial_GroupLength 3

;; OPTIONAL: Generate x number of groups (Defaults to 5)
;#define ISSI_GenerateSerial_Groups 6

;; OPTIONAL: For naming of ini [Sections] and folder structure
;#define ISSI_GenerateSerial_AppName "ISSI Serial Generator v1.0"


;; REQUIRED: Issi include
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
outputBaseFileName=ISSI Serial Generator

