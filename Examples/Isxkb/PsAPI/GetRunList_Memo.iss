;
; IS 5.1,5
;
; portion of code Michael Winestock
; http://news.jrsoftware.org/news/innosetup/msg53256.html

;Author: Vincenzo
;Article created: 02/02/06 23:15:19
;Article URL : http://www.vincenzo.net/isxkb/modules.php?name=News&file=article&sid=107

#include "psapi.ish"

[Setup]
AppName=Psapi
AppVerName=Psapi
DisableProgramGroupPage=true
DisableStartupPrompt=true
DefaultDirName={pf}\Psapi
OutputDir=userdocs:Inno Setup Examples Output

[Code]
procedure RefreshClick(Sender: TObject); forward;

{ RedesignWizardFormBegin } // 不要删除这一行代码。
// 不要修改这一段代码，它是自动生成的。
var
  Panel1: TPanel;
  NewMemo1: TNewMemo;
  btn_ReFresh: TNewButton;

procedure RedesignWizardForm;
begin
  { Panel1 }
  Panel1 := TPanel.Create(WizardForm);
  with Panel1 do
  begin
    Name := 'Panel1';
    Parent := WizardForm;
    Left := ScaleX(-1);
    Top := ScaleY(0);
    Width := ScaleX(499);
    Height := ScaleY(361);
    Caption := 'Panel1';
  end;

  { NewMemo1 }
  NewMemo1 := TNewMemo.Create(WizardForm);
  with NewMemo1 do
  begin
    Name := 'NewMemo1';
    Parent := Panel1;
    Left := ScaleX(1);
    Top := ScaleY(1);
    Width := ScaleX(497);
    Height := ScaleY(313);
    Align := alTop;
    ScrollBars := ssVertical;
  end;

  { btn_ReFresh }
  btn_ReFresh := TNewButton.Create(WizardForm);
  with btn_ReFresh do
  begin
    Name := 'btn_ReFresh';
    Parent := Panel1;
    Left := ScaleX(207);
    Top := ScaleY(325);
    Width := ScaleX(75);
    Height := ScaleY(25);
    Caption := 'ReFresh';
  end;

  NewMemo1.TabOrder := 0;
  btn_ReFresh.TabOrder := 1;

  Panel1.TabOrder := 5;

{ ReservationBegin }
  // 这一部分是提供给你的，你可以在这里输入一些补充代码。

  btn_ReFresh.OnClick := @RefreshClick;

{ ReservationEnd }
end;
// 不要修改这一段代码，它是自动生成的。
{ RedesignWizardFormEnd } // 不要删除这一行代码。


procedure RefreshClick(Sender: TObject);
begin
  NewMemo1.Lines.Clear;
  with GetRunList do
  begin
    NewMemo1.Lines.Text := Text;
    Free;
  end;
end;

procedure InitializeWizard();
begin
  RedesignWizardForm;
  NewMemo1.Lines.Add('This memo shows all running programs. Click "Refresh" to see the list!')
end;

[ISFormDesigner]
WizardForm=FF0A005457495A415244464F524D0030103F02000054504630F10B5457697A617264466F726D0A57697A617264466F726D0C436C69656E744865696768740366010B436C69656E74576964746803EF010C4578706C696369744C65667402000B4578706C69636974546F7002000D4578706C69636974576964746803F7010E4578706C696369744865696768740381010D506978656C73506572496E636802600A54657874486569676874020D00F10C544E65774E6F7465626F6F6B0D4F757465724E6F7465626F6F6B00F110544E65774E6F7465626F6F6B506167650B57656C636F6D65506167650D4578706C69636974576964746803F1010E4578706C696369744865696768740339010000F110544E65774E6F7465626F6F6B5061676509496E6E6572506167650D4578706C69636974576964746803F1010E4578706C69636974486569676874033901000000065450616E656C0650616E656C31044C65667402FF03546F70020005576964746803F301064865696768740369010743617074696F6E060650616E656C31085461624F7264657202050008544E65774D656D6F084E65774D656D6F31044C656674020103546F70020105576964746803F1010648656967687403390105416C69676E0705616C546F700A5363726F6C6C42617273070A7373566572746963616C085461624F72646572020000000A544E6577427574746F6E0B62746E5F52654672657368044C65667403CF0003546F70034501055769647468024B0648656967687402190743617074696F6E060752654672657368085461624F72646572020100000000
