; -- Killer.iss --

; ksiCallNsis 插件演示，调用含有callback的nsis插件

#include "ksiCallNsis.ish"

[Setup]
AppName=我的程序
AppVerName=我的程序 版本 1.5
DefaultDirName={pf}\我的程序
DefaultGroupName=我的程序
UninstallDisplayIcon={app}\MyProg.exe
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "{#PluginDir}\Nsis\killer.dll"; Flags: dontcopy

[Icons]
Name: "{group}\我的程序"; Filename: "{app}\MyProg.exe"

[code]
// 可以检测和结束32位程序进程和64位程序进程
// IsProcessRunning 发现的话，返回值为1,0为未发现
// KillProcess 没有返回值
procedure InitializeWizard();
var
  val: string;
  ival: Integer;
begin
  PDir('{# ksiCallNsis_DLL }');

  InitNsisPlug(0);
  try
    CallNsisPlugEx(PDir('killer.dll'),'IsProcessRunning', ['cmd.exe']);
    val := PopNsisString;
    if val = '1' then begin
      if MsgBox('发现cmd，是否关闭进程？', mbConfirmation, MB_YESNO) = IDYES then
        CallNsisPlugEx(PDir('killer.dll'),'KillProcess', ['cmd.exe']);
    end
    else
      MsgBox(Format('错误代码：%s', [val]), mbConfirmation, MB_OK);
  finally
    FreeNsisPlug();
  end;
end;


