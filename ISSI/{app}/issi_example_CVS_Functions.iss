
[ ISSI EXAMPLE SCRIPT ]

; LOGAN's Inno Setup Script Includes (ISSI)
; http://www.albartus.com/issi/
;
; (c) 2005 Jan Albartus / LOGAN Interactive

The most likely CVS opration you might encounter in
the setup compiling part of the publishing process
is 'checking out' a clean copy or 'exportrting' a
new version of a software release.

Functions that manipulate the CVS repository are
normally not needed in the publishing process. That
is whi ISSI does not support 'commit', 'update',
'merge' and other repository changing commands. If
you have specific needs it can be implemented very
easely.

NOTE: Deletion on the export folder is needed to
      get the correct new updated files from the
      repository. (ie. Export does not overwrite)

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

[ INCLUDE ISSI ]
#include ISSI_IncludePath + "\_issi.isi"

;; Notify the user the operation has finished
#error FINISHED CVS OPERATION
