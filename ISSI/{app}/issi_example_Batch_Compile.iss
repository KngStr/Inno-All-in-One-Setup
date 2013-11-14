
; ISSI EXAMPLE SCRIPT
;
; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive

; Make sure you have set the outputBaseFilename so each setup get's its own file name.
;
; Usefull for:
; - compiling many scripts at once (Currently up to 50) per include batch
; - compiling scripts to be includend into the [Files] section of the current setup
; - testing include files for compile problems among many different setups scripts



;; Batch scripts folder / working dir
#define ISSI_BatchCompile ISSI_IncludePath

;; Batch compile a list of Inno Setup sctipts
;; This example will compile virtually al ISSI_Example scripts
#define ISSI_BatchCompile1 "issi_example_About_Button.iss"
#define ISSI_BatchCompile2 "issi_example_Associate_Extension.iss"
#define ISSI_BatchCompile3 "issi_example_Background_Image.iss"
#define ISSI_BatchCompile4 "issi_example_Beveled_Label.iss"
#define ISSI_BatchCompile5 "issi_example_Compile_DateTime.iss"
#define ISSI_BatchCompile6 "issi_example_Custom_Code.iss"
#define ISSI_BatchCompile7 "issi_example_Download_Setup.iss"
#define ISSI_BatchCompile8 "issi_example_Full_And_Update.iss"
#define ISSI_BatchCompile9 "issi_example_Languages.iss"
#define ISSI_BatchCompile10 "issi_example_Languages_LicenseFile.iss"
#define ISSI_BatchCompile11 "issi_example_Net_Detect.iss"
#define ISSI_BatchCompile12 "issi_example_Script_Backup.iss"
#define ISSI_BatchCompile13 "issi_example_Splash_Screen.iss"
#define ISSI_BatchCompile14 "issi_example_Update.iss"
#define ISSI_BatchCompile15 "issi_example_URL_Link.iss"
#define ISSI_BatchCompile16 "issi_example_Wizard_Images.iss"
#define ISSI_BatchCompile17 "issi_example_Wizard_Image_File.iss"
#define ISSI_BatchCompile18 "issi_example.iss"
#define ISSI_BatchCompile19 "issi_example_Play_Wave.iss"
#define ISSI_BatchCompile20 "issi_example_App_Name.iss"
#define ISSI_BatchCompile19 "issi_example_Play_Midi.iss"
#define ISSI_BatchCompile20 "issi_example_Wizard_Image_Switch.iss"
#define ISSI_BatchCompile21 "issi_example_Compression.iss"
#define ISSI_BatchCompile22 "issi_example_Background_Image_Switch.iss"
#define ISSI_BatchCompile23 "issi_example_Get_MD5.iss"
#define ISSI_BatchCompile24 "issi_example_Serial_Generator.iss"
#define ISSI_BatchCompile25 "issi_example_UninsHs.iss"
#define ISSI_BatchCompile26 "issi_example_UnZip.iss"


;; OPTIONAL:
#define ISSI_BatchCompileNotify

;; Include ISSI (Required)
#include ISSI_IncludePath + "\_issi.isi"

;; You could enter a setup script here to compile after all
;; batched files are compiled to include them in a main setup.

;; Or you could add here a second ISSI inclusion thus making it possible
;; to batchcompile an endless ammount of ISS files. (If you do, do not use
;; ISSI_BatchNotify because it would abort the compile after the first batch)
