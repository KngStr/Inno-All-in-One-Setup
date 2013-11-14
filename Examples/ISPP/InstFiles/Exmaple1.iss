; -- Example1.iss --
; Demonstrates use InstFiles.ish.
; Author  : WLDNA
; WebSite : http://www.wldna.com/archive/inno/ish/instfiles/

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

#expr InstFiles("D:\Users", "*.*")