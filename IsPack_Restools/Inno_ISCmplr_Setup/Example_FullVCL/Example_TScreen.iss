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
  ListBox: TListBox;
  
procedure ListBoxDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  with ListBox.Canvas do
  begin
    FillRect(Rect);
    Font.Name := ListBox.Items[Index];
    Font.Size := 0;    // use font's preferred size
    TextOut(Rect.Left+1, Rect.Top+1, ListBox.Items[Index]);
  end;
end;

procedure ListBoxMeasureItem(Control: TWinControl; Index: Integer; var Height: Integer);
begin
  with ListBox.Canvas do
  begin
    Font.Name := ListBox.Items[Index];
    Font.Size := 0;                 // use font's preferred size
    Height := TextHeight('Wg') + 2; // measure ascenders and descenders
  end;
end;

procedure InitializeWizard();
begin
  WizardForm.WelcomeLabel1.Caption := 'System Fonts';
  ListBox := TListBox.Create(WizardForm);
  ListBox.Parent := WizardForm.WelcomePage;
  ListBox.SetBounds(WizardForm.WizardBitmapImage.Width + 5,
       WizardForm.WelcomeLabel1.Top + WizardForm.WelcomeLabel1.Height - 10,
       WizardForm.WelcomePage.Width - (WizardForm.WizardBitmapImage.Width + 10),
       WizardForm.Bevel.Top - (WizardForm.WelcomeLabel1.Top + WizardForm.WelcomeLabel1.Height));
  ListBox.Items := Screen.Fonts;
  ListBox.Style := lbOwnerDrawVariable;
  ListBox.OnMeasureItem := @ListBoxMeasureItem;
  ListBox.OnDrawItem := @ListBoxDrawItem;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  WizardForm.NextButton.Hide;
  WizardForm.CancelButton.Caption := 'Close';
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := False;
end;



