; -- Example1.iss --

; 演示如何调用 NSIS 插件的 INNO 安装程序。
; 带有返回值的调用插件
; 渐显渐隐的闪屏效果，还附带背景声音。
; 通用 NSIS 调用插件 callnsis.dll，NSIS 闪屏插件 AdvSplash.dll
; 脚本编写： restools 主页： http://restools.yeah.net

#include "CallNsis.Ish"

[Setup]
AppName=我的程序
AppVerName=我的程序 版本 1.5
DefaultDirName={pf}\我的程序
DefaultGroupName=我的程序
UninstallDisplayIcon={app}\MyProg.exe
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "compiler:\Examples\MyProg.exe"; DestDir: "{app}"
Source: "compiler:\Examples\MyProg.chm"; DestDir: "{app}"
Source: "compiler:\Examples\Readme.txt"; DestDir: "{app}"; Flags: isreadme

Source: "{#PluginDir}\Nsis\AdvSplash.dll"; Flags: dontcopy
Source: "logo.bmp"; Flags: dontcopy
Source: "logo.wav"; Flags: dontcopy


[Icons]
Name: "{group}\我的程序"; Filename: "{app}\MyProg.exe"

[code]

procedure InitializeWizard();
var
  val: Integer;
begin
  PDir('{# CallNsis_Dll}');
  
  ExtractTemporaryFile('AdvSplash.dll');
  ExtractTemporaryFile('logo.bmp');
  ExtractTemporaryFile('logo.wav');
  val:=callplug(0,ExpandConstant('{tmp}\AdvSplash.dll'),'show','2800','1400','1200','-1',ExpandConstant('{tmp}\logo'),'','','','','');
  
  // 在 NSIS 的例子中调用是如下的：
  
  // SetOutPath $TEMP                               # 设置输出位置为临时目录
  // File /oname=logo.bmp "my_splash.bmp"           # 释放文件
  // File /oname=logo.wav "my_splashshit.wav"       # 释放文件
  // advsplash::show 2800 1400 1200 -1 $TEMP\spltmp # 调用插件
  // Pop $0                                         # 取返回值： 返回 '1' 表示用户提前关闭闪屏, 返回 '0' 表示闪屏正常结束, 返回 '-1' 表示闪屏显示出错
  
  // 基本上，调用的方法都是一样的，所以只要稍稍看看 NSIS 的插件例子，你就可以在 INNO 中利用以上方法进行调用

  if val = 1 then
    MsgBox('你点击了闪屏窗口，导致闪屏提前关闭！', mbConfirmation, MB_OK);
end;



