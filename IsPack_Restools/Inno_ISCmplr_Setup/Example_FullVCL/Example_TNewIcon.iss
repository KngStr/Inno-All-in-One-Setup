; 演示如何使用增强的主体安装程序和增强的编译器。
; 脚本: restools ( http://restools.hanzify.org )
; 这里将会演示所有增强功能并提供相关解释。

; 其他更多的 VCL 属性和函数，具体请查看“Support Classes.txt”

#ifdef IS_ENHANCED
  #if (Ver < 0x5020300) || (Pos('ee', IS_Ver_Str) < 1)
    #pragma error 'Enhanced edition of Inno Setup (5.2.3.ee1 or higher) is required to compile this script'
  #endif
#else
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=My Application
AppVersion=1.5
DefaultDirName={pf}\My Application
SolidCompression=yes
Compression=lzma/ultra	
PrivilegesRequired=none
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "Icon1.ico"; Flags: dontcopy
Source: "Icon2.ico"; Flags: dontcopy
Source: "Icon3.ico"; Flags: dontcopy
Source: "Icon4.ico"; Flags: dontcopy
Source: "InnoSetup.ico"; Flags: dontcopy

[code]
var
  IconIndex: Integer;

procedure MyOnTimer(Sender: TObject);
var
  Icon: TNewIcon;
begin
  Icon := TNewIcon.Create; // Support True Color
  try
    Icon.LoadFromFile(ExpandConstant('{tmp}\Icon' + IntToStr(IconIndex) + '.ico'));
    Icon.Width := 16; // Selected Icon Size (16x16 ; 32x32; 48x48 ......)
    Icon.Height := 16; // Default Size: 32x32
    WizardForm.Icon.Handle := Icon.Handle;
  finally
    Icon.Free;
  end;
  
  IconIndex := IconIndex + 1;
  if IconIndex > 4 then IconIndex := 1;
end;

procedure InitializeWizard();
var
  i: Integer;
  Icon: TNewIcon;
begin
  Icon := TNewIcon.Create; // Support True Color
  try
    ExtractTemporaryFile('InnoSetup.ico');
    Icon.LoadFromFile(ExpandConstant('{tmp}\InnoSetup.ico'));
    Icon.Width := 16; // Selected Icon Size (16x16 ; 32x32; 48x48 ......)
    Icon.Height := 16; // Default Size: 32x32
    Application.Icon.Handle := Icon.Handle;
  finally
    Icon.Free;
  end;

  IconIndex := 1;

  for i := 1 to 4 do
    ExtractTemporaryFile('Icon' + IntToStr(i) + '.ico');

  with TTimer.Create(WizardForm) do
  begin
    Interval := 50;
    OnTimer := @MyOnTimer;
  end;
end;


