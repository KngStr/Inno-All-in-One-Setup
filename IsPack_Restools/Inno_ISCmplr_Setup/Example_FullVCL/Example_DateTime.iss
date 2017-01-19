; 演示如何使用增强的主体安装程序和增强的编译器。
; 脚本: restools ( http://restools.hanzify.org )
; 这里将会演示所有增强功能并提供相关解释。

; 其他更多的 VCL 属性和函数，具体请查看“Support Classes.txt”

#ifdef IS_ENHANCED
  #if (Ver < 0x5030600) || (Pos('ee', IS_Ver_Str) < 1)
    #pragma error 'Enhanced edition of Inno Setup (5.3.6.ee1 or higher) is required to compile this script'
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
  MonthCalendar: TNewMonthCalendar;
  DateTimePicker1, DateTimePicker2: TNewDateTimePicker;
  MonLabel: TLabel;
  
procedure MonthCalendarOnChange(Sender: TObject);
begin
  MonLabel.Caption := FormatDateTime('"Current date is: "dddddd ( ddd )', MonthCalendar.Date);
end;                         
  
procedure DateTimePicker1OnChange(Sender: TObject);
begin
  MonLabel.Caption := FormatDateTime('"Current date is: "dddddd ( ddd )', DateTimePicker1.Date);
end;                         
  
procedure DateTimePicker2OnChange(Sender: TObject);
begin
  MonLabel.Caption := FormatDateTime('"Current time is: "tt', DateTimePicker2.Time);
end;                         
  
procedure InitializeWizard();
begin
  WizardForm.WelcomeLabel2.Caption := '';
  
  MonthCalendar := TNewMonthCalendar.Create(WizardForm);
  MonthCalendar.Parent := WizardForm.WelcomePage;
  MonthCalendar.AutoSize := True;
  MonthCalendar.Left := WizardForm.WizardBitmapImage.Width + 20;
  MonthCalendar.Top :=  WizardForm.WelcomeLabel1.Top + WizardForm.WelcomeLabel1.Height + 20;
  MonthCalendar.CalColors.MonthBackColor := $00E8FFE8;
  MonthCalendar.OnChange := @MonthCalendarOnChange;
  
  DateTimePicker1 := TNewDateTimePicker.Create(WizardForm);
  DateTimePicker1.ShowCheckbox := True;
  DateTimePicker1.Parent := WizardForm.WelcomePage;
  DateTimePicker1.Left := WizardForm.WizardBitmapImage.Width + 20;
  DateTimePicker1.Top :=  MonthCalendar.Top + MonthCalendar.Height + 20;
  DateTimePicker1.Width := 100;
  DateTimePicker1.OnChange := @DateTimePicker1OnChange;
  
  DateTimePicker2 := TNewDateTimePicker.Create(WizardForm);
  DateTimePicker2.Parent := WizardForm.WelcomePage;
  DateTimePicker2.Kind := dtkTime;
  DateTimePicker2.Left := DateTimePicker1.Left + 120;
  DateTimePicker2.Top :=  MonthCalendar.Top + MonthCalendar.Height + 20;
  DateTimePicker2.Width := 100;
  DateTimePicker2.OnChange := @DateTimePicker2OnChange;
  
  MonLabel := TLabel.Create(WizardForm);
  MonLabel.Parent := WizardForm;
  MonLabel.Left := 20;
  MonLabel.Top := WizardForm.NextButton.Top;
end;




