#include "ISXDL.Ish"

[Setup]
AppName=My Program
AppVerName=My Program version 1.5
DefaultDirName={pf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
Compression=lzma
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output
DisableWelcomePage=yes

[Code]
{ RedesignWizardFormBegin } // Don't remove this line!
// Don't modify this section. It is generated automatically.
var
  ISCustomPage1: TWizardPage;
  Label1: TLabel;
  Label2: TLabel;
  NewEdit1: TNewEdit;
  NewEdit2: TNewEdit;
  NewButton1: TNewButton;

procedure NewButton1Click(Sender: TObject); forward;

procedure RedesignWizardForm;
begin
  { Creates custom wizard page }
  ISCustomPage1 := CreateCustomPage(wpWelcome, 'ISCustomPage1_Caption', 'ISCustomPage1_Description');

  { ISCustomPage1 }
  with ISCustomPage1.Surface do
  begin
    Name := 'ISCustomPage1';
  end;

  { Label1 }
  Label1 := TLabel.Create(WizardForm);
  with Label1 do
  begin
    Name := 'Label1';
    Parent := ISCustomPage1.Surface;
    Caption := 'Url:';
    Transparent := False;
    Left := ScaleX(16);
    Top := ScaleY(8);
    Width := ScaleX(17);
    Height := ScaleY(13);
  end;

  { Label2 }
  Label2 := TLabel.Create(WizardForm);
  with Label2 do
  begin
    Name := 'Label2';
    Parent := ISCustomPage1.Surface;
    Caption := 'FilePath';
    Transparent := False;
    Left := ScaleX(16);
    Top := ScaleY(64);
    Width := ScaleX(38);
    Height := ScaleY(13);
  end;

  { NewEdit1 }
  NewEdit1 := TNewEdit.Create(WizardForm);
  with NewEdit1 do
  begin
    Name := 'NewEdit1';
    Parent := ISCustomPage1.Surface;
    Left := ScaleX(15);
    Top := ScaleY(24);
    Width := ScaleX(385);
    Height := ScaleY(21);
    Text := '';
  end;

  { NewEdit2 }
  NewEdit2 := TNewEdit.Create(WizardForm);
  with NewEdit2 do
  begin
    Name := 'NewEdit2';
    Parent := ISCustomPage1.Surface;
    Left := ScaleX(16);
    Top := ScaleY(82);
    Width := ScaleX(384);
    Height := ScaleY(21);
    Text := '';
  end;

  { NewButton1 }
  NewButton1 := TNewButton.Create(WizardForm);
  with NewButton1 do
  begin
    Name := 'NewButton1';
    Parent := ISCustomPage1.Surface;
    Left := ScaleX(72);
    Top := ScaleY(144);
    Width := ScaleX(249);
    Height := ScaleY(41);
    Caption := 'GetFile';
    OnClick := @NewButton1Click;
  end;

  NewEdit1.TabOrder := 0;
  NewEdit2.TabOrder := 1;
  NewButton1.TabOrder := 2;

{ ReservationBegin }
  NewEdit1.Text := 'http://www.sherlocksoftware.org/innotools/example3%202.0.exe';
  NewEdit2.Text := ExpandConstant('{commondesktop}\Isxdl_Demodown.exe')

{ ReservationEnd }
end;
// Don't modify this section. It is generated automatically.
{ RedesignWizardFormEnd } // Don't remove this line!

procedure NewButton1Click(Sender: TObject);
begin
  PDir('{# ISXDL_DLL }');

  isxdl_Download(0, NewEdit1.Text, NewEdit2.Text);
end;

procedure InitializeWizard();
begin
  RedesignWizardForm;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  WizardForm.ReadyPage.Hide;
end;

[ISFormDesigner]
WizardForm=FF0A005457495A415244464F524D003010E703000054504630F10B5457697A617264466F726D0A57697A617264466F726D0C436C69656E744865696768740368010B436C69656E74576964746803F1010C4578706C696369744C65667402000B4578706C69636974546F7002000D4578706C69636974576964746803F9010E4578706C696369744865696768740383010D506978656C73506572496E636802600A54657874486569676874020D00F10C544E65774E6F7465626F6F6B0D4F757465724E6F7465626F6F6B00F110544E65774E6F7465626F6F6B506167650B57656C636F6D6550616765084E65787450616765070D4953437573746F6D50616765310D4578706C69636974576964746803F1010E4578706C696369744865696768740339010000F110544E65774E6F7465626F6F6B5061676509496E6E6572506167650D4578706C69636974576964746803F1010E4578706C6963697448656967687403390100F10C544E65774E6F7465626F6F6B0D496E6E65724E6F7465626F6F6B00F110544E65774E6F7465626F6F6B506167650B4C6963656E7365506167650C50726576696F757350616765070D4953437573746F6D50616765310D4578706C69636974576964746803A1010E4578706C6963697448656967687403ED00000010544E65774E6F7465626F6F6B506167650D4953437573746F6D50616765310743617074696F6E06154953437573746F6D50616765315F43617074696F6E0B4465736372697074696F6E06194953437573746F6D50616765315F4465736372697074696F6E0C50726576696F757350616765070B57656C636F6D6550616765084E65787450616765070B4C6963656E7365506167650006544C6162656C064C6162656C31044C656674021003546F700208055769647468021106486569676874020D0743617074696F6E060455726C3A0B5472616E73706172656E7408000006544C6162656C064C6162656C32044C656674021003546F700240055769647468022606486569676874020D0743617074696F6E060846696C65506174680B5472616E73706172656E7408000008544E657745646974084E65774564697431044C656674020F03546F700218055769647468038101064865696768740215085461624F726465720200000008544E657745646974084E65774564697432044C656674021003546F700252055769647468038001064865696768740215085461624F72646572020100000A544E6577427574746F6E0A4E6577427574746F6E31044C656674024803546F7003900005576964746803F9000648656967687402290743617074696F6E060747657446696C65085461624F726465720202074F6E436C69636B070F4E6577427574746F6E31436C69636B00000000000000

