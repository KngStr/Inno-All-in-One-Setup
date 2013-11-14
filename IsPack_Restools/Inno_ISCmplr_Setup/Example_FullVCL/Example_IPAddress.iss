; 演示如何使用增强的主体安装程序和增强的编译器。
; 脚本: restools ( http://restools.hanzify.org )
; 这里将会演示所有增强功能并提供相关解释。

; 其他更多的 VCL 属性和函数，具体请查看“Support Classes.txt”

#ifdef IS_ENHANCED
  #if (Ver < 0x5030700) || (Pos('ee', IS_Ver_Str) < 1)
    #pragma error 'Enhanced edition of Inno Setup (5.3.7.ee1 or higher) is required to compile this script'
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
var
  IPEdit: TIPAddressEdit;
  IPLabel: TNewStaticText;
  
procedure InitializeWizard();
begin      
  { IPLabel }
  IPLabel := TNewStaticText.Create(WizardForm);
  IPLabel.Parent := WizardForm.WelcomePage;
  IPLabel.Left := ScaleX(220);
  IPLabel.Top := ScaleY(180);
  IPLabel.Caption := 'Enter your IP:';
  
  { IPEdit }
  IPEdit := TIPAddressEdit.Create(WizardForm);
  IPEdit.Parent := WizardForm.WelcomePage;
  IPEdit.Font.Name := 'Fixedsys';
  IPEdit.Font.Height := -16;
  IPEdit.Field1Value := 192;
  IPEdit.Field2Value := 168;
  IPEdit.Field3Value := 0;
  IPEdit.Field4Value := 1;
  IPEdit.SetBounds(ScaleX(220), ScaleY(200), IPEdit.Width, IPEdit.Height);
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpSelectDir then
    MsgBox('Your IP is: ' + IntToStr(IPEdit.Field1Value) + '.' + IntToStr(IPEdit.Field2Value) + '.' +
         IntToStr(IPEdit.Field3Value) + '.' + IntToStr(IPEdit.Field4Value) + #13#10 +
           '  Value is: ' + Format('%u', [IPEdit.IPValue]), mbInformation, MB_OK);
end;

