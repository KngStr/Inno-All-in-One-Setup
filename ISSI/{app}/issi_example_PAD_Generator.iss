
[ ISSI EXAMPLE SCRIPT ]

; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive

What is PAD?
PAD is the Portable Application Description, and it
helps authors provide product descriptions and
specifications to online sources in a standard way,
using a standard data format that will allow webmasters
and program librarians to automate program listings.
PAD saves time for both authors and webmasters.


This example shows the ISSI implementation of the
Portable Application Description XML file support.

ISSI will create a new PAD file to go with your
published application.

It takes it's PAD data from the "pad.ini" located in
the "ISSI/Include" subfolder. This ini file all in-
formation regarding your application(s).

To use the PAD functionality of ISSI copy the ISSI
example entry and adjust your application information
accordingly. Once you have an entry for your app
you can use it as described in this example script.

By writing the variables to the ini file you can add
control over your DAP info from within Inno Setup.

The best way to fully use the PAD feature is to
combine the batch generation functions with PAD
creation. That way you can read the file size of your
setup and automatically add it to the PAD.INI before
you export the updated PAD file.

Then you could add an upload feature for all the files
through ISPP so you can really publish with on click of
a button.

One of the best ways to start your PAD file is using
PAD-Gen to quickly set up the pad for your application

More information about PAD and the PAD-Gen can be found
here: http://www.asp-shareware.org/pad/


[ISSI]
;; The AppName used in the ISSI\Include\pad.ini file
  #define ISSI_PadAppName "myApp"
;;

;; The AppName used in the ISSI\Include\pad.ini file
  #define ISSI_PadIni ISSI_IncludePath + "\Output\pad.ini"
;;

;; Define the Export file name and folder
  #define ISSI_PadExportFileName "myApp-pad.xml"
  #define ISSI_PadExportFolder ISSI_IncludePath + "\Output"
;;

;; OPTIONAL: Define PAD Style
;  #define ISSI_padStyle "pad"
;;

;; OPTIONAL add variables based on your current script
  ;; Before we generate the PAD file we can ajust some of it's variables
  #define AppVersion "1.0"
  #define PAD_Program_Version AppVersion
;;

;; OPTIONAL Add information from external file(s)
  ;; This overrules the manual entry. Please note all carrage returns are lost.
  ;#define PAD_EULA_FileName ISSI_IncludePath + "\License.txt"
  ;; This overrules the manual entry. Please note all carrage returns are lost.
  ;#define PAD_Distribution_Permissions_FileName ISSI_IncludePath + "\Vendor.txt"
;;

;; O P T I O N A L   P A D   E X T E N S I O N S
  ;; Before we generate the PAD file we can ajust some of it's variables

    ;; A S P   P A D   E X T E N S I O N : http://www.asp-shareware.org/
    ;#define PAD_ASP_Member_Number "12345"
    
    ;; E S C   P A D   E X T E N S I O N : http://www.edu-soft.org/
    ;#define PAD_ESC_Member_Number "12345"
    
    ;; T P A   P A D   E X T E N S I O N : http://www.trialware.org/
    ;#define PAD_TPA_Member_ID "myID"
    ;; LicenceTypes: Trailware", "Time-limited trail", "Feature-limited trail"
    ;#define PAD_TPA_Trial_License_Type "LicenseType"

    ;; M S N   P A D   E X T E N S I O N
    #define PAD_MSN_IS_32bit "Y" ;; Certify that application is true 32-bit

    ;; P A D R I N G   P A D   E X T E N S I O N : http://www.padring.com/padring.html
    #define PAD_PADRING1 "http://members.home.nl/albartus/ISSI-pad.xml"
    #define PAD_PADRING2
    #define PAD_PADRING3
    #define PAD_PADRING4
    #define PAD_PADRING5
    #define PAD_PADRING6
    #define PAD_PADRING7
    #define PAD_PADRING8
    #define PAD_PADRING9
    #define PAD_PADRING10
    
    ;; D E L P H I   P A D   E X T E N S I O N
    ;#define PAD_DELPHI_FORM "Y"
    ;; Delphi or Borland C++ version supported (and url)
    ;#define PAD_DELPHI_D1_URL
    ;#define PAD_DELPHI_D2_URL
    ;#define PAD_DELPHI_D3_URL
    ;#define PAD_DELPHI_D4_URL
    ;#define PAD_DELPHI_D5_URL
    ;#define PAD_DELPHI_D6_URL
    ;#define PAD_DELPHI_BCB1_URL
    ;#define PAD_DELPHI_BCB3_URL
    ;#define PAD_DELPHI_BCB4_URL
    ;#define PAD_DELPHI_BCB5_URL
    ;#define PAD_DELPHI_K1_URL
    ;; COMPONENT TYPE: "Freeware", "Shareware", "Commercial"
    ;#define PAD_DELPHI_Type
    ;; Price with Source
    ;#define PAD_DELPHI_Price
    ;; SOURCE AVAILABLE: "Included", "After purchase/registration", "On request", "None", "N/A"
    ;#define PAD_DELPHI_Source
    ;; FILE LOCATION: "Uploaded or will be soon", "Please, download it", "Link (no download count)"
    ;;                "Sent/Sending via e-mail", "Just additional info"
    ;#define PAD_DELPHI_File_Location
    ;; The exact link to your file
    ;#define PAD_DELPHI_Link_URL
    ;; Add permanent link to file if you want 'them' to download it
    ;#define PAD_DELPHI_Download_URL
    ;; Version this file replaces (if any) that should be removed from 'our' site
    ;#define PAD_DELPHI_Version
    ;; NOTES
    ;#define PAD_DELPHI_Notes
    ;;






;; ISSI Iclude
#include ISSI_IncludePath + "\_issi.isi"
;;


[Setup]
AppName=ISSI PADExample
AppVerName=ISSI PAD Example v{#AppVersion}
AppVersion={#AppVersion}
AppPublisher=LOGAN Interactive
AppPublisherURL=http://www.albartus.com
AppSupportURL=http://www.albartus.com
AppUpdatesURL=http://www.albartus.com
AppCopyright=Jan Albartus
CreateAppDir=no
CreateUninstallRegKey=no
Uninstallable=no
outputBaseFileName=ISSI_PAD_Generator


