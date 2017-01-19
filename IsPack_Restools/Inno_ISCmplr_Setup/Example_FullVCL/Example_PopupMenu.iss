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
var
  PupMnu: TPopupMenu;
  btn: TButton;
  
procedure BtnOnClick(Sender: TObject);
var
  p: TPoint;
begin
  p.x := btn.Left;
  p.y := btn.Top + btn.Height;
  p := Wizardform.ClientToScreen(p);
  PupMnu.Popup(p.x, p.y);
end;

procedure Menu1OnClick(Sender: TObject);
begin
  MsgBox('Menu 1 OnClick!', mbInformation, MB_OK);
end;

procedure Menu2OnClick(Sender: TObject);
begin
  MsgBox('Menu 2 OnClick!', mbInformation, MB_OK);
end;

procedure InitializeWizard();
var
  Mnu: TMenuItem;
begin
  PupMnu := TPopupMenu.Create(WizardForm);
  // Menu 1
  Mnu := TMenuItem.Create(WizardForm);
  Mnu.Caption := 'Menu 1';
  Mnu.OnClick := @Menu1OnClick;
  PupMnu.Items.Add(Mnu);
  // Menu 2
  Mnu := TMenuItem.Create(WizardForm);
  Mnu.Caption := 'Menu 2';
  Mnu.OnClick := @Menu2OnClick;
  PupMnu.Items.Add(Mnu);
  // btn
  btn := TButton.Create(WizardForm);
  btn.Caption := 'Popup Menu';
  btn.SetBounds(ScaleX(10), ScaleY(320), ScaleX(100), ScaleY(28));
  btn.Parent := WizardForm;
  btn.OnClick := @BtnOnClick;
  btn.PopupMenu := PupMnu;
end;

