[Setup]
AppName=Game
AppVerName=Game
DefaultDirName={pf}\Game
OutputBaseFilename=game
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: compiler:Examples\MyProg.exe; DestDir: {app}

[Registry]
Root: HKLM; Subkey: Software\Game; Flags: uninsdeletekey
Root: HKLM; Subkey: Software\Game; ValueType: string; ValueName: Path; ValueData: {app}\MyProg.exe; Flags: uninsdeletekey
