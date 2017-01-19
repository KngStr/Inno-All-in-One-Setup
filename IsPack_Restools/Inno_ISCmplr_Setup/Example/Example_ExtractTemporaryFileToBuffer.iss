; 脚本: restools ( http://restools.hanzify.org )

#ifndef IS_ENHANCED
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=My Application
AppVersion=1.5
DefaultDirName={pf}\My Application
DefaultGroupName=My Application
UninstallDisplayIcon={app}\MyProg.exe
SolidCompression=yes
Compression=lzma/ultra
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "Readme1.txt"; Flags: dontcopy

[code]
procedure InitializeWizard();
var
  Buffer: AnsiString;
  FileName: String;
  FileSize: Cardinal;
begin
  FileName := 'Readme1.txt';
  FileSize := ExtractTemporaryFileSize(FileName);
  SetLength(Buffer, FileSize);
// 可在内存中释出安装包的文件, 直接释出到内存的地址中, 可以是字符串, 也可以是非字符的十六进制数据.
#ifdef UNICODE
  ExtractTemporaryFileToBuffer(FileName, CastAnsiStringToInteger(Buffer));
#else
  ExtractTemporaryFileToBuffer(FileName, CastStringToInteger(Buffer));
#endif
  MsgBoxEx(WizardForm.Handle, Buffer, FileName, MB_OK, 0, 0);
end;







