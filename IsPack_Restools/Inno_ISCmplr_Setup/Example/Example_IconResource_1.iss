; 演示如何使用Setup参数 IconResource.
; 脚本: restools ( http://restools.hanzify.org )

; 该参数主要给安装程序添加 Icon 资源, 这样做主要可以为卸载程序带来额外的图像资源.
; 因为卸载程序是不带压缩文件的. 所以如果想卸载程序也是一个单独的文件, 只能以资源方式为卸载程序提供额外的图像来源.

#ifndef IS_ENHANCED
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
IconResource=MyIcon1:2000.ico|MyIcon2:2001.ico|MyIcon3:2002.ico
; IconResource 格式:
;  IcoResName1:IconFileName1|IcoResName2:IconFileName2|IcoResName3:IconFileName3|......
; 注意: Icon 资源写入安装程序后, 会自动在图标资源名称前面添加前缀 "_IS_"
; 所以在使用 LoadIcon 等等 API 的时候也需要在图标资源名称前面添加 "_IS_"
; 例如: LoadIcon(HInstance, '_IS_MYICON1');

; HInstance 在增强版中也会同时提供, 方便引用安装程序自身的资源.

; 以下的例子虽然是在安装程序中演示, 但是它也同样适用于卸载程序.

[Code]
function LoadImage(hInst: UINT; ImageName: String; ImageType: UINT; X, Y: Integer; Flags: UINT): THandle;
external 'LoadImage{#A}@user32.dll stdcall';
function DrawIconEx(hdc: LongInt; xLeft, yTop: Integer; hIcon: LongInt; cxWidth, cyWidth: Integer; istepIfAniCur: LongInt; hbrFlickerFreeDraw, diFlags: LongInt): LongInt;
external 'DrawIconEx@user32.dll stdcall';
function DestroyIcon(hIcon: LongInt): LongInt;
external 'DestroyIcon@user32.dll stdcall';

const
  IMAGE_ICON = 1;
  DI_NORMAL = 3;

procedure InitializeWizard();
var
  MyBmp1, MyBmp2, MyBmp3: TBitmapImage;
  hIcon: LongInt;
begin
  with TLabel.Create(WizardForm) do
  begin
    Parent := WizardForm.WelcomePage;
    Caption := 'MyIcon1:';
    SetBounds(ScaleX(176), ScaleY(184), ScaleX(45), ScaleY(13));
  end;
  with TLabel.Create(WizardForm) do
  begin
    Parent := WizardForm.WelcomePage;
    Caption := 'MyIcon2:';
    SetBounds(ScaleX(248), ScaleY(184), ScaleX(45), ScaleY(13));
  end;
  with TLabel.Create(WizardForm) do
  begin
    Parent := WizardForm.WelcomePage;
    Caption := 'MyIcon3:';
    SetBounds(ScaleX(320), ScaleY(184), ScaleX(45), ScaleY(13));
  end;

  MyBmp1 := TBitmapImage.Create(WizardForm);
  with MyBmp1 do
  begin
    Parent := WizardForm.WelcomePage;
    SetBounds(ScaleX(176), ScaleY(200), 32, 32);
    // HInstance 是新提供的返回安装程序实例的函数, 它主要是配合安装程序或卸载程序调用自身资源使用的.
    hIcon := LoadImage(HInstance, '_IS_MYICON1', IMAGE_ICON, 32, 32, 0);
    try
      Bitmap.Width := 32;
      Bitmap.Height := 32;
      DrawIconEx(Bitmap.Canvas.Handle, 0, 0, hIcon, 32, 32, 0, 0, DI_NORMAL);
    finally
      DestroyIcon(hIcon);
    end;
  end;
  MyBmp2 := TBitmapImage.Create(WizardForm);
  with MyBmp2 do
  begin
    Parent := WizardForm.WelcomePage;
    SetBounds(ScaleX(248), ScaleY(200), 32, 32);
    hIcon := LoadImage(HInstance, '_IS_MYICON2', IMAGE_ICON, 32, 32, 0);
    try
      Bitmap.Width := 32;
      Bitmap.Height := 32;
      DrawIconEx(Bitmap.Canvas.Handle, 0, 0, hIcon, 32, 32, 0, 0, DI_NORMAL);
    finally
      DestroyIcon(hIcon);
    end;
  end;
  MyBmp3 := TBitmapImage.Create(WizardForm);
  with MyBmp3 do
  begin
    Parent := WizardForm.WelcomePage;
    SetBounds(ScaleX(320), ScaleY(200), 32, 32);
    hIcon := LoadImage(HInstance, '_IS_MYICON3', IMAGE_ICON, 32, 32, 0);
    try
      Bitmap.Width := 32;
      Bitmap.Height := 32;
      DrawIconEx(Bitmap.Canvas.Handle, 0, 0, hIcon, 32, 32, 0, 0, DI_NORMAL);
    finally
      DestroyIcon(hIcon);
    end;
  end;

  WizardForm.WelcomeLabel2.Height := ScaleY(100);
end;





