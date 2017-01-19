; -- Example_Password.iss --
; 演示如何防止 通用解包程序。Update: 2008-12-07
; 脚本: restools ( http://restools.hanzify.org )

; 如果该修改版本在编译脚本或者运行的时候出现问题请提出来.

;build 081207
;1. 修改 GetPassword 定义。
;     function GetPassword(PrePassword: String): String;
;2. 增加 1 个密码设置函数 SetPassword，具体使用方法可以参考例子。
;     procedure SetPassword(const Password: String);

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
Password=123456abcdef
UsePreviousTasks=yes
Encryption=true
OutputDir=userdocs:Inno Setup Examples Output

[Types]
Name: "full"; Description: "full"
Name: "compact"; Description: "compact"
Name: "custom"; Description: "custom"; Flags: iscustom

[Components]
Name: "program"; Description: "app files"; Types: full compact custom; Flags: fixed
Name: "help"; Description: "help files"; Types: full
Name: "readme"; Description: "readme files"; Types: full

[Files]
Source: "MyProg.exe"; DestDir: "{app}"; Components: program
Source: "MyProg1.chm"; DestDir: "{app}"; Components: help
Source: "Readme1.txt"; DestDir: "{app}"; Components: readme; Flags: isreadme
Source: "logo.bmp"; Flags: dontcopy

[Icons]
Name: "{group}\my application"; Filename: "{app}\MyProg.exe"

[code]
function TmpPassword: String;
begin
// 这个临时的密码提供函数是用户自己定义的，函数名字可以随便起，里面的代码随便写，
// 但是不能写成 Result := '123456abcdef'; 否则密码会是以常规字符串出现。
// 这个函数只是用来提供给安装程序临时释放文件用，如无必要，请不要使用这种方式。
// 如果使用这种方式，所有用户文件都可以加密，包括预释放文件都可以不用 noencryption 标记。
  Result := chr(ord('2')-1);
  Result := Result + chr(ord('3')-1);
  Result := Result + chr(ord('4')-1);
  Result := Result + chr(ord('5')-1);
  Result := Result + chr(ord('6')-1);
  Result := Result + chr(ord('7')-1);
  Result := Result + chr(ord('b')-1);
  Result := Result + chr(ord('c')-1);
  Result := Result + chr(ord('d')-1);
  Result := Result + chr(ord('e')-1);
  Result := Result + chr(ord('f')-1);
  Result := Result + chr(ord('g')-1);
end;

function CheckPassword(Password: String): Boolean;
begin
// 无论密码是否正确都要关闭 password 页面。
// 因为我们不需要这个页面来提供正确密码。
  Result := True;
end;

procedure InitializeWizard();
var
  Logo: TBitmapImage;
begin
// 以下代码是实现取用临时创建的密码来初期使用释放文件。
// 但是我认为这是可免则免的事情。
// 要尽可能在安装文件的时候才提供正确密码。

  SetPassword(TmpPassword);
  ExtractTemporaryFile('logo.bmp');
  SetPassword('FakePassword'); // 用完后最好重新清空一下密码。
  
  // 用完立刻清除正确密码是在尽可能的缩短动态调试程序看见密码的时间范围。 

  Logo := TBitmapImage.Create(WizardForm);
  Logo.Parent := WizardForm;
  Logo.Bitmap.LoadFromFile(ExpandConstant('{tmp}\logo.bmp'));
  Logo.SetBounds(30, WizardForm.Bevel.Top+10, Logo.Bitmap.Width, Logo.Bitmap.Height);
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  // 到了真正安装文件的时候才提供正确的密码，这种做法主要是针对直接使用调试软件来检测密码的方法。
  // 简单的算法就可以令到调试的过程成为一项烦躁的工作，而你需要做的事情只是短短的几句代码。 
  if CurStep = ssInstall then
    SetPassword(TmpPassword); 
end;

