
; ISSI EXAMPLE SCRIPT
;
; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive

;; This function manipulates the WizardImageFile and text to allow different aspect ratio images
#define ISSI_WizardImageFile ISSI_IncludePath + "\issi_example_Images\issi_164x314.bmp"
#define ISSI_WizardImageFile_x 164
;; Optional: align will switches alignment of the image
#define ISSI_WizardImageFile_Align


;; (optional) This does the same for the Finished screen
;#define ISSI_WizardImageFile2 ISSI_IncludePath + "\issi_example_Images\issi_164x314.bmp"
;#define ISSI_WizardImageFile2_x 164
;#define ISSI_WizardImageFile2_Align

;; The WizardSmallImageFile
#define ISSI_WizardSmallImageFile ISSI_IncludePath + "\issi_example_Images\issi_164x58.bmp"
#define ISSI_WizardSmallImageFile_x 164

;; Optional: align will switches alignment of the image
#define ISSI_WizardSmallImageFile_Align

;; Include ISSI:
#include ISSI_IncludePath + "\_issi.isi"

[Setup]
AppName=ISSI Example Wizard Image File
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
outputBaseFileName=ISSI_WizardImageFile
