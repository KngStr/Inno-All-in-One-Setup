; -- Example2.iss --
; Demonstrates advance usage and count time.
; Author  : KngStr
; WebSite : http://www.kngstr.com/archive/inno/ish/instfiles/

#include "InstFiles.ish"

[Setup]
AppName=My Program
AppVersion=1.5
DefaultDirName={pf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
Compression=lzma2
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output
CreateUninstallRegKey=no
Uninstallable=no

[Dirs]

[Files]

[Dirs]

#pragma option -v-  ;If you have a lot of files, enable this line

#define start_time GetDateTimeString('hh:nn:ss', '-', ':')

#define InstFiles_Tmp_Inc 2000
#expr InstFiles("D:\Users", "*.*", "")

#define end_time GetDateTimeString('hh:nn:ss', '-', ':')
#pragma warning start_time + " - " + end_time

[code]
(* {#emit start_time + " - " + end_time} *)

#expr SaveToFile(SourcePath + "preprocessed.iss") , Exec(CompilerPath + "Compil32.exe", SourcePath + "preprocessed.iss")
