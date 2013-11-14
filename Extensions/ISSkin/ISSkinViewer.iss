#ifndef IS_ENHANCED
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=ISSkinViewer
AppVersion=1.0
SetupIconFile=IViewer.ico
DefaultDirName={pf}\ISSkinViewer
OutputBaseFilename=ISSkinViewer
OutputDir=.

[Files]
Source: ISSkin.dll; DestDir: {app}; Flags: dontcopy

[ISFormDesigner]
WizardForm=FF0A005457495A415244464F524D003010B60C000054504630F10B5457697A617264466F726D0A57697A617264466F726D0743617074696F6E14200000004953534B494E20E79AAEE882A4E9A284E8A788E7A88BE5BA8F20566572312E300C436C69656E744865696768740366010B436C69656E74576964746803EF010853686F7748696E74090C4578706C696369744C65667402000B4578706C69636974546F7002000D4578706C69636974576964746803F7010E4578706C696369744865696768740381010D506978656C73506572496E636802600A54657874486569676874020D00F10C544E65774E6F7465626F6F6B0D4F757465724E6F7465626F6F6B00F110544E65774E6F7465626F6F6B506167650B57656C636F6D65506167650D4578706C69636974576964746803F1010E4578706C6963697448656967687403390100065450616E656C0650616E656C31044C656674020003546F70020005576964746803F101064865696768740339010A426576656C4F75746572070662764E6F6E650743617074696F6E06012010506172656E744261636B67726F756E6408085461624F7264657202020006544C6162656C064C6162656C31044C656674021003546F700208055769647468023306486569676874020D0743617074696F6E1205000000AE76A4808765F64E3A000B5472616E73706172656E7408000006544C6162656C064C6162656C32044C65667403200103546F700208055769647468024706486569676874020D0743617074696F6E1412000000E79AAEE882A420494E4920E58F82E695B03A0B5472616E73706172656E740800000654426576656C06426576656C32044C656674020703546F70024805576964746803E2010648656967687403E500000006544C6162656C064C6162656C33044C656674021003546F700235055769647468027606486569676874020D0743617074696F6E141B000000496E6E6F20536574757020E694AFE68C81E79A84E68EA7E4BBB63A0B5472616E73706172656E740800000C544269746D6170496D6167650C4269746D6170496D61676531044C65667403200103546F70025005576964746803B90006486569676874021D000006544C6162656C064C6162656C34044C65667403900003546F700250055769647468022006486569676874020D0448696E740606544C6162656C0743617074696F6E06064C6162656C340B5472616E73706172656E740800000C544E6577436F6D626F426F780F4953536B696E46696C65436F6D626F044C656674021003546F70021805576964746803E500064865696768740215055374796C65070E637344726F70446F776E4C6973740D44726F70446F776E436F756E7402100A4974656D486569676874020D085461624F72646572020000000C544E6577436F6D626F426F780E4953536B696E496E69436F6D626F044C65667403200103546F70021805576964746803C100064865696768740215055374796C65070E637344726F70446F776E4C6973740A4974656D486569676874020D085461624F726465720201000008544E657745646974084E65774564697431044C656674021003546F70026805576964746802690648656967687402150448696E740608544E657745646974085461624F726465720202045465787406084E65774564697431000008544E65774D656D6F084E65774D656D6F31044C656674021003546F7003800005576964746802690648656967687402590448696E740608544E65774D656D6F0D4C696E65732E537472696E67730106084E65774D656D6F3106064C696E65203206064C696E65203306064C696E65203406064C696E65203506064C696E65203606064C696E65203706064C696E65203806064C696E65203906074C696E6520313006074C696E6520313106074C696E6520313206074C696E652031330600000A5363726F6C6C4261727307067373426F7468085461624F72646572020300000C544E6577436865636B426F780C4E6577436865636B426F7831044C656674021003546F7003F80005576964746802610648656967687402110448696E74060C544E6577436865636B426F780743617074696F6E060C4E6577436865636B426F7831085461624F72646572020400000F544E6577526164696F427574746F6E0F4E6577526164696F427574746F6E31044C656674021003546F7003100105576964746802710648656967687402110448696E74060F544E6577526164696F427574746F6E0743617074696F6E060F4E6577526164696F427574746F6E31085461624F72646572020500000B544E65774C697374426F780B4E65774C697374426F7831044C656674027F03546F70027805576964746802550648656967687402510448696E74060B544E65774C697374426F780A4974656D486569676874020D0D4974656D732E537472696E67730106064C696E65203206064C696E65203306064C696E65203406064C696E65203506064C696E65203606064C696E65203706064C696E65203806064C696E65203906074C696E6520313006074C696E6520313106074C696E6520313206074C696E6520313300085461624F726465720206094974656D496E64657802FF0000065450616E656C0650616E656C32044C656674027F03546F7003E00005576964746802550648656967687402290448696E7406065450616E656C0743617074696F6E060650616E656C32085461624F72646572020700000D5450617373776F7264456469740D50617373776F72644564697431044C656674027F03546F7003100105576964746802550648656967687402150448696E74060D5450617373776F726445646974085461624F7264657202080454657874060D50617373776F72644564697431000010544E6577436865636B4C697374426F78104E6577436865636B4C697374426F7831044C65667403E00003546F7002780557696474680391000648656967687402510448696E740610544E6577436865636B4C697374426F78085461624F72646572020900000E544E6577537461746963546578740E4E65775374617469635465787431044C65667403900003546F70025F055769647468024D06486569676874020E0448696E74060E544E6577537461746963546578740743617074696F6E060E4E65775374617469635465787431085461624F72646572020A00000F54466F6C64657254726565566965770F466F6C646572547265655669657731044C65667403E00003546F7003CC0005576964746803910006486569676874025906437572736F72070763724172726F770448696E74060F54466F6C6465725472656556696577085461624F72646572020B00000F5452696368456469745669657765720F526963684564697456696577657231044C65667403780103546F70027805576964746802690648656967687402510448696E74060F545269636845646974566965776572085461624F72646572020C00000F544E657750726F67726573734261720F4E657750726F677265737342617231044C656674021003546F7003E00005576964746802690648656967687402110448696E74060F544E657750726F6772657373426172034D696E0200034D6178026408506F736974696F6E024600000C544E6577436F6D626F426F780C4E6577436F6D626F426F7831044C656674021003546F70025005576964746802690648656967687402150448696E74060C544E6577436F6D626F426F780A4974656D486569676874020D085461624F72646572020E0D4974656D732E537472696E67730106064C696E65203206064C696E65203306064C696E65203406064C696E65203506064C696E65203606064C696E65203706064C696E65203806064C696E65203906074C696E6520313006074C696E6520313106074C696E6520313206074C696E65203133000000185453746172744D656E75466F6C64657254726565566965771853746172744D656E75466F6C646572547265655669657731044C65667403780103546F7003CC00055769647468026906486569676874025906437572736F72070763724172726F770448696E7406185453746172744D656E75466F6C6465725472656556696577085461624F72646572020F00000A544E6577427574746F6E0A42726F7773657242746E044C65667403F80003546F70021605576964746802230648656967687402190743617074696F6E1202000000EE76555F085461624F72646572021000000000F110544E65774E6F7465626F6F6B5061676509496E6E6572506167650D4578706C69636974576964746803F1010E4578706C696369744865696768740339010000000A544E6577427574746F6E07426C6F6742746E044C656674021403546F70034701055769647468026B0648656967687402170448696E741411000000E8AEBFE997AEE68891E79A8420424C4F470743617074696F6E060E524553544F4F4C532720424C4F47085461624F726465720205000000

[Code]
procedure LoadSkin(lpszPath: String; lpszIniFileName: String); external 'LoadSkin@files:isskin.dll stdcall';
procedure UnloadSkin(); external 'UnloadSkin@files:isskin.dll stdcall';
function ShowWindow(hWnd: Integer; uType: Integer): Integer; external 'ShowWindow@user32.dll stdcall';
function LoadLibrary(lpLibFileName: String): THandle; external 'LoadLibraryA@kernel32.dll stdcall';
function FreeLibrary(hLibModule: THandle): Boolean; external 'FreeLibrary@kernel32.dll stdcall';
function EnumResourceNames(hModule: THandle; lpType: String; lpEnumFunc: Longword; lParam: Longint): BOOL; external 'EnumResourceNamesA@kernel32.dll stdcall';
function SetWindowText(hWnd: Longint; lpString: PChar): Longint; external 'SetWindowTextA@user32.dll';
function GetWindowLong(hWnd, nIndex: Integer): Longint; external 'GetWindowLongA@user32.dll';

procedure DeinitializeSetup();
begin
	ShowWindow(StrToInt(ExpandConstant('{wizardhwnd}')), 0);
	UnloadSkin();
end;

var
  SkinFilePath: String;

procedure BrowserBtn_OnClick(Sender: TObject); forward;

procedure ISSkinFileCombo_OnChange(Sender: TObject); forward;

procedure ISSkinIniCombo_OnChange(Sender: TObject); forward;

procedure BlogBtn_OnClick(Sender: TObject);
var
  Res: Integer;
begin
  ShellExec('open', 'http://restools.hanzify.org','','', SW_SHOW, ewNoWait, Res);
end;

{ RedesignWizardFormBegin } // 不要删除这一行代码。
// 不要修改这一段代码，它是自动生成的。
var
  Panel1: TPanel;
  Label1: TLabel;
  Label2: TLabel;
  Bevel2: TBevel;
  Label3: TLabel;
  BitmapImage1: TBitmapImage;
  Label4: TLabel;
  ISSkinFileCombo: TNewComboBox;
  ISSkinIniCombo: TNewComboBox;
  NewEdit1: TNewEdit;
  NewMemo1: TNewMemo;
  NewCheckBox1: TNewCheckBox;
  NewRadioButton1: TNewRadioButton;
  NewListBox1: TNewListBox;
  Panel2: TPanel;
  PasswordEdit1: TPasswordEdit;
  NewCheckListBox1: TNewCheckListBox;
  NewStaticText1: TNewStaticText;
  FolderTreeView1: TFolderTreeView;
  RichEditViewer1: TRichEditViewer;
  NewProgressBar1: TNewProgressBar;
  NewComboBox1: TNewComboBox;
  StartMenuFolderTreeView1: TStartMenuFolderTreeView;
  BrowserBtn: TNewButton;
  BlogBtn: TNewButton;

procedure RedesignWizardForm;
begin
  with WizardForm do
  begin
    Caption := 'ISSKIN 皮肤预览程序 Ver1.0';
    ShowHint := True;
  end;

  { Panel1 }
  Panel1 := TPanel.Create(WizardForm);
  with Panel1 do
  begin
    Name := 'Panel1';
    Parent := WizardForm.WelcomePage;
    Left := ScaleX(0);
    Top := ScaleY(0);
    Width := ScaleX(497);
    Height := ScaleY(313);
    BevelOuter := bvNone;
    Caption := ' ';
    ParentBackground := False;
  end;

  { Label1 }
  Label1 := TLabel.Create(WizardForm);
  with Label1 do
  begin
    Name := 'Label1';
    Parent := Panel1;
    Caption := '皮肤文件:';
    Transparent := False;
    Left := ScaleX(16);
    Top := ScaleY(8);
    Width := ScaleX(51);
    Height := ScaleY(13);
  end;

  { Label2 }
  Label2 := TLabel.Create(WizardForm);
  with Label2 do
  begin
    Name := 'Label2';
    Parent := Panel1;
    Caption := '皮肤 INI 参数:';
    Transparent := False;
    Left := ScaleX(288);
    Top := ScaleY(8);
    Width := ScaleX(71);
    Height := ScaleY(13);
  end;

  { Bevel2 }
  Bevel2 := TBevel.Create(WizardForm);
  with Bevel2 do
  begin
    Name := 'Bevel2';
    Parent := Panel1;
    Left := ScaleX(7);
    Top := ScaleY(72);
    Width := ScaleX(482);
    Height := ScaleY(229);
  end;

  { Label3 }
  Label3 := TLabel.Create(WizardForm);
  with Label3 do
  begin
    Name := 'Label3';
    Parent := Panel1;
    Caption := 'Inno Setup 支持的控件:';
    Transparent := False;
    Left := ScaleX(16);
    Top := ScaleY(53);
    Width := ScaleX(118);
    Height := ScaleY(13);
  end;

  { BitmapImage1 }
  BitmapImage1 := TBitmapImage.Create(WizardForm);
  with BitmapImage1 do
  begin
    Name := 'BitmapImage1';
    Parent := Panel1;
    Left := ScaleX(288);
    Top := ScaleY(80);
    Width := ScaleX(185);
    Height := ScaleY(29);
  end;

  { Label4 }
  Label4 := TLabel.Create(WizardForm);
  with Label4 do
  begin
    Name := 'Label4';
    Parent := Panel1;
    Hint := 'TLabel';
    Caption := 'Label4';
    Transparent := False;
    Left := ScaleX(144);
    Top := ScaleY(80);
    Width := ScaleX(32);
    Height := ScaleY(13);
  end;

  { ISSkinFileCombo }
  ISSkinFileCombo := TNewComboBox.Create(WizardForm);
  with ISSkinFileCombo do
  begin
    Name := 'ISSkinFileCombo';
    Parent := Panel1;
    Left := ScaleX(16);
    Top := ScaleY(24);
    Width := ScaleX(229);
    Height := ScaleY(21);
    Style := csDropDownList;
    DropDownCount := 16;
  end;

  { ISSkinIniCombo }
  ISSkinIniCombo := TNewComboBox.Create(WizardForm);
  with ISSkinIniCombo do
  begin
    Name := 'ISSkinIniCombo';
    Parent := Panel1;
    Left := ScaleX(288);
    Top := ScaleY(24);
    Width := ScaleX(193);
    Height := ScaleY(21);
    Style := csDropDownList;
  end;

  { NewEdit1 }
  NewEdit1 := TNewEdit.Create(WizardForm);
  with NewEdit1 do
  begin
    Name := 'NewEdit1';
    Parent := Panel1;
    Left := ScaleX(16);
    Top := ScaleY(104);
    Width := ScaleX(105);
    Height := ScaleY(21);
    Hint := 'TNewEdit';
    Text := 'NewEdit1';
  end;

  { NewMemo1 }
  NewMemo1 := TNewMemo.Create(WizardForm);
  with NewMemo1 do
  begin
    Name := 'NewMemo1';
    Parent := Panel1;
    Left := ScaleX(16);
    Top := ScaleY(128);
    Width := ScaleX(105);
    Height := ScaleY(89);
    Hint := 'TNewMemo';
    Lines.Text := 'NewMemo1' + #13#10 +
         'Line 2' + #13#10 +
         'Line 3' + #13#10 +
         'Line 4' + #13#10 +
         'Line 5' + #13#10 +
         'Line 6' + #13#10 +
         'Line 7' + #13#10 +
         'Line 8' + #13#10 +
         'Line 9' + #13#10 +
         'Line 10' + #13#10 +
         'Line 11' + #13#10 +
         'Line 12' + #13#10 +
         'Line 13' + #13#10 +
         '';
    ScrollBars := ssBoth;
  end;

  { NewCheckBox1 }
  NewCheckBox1 := TNewCheckBox.Create(WizardForm);
  with NewCheckBox1 do
  begin
    Name := 'NewCheckBox1';
    Parent := Panel1;
    Left := ScaleX(16);
    Top := ScaleY(248);
    Width := ScaleX(97);
    Height := ScaleY(17);
    Hint := 'TNewCheckBox';
    Caption := 'NewCheckBox1';
  end;

  { NewRadioButton1 }
  NewRadioButton1 := TNewRadioButton.Create(WizardForm);
  with NewRadioButton1 do
  begin
    Name := 'NewRadioButton1';
    Parent := Panel1;
    Left := ScaleX(16);
    Top := ScaleY(272);
    Width := ScaleX(113);
    Height := ScaleY(17);
    Hint := 'TNewRadioButton';
    Caption := 'NewRadioButton1';
  end;

  { NewListBox1 }
  NewListBox1 := TNewListBox.Create(WizardForm);
  with NewListBox1 do
  begin
    Name := 'NewListBox1';
    Parent := Panel1;
    Left := ScaleX(127);
    Top := ScaleY(120);
    Width := ScaleX(85);
    Height := ScaleY(81);
    Hint := 'TNewListBox';
    Items.Text := 'Line 2' + #13#10 +
         'Line 3' + #13#10 +
         'Line 4' + #13#10 +
         'Line 5' + #13#10 +
         'Line 6' + #13#10 +
         'Line 7' + #13#10 +
         'Line 8' + #13#10 +
         'Line 9' + #13#10 +
         'Line 10' + #13#10 +
         'Line 11' + #13#10 +
         'Line 12' + #13#10 +
         'Line 13';
    ItemIndex := -1;
  end;

  { Panel2 }
  Panel2 := TPanel.Create(WizardForm);
  with Panel2 do
  begin
    Name := 'Panel2';
    Parent := Panel1;
    Left := ScaleX(127);
    Top := ScaleY(224);
    Width := ScaleX(85);
    Height := ScaleY(41);
    Hint := 'TPanel';
    Caption := 'Panel2';
  end;

  { PasswordEdit1 }
  PasswordEdit1 := TPasswordEdit.Create(WizardForm);
  with PasswordEdit1 do
  begin
    Name := 'PasswordEdit1';
    Parent := Panel1;
    Left := ScaleX(127);
    Top := ScaleY(272);
    Width := ScaleX(85);
    Height := ScaleY(21);
    Hint := 'TPasswordEdit';
    Text := 'PasswordEdit1';
  end;

  { NewCheckListBox1 }
  NewCheckListBox1 := TNewCheckListBox.Create(WizardForm);
  with NewCheckListBox1 do
  begin
    Name := 'NewCheckListBox1';
    Parent := Panel1;
    Left := ScaleX(224);
    Top := ScaleY(120);
    Width := ScaleX(145);
    Height := ScaleY(81);
    Hint := 'TNewCheckListBox';
  end;

  { NewStaticText1 }
  NewStaticText1 := TNewStaticText.Create(WizardForm);
  with NewStaticText1 do
  begin
    Name := 'NewStaticText1';
    Parent := Panel1;
    Hint := 'TNewStaticText';
    Caption := 'NewStaticText1';
    Left := ScaleX(144);
    Top := ScaleY(95);
    Width := ScaleX(77);
    Height := ScaleY(14);
  end;

  { FolderTreeView1 }
  FolderTreeView1 := TFolderTreeView.Create(WizardForm);
  with FolderTreeView1 do
  begin
    Name := 'FolderTreeView1';
    Parent := Panel1;
    Left := ScaleX(224);
    Top := ScaleY(204);
    Width := ScaleX(145);
    Height := ScaleY(89);
    Cursor := crArrow;
    Hint := 'TFolderTreeView';
  end;

  { RichEditViewer1 }
  RichEditViewer1 := TRichEditViewer.Create(WizardForm);
  with RichEditViewer1 do
  begin
    Name := 'RichEditViewer1';
    Parent := Panel1;
    Left := ScaleX(376);
    Top := ScaleY(120);
    Width := ScaleX(105);
    Height := ScaleY(81);
    Hint := 'TRichEditViewer';
  end;

  { NewProgressBar1 }
  NewProgressBar1 := TNewProgressBar.Create(WizardForm);
  with NewProgressBar1 do
  begin
    Name := 'NewProgressBar1';
    Parent := Panel1;
    Left := ScaleX(16);
    Top := ScaleY(224);
    Width := ScaleX(105);
    Height := ScaleY(17);
    Hint := 'TNewProgressBar';
    Min := 0;
    Max := 100;
    Position := 70;
  end;

  { NewComboBox1 }
  NewComboBox1 := TNewComboBox.Create(WizardForm);
  with NewComboBox1 do
  begin
    Name := 'NewComboBox1';
    Parent := Panel1;
    Left := ScaleX(16);
    Top := ScaleY(80);
    Width := ScaleX(105);
    Height := ScaleY(21);
    Hint := 'TNewComboBox';
    Items.Text := 'Line 2' + #13#10 +
         'Line 3' + #13#10 +
         'Line 4' + #13#10 +
         'Line 5' + #13#10 +
         'Line 6' + #13#10 +
         'Line 7' + #13#10 +
         'Line 8' + #13#10 +
         'Line 9' + #13#10 +
         'Line 10' + #13#10 +
         'Line 11' + #13#10 +
         'Line 12' + #13#10 +
         'Line 13';
  end;

  { StartMenuFolderTreeView1 }
  StartMenuFolderTreeView1 := TStartMenuFolderTreeView.Create(WizardForm);
  with StartMenuFolderTreeView1 do
  begin
    Name := 'StartMenuFolderTreeView1';
    Parent := Panel1;
    Left := ScaleX(376);
    Top := ScaleY(204);
    Width := ScaleX(105);
    Height := ScaleY(89);
    Cursor := crArrow;
    Hint := 'TStartMenuFolderTreeView';
  end;

  { BrowserBtn }
  BrowserBtn := TNewButton.Create(WizardForm);
  with BrowserBtn do
  begin
    Name := 'BrowserBtn';
    Parent := Panel1;
    Left := ScaleX(248);
    Top := ScaleY(22);
    Width := ScaleX(35);
    Height := ScaleY(25);
    Caption := '目录';
  end;

  ISSkinFileCombo.TabOrder := 0;
  ISSkinIniCombo.TabOrder := 1;
  NewEdit1.TabOrder := 2;
  NewMemo1.TabOrder := 3;
  NewCheckBox1.TabOrder := 4;
  NewRadioButton1.TabOrder := 5;
  NewListBox1.TabOrder := 6;
  Panel2.TabOrder := 7;
  PasswordEdit1.TabOrder := 8;
  NewCheckListBox1.TabOrder := 9;
  NewStaticText1.TabOrder := 10;
  FolderTreeView1.TabOrder := 11;
  RichEditViewer1.TabOrder := 12;
  NewProgressBar1.TabOrder := 13;
  NewComboBox1.TabOrder := 14;
  StartMenuFolderTreeView1.TabOrder := 15;
  BrowserBtn.TabOrder := 16;

  Panel1.TabOrder := 2;

  { BlogBtn }
  BlogBtn := TNewButton.Create(WizardForm);
  with BlogBtn do
  begin
    Name := 'BlogBtn';
    Parent := WizardForm;
    Left := ScaleX(20);
    Top := ScaleY(327);
    Width := ScaleX(107);
    Height := ScaleY(23);
    Hint := '访问我的 BLOG';
    Caption := 'RESTOOLS'' BLOG';
  end;

  BlogBtn.TabOrder := 5;

{ ReservationBegin }
  // 这一部分是提供给你的，你可以在这里输入一些补充代码。
  NewCheckListBox1.AddCheckBox('TNewCheckListBox', '', 0, True, True, False, True, nil);
  NewCheckListBox1.AddRadioButton('TNewCheckListBox', '', 1, True, True, nil);
  NewCheckListBox1.AddRadioButton('TNewCheckListBox', '', 1, False, True, nil);
  NewCheckListBox1.AddCheckBox('TNewCheckListBox', '', 0, True, True, False, True, nil);
  BrowserBtn.OnClick := @BrowserBtn_OnClick;
  ISSkinFileCombo.OnChange := @ISSkinFileCombo_OnChange;
  ISSkinIniCombo.OnChange := @ISSkinIniCombo_OnChange;
  BlogBtn.OnClick := @BlogBtn_OnClick;
{ ReservationEnd }
end;
// 不要修改这一段代码，它是自动生成的。
{ RedesignWizardFormEnd } // 不要删除这一行代码。

function EnumResName(hModule: THandle; lpType, lpName: String; lParam: Longint): Boolean;
begin
  ISSkinIniCombo.Items.Append(lpName);
  Result := True;
end;

procedure ISSkinIniCombo_OnChange(Sender: TObject);
var
  SkinFile, SkinIni: String;
begin
  try
    SkinFile := '';
    SkinIni := '';
    if ISSkinFileCombo.Items[ISSkinFileCombo.ItemIndex] <> '' then
      SkinFile := SkinFilePath+'\'+ISSkinFileCombo.Items[ISSkinFileCombo.ItemIndex];
    if ISSkinIniCombo.Items[ISSkinIniCombo.ItemIndex] <> '' then
      SkinIni := ISSkinIniCombo.Items[ISSkinIniCombo.ItemIndex];

    LoadSkin(SkinFile, SkinIni);
  except
  end;
end;

procedure ISSkinFileCombo_OnChange(Sender: TObject);
var
  hSkin: THandle;
  i, DelIndex: Integer;
  S, SkinFile, SkinIni: String;
begin
  try
    hSkin:=LoadLibrary(SkinFilePath+'\'+ISSkinFileCombo.Items[ISSkinFileCombo.ItemIndex]);
    try
      ISSkinIniCombo.Items.Clear;

      EnumResourceNames(hSkin, 'TEXTFILE', CallbackAddr('EnumResName'), 0);

      DelIndex := -1;
      for i := 0 to ISSkinIniCombo.Items.Count - 1 do
      begin
        S := ISSkinIniCombo.Items[i];
        if CompareText(S, 'THEMES_INI')=0 then
          DelIndex := i;
        StringChange(S, '_', '.');
        ISSkinIniCombo.Items[i] := S;
      end;

      if DelIndex >= 0 then
        ISSkinIniCombo.Items.Delete(DelIndex);

      if ISSkinIniCombo.Items.Count >= 0 then
        ISSkinIniCombo.ItemIndex := ISSkinIniCombo.Items.Count - 1;
    finally
      FreeLibrary(hSkin);
    end;

    SkinFile := '';
    SkinIni := '';
    if ISSkinFileCombo.Items[ISSkinFileCombo.ItemIndex] <> '' then
      SkinFile := SkinFilePath+'\'+ISSkinFileCombo.Items[ISSkinFileCombo.ItemIndex];
    if ISSkinIniCombo.Items[ISSkinIniCombo.ItemIndex] <> '' then
      SkinIni := ISSkinIniCombo.Items[ISSkinIniCombo.ItemIndex];

    LoadSkin(SkinFile, SkinIni);
  except
  end;
end;

procedure FindSkinFile();
var
  FindRec: TFindRec;
begin
  ISSkinFileCombo.Items.Clear;
  if FindFirst(SkinFilePath+'\*.cjstyles', FindRec) then begin
    try
      repeat
        if FindRec.Attributes and FILE_ATTRIBUTE_DIRECTORY = 0 then
          ISSkinFileCombo.Items.Append(FindRec.Name);
      until not FindNext(FindRec);
    finally
      FindClose(FindRec);
    end;
  end;
end;

procedure BrowserBtn_OnClick(Sender: TObject);
begin
  if BrowseForFolder('请选择 ISSkin 皮肤所在路径:', SkinFilePath, False) then
  begin
    FindSkinFile();
    UnloadSkin;
  end;
end;

function InitializeSetup(): Boolean;
begin
  if SkinFilePath='' then
    SkinFilePath := ExtractFileDir(ExpandConstant('{srcexe}'))+'\Styles';
	LoadSkin('', '');
	Result := True;
end;

procedure InitializeWizard();
begin
  RedesignWizardForm;
  FindSkinFile();
  ISSkinFileCombo.Sorted := True;
end;

Procedure SetAppTitle(Value: String);
var
  n: HWND;
begin
  n:=GetWindowLong(MainForm.Handle, -8);
  if n <> 0 then SetWindowText(n, PChar(Value));
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  WizardForm.NextButton.Hide;
  WizardForm.CancelButton.Caption := '关闭';
  SetAppTitle('ISSKIN 皮肤预览程序');
end;

