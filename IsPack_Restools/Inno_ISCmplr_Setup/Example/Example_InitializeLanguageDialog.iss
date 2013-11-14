; 脚本: restools ( http://restools.hanzify.org )

; 演示 InitializeLanguageDialog 的用法.
; 它是一个比 语言对话框 更早出现的 Inno Setup 事件。
; 返回值如果为假, 语言对话框将不会出现.
; 在这个事件中你可以使用包括以下控件及属性
;  TSelectLanguageForm = class(TSetupForm)
;    property SelectLabel: TNewStaticText; read;
;    property LangCombo: TNewComboBox; read;
;    property OKButton: TNewButton; read;
;    property CancelButton: TNewButton; read;
;    property IconBitmapImage: TBitmapImage; read;
;  end;
;
;  function SelectLanguageForm: TSelectLanguageForm;

#ifndef IS_ENHANCED
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=My Application
AppVersion=1.5
DefaultDirName={pf}\My Application
DefaultGroupName=My Application
UninstallDisplayIcon={app}\MyProg.exe
SolidCompression=yes
Compression=lzma/ultra
OutputDir=userdocs:Inno Setup Examples Output

[Languages]
Name: "default"; MessagesFile: "compiler:Default.isl"
Name: "chinesesimp"; MessagesFile: "compiler:Languages\ChineseSimp.isl"
Name: "chinesetrad"; MessagesFile: "compiler:Languages\ChineseTrad.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "korean"; MessagesFile: "compiler:Languages\Korean.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Types]
Name: "full"; Description: "full"
Name: "compact"; Description: "compact"
Name: "custom"; Description: "custom"; Flags: iscustom

[Components]
Name: "program"; Description: "app files"; Types: full compact custom; Flags: fixed
Name: "help"; Description: "help files"; Types: full
Name: "readme"; Description: "readme files"; Types: full

[Files]
Source: "ISSkin.dll"; DestDir: {app}; Flags: dontcopy
Source: "Styles\Office2007.cjstyles"; DestDir: {tmp}; Flags: dontcopy
Source: "MyProg.exe"; DestDir: "{app}"; Components: program
Source: "MyProg1.chm"; DestDir: "{app}"; Components: help
Source: "Readme1.txt"; DestDir: "{app}"; Components: readme; Flags: isreadme

[Icons]
Name: "{group}\my application"; Filename: "{app}\MyProg.exe"

[code]
procedure LoadSkin(lpszPath: String; lpszIniFileName: String); external 'LoadSkin@files:isskin.dll stdcall';
procedure UnloadSkin(); external 'UnloadSkin@files:isskin.dll stdcall';
function ShowWindow(hWnd: Integer; uType: Integer): Integer; external 'ShowWindow@user32.dll stdcall';

function InitializeLanguageDialog(): Boolean;
var
  h: Integer;
begin
  h := SelectLanguageForm.ClientHeight;
  
  ExtractTemporaryFile('Office2007.cjstyles');
	LoadSkin(ExpandConstant('{tmp}\Office2007.cjstyles'), '');
	
	SelectLanguageForm.ClientHeight = h;
	
	Result := True;
end;

procedure DeinitializeSetup();
begin
	ShowWindow(StrToInt(ExpandConstant('{wizardhwnd}')), 0);
	UnloadSkin();
end;


















