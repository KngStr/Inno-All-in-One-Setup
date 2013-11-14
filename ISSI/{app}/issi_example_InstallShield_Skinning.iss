
; ISSI EXAMPLE SCRIPT
;
; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive

; Create a Setup that is skinned to look like Installshield ;)

; Extra Requirements:
; ISSI FOLDER\Wizard_Images\InstallShield_100x58.bmp
; ISSI FOLDER\Wizard_Images\InstallShield_164x314.bmp
; ISSI FOLDER\Wizard_Images\InstallShield.ico

[ISSI]
#define ISSI_WizardSmallBitmapImage ISSI_IncludePath+"\Wizard_Images\InstallShield_100x58.bmp"
#define ISSI_WizardSmallBitmapImage_x 100
[Setup]
WizardImageFile={#ISSI_IncludePath}\Wizard_Images\InstallShield_164x314.bmp
SetupIconFile={#ISSI_IncludePath}\Wizard_Images\InstallShield.ico
[Messages]
BeveledLabel=InstallShield
#include ISSI_IncludePath + "\_issi.isi"

[Setup]
;dummy entries
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
outputBaseFileName=ISSI_InstallShield_Skinning

