; -- CodeClasses.iss --
;
; This script shows how to use the WizardForm object and the various VCL classes.

[Setup]
AppName=My Program
AppVersion=1.5
CreateAppDir=no
DisableProgramGroupPage=yes
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
WindowVisible=yes
OutputDir=userdocs:Inno Setup Examples Output

[Files]
;{ ISFormDesignerFilesBegin } // Don't remove this line!
;// Don't modify this section. It is generated automatically.
DestName: "WizardForm.BitmapImage.bmp"; Source: "compiler:WizModernSmallImage.bmp"; Flags: dontcopy solidbreak
DestName: "WizardForm.BitmapImage2.bmp"; Source: "compiler:WizModernSmallImage.bmp"; Flags: dontcopy solidbreak
DestName: "WizardForm.BitmapImage3.bmp"; Source: "compiler:WizModernSmallImage.bmp"; Flags: dontcopy solidbreak
;// Don't modify this section. It is generated automatically.
;{ ISFormDesignerFilesEnd } // Don't remove this line!

[ISFormDesigner]
WizardForm=FF0A005457495A415244464F524D003010F010000054504630F10B5457697A617264466F726D0A57697A617264466F726D044C656674020003546F7002000C436C69656E744865696768740368010B436C69656E74576964746803F1010D506978656C73506572496E636802600A54657874486569676874020D00F10C544E65774E6F7465626F6F6B0D4F757465724E6F7465626F6F6B00F110544E65774E6F7465626F6F6B506167650B57656C636F6D6550616765084E65787450616765071454427574746F6E416E644F7468657273506167650000F110544E65774E6F7465626F6F6B5061676509496E6E65725061676500F10C544E65774E6F7465626F6F6B0D496E6E65724E6F7465626F6F6B00F110544E65774E6F7465626F6F6B506167650B4C6963656E7365506167650C50726576696F757350616765070F545269636856696577657250616765000010544E65774E6F7465626F6F6B506167651454427574746F6E416E644F7468657273506167650743617074696F6E061B437573746F6D2077697A617264207061676520636F6E74726F6C730B4465736372697074696F6E061254427574746F6E20616E64206F74686572730C50726576696F757350616765070B57656C636F6D6550616765084E65787450616765071654436F6D626F426F78416E644F746865727350616765000A544E6577427574746F6E06427574746F6E044C656674020003546F700200055769647468024B0648656967687402170743617074696F6E060A544E6577427574746F6E085461624F726465720200074F6E436C69636B070B427574746F6E436C69636B0000065450616E656C0550616E656C044C65667403D90003546F70020005576964746803C80006486569676874022E0743617074696F6E06065450616E656C05436F6C6F720708636C57696E646F7710506172656E744261636B67726F756E6408085461624F72646572020100000C544E6577436865636B426F7808436865636B426F78044C656674020003546F70021F05576964746803D0000648656967687402110743617074696F6E060C544E6577436865636B426F7807436865636B65640905537461746507096362436865636B6564085461624F726465720202000008544E6577456469740445646974044C656674020003546F70023805576964746803C800064865696768740215085461624F72646572020304546578740608544E65774564697400000D5450617373776F7264456469740D50617373776F72644564697431044C65667403D80003546F70023805576964746803C900064865696768740215085461624F7264657202040454657874060D5450617373776F726445646974000008544E65774D656D6F044D656D6F044C656674020003546F70025505576964746803A1010648656967687402590D4C696E65732E537472696E67730106044D656D6F00085461624F72646572020500000A544E6577427574746F6E0A466F726D427574746F6E044C656674020003546F7003B600055769647468024B0648656967687402170743617074696F6E060A545365747570466F726D085461624F726465720206074F6E436C69636B070F466F726D427574746F6E436C69636B00000010544E65774E6F7465626F6F6B506167651654436F6D626F426F78416E644F7468657273506167650743617074696F6E061B437573746F6D2077697A617264207061676520636F6E74726F6C730B4465736372697074696F6E061454436F6D626F426F7820616E64206F74686572730C50726576696F757350616765071454427574746F6E416E644F746865727350616765084E657874506167650714544E6577436865636B4C697374426F7850616765000C544E6577436F6D626F426F780C4E6577436F6D626F426F7831044C656674020003546F70020005576964746803A101064865696768740215055374796C65070E637344726F70446F776E4C6973740A4974656D486569676874020D085461624F7264657202000454657874060954436F6D626F426F780D4974656D732E537472696E677301060954436F6D626F426F7800094974656D496E646578020000000B544E65774C697374426F780B4E65774C697374426F7831044C656674020003546F70021D05576964746803A1010648656967687402610A4974656D486569676874020D0D4974656D732E537472696E6773010608544C697374426F7800085461624F726465720201094974656D496E646578020000000E544E6577537461746963546578740A53746174696354657874044C656674020003546F70038600055769647468024D06486569676874020E0743617074696F6E060E544E657753746174696354657874085461624F72646572020200000E544E6577537461746963546578741050726F67726573734261724C6162656C044C656674020003546F70039C00055769647468025606486569676874020E0743617074696F6E060F544E657750726F6772657373426172085461624F72646572020300000F544E657750726F67726573734261720B50726F6772657373426172044C656674025F03546F70039C0005576964746803420106486569676874021608506F736974696F6E021900000F544E657750726F67726573734261720C50726F677265737342617232044C656674025F03546F7003B60005576964746803420106486569676874021608506F736974696F6E023200000F544E657750726F67726573734261720C50726F677265737342617233044C656674025F03546F7003D000055769647468034201064865696768740216055374796C65070C6E706273744D61727175656500000010544E65774E6F7465626F6F6B5061676514544E6577436865636B4C697374426F78506167650743617074696F6E061B437573746F6D2077697A617264207061676520636F6E74726F6C730B4465736372697074696F6E0610544E6577436865636B4C697374426F780C50726576696F757350616765071654436F6D626F426F78416E644F746865727350616765084E65787450616765071354466F6C6465725472656556696577506167650010544E6577436865636B4C697374426F780C436865636B4C697374426F78044C656674020003546F70020005576964746803A10106486569676874026104466C617409085461624F726465720200000010544E6577436865636B4C697374426F780D436865636B4C697374426F7832044C656674020003546F70026905576964746803A1010648656967687402610B426F726465725374796C65070662734E6F6E650D4D696E4974656D48656967687402160B506172656E74436F6C6F72090953686F774C696E657308085461624F7264657202010857616E74546162730900000010544E65774E6F7465626F6F6B506167651354466F6C6465725472656556696577506167650743617074696F6E061B437573746F6D2077697A617264207061676520636F6E74726F6C730B4465736372697074696F6E060F54466F6C64657254726565566965770C50726576696F7573506167650714544E6577436865636B4C697374426F7850616765084E657874506167650710544269746D6170496D61676550616765000F54466F6C64657254726565566965770E466F6C6465725472656556696577044C656674020003546F70020005576964746803A1010648656967687403ED0006437572736F72070763724172726F77085461624F72646572020000000010544E65774E6F7465626F6F6B5061676510544269746D6170496D616765506167650743617074696F6E061B437573746F6D2077697A617264207061676520636F6E74726F6C730B4465736372697074696F6E060C544269746D6170496D6167650C50726576696F757350616765071354466F6C646572547265655669657750616765084E65787450616765070F545269636856696577657250616765000C544269746D6170496D6167650B4269746D6170496D616765044C656674020003546F700200055769647468023706486569676874023706437572736F72070B637248616E64506F696E74084175746F53697A65090A4269746D617046696C650620636F6D70696C65723A57697A4D6F6465726E536D616C6C496D6167652E626D70074F6E436C69636B07104269746D6170496D616765436C69636B00000C544269746D6170496D6167650C4269746D6170496D61676532044C656674024103546F700200055769647468026E06486569676874026E06437572736F72070B637248616E64506F696E74094261636B436F6C6F7204000040000643656E746572090A4269746D617046696C650620636F6D70696C65723A57697A4D6F6465726E536D616C6C496D6167652E626D70074F6E436C69636B07104269746D6170496D616765436C69636B00000C544269746D6170496D6167650C4269746D6170496D61676533044C65667403B90003546F70020005576964746803DC000648656967687403DC0006437572736F72070B637248616E64506F696E740643656E746572090753747265746368090A4269746D617046696C650620636F6D70696C65723A57697A4D6F6465726E536D616C6C496D6167652E626D70074F6E436C69636B07104269746D6170496D616765436C69636B00000010544E65774E6F7465626F6F6B506167650F5452696368566965776572506167650743617074696F6E061B437573746F6D2077697A617264207061676520636F6E74726F6C730B4465736372697074696F6E060B54526963685669657765720C50726576696F7573506167650710544269746D6170496D61676550616765084E65787450616765070B4C6963656E736550616765000F5452696368456469745669657765720E5269636845646974566965776572044C656674020003546F70020005576964746803A1010648656967687403ED0008526561644F6E6C79090A5363726F6C6C42617273070A7373566572746963616C085461624F72646572020007525446546578740C2F0100007B5C727466315C6662696469735C616E73695C616E7369637067313235325C64656666307B5C666F6E7474626C7B5C66305C6673776973735C66636861727365743020417269616C3B7D7B5C66315C666E696C5C6663686172736574313334204D6963726F736F66742053616E732053657269663B7D7D0D0A7B5C636F6C6F7274626C203B5C7265643235355C677265656E305C626C7565303B5C726564305C677265656E3132385C626C7565303B5C726564305C677265656E305C626C75653132383B7D0D0A5C766965776B696E64345C7563315C706172645C6C74727061725C6C616E67313034335C66305C6673323020545C63663120526963685C63663220456469745C636633205669657765725C6366305C6C616E67323035325C66315C667331365C7061720D0A7D0D0A0B5468656D65426F72646572080000000000000A544E6577427574746F6E0B41626F7574427574746F6E044C656674020A03546F70034701055769647468024B0648656967687402170743617074696F6E06092641626F75742E2E2E085461624F726465720205074F6E436C69636B071041626F7574427574746F6E436C69636B00000E544E6577537461746963546578740855524C4C6162656C044C656674026903546F70034C01055769647468026106486569676874020E06437572736F72070B637248616E64506F696E740743617074696F6E06117777772E696E6E6F73657475702E636F6D0C466F6E742E43686172736574070F44454641554C545F434841525345540A466F6E742E436F6C6F720706636C426C75650B466F6E742E48656967687402F509466F6E742E4E616D6506144D6963726F736F66742053616E732053657269660A466F6E742E5374796C650B0B6673556E6465726C696E65000A506172656E74466F6E7408085461624F726465720206074F6E436C69636B070D55524C4C6162656C436C69636B000000

[Code]
{ RedesignWizardFormBegin } // Don't remove this line!
// Don't modify this section. It is generated automatically.
var
  TButtonAndOthersPage: TWizardPage;
  Button: TNewButton;
  Panel: TPanel;
  CheckBox: TNewCheckBox;
  Edit: TNewEdit;
  PasswordEdit1: TPasswordEdit;
  Memo: TNewMemo;
  FormButton: TNewButton;
  TComboBoxAndOthersPage: TWizardPage;
  NewComboBox1: TNewComboBox;
  NewListBox1: TNewListBox;
  StaticText: TNewStaticText;
  ProgressBarLabel: TNewStaticText;
  ProgressBar: TNewProgressBar;
  ProgressBar2: TNewProgressBar;
  ProgressBar3: TNewProgressBar;
  TNewCheckListBoxPage: TWizardPage;
  CheckListBox: TNewCheckListBox;
  CheckListBox2: TNewCheckListBox;
  TFolderTreeViewPage: TWizardPage;
  FolderTreeView: TFolderTreeView;
  TBitmapImagePage: TWizardPage;
  BitmapImage: TBitmapImage;
  BitmapImage2: TBitmapImage;
  BitmapImage3: TBitmapImage;
  TRichViewerPage: TWizardPage;
  RichEditViewer: TRichEditViewer;
  AboutButton: TNewButton;
  URLLabel: TNewStaticText;

procedure ButtonClick(Sender: TObject); forward;
procedure FormButtonClick(Sender: TObject); forward;
procedure BitmapImageClick(Sender: TObject); forward;
procedure AboutButtonClick(Sender: TObject); forward;
procedure URLLabelClick(Sender: TObject); forward;

procedure RedesignWizardForm;
begin
  { Creates custom wizard page }
  TButtonAndOthersPage := CreateCustomPage(wpWelcome, 'Custom wizard page controls', 'TButton and others');
  TComboBoxAndOthersPage := CreateCustomPage(TButtonAndOthersPage.ID, 'Custom wizard page controls', 'TComboBox and others');
  TNewCheckListBoxPage := CreateCustomPage(TComboBoxAndOthersPage.ID, 'Custom wizard page controls', 'TNewCheckListBox');
  TFolderTreeViewPage := CreateCustomPage(TNewCheckListBoxPage.ID, 'Custom wizard page controls', 'TFolderTreeView');
  TBitmapImagePage := CreateCustomPage(TFolderTreeViewPage.ID, 'Custom wizard page controls', 'TBitmapImage');
  TRichViewerPage := CreateCustomPage(TBitmapImagePage.ID, 'Custom wizard page controls', 'TRichViewer');

  { TButtonAndOthersPage }
  with TButtonAndOthersPage.Surface do
  begin
    Name := 'TButtonAndOthersPage';
  end;

  { Button }
  Button := TNewButton.Create(WizardForm);
  with Button do
  begin
    Name := 'Button';
    Parent := TButtonAndOthersPage.Surface;
    Left := ScaleX(0);
    Top := ScaleY(0);
    Width := ScaleX(75);
    Height := ScaleY(23);
    Caption := 'TNewButton';
    OnClick := @ButtonClick;
  end;

  { Panel }
  Panel := TPanel.Create(WizardForm);
  with Panel do
  begin
    Name := 'Panel';
    Parent := TButtonAndOthersPage.Surface;
    Left := ScaleX(217);
    Top := ScaleY(0);
    Width := ScaleX(200);
    Height := ScaleY(46);
    Caption := 'TPanel';
    Color := clWindow;
    ParentBackground := False;
  end;

  { CheckBox }
  CheckBox := TNewCheckBox.Create(WizardForm);
  with CheckBox do
  begin
    Name := 'CheckBox';
    Parent := TButtonAndOthersPage.Surface;
    Left := ScaleX(0);
    Top := ScaleY(31);
    Width := ScaleX(208);
    Height := ScaleY(17);
    Caption := 'TNewCheckBox';
    Checked := True;
    State := cbChecked;
  end;

  { Edit }
  Edit := TNewEdit.Create(WizardForm);
  with Edit do
  begin
    Name := 'Edit';
    Parent := TButtonAndOthersPage.Surface;
    Left := ScaleX(0);
    Top := ScaleY(56);
    Width := ScaleX(200);
    Height := ScaleY(21);
    Text := 'TNewEdit';
  end;

  { PasswordEdit1 }
  PasswordEdit1 := TPasswordEdit.Create(WizardForm);
  with PasswordEdit1 do
  begin
    Name := 'PasswordEdit1';
    Parent := TButtonAndOthersPage.Surface;
    Left := ScaleX(216);
    Top := ScaleY(56);
    Width := ScaleX(201);
    Height := ScaleY(21);
    Text := 'TPasswordEdit';
  end;

  { Memo }
  Memo := TNewMemo.Create(WizardForm);
  with Memo do
  begin
    Name := 'Memo';
    Parent := TButtonAndOthersPage.Surface;
    Left := ScaleX(0);
    Top := ScaleY(85);
    Width := ScaleX(417);
    Height := ScaleY(89);
    Lines.Text := 'Memo';
  end;

  { FormButton }
  FormButton := TNewButton.Create(WizardForm);
  with FormButton do
  begin
    Name := 'FormButton';
    Parent := TButtonAndOthersPage.Surface;
    Left := ScaleX(0);
    Top := ScaleY(182);
    Width := ScaleX(75);
    Height := ScaleY(23);
    Caption := 'TSetupForm';
    OnClick := @FormButtonClick;
  end;

  Button.TabOrder := 0;
  Panel.TabOrder := 1;
  CheckBox.TabOrder := 2;
  Edit.TabOrder := 3;
  PasswordEdit1.TabOrder := 4;
  Memo.TabOrder := 5;
  FormButton.TabOrder := 6;

  { TComboBoxAndOthersPage }
  with TComboBoxAndOthersPage.Surface do
  begin
    Name := 'TComboBoxAndOthersPage';
  end;

  { NewComboBox1 }
  NewComboBox1 := TNewComboBox.Create(WizardForm);
  with NewComboBox1 do
  begin
    Name := 'NewComboBox1';
    Parent := TComboBoxAndOthersPage.Surface;
    Left := ScaleX(0);
    Top := ScaleY(0);
    Width := ScaleX(417);
    Height := ScaleY(21);
    Style := csDropDownList;
    Text := 'TComboBox';
    Items.Text := 'TComboBox';
    ItemIndex := 0;
  end;

  { NewListBox1 }
  NewListBox1 := TNewListBox.Create(WizardForm);
  with NewListBox1 do
  begin
    Name := 'NewListBox1';
    Parent := TComboBoxAndOthersPage.Surface;
    Left := ScaleX(0);
    Top := ScaleY(29);
    Width := ScaleX(417);
    Height := ScaleY(97);
    Items.Text := 'TListBox';
    ItemIndex := 0;
  end;

  { StaticText }
  StaticText := TNewStaticText.Create(WizardForm);
  with StaticText do
  begin
    Name := 'StaticText';
    Parent := TComboBoxAndOthersPage.Surface;
    Caption := 'TNewStaticText';
    Left := ScaleX(0);
    Top := ScaleY(134);
    Width := ScaleX(77);
    Height := ScaleY(14);
  end;

  { ProgressBarLabel }
  ProgressBarLabel := TNewStaticText.Create(WizardForm);
  with ProgressBarLabel do
  begin
    Name := 'ProgressBarLabel';
    Parent := TComboBoxAndOthersPage.Surface;
    Caption := 'TNewProgressBar';
    Left := ScaleX(0);
    Top := ScaleY(156);
    Width := ScaleX(86);
    Height := ScaleY(14);
  end;

  { ProgressBar }
  ProgressBar := TNewProgressBar.Create(WizardForm);
  with ProgressBar do
  begin
    Name := 'ProgressBar';
    Parent := TComboBoxAndOthersPage.Surface;
    Left := ScaleX(95);
    Top := ScaleY(156);
    Width := ScaleX(322);
    Height := ScaleY(22);
    Position := 25;
  end;

  { ProgressBar2 }
  ProgressBar2 := TNewProgressBar.Create(WizardForm);
  with ProgressBar2 do
  begin
    Name := 'ProgressBar2';
    Parent := TComboBoxAndOthersPage.Surface;
    Left := ScaleX(95);
    Top := ScaleY(182);
    Width := ScaleX(322);
    Height := ScaleY(22);
    Position := 50;
  end;

  { ProgressBar3 }
  ProgressBar3 := TNewProgressBar.Create(WizardForm);
  with ProgressBar3 do
  begin
    Name := 'ProgressBar3';
    Parent := TComboBoxAndOthersPage.Surface;
    Left := ScaleX(95);
    Top := ScaleY(208);
    Width := ScaleX(322);
    Height := ScaleY(22);
    Style := npbstMarquee;
  end;

  NewComboBox1.TabOrder := 0;
  NewListBox1.TabOrder := 1;
  StaticText.TabOrder := 2;
  ProgressBarLabel.TabOrder := 3;
  ProgressBar.TabOrder := 4;
  ProgressBar2.TabOrder := 5;
  ProgressBar3.TabOrder := 6;

  { TNewCheckListBoxPage }
  with TNewCheckListBoxPage.Surface do
  begin
    Name := 'TNewCheckListBoxPage';
  end;

  { CheckListBox }
  CheckListBox := TNewCheckListBox.Create(WizardForm);
  with CheckListBox do
  begin
    Name := 'CheckListBox';
    Parent := TNewCheckListBoxPage.Surface;
    Left := ScaleX(0);
    Top := ScaleY(0);
    Width := ScaleX(417);
    Height := ScaleY(97);
    Flat := True;
  end;

  { CheckListBox2 }
  CheckListBox2 := TNewCheckListBox.Create(WizardForm);
  with CheckListBox2 do
  begin
    Name := 'CheckListBox2';
    Parent := TNewCheckListBoxPage.Surface;
    Left := ScaleX(0);
    Top := ScaleY(105);
    Width := ScaleX(417);
    Height := ScaleY(97);
    BorderStyle := bsNone;
    MinItemHeight := 22;
    ParentColor := True;
    ShowLines := False;
    WantTabs := True;
  end;

  CheckListBox.TabOrder := 0;
  CheckListBox2.TabOrder := 1;

  { TFolderTreeViewPage }
  with TFolderTreeViewPage.Surface do
  begin
    Name := 'TFolderTreeViewPage';
  end;

  { FolderTreeView }
  FolderTreeView := TFolderTreeView.Create(WizardForm);
  with FolderTreeView do
  begin
    Name := 'FolderTreeView';
    Parent := TFolderTreeViewPage.Surface;
    Left := ScaleX(0);
    Top := ScaleY(0);
    Width := ScaleX(417);
    Height := ScaleY(237);
    Cursor := crArrow;
  end;

  FolderTreeView.TabOrder := 0;

  { TBitmapImagePage }
  with TBitmapImagePage.Surface do
  begin
    Name := 'TBitmapImagePage';
  end;

  { BitmapImage }
  BitmapImage := TBitmapImage.Create(WizardForm);
  with BitmapImage do
  begin
    Name := 'BitmapImage';
    Parent := TBitmapImagePage.Surface;
    Left := ScaleX(0);
    Top := ScaleY(0);
    Width := ScaleX(55);
    Height := ScaleY(55);
    Cursor := crHand;
    AutoSize := True;
    ExtractTemporaryFile('WizardForm.BitmapImage.bmp');
    Bitmap.LoadFromFile(ExpandConstant('{tmp}\WizardForm.BitmapImage.bmp'));
    OnClick := @BitmapImageClick;
  end;

  { BitmapImage2 }
  BitmapImage2 := TBitmapImage.Create(WizardForm);
  with BitmapImage2 do
  begin
    Name := 'BitmapImage2';
    Parent := TBitmapImagePage.Surface;
    Left := ScaleX(65);
    Top := ScaleY(0);
    Width := ScaleX(110);
    Height := ScaleY(110);
    Cursor := crHand;
    BackColor := 4194304;
    Center := True;
    ExtractTemporaryFile('WizardForm.BitmapImage2.bmp');
    Bitmap.LoadFromFile(ExpandConstant('{tmp}\WizardForm.BitmapImage2.bmp'));
    OnClick := @BitmapImageClick;
  end;

  { BitmapImage3 }
  BitmapImage3 := TBitmapImage.Create(WizardForm);
  with BitmapImage3 do
  begin
    Name := 'BitmapImage3';
    Parent := TBitmapImagePage.Surface;
    Left := ScaleX(185);
    Top := ScaleY(0);
    Width := ScaleX(220);
    Height := ScaleY(220);
    Cursor := crHand;
    Center := True;
    Stretch := True;
    ExtractTemporaryFile('WizardForm.BitmapImage3.bmp');
    Bitmap.LoadFromFile(ExpandConstant('{tmp}\WizardForm.BitmapImage3.bmp'));
    OnClick := @BitmapImageClick;
  end;

  { TRichViewerPage }
  with TRichViewerPage.Surface do
  begin
    Name := 'TRichViewerPage';
  end;

  { RichEditViewer }
  RichEditViewer := TRichEditViewer.Create(WizardForm);
  with RichEditViewer do
  begin
    Name := 'RichEditViewer';
    Parent := TRichViewerPage.Surface;
    Left := ScaleX(0);
    Top := ScaleY(0);
    Width := ScaleX(417);
    Height := ScaleY(237);
    ReadOnly := True;
    ScrollBars := ssVertical;
    RTFText := '{\rtf1\fbidis\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss\fcharset0 Arial;}{\f1\fnil\fcharset134 Microsoft Sans Serif;}}' + #13#10 +
         '{\colortbl ;\red255\green0\blue0;\red0\green128\blue0;\red0\green0\blue128;}' + #13#10 +
         '\viewkind4\uc1\pard\ltrpar\lang1043\f0\fs20 T\cf1 Rich\cf2 Edit\cf3 Viewer\cf0\lang2052\f1\fs16\par' + #13#10 +
         '}' + #13#10 +
         '';
  end;

  RichEditViewer.TabOrder := 0;

  { AboutButton }
  AboutButton := TNewButton.Create(WizardForm);
  with AboutButton do
  begin
    Name := 'AboutButton';
    Parent := WizardForm;
    Left := ScaleX(10);
    Top := ScaleY(327);
    Width := ScaleX(75);
    Height := ScaleY(23);
    Caption := '&About...';
    OnClick := @AboutButtonClick;
  end;

  { URLLabel }
  URLLabel := TNewStaticText.Create(WizardForm);
  with URLLabel do
  begin
    Name := 'URLLabel';
    Parent := WizardForm;
    Cursor := crHand;
    Caption := 'www.innosetup.com';
    Font.Color := clBlue;
    Font.Height := -11;
    Font.Name := 'Microsoft Sans Serif';
    Font.Style := [fsUnderline];
    ParentFont := False;
    OnClick := @URLLabelClick;
    Left := ScaleX(105);
    Top := ScaleY(332);
    Width := ScaleX(97);
    Height := ScaleY(14);
  end;

  AboutButton.TabOrder := 5;
  URLLabel.TabOrder := 6;

{ ReservationBegin }
  // This part is for you. Add your specialized code here.
  ProgressBar2.State := npbsError;

  CheckListBox.AddCheckBox('TNewCheckListBox', '', 0, True, True, False, True, nil);
  CheckListBox.AddRadioButton('TNewCheckListBox', '', 1, True, True, nil);
  CheckListBox.AddRadioButton('TNewCheckListBox', '', 1, False, True, nil);
  CheckListBox.AddCheckBox('TNewCheckListBox', '', 0, True, True, False, True, nil);

  CheckListBox2.AddGroup('TNewCheckListBox', '', 0, nil);
  CheckListBox2.AddRadioButton('TNewCheckListBox', '', 0, True, True, nil);
  CheckListBox2.AddRadioButton('TNewCheckListBox', '', 0, False, True, nil);

  FolderTreeView.Directory := ExpandConstant('{src}');
{ ReservationEnd }
end;
// Don't modify this section. It is generated automatically.
{ RedesignWizardFormEnd } // Don't remove this line!

procedure BitmapImageClick(Sender: TObject);
begin
  MsgBox('You clicked the image!', mbInformation, mb_Ok);
end;

procedure FormButtonClick(Sender: TObject);
var
  Form: TSetupForm;
  OKButton, CancelButton: TNewButton;
begin
  Form := CreateCustomForm();
  try
    Form.ClientWidth := ScaleX(256);
    Form.ClientHeight := ScaleY(256);
    Form.Caption := 'TSetupForm';
    Form.CenterInsideControl(WizardForm, False);

    OKButton := TNewButton.Create(Form);
    OKButton.Parent := Form;
    OKButton.Width := ScaleX(75);
    OKButton.Height := ScaleY(23);
    OKButton.Left := Form.ClientWidth - ScaleX(75 + 6 + 75 + 10);
    OKButton.Top := Form.ClientHeight - ScaleY(23 + 10);
    OKButton.Caption := 'OK';
    OKButton.ModalResult := mrOk;

    CancelButton := TNewButton.Create(Form);
    CancelButton.Parent := Form;
    CancelButton.Width := ScaleX(75);
    CancelButton.Height := ScaleY(23);
    CancelButton.Left := Form.ClientWidth - ScaleX(75 + 10);
    CancelButton.Top := Form.ClientHeight - ScaleY(23 + 10);
    CancelButton.Caption := 'Cancel';
    CancelButton.ModalResult := mrCancel;
    CancelButton.Cancel := True;

    Form.ActiveControl := OKButton;

    if Form.ShowModal() = mrOk then
      MsgBox('You clicked OK.', mbInformation, MB_OK);
  finally
    Form.Free();
  end;
end;

procedure ButtonClick(Sender: TObject);
begin
  MsgBox('You clicked the button!', mbInformation, mb_Ok);
end;

procedure URLLabelClick(Sender: TObject);
var
  ErrorCode: Integer;
begin
  ShellExecAsOriginalUser('open', 'http://www.innosetup.com/', '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);
end;

procedure AboutButtonClick(Sender: TObject);
begin
  MsgBox('This demo shows some features of the various form objects and control classes.', mbInformation, mb_Ok);
end;

procedure InitializeWizard();
var
  BackgroundBitmapImage: TBitmapImage;
  BackgroundBitmapText: TNewStaticText;
begin
  RedesignWizardForm;

  BackgroundBitmapImage := TBitmapImage.Create(MainForm);
  BackgroundBitmapImage.Left := 50;
  BackgroundBitmapImage.Top := 90;
  BackgroundBitmapImage.AutoSize := True;
  BackgroundBitmapImage.Bitmap := WizardForm.WizardBitmapImage.Bitmap;
  BackgroundBitmapImage.Parent := MainForm;

  BackgroundBitmapText := TNewStaticText.Create(MainForm);
  BackgroundBitmapText.Left := BackgroundBitmapImage.Left;
  BackgroundBitmapText.Top := BackgroundBitmapImage.Top + BackgroundBitmapImage.Height + ScaleY(8);
  BackgroundBitmapText.Caption := 'TBitmapImage';
  BackgroundBitmapText.Parent := MainForm;
end;






