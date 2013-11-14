
[ ISSI EXAMPLE SCRIPT ]

; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive



[ FTP SETTINGS ]
#define ISSI_FTP_UserName "username"
#define ISSI_FTP_Password "gjhghgsgjhgsj"
#define ISSI_FTP_Server "ftp.myServer.com"
#define ISSI_FTP_Port "21"

[ FTP FILES ]
#define ISSI_FTP_Source1 "C:\myTestFolder/myTestFile1.isi"
#define ISSI_FTP_Target1 "myTestFolder/myTestFile1.isi"

#define ISSI_FTP_Source2 "C:\myTestFolder/myTestFile2.isi"
#define ISSI_FTP_Target2 "myTestFolder2/myTestFile2.isi"

;; UP TO 50 supported

#define ISSI_FTP_Source50 "C:\myTestFolder/myTestFile50.isi"
#define ISSI_FTP_Target50 "myTestFolder50/myTestFile50.isi"


[ Include ISSI ]
#include ISSI_IncludePath + "\_issi.isi"


#error FINISHED UPLOADING
