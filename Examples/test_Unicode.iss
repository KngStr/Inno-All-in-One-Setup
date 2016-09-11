#ifndef UNICODE
  #error Unicode Inno Setup is required to compile this script
#endif

;借用了Restools的托盘插件文字，这里表示感谢

[Setup]
AppName=MyApp
AppVerName=MyApp Ver 1.0
DefaultDirName={pf}\MyApp
DefaultGroupName=MyApp
Compression=lzma
;WindowVisible=yes
OutputDir=userdocs:Inno Setup Examples Output

[Languages]
Name: "eng"; MessagesFile: "compiler:\languages\English.isl"
Name: "chs"; MessagesFile: "compiler:\languages\ChineseSimp.isl"
Name: "cht"; MessagesFile: "compiler:\languages\ChineseTrad.isl"
Name: "jp"; MessagesFile: "compiler:\languages\Japanese.isl"
Name: "ko"; MessagesFile: "compiler:\languages\Korean.isl"
Name: "rus"; MessagesFile: "compiler:\languages\Russian.isl"

[CustomMessages]
eng.Tooltip=MyApp Ver 1.0
eng.TooltipText=Setup is starting...
eng.MenuStrs=&Show/Hide WizardForm;-;&About...;-;E&xit

chs.Tooltip=我的应用程序 Ver 1.0
chs.TooltipText=安装正在开始...
chs.MenuStrs=显示/隐藏 WizardForm(&S);-;关于(&A)...;-;退出(&X)

cht.Tooltip=我的應用程式 Ver 1.0
cht.TooltipText=安裝正在開始...
cht.MenuStrs=顯示/隱藏 WizardForm(&S);-;關於(&A)...;-;退出(&X)

jp.Tooltip=私のアプリケーション Ver 1.0
jp.TooltipText=セットアップを開始しています...
jp.MenuStrs=見せる/隠す WizardForm(&S);-;セットアップについて(&A)...;-;終了(&X)

ko.Tooltip=내 응용 프로그램 Ver 1.0
ko.TooltipText=설치 프로그램을 시작합니다...
ko.MenuStrs=보이다/숨기기 WizardForm(&S);-;설치에 대하여(&A)...;-;종료(&X)

rus.Tooltip=мое заявление Ver 1.0
rus.TooltipText=Установка начинается...
rus.MenuStrs=Показывать/Прятать WizardForm(&S);-;О программе(&A)...;-;Выйти(&X)

[ISFormDesigner]
WizardForm=FF0A005457495A415244464F524D0030103D01000054504630F10B5457697A617264466F726D0A57697A617264466F726D0C436C69656E744865696768740368010B436C69656E74576964746803F1010C4578706C696369744C65667402000B4578706C69636974546F7002000D4578706C6963697457696474680301020E4578706C69636974486569676874038E010D506978656C73506572496E636802600A54657874486569676874020D00F2020106544C6162656C064C6162656C31044C656674021003546F70034801055769647468021F06486569676874020D0743617074696F6E06064C6162656C310000F10C544E65774E6F7465626F6F6B0D4F757465724E6F7465626F6F6B00F110544E65774E6F7465626F6F6B506167650B57656C636F6D65506167650D4578706C69636974576964746803F1010E4578706C6963697448656967687403390100000000

[Code]
{ RedesignWizardFormBegin } // 不要删除这一行代码。
// 不要修改这一段代码，它是自动生成的。
var
  Label1: TLabel;

procedure RedesignWizardForm;
begin
  { Label1 }
  Label1 := TLabel.Create(WizardForm);
  with Label1 do
  begin
    Name := 'Label1';
    Parent := WizardForm;
    Left := ScaleX(16);
    Top := ScaleY(328);
    Width := ScaleX(31);
    Height := ScaleY(13);
  end;

{ ReservationBegin }
  // 这一部分是提供给你的，你可以在这里输入一些补充代码。

{ ReservationEnd }
end;
// 不要修改这一段代码，它是自动生成的。
{ RedesignWizardFormEnd } // 不要删除这一行代码。

procedure InitializeWizard();
begin
  RedesignWizardForm;

  Label1.Caption := ExpandConstant('{cm:Tooltip}');
end;



