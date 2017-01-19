; -- Example1.iss --
; restools
; http://restools.hanzify.org
; 看见很多人需要，就整个出来爽爽吧
; 时间仓促，所以编程可能会有点谬误，如有错误可以提出
; descctrl.dll 为一个 6.5 KB 的组件描述插件

#include "DescCtrl.ish"

[Setup]
AppName=My Program
AppVerName=My Program version 1.5
DefaultDirName={pf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
OutputDir=userdocs:Inno Setup Examples Output

[Components]
Name: "program"; Description: "程序文件"; Types: full compact custom; Flags: fixed
Name: "help"; Description: "帮助文件"; Types: full
Name: "readme"; Description: "自述文件"; Types: full
Name: "readme\en"; Description: "英文"; Flags: exclusive
Name: "readme\de"; Description: "德文"; Flags: exclusive
Name: "readme\cn"; Description: "中文"; Flags: exclusive
Name: "readme\ru"; Description: "俄文"; Flags: exclusive
Name: "test"; Description: "测试"; Types: full
Name: "test\test1"; Description: "测试1"; Flags: checkablealone
Name: "test\test2"; Description: "测试2"; Flags: checkablealone
Name: "test\test3"; Description: "测试3"; Flags: checkablealone
Name: "test\test4"; Description: "测试4"; Flags: checkablealone
Name: "test\test5"; Description: "测试5"; Flags: checkablealone
Name: "test\test6"; Description: "测试6"; Flags: checkablealone

[Files]
Source: "compiler:\Examples\MyProg.exe"; DestDir: "{app}"; Components: program
Source: "compiler:\Examples\MyProg.chm"; DestDir: "{app}"; Components: help

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"

[Code]

var
  Info: TNewStaticText;
  InfoCaption: TNewStaticText;
  InfoPanel: TPanel;

procedure DeinitializeSetup();
begin
  //释放描述控制
  disabledesc();
end;

procedure InitializeWizard();
begin
  PDir('DescCtrl.dll');

  // 调整组件列表的大小
  WizardForm.TYPESCOMBO.Visible:= false;
  WizardForm.ComponentsList.Height := WizardForm.ComponentsList.Height + WizardForm.ComponentsList.Top - WizardForm.TYPESCOMBO.Top;
  WizardForm.ComponentsList.Top := WizardForm.TYPESCOMBO.Top;
  WizardForm.ComponentsList.Width := ScaleX(200);
  //创建一个虚拟的GroupBox，因为Inno Setup 没有啊。
  InfoPanel := TPanel.Create(WizardForm);
  InfoPanel.Parent := WizardForm.SelectComponentsPage;
  InfoPanel.Caption := '';
  InfoPanel.Top := WizardForm.ComponentsList.Top;
  InfoPanel.Left := ScaleX(216);
  InfoPanel.Width := ScaleX(200);
  InfoPanel.Height := WizardForm.ComponentsList.Height;
  InfoPanel.BevelInner := bvRaised;
  InfoPanel.BevelOuter := bvLowered;
  InfoCaption := TNewStaticText.Create(WizardForm);
  InfoCaption.Parent := WizardForm.SelectComponentsPage;
  InfoCaption.Caption := '描述';
  InfoCaption.Left := ScaleX(224);
  InfoCaption.Top := InfoPanel.Top - ScaleY(5);
  InfoCaption.Font.Color := clActiveCaption;
  // 创建描述文字
  Info := TNewStaticText.Create(WizardForm);
  Info.Parent := InfoPanel;
  Info.AutoSize := False;
  Info.Left := ScaleX(6);
  Info.Width := ScaleX(188);
  Info.Top := ScaleY(12);
  Info.Height := WizardForm.ComponentsList.Height - ScaleY(18);
  Info.Caption := '移动你的鼠标指针到组件之上，便可见到它的描述。';
  Info.WordWrap := true;
  //激活描述控制
  enabledesc(WizardForm.ComponentsList.Handle,Info.Handle,
       '程序文件描述;'+
       '帮助文件描述;'+
       '自述文件描述;'+
       '英文描述;'+
       '德文描述;'+
       '中文描述;'+
       '俄文描述测试#3B#3B包含#3B英文分号;'+
       '测试描述;'+
       '测试1描述;'+
       '测试2描述;'+
       '测试3描述;'+
       '测试4描述;'+
       '测试5描述;'+
       '测试6描述;'
       );
end;






