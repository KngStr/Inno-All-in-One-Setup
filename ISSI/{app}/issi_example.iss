; -------------------------------------------------------------
;        #############################################
;       ####                                       ####
;      ####   LOGAN's Inno Setup Script Includes    ####
;      ####     ISSI Example Script   v5.1.0.8      ####
;      ####  For use with Inno Setup v4.x and v5.x  ####
;      ####                                         ####
;      ####      http://www.albartus.com/issi/      ####
;       ####                                       ####
;        #############################################
; -------------------------------------------------------------
; ISSI now requires the inclusion of entries into the Languages
; Section (see below).
;
; ISSI functions that feature user text string (like ISSI_URL
; or ISSI_About) should define the text(s) into CustomMessages
; section.
;
; All standard text used in ISSI will be called from the Inno
; Setup Language (.isl) file.
;
; -------------------------------------------------------------

;; ISSI Languages without license file
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

;; OR:
;; ISSI Languages with license file
;#define ISSI_English ISSI_IncludePath + "\license.txt"
;#define ISSI_German ISSI_IncludePath + "\license.txt"
;#define ISSI_French ISSI_IncludePath + "\license.txt"
;#define ISSI_Dutch ISSI_IncludePath + "\license.txt"
;#define ISSI_Czech ISSI_IncludePath + "\license.txt"
;#define ISSI_Russian ISSI_IncludePath + "\license.txt"

;; OR:
;; ISSI Languages with license file and InfoBeforeFile addon
#define ISSI_German ISSI_IncludePath + "\license.txt;InfoBeforeFile:" + ISSI_IncludePath + "\readme.txt"
#define ISSI_French ISSI_IncludePath + "\license.txt;InfoBeforeFile:" + ISSI_IncludePath + "\readme.txt"
#define ISSI_Dutch ISSI_IncludePath + "\license.txt;InfoBeforeFile:" + ISSI_IncludePath + "\readme.txt"
#define ISSI_English ISSI_IncludePath + "\license.txt;InfoBeforeFile:" + ISSI_IncludePath + "\readme.txt"
#define ISSI_Russian ISSI_IncludePath + "\license.txt;InfoBeforeFile:" + ISSI_IncludePath + "\readme.txt"

;; OR:
;; ISSI Languages added as native Inno script.
;[Languages]
;Name: "en"; MessagesFile: "compiler:Default.isl,{#ISSI_IncludePath}\Languages\_issi_English.isl"
;Name: "nl"; MessagesFile: "compiler:\Languages\Dutch.isl,{#ISSI_IncludePath}\Languages\_issi_Dutch.isl"

;; AND/OR:
;; OPTIONAL: add unsupported languages by linking to the English ISSI messages file
;Name: "tu"; MessagesFile: "compiler:\Languages\Turkish.isl,{#ISSI_IncludePath}\Languages\_issi_English.isl"

[CustomMessages]
;en.issiAbout=English Example text.
;fr.issiAbout=Texte français d'exemple.
;nl.issiAbout=Nederlands Voorbeeld tekst.
;de.issiAbout=Deutscher Beipiel tekst.

;issiUrl=http://members.home.nl/albartus/inno/
;fr.issiUrl=http://members.home.nl/albartus/inno/
;nl.issiUrl=http://members.home.nl/albartus/inno/
;de.issiUrl=http://members.home.nl/albartus/inno/

;issiUrlText=ISSI Online Documentation
;fr.issiUrlText=ISSI Online Documentation
;nl.issiUrlText=ISSI Online Dokumentatie
;de.issiUrlText=ISSI Online Dokumentation
; -------------------------------------------------------------

;; Create an About button in the Setup Wizard
#define ISSI_AboutButton "NameAndVersionDate"


;; Set date-time format and seperator
#define ISSI_Constants "YYMDHMS"
#define ISSI_ConstantsSeperator "."


;; Create a print button on the License page
#define ISSI_LicensePrint


;; Detects the presence of Microsoft .NET framework v1.1
;#define ISSI_NetDetect


;; Helps installing screen savers, starting screensaver properties after install
;#define ISSI_ScreenSaver "myScreensaver.scr"

;; Activation of Serial Generation
;#define ISSI_GenerateSerial

;; OPTIONAL: Generate groups of these lengths (Defaults to 5)
;#define ISSI_GenerateSerial_GroupLength 5

;; OPTIONAL: Generate x number of groups (Defaults to 5)
;#define ISSI_GenerateSerial_Groups 5

;; OPTIONAL: For naming of ini [Sections] and folder structure
;#define ISSI_GenerateSerial_AppName "ISSI Serial Generator v1.0"

;; MD5
;; This activates Inno Setup's Serial (+Userpage)
;; without storing the Serial itself inside the setup
;#define ISSI_GetMD5OfSerial "Serial"

;; This activates Inno Setup's Password protection
;; without storing the Password itself inside the setup
;#define ISSI_GetMD5OfPassword "Password"

;; Get MD5 from string for use in custom code
#define ISSI_GetMD5OfString "ISSI Example"

;; Get MD5 from file for use in custom code
;#define ISSI_GetMD5OfFile "C:\Documents and Settings\file.ext"

;; This function manipulates the WizardImageFile and text to allow different aspect ratio images
#define ISSI_WizardImageFile ISSI_IncludePath + "\issi_example_Images\issi_164x314.bmp"
#define ISSI_WizardImageFile_x 164
#define ISSI_WizardImageFile_Align
;; This does the same for the Finished screen
#define ISSI_WizardImageFile2 ISSI_IncludePath + "\issi_example_Images\issi_164x314.bmp"
#define ISSI_WizardImageFile2_x 164
;#define ISSI_WizardImageFile2_Align
;; The WizardSmallImageFile
#define ISSI_WizardSmallImageFile ISSI_IncludePath + "\issi_example_Images\issi_164x58.bmp"
#define ISSI_WizardSmallImageFile_x 164
;; Optional: align will switches alignment of the image
#define ISSI_WizardSmallImageFile_Align


;; Set WizardSmallImageFile for each wpPage
#define ISSI_wpLicense ISSI_IncludePath + "\issi_example_Images\issi_164x58.bmp"
#define ISSI_wpSelectDir ISSI_IncludePath + "\Wizard_Images\2_55x55.bmp"
#define ISSI_wpSelectProgramGroup ISSI_IncludePath + "\Wizard_Images\3_55x55.bmp"
#define ISSI_wpReady ISSI_IncludePath + "\Wizard_Images\4_55x55.bmp"



;; Create a splash screen that shows before setup. OPTIONAL Corner
#define ISSI_SplashScreen ISSI_IncludePath + "\issi_example_Images\issi_200x100_round.bmp"
;; Time in seconds:
#define ISSI_SplashScreen_T 2
;; Image Width:
#define ISSI_SplashScreen_X 200
;; Image Heigth:
#define ISSI_SplashScreen_Y 100
;; Rounded corners (Optional):
#define ISSI_Splash_Corner 200


;; Apply this to create a background image during setup
#define ISSI_BackgroundImage ISSI_IncludePath + "\issi_example_Images\issi_800x600.bmp"

;; OPTIONAL: Overrule the standard background color
;; clBlack (default), clMaroon, clGreen, clOlive, clNavy, clPurple, clTeal,
;; clGray, clSilver, clRed, clLime, clYellow, clBlue, clFuchsia, clAqua, clWhite.
;; OR:
;; value in the form of $bbggrr, where rr, gg, and bb specify the two-digit
;; intensities (in hexadecimal) for red, green, and blue respectively.
#define ISSI_BackgroundImage_BGColor "clWhite"

;; Apply this to create a background image for each page
#define ISSI_ImageWpWelcome ISSI_IncludePath + "\issi_example_Images\issi_800x600.bmp"
#define ISSI_ImageWpSelectDir ISSI_IncludePath + "\Wizard_Images\1_55x55.bmp"
#define ISSI_ImageWpReady ISSI_IncludePath + "\issi_example_Images\issi_55x55.bmp"


;; Enables you play a MIDI file during setup. With OPTIONAL Internal and external support
#define ISSI_PlayMidi ISSI_IncludePath + "\issi_example_Images\sound.mid"
;#define ISSI_PlayMidiExternal


;; Enables you play a WAVE file during setup. With OPTIONAL Internal and external and loop support
#define ISSI_PlayWav ISSI_IncludePath + "\issi_example_Images\sound.wav"
;#define ISSI_PlayWavExternal
;#define ISSI_PlayWavLoop


;; Associate Extention with known file type
#define ISSI_AssociateExt "isi"
#define ISSI_AssociateProgram "Inno Setup"
#define ISSI_AssociateName "InnoSetupScriptFile"


;; Only install when existing AppID exists
;#define ISSI_UpdateTitle "myAppName"
;#define ISSI_Update "myAppID or myAppName"
;; OPTIONAL VERSION CHECK
;#define ISSI_UpdateVersion "01010012"


;; Include a copy of your setup script into your setup.exe as backup
#define ISSI_ScriptBackup "issi_example.iss"
#define ISSI_ScriptBackup_Key "somekeyword"


;; Enable to create a setup that downloads and installs a remote setup
;#define ISSI_DOWNLOAD_TITLE "Inno Setup Script Includes"
;#define ISSI_DOWNLOAD_DLL "C:\Program Files\ISX Download DLL\isxdl.dll"
;#define ISSI_DOWNLOAD_URL "http://members.home.nl/issi/issi_setup.exe"


;; To get the smallest setup files
#define ISSI_Compression


;; Auto insert WizardBitmapImages
;#define ISSI_WizardImages 2


;; Make your custom includes and templates
;#define ISSI_UserInclude "no"
;; OR
;#define ISSI_UserInclude "E:\_issi_user.txt"
;; OR nothing


;; Use templates to create some [Setup] entries like default program group and install dir
#define ISSI_AppName "ISSI Example Script"
#define ISSI_AppVersion "5"
#define ISSI_AppPublisher "LOGAN Interactive"
;; OPTIONAL: select a template structure for creation of default AppFolder value
#define ISSI_AppTemplate 5
;; OPTIONAL: set application icon
;#define ISSI_AppIcon "E:\ISSI\issi.ico"
;; OPTIONAL: copy all files from this folder to {App}
;#define ISSI_AppFilesFolder "E:\ISSI\issi_v5_00_27_18"
;; OPTIONAL: create startmenu entry
;#define ISSI_AppStart "_issi.isi"

;; Create a link to a web page in the Setup Wizard
#define ISSI_URL "http://www.albartus.com/issi/"
#define ISSI_UrlText "{cm:ProgramOnTheWeb,ISSI}"


;; Apply a BeveledLabel that overrules the one defined through the use of ISSI_AppName
;; If left empty it will display Inno Setup
#define ISSI_BeveledLabel "Inno Setup Script Includes"


;; Launch the ISSI generated code in a new instance of Inno Setup for review
;#define ISSI_Debug


;; CUSTOM CODE EXAMPLES
;#define ISSI_InitializeWizard
;[Code]
;procedure ISSI_InitializeWizard();
;begin
;  MsgBox(ExpandConstant('ISSI_InitializeWizard'), mbInformation, mb_Ok);
;end;
;[/Code]

;#define ISSI_InitializeSetup
;[Code]
;function ISSI_InitializeSetup(): Boolean;
;begin
;  MsgBox(ExpandConstant('{#ISSI_UseMyInitializeSetup}'), mbInformation, mb_Ok);
;  result:=True
;end;
;[/Code]

;#define ISSI_DeInitializeSetup
;[Code]
;procedure ISSI_DeInitializeSetup();
;begin
;  MsgBox('ISSI_UseMyDeInitializeSetup', mbInformation, mb_Ok);
;end;
;[/Code]

;#define ISSI_NextButtonClick
;[Code]
;function ISSI_NextButtonClick(CurPage : Integer) : Boolean;
;begin
;  MsgBox('ISSI_UseMyNextButtonClick', mbInformation, mb_Ok);
;  result:=True
;end;
;[/Code]

;#define ISSI_BackButtonClick
;[Code]
;function ISSI_BackButtonClick(CurPage : Integer) : Boolean;
;begin
;  MsgBox('ISSI_UseMyBackButtonClick', mbInformation, mb_Ok);
;  result:=True
;end;
;[/Code]

;#define ISSI_CurPageChanged
;[Code]
;procedure ISSI_CurPageChanged(CurPageID: Integer): Boolean;
;begin
;  MsgBox('ISSI_UseMyCurPageChanged', mbInformation, mb_Ok);
;end;
;[/Code]


#include ISSI_IncludePath + "\_issi.isi"


; -------------------------------------------------------------
;; EXAMPLE AppTemplate for ISSI_AppName
;; This could also be put in your custom "_issi_user.txt"
;
;#if ISSI_AppTemplate == 1000 || ISSI_AppTemplate == -1000
;[Setup]
;  AppVerName={#ISSI_AppName} version {#ISSI_AppVersion}
;  OutputBaseFilename={#ISSI_AppName} Setup
;  DefaultDirName={pf}\{#ISSI_AppName} version {#ISSI_AppVersion}
;  DefaultGroupName={#ISSI_AppName} version {#ISSI_AppVersion}
;#endif

