
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
; - Generating serials


;; Batch scripts folder / working dir
#define ISSI_BatchCompile ISSI_IncludePath + "\"

;; Batch compile a list of Inno Setup sctipts


;; Because the script that is batch compiled generates a random serial for the setup,
;; this can be used to generate a number of setups.
#define ISSI_BatchCompile1 "issi_example_Serial_Generator.iss"
#define ISSI_BatchCompile2 "issi_example_Serial_Generator.iss"
;#define ISSI_BatchCompile3 "issi_example_Serial_Generator.iss"
;#define ISSI_BatchCompile4 "issi_example_Serial_Generator.iss"
;#define ISSI_BatchCompile5 "issi_example_Serial_Generator.iss"
;#define ISSI_BatchCompile6 "issi_example_Serial_Generator.iss"
;#define ISSI_BatchCompile7 "issi_example_Serial_Generator.iss"
;#define ISSI_BatchCompile8 "issi_example_Serial_Generator.iss"
;#define ISSI_BatchCompile9 "issi_example_Serial_Generator.iss"
;#define ISSI_BatchCompile10 "issi_example_Serial_Generator.iss"

;; OPTIONAL:
#define ISSI_BatchCompileNotify

;; Include ISSI (Required)
#include ISSI_IncludePath + "\_issi.isi"

;; You could enter a setup script here to compile after all
;; batched files are compiled to include them in a main setup.

;; Or you could add here a second ISSI inclusion thus making it possible
;; to batchcompile an endless ammount of ISS files. (If you do, do not use
;; ISSI_BatchNotify because it would abort the compile after the first batch)


;; The files can be found in:
;; {SourcePath}\Output\{AppName}\Serial{x}\
;; {SourcePath}\Output\{AppName}\Serial{x}.txt
;; {SourcePath}\Include\Serials.ini
;;
;;


