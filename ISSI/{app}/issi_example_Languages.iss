
; ISSI EXAMPLE SCRIPT
;
; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive

; This example shows you how to add an ISSI Language Section

; Please note: If you don't have some languages installed on your system,
; not all languages may show up in the language selection box

[ISSI]
;; Include ALL languages
#define ISSI_Languages

;; OPTIONAL: To define a certain localization zone
;;           ("Europe", "EuropeWest", "EuropeEast", "Asia", "Benelux", "Scandinavia")
;#define ISSI_LanguagesZone "Benelux"



;; OPTIONAL: Force all languages to display in the language selection dialog
;;           Inno's default settings don't show every included language by default
#define ISSI_LanguagesShowAll



;; Individual ISSI Languages
;#define ISSI_Bosnian
;#define ISSI_Catalan
;#define ISSI_Chinese
;#define ISSI_Czech
;#define ISSI_Danish
;#define ISSI_Dutch
;#define ISSI_English
;#define ISSI_French
;#define ISSI_German
;#define ISSI_Hungarian
;#define ISSI_Italian
;#define ISSI_Norwegian		
;#define ISSI_Polish		
;#define ISSI_Portuguese
;#define ISSI_Japanese
;#define ISSI_Russian
;#define ISSI_Slovenian
;#define ISSI_Spanish
;#define ISSI_Swedish
;#define ISSI_BrazilianPortuguese
;; OR:
;; ISSI Languages with license file
;#define ISSI_English "E:\ISSI\issi_v5_1_0_3\license.txt"
;#define ISSI_German "E:\ISSI\issi_v5_1_0_3\license.txt"
;#define ISSI_French "E:\ISSI\issi_v5_1_0_3\license.txt"
;#define ISSI_Dutch "E:\ISSI\issi_v5_1_0_3\license.txt"
;#define ISSI_Czech "E:\ISSI\issi_v5_1_0_3\license.txt"
;#define ISSI_Russian "E:\ISSI\issi_v5_1_0_3\license.txt"
;; OR:
;; ISSI Languages with license file and InfoBeforeFile addon
;#define ISSI_German "E:\ISSI\issi_v5_00_27_18\license.txt;InfoBeforeFile:C:\ISSI\readme.txt"
;#define ISSI_French "E:\ISSI\issi_v5_00_27_18\license.txt;InfoBeforeFile:C:\ISSI\readme.txt"
;#define ISSI_Dutch "E:\ISSI\issi_v5_00_27_18\license.txt;InfoBeforeFile:C:\ISSI\readme.txt"
;#define ISSI_Spanish "E:\ISSI\issi_v5_00_27_18\license.txt;InfoBeforeFile:C:\ISSI\readme.txt"
;#define ISSI_Czech "E:\ISSI\issi_v5_00_27_18\license.txt;InfoBeforeFile:C:\ISSI\readme.txt"
;#define ISSI_Hungarian "E:\ISSI\issi_v5_00_27_18\license.txt;InfoBeforeFile:C:\ISSI\readme.txt"
;#define ISSI_Russian "E:\ISSI\issi_v5_00_27_18\license.txt;InfoBeforeFile:C:\ISSI\readme.txt"
;; OR:
;; ISSI Languages added as native Inno script.
;[Languages]
;Name: "en"; MessagesFile: "compiler:Default.isl,{#ISSI_IncludePath}\Languages\_issi_English.isl"
;Name: "nl"; MessagesFile: "compiler:\Languages\Dutch.isl,{#ISSI_IncludePath}\Languages\_issi_Dutch.isl"
;; OPTIONAL: add unsupported languages by linking to the English ISSI messages file
;Name: "tu"; MessagesFile: "compiler:\Languages\Turkish.isl,{#ISSI_IncludePath}\Languages\_issi_English.isl"

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
outputBaseFileName=ISSI_Languages

; SUPPORTED LANGUAGES:

;ISSI_Afrikaans ISSI_Languages
;ISSI_Albanian ISSI_Languages
;ISSI_Arabic ISSI_Languages
;ISSI_Asturian ISSI_Languages
;ISSI_Belarusian ISSI_Languages
;ISSI_Bosnian ISSI_Languages
;ISSI_Bulgarian ISSI_Languages
;ISSI_BrazilianPortuguese ISSI_Languages
;ISSI_Catalan ISSI_Languages
;ISSI_ChineseTrad ISSI_Languages
;ISSI_ChineseSimp ISSI_Languages
;ISSI_Croatian ISSI_Languages
;ISSI_Czech ISSI_Languages
;ISSI_Danish ISSI_Languages
;ISSI_Dutch ISSI_Languages
;ISSI_English ISSI_Languages
;ISSI_Estonian ISSI_Languages
;ISSI_Finnish ISSI_Languages
;ISSI_French ISSI_Languages
;ISSI_Galician ISSI_Languages
;ISSI_German ISSI_Languages
;ISSI_Greek ISSI_Languages
;ISSI_Hebrew ISSI_Languages
;ISSI_Hungarian ISSI_Languages
;ISSI_Icelandic ISSI_Languages
;ISSI_Indonesian ISSI_Languages
;ISSI_Italian ISSI_Languages
;ISSI_Japanese ISSI_Languages
;ISSI_Korean ISSI_Languages
;ISSI_Lithuanian ISSI_Languages
;ISSI_Luxemburgish ISSI_Languages
;ISSI_Malaysian ISSI_Languages
;ISSI_Marcedonian ISSI_Languages
;ISSI_Norwegian ISSI_Languages	
;ISSI_Polish	ISSI_Languages
;ISSI_Portuguese ISSI_Languages
;ISSI_Romanian ISSI_Languages
;ISSI_Russian ISSI_Languages
;ISSI_Serbian ISSI_Languages
;ISSI_Slovak ISSI_Languages
;ISSI_Slovenian ISSI_Languages
;ISSI_Spanish ISSI_Languages
;ISSI_Swedish ISSI_Languages
;ISSI_Turkish ISSI_Languages
;ISSI_Ukrainian ISSI_Languages






