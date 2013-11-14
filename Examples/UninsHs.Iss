[Setup]
AppName=My Program
AppVerName=My Program version 1.5
DefaultDirName={pf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
Compression=lzma
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "{#ExtendDir}\UninsHs\UninsHs.exe"; DestDir: "{app}"; Flags: restartreplace


[Run]
Filename: "{app}\UninsHs.exe"; Parameters: "/r0=My Program,{language},{srcexe},{userappdata}\$Inst$\Setup.exe";

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"
Name: "{group}\п╤ть My Program"; Filename: "{app}\UninsHs.exe"; Parameters: "/u0=My Program"; WorkingDir: "{app}";

[Languages]
; These files are stubs
; To achieve better results after recompilation, use the real language files
Name: "chinesesimp"; MessagesFile: "compiler:Languages\ChineseSimp.isl"
Name: "english"; MessagesFile: "compiler:Languages\English.isl"


