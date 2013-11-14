
; ISSI EXAMPLE SCRIPT
;
; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive

; This example shows you how to add a background image

[ISSI]
; Ass background Image
#define ISSI_BackgroundImage ISSI_IncludePath + "\issi_example_Images\issi_800x600.bmp"

;; OPTIONAL: Overrule the standard background color
;; clBlack (default), clMaroon, clGreen, clOlive, clNavy, clPurple, clTeal,
;; clGray, clSilver, clRed, clLime, clYellow, clBlue, clFuchsia, clAqua, clWhite.
;; OR:
;; value in the form of $bbggrr, where rr, gg, and bb specify the two-digit
;; intensities (in hexadecimal) for red, green, and blue respectively.
#define ISSI_BackgroundImage_BGColor "clWhite"

; Include ISSI
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
outputBaseFileName=ISSI_Background_Image
