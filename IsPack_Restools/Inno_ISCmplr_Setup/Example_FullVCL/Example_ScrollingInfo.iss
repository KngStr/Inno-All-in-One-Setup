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
Source: "InnoSetup.ico"; Flags: dontcopy

[code]
const
  WM_MOUSEMOVE = $0200;
var
  OuterPanel, InfoPanel: TPanel;
  Timer: TTimer;
  
procedure InfoPanelOnMouseEnter(Sender: TObject);
begin
  Timer.Enabled := False;
end;

procedure InfoPanelOnMouseLeave(Sender: TObject);
begin
  Timer.Enabled := True;
end;

procedure MyOnTimer(Sender: TObject);
begin
  InfoPanel.Top := InfoPanel.Top - 1;
  if InfoPanel.Top = -InfoPanel.Height then
    InfoPanel.Top := OuterPanel.Height;
end;

procedure InitializeWizard();
var
  i: Integer;
begin
  WizardForm.WelcomeLabel2.Caption := '';
#ifdef UNICODE
  WizardForm.DoubleBuffered := True;
#endif

// OuterPanel
  OuterPanel := TPanel.Create(WizardForm);
  OuterPanel.Parent := WizardForm.WelcomePage;
  OuterPanel.BevelOuter := bvNone;
  OuterPanel.SetBounds(ScaleX(180), ScaleY(60), ScaleX(285), ScaleY(240));
  OuterPanel.Color := clWhite;
#ifdef UNICODE
  OuterPanel.ParentBackground := False;
#endif

// InfoPanel
  InfoPanel := TPanel.Create(WizardForm);
  InfoPanel.Parent := OuterPanel;
  InfoPanel.BevelOuter := bvNone;
  InfoPanel.SetBounds(0, 0, OuterPanel.Width, ScaleY(300));
  InfoPanel.Color := clWhite;
  InfoPanel.OnMouseEnter := @InfoPanelOnMouseEnter;
  InfoPanel.OnMouseLeave := @InfoPanelOnMouseLeave;
#ifdef UNICODE
  InfoPanel.ParentBackground := False;
#endif

// IconImage
  with TNewIconImage.Create(WizardForm) do
  begin
    Parent := InfoPanel;
    Left := ScaleX(10);
    Top := ScaleY(10);
    ExtractTemporaryFile('InnoSetup.ico');
    Icon.LoadFromFile(ExpandConstant('{tmp}\InnoSetup.ico'));
    AutoSize := True;
    OnMouseEnter := @InfoPanelOnMouseEnter;
    OnMouseLeave := @InfoPanelOnMouseLeave;
  end;
// Text Shadow
  with TLabel.Create(WizardForm) do
  begin
    Parent := InfoPanel;
    Caption := 'Inno Setup';
    Font.Size := 24;
    Font.Style := [fsBold];
    Font.Name := 'Tahoma';
    Font.Color := clSilver;
    Left := ScaleX(58);
    Top := ScaleY(11);
    OnMouseEnter := @InfoPanelOnMouseEnter;
    OnMouseLeave := @InfoPanelOnMouseLeave;
  end;

  with TLabel.Create(WizardForm) do
  begin
    Parent := InfoPanel;
    Caption := 'Inno Setup';
    Font.Size := 24;
    Font.Style := [fsBold];
    Font.Name := 'Tahoma';
    Left := ScaleX(55);
    Top := ScaleY(8);
    Transparent := True;
    OnMouseEnter := @InfoPanelOnMouseEnter;
    OnMouseLeave := @InfoPanelOnMouseLeave;
  end;

  with TLabel.Create(WizardForm) do
  begin
    Parent := InfoPanel;
    Caption := 'Version 5.4.1.ee1';
    Font.Size := 10;
    Font.Color := clMaroon;
    Font.Name := 'Tahoma';
    Left := ScaleX(130);
    Top := ScaleY(48);
    OnMouseEnter := @InfoPanelOnMouseEnter;
    OnMouseLeave := @InfoPanelOnMouseLeave;
  end;

  with TLabel.Create(WizardForm) do
  begin
    Parent := InfoPanel;
    Caption := 'Copyright (C) 1997-2011 Jordan Russell'+#13+
         'Portions Copyright (C) 2000-2011 Martijn Laan'+#13+
         'All rights reserved.'+#13+#13+
         'Inno Setup home page:'+#13+
         'http://www.innosetup.com/'+#13+#13+
         'RemObjects Pascal Script home page:'+#13+
         'http://www.remobjects.com/?ps'+#13+#13+
         'Enhanced edition home page:'+#13+
         'http://restools.hanzify.org/'+#13+#13+
         'Inno Setup Preprocessor home page:'+#13+
         'http://ispp.sourceforge.net/';
    Font.Size := 9;
    Font.Color := clBlue;
    Left := ScaleX(20);
    Top := ScaleY(70);
    OnMouseEnter := @InfoPanelOnMouseEnter;
    OnMouseLeave := @InfoPanelOnMouseLeave;
  end;

  Timer := TTimer.Create(WizardForm);
  Timer.Interval := 20;
  Timer.OnTimer := @MyOnTimer;
end;




