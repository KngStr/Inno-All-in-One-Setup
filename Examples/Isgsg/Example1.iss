;Пример использования BMP-изображения с вырезанием цвета.

[Setup]
AppName=Test
AppVerName=Test
DefaultDirName={pf}\Test
OutputDir=.

[Languages]
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Files]
Source: "splash.bmp"; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression
Source: "isgsg.dll"; DestDir: {tmp}; Flags: ignoreversion dontcopy nocompression

[Code]
procedure ShowSplashScreen(p1:HWND;p2:string;p3,p4,p5,p6,p7:integer;p8:boolean;p9:Cardinal;p10:integer); external 'ShowSplashScreen@files:isgsg.dll stdcall delayload';

procedure InitializeWizard;
begin
  ExtractTemporaryFile('splash.bmp');
  ShowSplashScreen(WizardForm.Handle,ExpandConstant('{tmp}')+'\splash.bmp',1000,3000,1000,0,255,True,$00FF00,10);
end;
