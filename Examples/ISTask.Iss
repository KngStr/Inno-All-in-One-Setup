//Author      : KngStr
//Link        : http://www.kngstr.com/
//Description :
//Modified    : 2013-11-14 11:40:59
//Tested Inno :
//Usage       : See Examples folder

#include "istask.ish"

[Setup]
AppName=My Program
AppVerName=My Program v 1.5
DefaultDirName={pf}\My Program
OutputDir=userdocs:Inno Setup Examples Output
Compression=lzma/ultra
InternalCompressLevel=ultra
;SolidCompression=yes
;DisableDirPage=yes
;DisableReadyPage=yes

[CustomMessages]
Tasks=QQ.exe%ncmd.exe%nnotepad.exe

[Code]
function InitializeSetup(): Boolean;
begin
  Result := True;

  if PDir ('ISTask.dll') <> '' then
    if RunTasks(CustomMessage('Tasks'), False, False) then
    begin
      if MsgBox('检测到 QQ/CMD/NotePad 正在运行，安装无法继续。' + #13#10 + #13#10 +
        '单击「确定」直接关闭 QQ/CMD/NotePad，或者单击「取消」退出安装。', mbConfirmation, MB_OKCANCEL) = IDYES then
        begin
          KillTasks(CustomMessage('Tasks'));
          Result := True;
        end
        else
          Result := False;
    end
end;

function InitializeUninstall(): Boolean;
begin
  Result := True;

  if PDir ('ISTask.dll') <> '' then
    if RunTask('QQ.exe', False) then
    begin
      if MsgBox('检测到QQ正在运行，安装无法继续。' + #13#10 + #13#10 +
        '单击「确定」直接关闭QQ，或者单击「取消」退出安装。', mbConfirmation, MB_OKCANCEL) = IDYES then
        begin
          KillTask('QQ.exe');
          Result := True;
        end
        else
          Result := False;
    end
end;
