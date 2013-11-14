; 脚本: restools ( http://restools.hanzify.org )

; 支持同名文件使用序号释出实际上不同的文件.
; 此种方式的释出文件同样支持以下函数:
;     ExtractTemporaryFileEx
;     ExtractTemporaryFileToStream
;     ExtractTemporaryFileToBuffer

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
; 文件序号 0 , 用  (logo.bmp:0)  来提取
Source: "logo.bmp"; Flags: dontcopy
; 文件序号 1 , 用  (logo.bmp:1)  来提取
Source: "otherlogo.bmp"; DestName: "logo.bmp"; Flags: dontcopy
; 文件序号 2 , 用  (logo.bmp:2)  来提取
;Source: "xxxx.bmp"; DestName: "logo.bmp"; Flags: dontcopy
; 文件序号 3 , 用  (logo.bmp:3)  来提取
;Source: "C:\mylogo\logo.bmp"; Flags: dontcopy

[code]
procedure InitializeWizard();
var
  Logo: TBitmapImage;
begin
  ExtractTemporaryFile('logo.bmp:1'); // 实际上相当于  otherlogo.bmp
  // 因为采用了相同的目标名字, 所以需要使用序号来代表不同的文件
  // 以 [Files] 中文件的顺序来排列序号, 由 0 开始计数.
  // logo.bmp:0  = (Source: "logo.bmp"; Flags: dontcopy)
  // logo.bmp:1  = (Source: "otherlogo.bmp"; DestName: "logo.bmp"; Flags: dontcopy)
  Logo := TBitmapImage.Create(WizardForm);
  Logo.Parent := WizardForm;
  Logo.Bitmap.LoadFromFile(ExpandConstant('{tmp}\logo.bmp'));
  Logo.SetBounds(30, WizardForm.Bevel.Top+10, Logo.Bitmap.Width, Logo.Bitmap.Height);
end;
