; 演示如何使用Setup参数 UninstallIconFile.
; 脚本: restools ( http://restools.hanzify.org )

; 重开 UninstallIconFile 参数.
; 该参数已经被官方版本所废弃, 原因是因为安装部分和卸载部分的主体程序已经被一体化.
; 重开是因为已经找到解决的方案. 该方案令到制作好的安装程序即使在 Win98 下也能运作正常.

#ifndef IS_ENHANCED
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=My Program
AppVersion=1.5
DefaultDirName={pf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
SetupIconFile=Setup.ico
SolidCompression=yes
Compression=lzma/ultra
OutputDir=userdocs:Inno Setup Examples Output
// 重新激活 UninstallIconFile 参数的使用
UninstallIconFile=Uninstall.ico

[Files]
Source: "MyProg.exe"; DestDir: "{app}"
Source: "MyProg1.chm"; DestName: "MyProg.chm"; DestDir: "{app}"
Source: "Readme1.txt"; DestName: "Readme.txt"; DestDir: "{app}"; Flags: isreadme

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"
Name: "{group}\My Program Documentation"; Filename: "{app}\MyProg.chm";
Name: "{group}\My Program Readme"; Filename: "{app}\Readme.txt";
Name: "{group}\Remove My Program"; Filename: "{uninstallexe}";

