; 脚本: restools ( http://restools.hanzify.org )

; 可在内存中释出安装包的文件, 例如你有些图片要在安装程序中使用, 但是不想释放到临时目录中使用,
; 就可以使用这个函数放进内存中, 然后载入, 那么文件在使用期间就不会释放到用户的硬盘中去.

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
Source: "logo.bmp"; Flags: dontcopy

[code]
procedure InitializeWizard();
var
  Logo: TBitmapImage;
  MemStream: TMemoryStream;
begin
  Logo := TBitmapImage.Create(WizardForm);
  Logo.Parent := WizardForm;
  MemStream := TMemoryStream.Create;
  try
    ExtractTemporaryFileToStream('logo.bmp', MemStream);
    MemStream.Position := 0;
    Logo.Bitmap.LoadFromStream(MemStream);
  finally
    MemStream.Free;
  end;
  Logo.SetBounds(30, WizardForm.Bevel.Top+10, Logo.Bitmap.Width, Logo.Bitmap.Height);
end;
