
; ISSI EXAMPLE SCRIPT
;
; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive

[ISSI]
;; Set WizardSmallImageFile for each wpPage
#define ISSI_wpLicense ISSI_IncludePath + "\Wizard_Images\1_55x55.bmp"
;#define ISSI_wpSelectDir ISSI_IncludePath + "\Wizard_Images\2_55x55.bmp"
#define ISSI_wpSelectProgramGroup ISSI_IncludePath + "\Wizard_Images\3_55x55.bmp"
#define ISSI_wpReady ISSI_IncludePath + "\Wizard_Images\4_55x55.bmp"

;; All pages in order of appearance.. if activated
;#define ISSI_wpLicense ISSI_IncludePath + "\Wizard_Images\1_55x55.bmp"
;#define ISSI_wpPassword ISSI_IncludePath + "\Wizard_Images\1_55x55.bmp"
;#define ISSI_wpInfoBefore ISSI_IncludePath + "\Wizard_Images\3_55x55.bmp"
;#define ISSI_wpUserInfo ISSI_IncludePath + "\Wizard_Images\2_55x55.bmp"
;#define ISSI_wpSelectDir ISSI_IncludePath + "\Wizard_Images\1_55x55.bmp"
;#define ISSI_wpSelectComponents ISSI_IncludePath + "\Wizard_Images\4_55x55.bmp"
;#define ISSI_wpSelectProgramGroup ISSI_IncludePath + "\Wizard_Images\4_55x55.bmp"
;#define ISSI_wpSelectTasks ISSI_IncludePath + "\Wizard_Images\3_55x55.bmp"
;#define ISSI_wpReady ISSI_IncludePath + "\Wizard_Images\2_55x55.bmp"
;#define ISSI_wpPreparing ISSI_IncludePath + "\Wizard_Images\1_55x55.bmp"
;#define ISSI_wpInstalling ISSI_IncludePath + "\Wizard_Images\2_55x55.bmp"
;#define ISSI_wpInfoAfter ISSI_IncludePath + "\Wizard_Images\3_55x55.bmp"

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
DefaultDirName={pf}\ISSI\
outputBaseFileName=ISSI_WizardSmallImage_Switch
licensefile=license.txt


