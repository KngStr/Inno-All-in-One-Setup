; -- Example1.iss --

; 演示如何使用 InstallShield 界面风格的 INNO 安装程序。
; 脚本： restools ( http://restools.yeah.net )

[Setup]
AppName=我的程序
AppVerName=我的程序 版本 1.5
DefaultDirName={pf}\我的程序
DefaultGroupName=我的程序
UninstallDisplayIcon={app}\MyProg.exe
SolidCompression=yes
Compression=lzma/ultra	
WizardImageFile=Left.bmp
LicenseFile=license.txt
UserInfoPage=true
InfoBeforeFile=infobefore.txt
InfoAfterFile=infoafter.txt
Password=1234
UsePreviousTasks=yes
OutputDir=userdocs:Inno Setup Examples Output

[Tasks]
Name: task1; Description: 我的附加任务1; GroupDescription: 附加任务;

[Types]
Name: "full"; Description: "完整安装"
Name: "compact"; Description: "简洁安装"
Name: "custom"; Description: "自定义安装"; Flags: iscustom

[Components]
Name: "program"; Description: "程序文件"; Types: full compact custom; Flags: fixed
Name: "help"; Description: "帮助文件"; Types: full
Name: "readme"; Description: "自述文件"; Types: full

[Languages]
Name: ch; MessagesFile: "MyLang.isl"

[Files]
;Source: "MyProg.exe"; DestDir: "{app}"; Components: program
;Source: "MyProg.hlp"; DestDir: "{app}"; Components: help
;Source: "Readme.txt"; DestDir: "{app}"; Components: readme; Flags: isreadme
Source: "bottom.bmp"; Flags: dontcopy
Source: "topline.bmp"; Flags: dontcopy

[Icons]
Name: "{group}\我的程序"; Filename: "{app}\MyProg.exe"

[code]
const
  SM_CXSCREEN = 0;
  SM_CYSCREEN = 1;

function GetSystemMetrics(nIndex: Integer): Integer; external 'GetSystemMetrics@user32.dll stdcall';

procedure Set_MUI_InstallShield;
var
  ScreenWidth, ScreenHeight: Integer;
begin
  WizardForm.BEVEL1.Hide;
  ExtractTemporaryFile('bottom.bmp');
  WizardForm.WizardSmallBitmapImage.SetBounds(0, 418, 690, 41);
  WizardForm.WizardSmallBitmapImage.Bitmap.LoadFromFile(ExpandConstant('{tmp}\bottom.bmp'));
  WizardForm.WizardSmallBitmapImage.Parent := WizardForm;
  ExtractTemporaryFile('topline.bmp');
  WizardForm.WizardBitmapImage2.SetBounds(0, 53, 690, 2);
  WizardForm.WizardBitmapImage2.Bitmap.LoadFromFile(ExpandConstant('{tmp}\topline.bmp'));
  WizardForm.WizardBitmapImage2.Parent := WizardForm;
  WizardForm.SelectDirBitmapImage.Hide;
  WizardForm.SelectGroupBitmapImage.Hide;
  WizardForm.Height := 483;
  WizardForm.Width := 696;
  ScreenWidth := GetSystemMetrics(SM_CXSCREEN);
  ScreenHeight := GetSystemMetrics(SM_CYSCREEN);
  WizardForm.SetBounds((ScreenWidth - WizardForm.Width) div 2, (ScreenHeight - WizardForm.Height) div 2,
       WizardForm.Width, WizardForm.Height);
  WizardForm.BACKBUTTON.SetBounds(296, 427, 77, 22);
  WizardForm.NEXTBUTTON.SetBounds(378, 427, 77, 22);
  WizardForm.CANCELBUTTON.SetBounds(600, 427, 77, 22);
  WizardForm.WizardBitmapImage.SetBounds(0, 55, 171, 363);
  WizardForm.WizardBitmapImage.Parent := WizardForm;
  WizardForm.WelcomePage.Parent.SetBounds(171,55,519,363);
  WizardForm.WelcomePage.Color := $00AB663D;
  WizardForm.FinishedPage.Color := $00AB663D;
  WizardForm.LicensePage.Color := $00AB663D;
  WizardForm.PasswordPage.Color := $00AB663D;
  WizardForm.InfoBeforePage.Color := $00AB663D;
  WizardForm.UserInfoPage.Color := $00AB663D;
  WizardForm.SelectDirPage.Color := $00AB663D;
  WizardForm.SelectDirPage.Parent.Align := alClient;
  WizardForm.SelectComponentsPage.Color := $00AB663D;
  WizardForm.SelectProgramGroupPage.Color := $00AB663D;
  WizardForm.SelectTasksPage.Color := $00AB663D;
  WizardForm.ReadyPage.Color := $00AB663D;
  WizardForm.PreparingPage.Color := $00AB663D;
  WizardForm.InstallingPage.Color := $00AB663D;
  WizardForm.InfoAfterPage.Color := $00AB663D;
  WizardForm.MAINPANEL.Parent := WizardForm;
  WizardForm.MAINPANEL.Color := $00663300;
  WizardForm.MAINPANEL.SetBounds(0, 0, 690, 53);
  WizardForm.WELCOMELABEL1.SetBounds(63, 119, 437, 42);
  WizardForm.WELCOMELABEL1.Font.Height := -12;
  WizardForm.WELCOMELABEL1.Font.Color := clWhite;
  WizardForm.WELCOMELABEL2.SetBounds(63, 167, 378, 60);
  WizardForm.WELCOMELABEL2.Font.Color := clWhite;
  WizardForm.PAGENAMELABEL.SetBounds(17, 5, 380, 12);
  WizardForm.PAGENAMELABEL.Font.Color := clWhite;
  WizardForm.PAGEDESCRIPTIONLABEL.SetBounds(30, 24, 366, 29);
  WizardForm.PAGEDESCRIPTIONLABEL.Font.Color := clWhite;
  WizardForm.LICENSELABEL1.SetBounds(64, 20, 437, 300);
  WizardForm.LICENSELABEL1.Font.Color := clWhite;
  WizardForm.LICENSEMEMO.SetBounds(64, 56, 437, 227);
  WizardForm.LICENSEMEMO.BringToFront;
  WizardForm.LICENSEACCEPTEDRADIO.Font.Color := clWhite;
  WizardForm.LICENSEACCEPTEDRADIO.SetBounds(64, 332, 150, 16);
  WizardForm.LICENSENOTACCEPTEDRADIO.Font.Color := clWhite;
  WizardForm.LICENSENOTACCEPTEDRADIO.SetBounds(230, 332, 150, 16);
  WizardForm.INFOBEFORECLICKLABEL.SetBounds(64, 20, 437, 24);
  WizardForm.INFOBEFORECLICKLABEL.Font.Color := clWhite;
  WizardForm.INFOBEFOREMEMO.SetBounds(64, 56, 437, 227);
  WizardForm.INFOAFTERCLICKLABEL.SetBounds(64, 20, 437, 24);
  WizardForm.INFOAFTERCLICKLABEL.Font.Color := clWhite;
  WizardForm.INFOAFTERMEMO.SetBounds(64, 56, 437, 227);
  WizardForm.USERINFONAMELABEL.SetBounds(64, 60, 128, 14);
  WizardForm.USERINFONAMELABEL.Font.Color := clWhite;
  WizardForm.USERINFONAMEEDIT.SetBounds(64, 79, 435, 20);
  WizardForm.USERINFOORGLABEL.SetBounds(64, 112, 128, 14);
  WizardForm.USERINFOORGLABEL.Font.Color := clWhite;
  WizardForm.USERINFOORGEDIT.SetBounds(64, 131, 435, 20);
  WizardForm.USERINFOSERIALLABEL.SetBounds(64, 164, 128, 14);
  WizardForm.USERINFOSERIALLABEL.Font.Color := clWhite;
  WizardForm.USERINFOSERIALEDIT.SetBounds(64, 183, 435, 20);
  WizardForm.SELECTDIRLABEL.SetBounds(64, 20, 437, 24);
  WizardForm.SELECTDIRLABEL.Font.Color := clWhite;
  WizardForm.SelectDirBrowseLabel.SetBounds(64, 44, 435, 24);
  WizardForm.SelectDirBrowseLabel.Font.Color := clWhite;
  WizardForm.DISKSPACELABEL.SetBounds(72, 277, 60, 14);
  WizardForm.DISKSPACELABEL.Font.Color := clWhite;
  WizardForm.BEVEL.SHAPE := bsFrame;
  WizardForm.BEVEL.SetBounds(64, 283, 437, 45);
  WizardForm.BEVEL.Parent := WizardForm.SelectDirPage;
  WizardForm.DIREDIT.SetBounds(72, 301, 345, 12);
  WizardForm.DIREDIT.BorderStyle := bsNone;
  WizardForm.DIREDIT.Color := $00AB663D;
  WizardForm.DIREDIT.Font.Color := clWhite;
  WizardForm.DIREDIT.AUTOSELECT := False;
  WizardForm.DirBrowseButton.SetBounds(420, 296, 77, 23);
  WizardForm.SELECTCOMPONENTSLABEL.SetBounds(64, 20, 437, 24);
  WizardForm.SELECTCOMPONENTSLABEL.Font.Color := clWhite;
  WizardForm.TYPESCOMBO.SetBounds(64, 56, 437, 20);
  WizardForm.COMPONENTSLIST.SetBounds(64, 80, 437, 227);
  WizardForm.COMPONENTSDISKSPACELABEL.SetBounds(64, 320, 437, 24);
  WizardForm.COMPONENTSDISKSPACELABEL.Font.Color := clWhite;
  WizardForm.SELECTSTARTMENUFOLDERLABEL.SetBounds(64, 20, 437, 36);
  WizardForm.SELECTSTARTMENUFOLDERLABEL.Font.Color := clWhite;
  WizardForm.SelectStartMenuFolderBrowseLabel.SetBounds(64, 100, 437, 14);
  WizardForm.SelectStartMenuFolderBrowseLabel.Font.Color := clWhite;
  WizardForm.GROUPEDIT.SetBounds(64, 120, 343, 20);
  WizardForm.GroupBrowseButton.SetBounds(414, 119, 77, 23);
  WizardForm.READYLABEL.SetBounds(64, 20, 437, 24);
  WizardForm.READYLABEL.Font.Color := clWhite;
  WizardForm.READYMEMO.SetBounds(64, 53, 437, 280);
  WizardForm.FINISHEDHEADINGLABEL.SetBounds(64, 20, 437, 24);
  WizardForm.FINISHEDHEADINGLABEL.Font.Height := -12;
  WizardForm.FINISHEDHEADINGLABEL.Font.Color := clWhite;
  WizardForm.FINISHEDLABEL.SetBounds(64, 60, 437, 14);
  WizardForm.FINISHEDLABEL.Font.Color := clWhite;
  WizardForm.RUNLIST.SetBounds(64, 146, 437, 190);
  WizardForm.RUNLIST.Font.Color := clWhite;
  WizardForm.STATUSLABEL.SetBounds(64, 20, 437, 14);
  WizardForm.STATUSLABEL.Font.Color := clWhite;
  WizardForm.FILENAMELABEL.SetBounds(64, 60, 437, 14);
  WizardForm.FILENAMELABEL.Font.Color := clWhite;
  WizardForm.PROGRESSGAUGE.SetBounds(64, 90, 430, 20);
  WizardForm.PASSWORDLABEL.SetBounds(64, 60, 437, 14);
  WizardForm.PASSWORDLABEL.Font.Color := clWhite;
  WizardForm.PASSWORDEDITLABEL.SetBounds(64, 90, 437, 14);
  WizardForm.PASSWORDEDITLABEL.Font.Color := clWhite;
  WizardForm.PASSWORDEDIT.SetBounds(64, 110, 400, 20);
  WizardForm.SELECTTASKSLABEL.SetBounds(64, 20, 437, 14);
  WizardForm.SELECTTASKSLABEL.Font.Color := clWhite;
  WizardForm.TASKSLIST.SetBounds(64, 45, 430, 300);
  WizardForm.TASKSLIST.Color := $00AB663D;
  WizardForm.TASKSLIST.Font.Color := clWhite;
end;

function CheckSerial(Serial: String): Boolean;
begin
  Result := Serial = '123456';
end;

procedure InitializeWizard();
begin
  Set_MUI_InstallShield;
end;

