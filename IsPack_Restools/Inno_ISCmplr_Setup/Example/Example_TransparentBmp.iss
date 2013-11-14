; 演示如何使用 BitmapImage 的透明色.
; 脚本: restools ( http://restools.hanzify.org )

; 如果该修改版本在编译脚本或者运行的时候出现问题请提出来.

; 当 BackColor 和 ReplaceWithColor 的颜色都为 clNone 的时候,
; 将会以 ReplaceColor 作为 BitmapImage 的透明色使用.

; 当 BackColor 的颜色为 clNone 的时候,NewIconImage 的背景将会是透明的.

#ifdef IS_ENHANCED
  #if (Pos('ee', IS_Ver_Str) >= 1)
    #define IS_Version_ee
  #endif
#else
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=My Program
AppVersion=1.5
DefaultDirName={pf}\My Program
DefaultGroupName=My Program
Compression=lzma2
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "logo.bmp"; Flags: dontcopy
Source: "WinXP.bmp"; Flags: dontcopy
#ifdef IS_Version_ee
Source: "..\Example_FullVCL\InnoSetup.ico"; Flags: dontcopy
#endif

[code]
function SetTimer(hWnd: longword; nIDEvent, uElapse: longword; lpTimerFunc: longword): longword;
     external 'SetTimer@user32.dll stdcall';

var
  bmp1, bmp2: TBitmapImage;
#ifdef IS_Version_ee
  Ico: TNewIconImage;
#endif

procedure MyTimerProc(h:Longword; msg: Longword; idevent: Longword; dwTime: Longword);
begin
  bmp1.Top := bmp1.Top - 1;
  bmp2.Left := bmp2.Left - 1;
#ifdef IS_Version_ee
  Ico.Left := Ico.Left + 1;
#endif
end;

procedure InitializeWizard();
begin
#ifdef UNICODE
  WizardForm.WelcomePage.DoubleBuffered := True;
#endif
  WizardForm.WelcomeLabel1.Hide;
  WizardForm.WelcomeLabel2.Hide;
  With TLabel.Create(WizardForm) do
  begin
    Parent := WizardForm.WelcomePage;
    AutoSize := False;
    WordWrap := True;
    SetBounds(WizardForm.WelcomeLabel1.Left, WizardForm.WelcomeLabel1.Top, WizardForm.WelcomeLabel1.Width,
         WizardForm.WelcomeLabel1.Height);
    Caption := 'Label Text; Label Text; Label Text; Label Text; Label Text; Label Text; Label Text;';
    Font.Assign(WizardForm.WelcomeLabel1.Font);
  end;

  With TLabel.Create(WizardForm) do
  begin
    Parent := WizardForm.WelcomePage;
    AutoSize := False;
    WordWrap := True;
    SetBounds(WizardForm.WelcomeLabel2.Left, WizardForm.WelcomeLabel2.Top, WizardForm.WelcomeLabel2.Width,
         WizardForm.WelcomeLabel2.Height);
    Caption := 'Label Text; Label Text; Label Text; Label Text; Label Text; Label Text; Label Text;'+
         'Label Text; Label Text; Label Text; Label Text; Label Text; Label Text; Label Text;'+
         'Label Text; Label Text; Label Text; Label Text; Label Text; Label Text; Label Text;'+
         'Label Text; Label Text; Label Text; Label Text; Label Text; Label Text; Label Text;'+
         'Label Text; Label Text; Label Text; Label Text; Label Text; Label Text; Label Text;';
    Font.Assign(WizardForm.WelcomeLabel2.Font);
  end;

  ExtractTemporaryFile('logo.bmp');
  ExtractTemporaryFile('WinXP.bmp');

  bmp2 := TBitmapImage.Create(WizardForm);
  bmp2.Parent := WizardForm.WelcomePage;
  bmp2.AutoSize := True;
  bmp2.Bitmap.LoadFromFile(ExpandConstant('{tmp}\WinXP.bmp'));
  bmp2.Left := WizardForm.WelcomePage.Width-10;
  bmp2.Top := 10;
  bmp2.BackColor := clNone;
  bmp2.ReplaceColor := clBlack;
  bmp2.ReplaceWithColor := clNone;

  bmp1 := TBitmapImage.Create(WizardForm);
  bmp1.Parent := WizardForm.WelcomePage;
  bmp1.AutoSize := True;
  bmp1.Bitmap.LoadFromFile(ExpandConstant('{tmp}\logo.bmp'));
  bmp1.Left := 280;
  bmp1.Top := WizardForm.WelcomePage.Height-10;
  bmp1.BackColor := clNone;
  bmp1.ReplaceColor := clWhite;
  bmp1.ReplaceWithColor := clNone;

#ifdef IS_Version_ee
  ExtractTemporaryFile('InnoSetup.ico');
  Ico := TNewIconImage.Create(WizardForm);
  Ico.Parent := WizardForm.WelcomePage;
  Ico.AutoSize := True;
  Ico.Icon.LoadFromFile(ExpandConstant('{tmp}\InnoSetup.ico'));
  Ico.Left := 100;
  Ico.Top := 100;
  Ico.BackColor := clNone;
#endif

  SetTimer(0, 101, 100, CallbackAddr('MyTimerProc'));
end;






