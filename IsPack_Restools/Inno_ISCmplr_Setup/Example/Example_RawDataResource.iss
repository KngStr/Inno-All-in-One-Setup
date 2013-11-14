; 演示如何使用Setup参数 IconResource.
; 脚本: restools ( http://restools.hanzify.org )

; 该参数主要给安装程序添加 Raw Data 资源, 这样做主要可以为卸载程序带来额外的文件资源.
; 因为卸载程序是不带压缩文件的. 所以如果想卸载程序也是一个单独的文件, 只能以资源方式为卸载程序提供额外的文件来源.

#ifdef IS_ENHANCED
  #if (Pos('ee', IS_Ver_Str) >= 1)
    #define IS_Version_ee
  #endif
#else
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

#ifdef UNICODE
  #define A "W"
#else
  #define A "A"
#endif

[Setup]
AppName=My Program
AppVersion=1.5
DefaultDirName={pf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
SolidCompression=yes
Compression=lzma/ultra
OutputDir=userdocs:Inno Setup Examples Output
RawDataResource=MyFile1:readme1.txt|MyFile2:readme2.txt|MyCursor:cursor.ani
; RawDataResource 格式:
; RDResName1:RDFileName1|RDResName2:RDFileName2|RDResName3:RDFileName3|......
; 注意: Raw Data 资源写入安装程序后, 会自动在 RCDATA 资源名称前面添加前缀 "_IS_"
; 所以在使用 TResourceStream.Create 等等函数的时候也需要在图标资源名称前面添加 "_IS_"
; 例如: TResourceStream.Create(HInstance, '_IS_MYFILE1', RT_RCDATA);

; HInstance 在增强版中也会同时提供, 方便引用安装程序自身的资源.

; 以下的例子虽然是在安装程序中演示, 但是它也同样适用于卸载程序.

[Code]
#ifdef IS_Version_ee
function LoadCursorFromFile(FileName: String): Cardinal; external 'LoadCursorFromFile{#A}@user32 stdcall';
function DeleteObject(p1: Longword): BOOL; external 'DeleteObject@gdi32.dll stdcall';

const
  MyCursor = 101;
#endif

const
  RT_RCDATA = 10;
var
  hcur: Cardinal;
  
procedure InitializeWizard();
var
  ResStream: TResourceStream;
  ISCustomPage: TWizardPage;
begin          
#ifdef IS_Version_ee
  ResStream := TResourceStream.Create(HInstance, '_IS_MYCURSOR', RT_RCDATA);
  try
    ResStream.SaveToFile(ExpandConstant('{tmp}\cursor.ani'));
    hcur := LoadCursorFromFile(ExpandConstant('{tmp}\cursor.ani'));
    Screen.Cursors[MyCursor] := hcur;
  finally
    ResStream.Free;
  end;
#endif

  ISCustomPage := CreateCustomPage(wpWelcome, 'Load from RCDATA resource', 'readme1.txt and readme2.txt');

  with TNewMemo.Create(WizardForm) do
  begin
    Parent := ISCustomPage.Surface;
    SetBounds(ScaleX(0), ScaleY(0), ScaleX(417), ScaleY(113));
#ifdef IS_Version_ee
    Cursor := MyCursor;
#endif
    ResStream := TResourceStream.Create(HInstance, '_IS_MYFILE1', RT_RCDATA);
    try
      Lines.LoadFromStream(ResStream);
    finally
      ResStream.Free;
    end;
  end;

  with TNewMemo.Create(WizardForm) do
  begin
    Parent := ISCustomPage.Surface;
    SetBounds(ScaleX(0), ScaleY(124), ScaleX(417), ScaleY(113));
#ifdef IS_Version_ee
    Cursor := MyCursor;
#endif
    ResStream := TResourceStream.Create(HInstance, '_IS_MYFILE2', RT_RCDATA);
    try
      Lines.LoadFromStream(ResStream);
    finally
      ResStream.Free;
    end;
  end;

  WizardForm.WelcomeLabel2.Height := ScaleY(100);
end;

procedure DeinitializeSetup();
begin
#ifdef IS_Version_ee
  DeleteObject(hcur);
#endif
end;






