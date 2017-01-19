; -- WH_CALLWNDPROC.iss --
; restools
; http://restools.hanzify.org
; WinMsgCtrl.dll 为一个用于 Inno Setup 的 6 KB 的 Windows 消息获取插件。
; 以下例子是演示如何处理安装程序的 Windows Message。

; 这里的例子示范了 Mouse Message 的使用.

; Ver 1.2 修正在某些 Windows 平台上(例如 Windows XP SP3)不能正常运行的问题。

; 低配置的电脑在调试状态下可能感觉有点迟缓，请直接运行生成的安装程序查看效果。

#include "MsgCtrl.ish"

[Setup]
AppName=MyApp
AppVerName=MyApp Ver 1.0
DefaultDirName={pf}\MyApp
DefaultGroupName=MyApp
Compression=lzma
OutputDir=userdocs:Inno Setup Examples Output

[Components]
Name: "Basque"; Description: "Basque"; Types: full compact custom; Flags: fixed
Name: "BrazilianPortuguese"; Description: "BrazilianPortuguese"; Types: full
Name: "Catalan"; Description: "Catalan"; Types: full compact
Name: "Czech"; Description: "Czech"; Types: full
Name: "Danish"; Description: "Danish"; Types: full
Name: "Dutch"; Description: "Dutch"; Types: full
Name: "Finnish"; Description: "Finnish"; Types: full
Name: "French"; Description: "French"; Types: full
Name: "German"; Description: "German"; Types: full
Name: "Hebrew"; Description: "Hebrew"; Types: full
Name: "Hungarian"; Description: "Hungarian"; Types: full
Name: "Italian"; Description: "Italian"; Types: full
Name: "Norwegian"; Description: "Norwegian"; Types: full
Name: "Polish"; Description: "Polish"; Types: full
Name: "Portuguese"; Description: "Portuguese"; Types: full
Name: "Russian"; Description: "Russian"; Types: full
Name: "Slovak"; Description: "Slovak"; Types: full
Name: "Slovenian"; Description: "Slovenian"; Types: full
Name: "Spanish"; Description: "Spanish"; Types: full

[code]
const
  WH_CALLWNDPROC   = 4;
  WM_SYSCOMMAND    = $0112;
  SC_MINIMIZE      = 61472;
  SC_CLOSE         = 61536;

type
  TCWPStruct = record
    lParam:  LongWord;
    wParam:  LongWord;
    message: UINT;
    hwnd:    HWND;
  end;

// 回调函数参数格式声明
//TMessageProc = procedure(nCode: LongWord; wParam: LongWord; lParam: LongWord);
  TMessageProc = procedure(nCode: LongWord; wParam: LongWord; lParam: TCWPStruct);

  {# MsgCtrl_SetWinHookEx }

var
  HandleMark: Boolean;

procedure MyMessageProc(nCode: LongWord; wParam: LongWord; lParam: TCWPStruct);
begin
  if HandleMark then exit;
  if nCode >= 0 then
  try
    HandleMark := True;
    if lParam.message = WM_SYSCOMMAND then
    begin
      case lParam.wParam of
      SC_MINIMIZE: MsgBox('OnMinmize', mbInformation, MB_OK);
      SC_CLOSE: MsgBox('OnClose', mbInformation, MB_OK);
      end;
    end;
  finally
    HandleMark := False;
  end;
end;

procedure InitializeWizard();
begin
  PDir('winmsgctrl.dll');
  HandleMark := False;
  SetWinHookEx(WH_CALLWNDPROC, @MyMessageProc);
end;

procedure DeinitializeSetup();
begin
  UnhookWinHookEx();
end;

