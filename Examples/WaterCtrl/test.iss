; -- test.iss --
; restools
; http://restools.hanzify.org
; 时间仓促，所以可能会有点谬误，如有错误可以提出
; waterctrl.dll 为一个用于 Inno Setup 的 16.5 KB 的水纹特效插件。
; 需要注意，插件使用 MFC, 系统需要有 mfc42.dll，不过一般系统自带。

; v2 版本  新增设置水纹插件的父句柄

[Setup]
AppName=我的程序
AppVerName=我的程序 版本 1.5
DefaultDirName={pf}\我的程序
DefaultGroupName=我的程序
UninstallDisplayIcon={app}\MyProg.exe
Compression=lzma
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "compiler:\Examples\MyProg.exe"; DestDir: "{app}"
Source: "compiler:\Examples\Readme.txt"; DestDir: "{app}"; Flags: isreadme
Source: "{#PluginDir}\waterctrl.dll"; Flags: dontcopy
Source: "WizModernImage-Is.bmp"; Flags: dontcopy

[Icons]
Name: "{group}\我的程序"; Filename: "{app}\MyProg.exe"

[code]

function enablewater(ParentWnd: HWND; Left, Top: integer; Bmp: HBITMAP;
     WaterRadius, WaterHeight: integer): BOOL; external 'enablewater@files:waterctrl.dll stdcall';
//ParentWnd     放置特效窗口的父窗口句柄。
//Left          左位置
//Top           上位置
//Bmp           位图句柄。
//WaterRadius   水纹半径，会令到水纹看起来范围更广。
//WaterHeight   水纹高度，会令到水纹看起来更深。
//注意，水纹插件自动根据图片来设定高度和宽度，
//另外水纹底图必须是翻转的图片，显示的时候会翻转图片来显示。

function waterblob(x, y: integer; radius, height: integer): BOOL; external 'waterblob@files:waterctrl.dll stdcall';
// 在 x,y 点产生半径为radius, 高度为height 的水纹。

function flattenwater(): BOOL; external 'flattenwater@files:waterctrl.dll stdcall';
// 平伏所有水纹。

function disablewater(): BOOL; external 'disablewater@files:waterctrl.dll stdcall';
//释放水纹插件

function setwaterparent(ParentWnd: HWND): BOOL; external 'setwaterparent@files:waterctrl.dll stdcall';
//v2 新增，设置水纹插件的父句柄

var
  bmp: TBitmap;

procedure InitializeWizard();
begin
  ExtractTemporaryFile('WizModernImage-Is.bmp');
  bmp := TBitmap.create;
  bmp.LoadFromFile(ExpandConstant('{tmp}\WizModernImage-Is.bmp'));

  enablewater(WizardForm.WelcomePage.Handle, 0, 0, bmp.Handle, 3, 50);
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpWelcome then
  begin
    setwaterparent(WizardForm.WelcomePage.Handle);
    waterblob(70, 198, 10, 1000);
  end else
  if CurPageID = wpFinished then
  begin
    setwaterparent(WizardForm.FinishedPage.Handle);
    waterblob(70, 198, 10, 1000);
  end else
    flattenwater();
end;

procedure DeinitializeSetup();
begin
  disablewater();
  bmp.Free;
end;


