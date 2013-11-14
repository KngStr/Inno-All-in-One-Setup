
; ISSI EXAMPLE SCRIPT
;
; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive

; This example shows you how to add a splash screen

[ISSI]
;; Name of the bitmap image:
#define ISSI_SplashScreen ISSI_IncludePath + "\issi_example_Images\issi_200x100_round.bmp"

;; Time in seconds:
#define ISSI_SplashScreen_T 2

;; Image Width:
#define ISSI_SplashScreen_X 400

;; Image Heigth:
#define ISSI_SplashScreen_Y 200

;; Rounded corners (Optional):
#define ISSI_Splash_Corner 400

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
CreateAppDir=no
CreateUninstallRegKey=no
Uninstallable=no
outputBaseFileName=ISSI_Splash_Screen
