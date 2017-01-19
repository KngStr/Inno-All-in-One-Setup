; Inno Setup 中替换卸载程序图标的插件与例子
; 编写: zhfi @ http://hi.baidu.com/zhfi1022/
; 特别感谢: 风铃夜思雨, Restools !

;注意: 替换卸载程序的图标，必须是在卸载程序生成之前！
;建议安装图标与卸载图标的格式与大小一致，否则可能会导致卸载程序出错！
;要替换图标的exe文件路径名称留空，则插件会自动替换掉Inno卸载程序的图标！

[Setup]
; 注意: AppId 的值是唯一识别这个程序的标志。
; 不要在其他程序中使用相同的 AppId 值。
; (在编译器中点击菜单“工具 -> 产生 GUID”可以产生一个新的 GUID)
AppId={{DC1559D2-A4CC-471F-8FDF-45F4278AFAEA}
AppName=Inno Setup 中替换卸载程序图标的例子
AppVerName=我的程序 1.5
AppPublisher=我的公司
AppPublisherURL=http://www.example.com/
AppSupportURL=http://www.example.com/
AppUpdatesURL=http://www.example.com/
DefaultDirName=.\Uninst
DefaultGroupName=我的程序
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes
SetupIconFile=Setup.ico
OutputDir=userdocs:Inno Setup Examples Output

[Languages]
Name: "chinese"; MessagesFile: "compiler:Default.isl"

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
;图标
Source: "uninst.ico"; Flags: solidbreak dontcopy
;插件
Source: "{#PluginDir}\UpdateIcon.dll"; Flags: solidbreak dontcopy

[code]
//插件函数用法：
//参数: 句柄(插件错误对话框的父句柄), exe文件完整路径名称, (exe文件中要替换的)图标资源名称, 图标文件的完整路径名称, (exe中要替换的图标资源所在)语系
//返回值: 成功 = True, 失败 = False
function UpdateIcon(const hWnd: Integer; const exeFileName, exeIcon, IcoFileName: String; wlangID: DWORD): Boolean;
external 'UpdateIcon@files:UpdateIcon.dll stdcall';

//替换卸载程序的图标
function UpdateUninstIcon(const IcoFileName: String): Boolean;
begin
//  要替换图标的exe文件路径名称留空，则插件会自动替换掉Inno卸载程序的图标！其它参数类似！
  Result:= UpdateIcon(MainForm.Handle, '', '', IcoFileName, 0); //替换卸载图标
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  sIcon: String;
begin
//注意: 替换卸载程序的图标，必须是在卸载程序生成之前！
//建议安装图标与卸载图标的格式与大小一致，否则可能会导致卸载程序出错！
  if CurStep=ssInstall then
  begin
    sIcon:= ExpandConstant('{tmp}\uninst.ico'); //定义卸载图标
//  ExtractTemporaryFile('UpdateIcon.dll');
    ExtractTemporaryFile(ExtractFileName(sIcon)); //释放卸载图标
//  要替换图标的exe文件路径名称留空，则插件会自动替换掉Inno卸载程序的图标！
    if UpdateUninstIcon(sIcon) then  //替换卸载图标
      MsgBox('卸载程序图标 替换成功！', mbInformation, MB_OK)
    else MsgBox('卸载程序图标 替换失败！', mbError, MB_OK);
  end;
end;
