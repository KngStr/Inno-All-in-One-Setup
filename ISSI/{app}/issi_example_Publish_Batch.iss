
[   ISSI EXAMPLE SCRIPT   ]
;;  LOGAN's Inno Setup Script Includes (ISSI)
;;  http://www.albartus.com/issi/
;;
;;  (c) 2005 Jan Albartus / LOGAN Interactive
;;

[   DESCRIPTION   ]
;;  Inno Setup and ISPP make a powerfull software
;;  publishing suite, but using ISSI it gets even
;;  better.

;;  ISSI now supports a few features that will
;;  become very usefull on the final publishing
;;  of your software.

;;  ISSI can batch compile many setups so many
;;  setup.exe files can be re-compiled at the
;;  power of one batch file

;;  ISSI can help you Generate and update a PAD
;;  (Portable Application Description) file for
;;  your application.

;;  ISSI can upload files to ftp required for
;;  making versions available to the public.

;;  For ano other particulair needs, there's
;;  Inno Setup PreProcessor (ISPP)


[ CVS GENERAL SETTINGS ]
;; Complete path and filename to your CVS application
#define ISSI_CVS "C:\Program Files\TortoiseCVS\cvs"
;; CVS Repository ROOT string
#define ISSI_CVS_Root ":local:C:/CVS_Root"
;; CVS Repository NAME string
#define ISSI_CVS_Repository "CVS_Repository"

[ CVS USER ACTIONS ]
;; An invalid TAG will result in a new empty sandbox
#define ISSI_CVS_Export "myTAGtoEXPORT"
;; The foldername to export the tagged version to
#define ISSI_CVS_ExportFolder "C:\myFOLDERtoEXPORT"


[ COMPILE SETUP(S) ]
;; Compile the required Setup(s)
#define ISSI_BatchCompile ISSI_IncludePath + "\"
#define ISSI_BatchCompile1 "issi_example.iss"

[ PAD SETTINGS ]
;; General PAD Settings
#define ISSI_PadAppName "myApp"
;; Use alternative pad.ini
#define ISSI_PadIni ISSI_IncludePath + "\Output\myPAD.ini"

[ PAD INI UPDATE ]
;; Update required PAD info according to current publish
#define PAD_Program_Version "1.2"
#define PAD_Application_XML_File_URL "http://www.server.com/mySubFolderOnServer/Exported_pad.xml"

[ PAD XML EXPORT ]
;; Export a new PAD.XML or update the previous one
#define ISSI_PadExportFolder ISSI_IncludePath + "\Output"
#define ISSI_PadExportFileName "Exported pad.xml"

[ FTP SETTINGS ]
;; Settings required to connect to FTP
#define ISSI_FTP_UserName "username"
#define ISSI_FTP_Password "password"
#define ISSI_FTP_Server "ftp.server.com"
#define ISSI_FTP_Port "21"

[ FTP FILE(S) ]
;; Upload created setup.exe
#define ISSI_FTP_Source1 ISSI_IncludePath + "\Output\ISSI Example Script Setup.exe"
#define ISSI_FTP_Target1 "mySubFolderOnServer/ISSI_Example_Script_Setup.exe"
;; Upload created pad.xml
#define ISSI_FTP_Source2 ISSI_IncludePath + "\Output\Exported pad.xml"
#define ISSI_FTP_Target2 "mySubFolderOnServer/Exported_pad.xml"

[ Include ISSI ] (Required)
#include ISSI_IncludePath + "\_issi.isi"

[ Notify User ]
#ERROR FINISHED PUBLISHING
