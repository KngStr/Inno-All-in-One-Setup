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
Source: {#PluginDir}\ISFlash.dll; DestDir: {tmp}; Flags: dontcopy
Source: 1.swf; DestDir: {tmp}; Flags: dontcopy

[Code]   
procedure ISFlash_init(Handle:HWND; Ffile: PAnsiChar);
external 'isflash_init@files:ISFlash.dll stdcall';

procedure ISFlash_free;
external 'isflash_free@files:ISFlash.dll stdcall';

procedure InitializeWizard();
var
  FlashPanel: TPanel;
begin
  FlashPanel := TPanel.Create(WizardForm);
  FlashPanel.Parent := WizardForm;
  FlashPanel.Top := WizardForm.OuterNotebook.Height + 1;
  FlashPanel.Left := 1;
  FlashPanel.Height := 45;
  FlashPanel.Width := 66;
  ExtractTemporaryFile('1.swf')
  ISFlash_init(FlashPanel.Handle, ExpandConstant('{tmp}\1.swf'));
end;

procedure DeinitializeSetup();
begin
  ISFlash_free;
end;





















