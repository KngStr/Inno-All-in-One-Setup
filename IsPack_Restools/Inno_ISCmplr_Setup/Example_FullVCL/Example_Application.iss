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

[code]
procedure BtnOnClick(Sender: TObject);
var
  i: integer;
begin
  For i := 0 to 30000 do
  begin
    WizardForm.Caption := 'Count: ' + IntToStr(I);
    Application.ProcessMessages; // 在做循环的时候，仍然允许程序做其他的工作。
  end;
end;

procedure InitializeWizard();
begin
  Application.Title := 'My App Title'; // 设置程序在任务栏中的标题。
  with TButton.Create(WizardForm) do
  Begin
    Caption := 'Count';
    SetBounds(ScaleX(10), ScaleY(320), ScaleX(80), ScaleY(28));
    Parent := WizardForm;
    OnClick := @BtnOnClick;
  end;
end;


