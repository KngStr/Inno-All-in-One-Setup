; 脚本由 Inno Setup 脚本向导 生成！
; 有关创建 Inno Setup 脚本文件的详细资料请查阅帮助文档！
#include "compiler:WaterLib.iss"

[Setup]
; 注: AppId的值为单独标识该应用程序。
; 不要为其他安装程序使用相同的AppId值。
; (生成新的GUID，点击 工具|在IDE中生成GUID。)
AppId={{CCE7261A-7B8C-4CCA-A4A6-B8048C5BEA9D}
AppName=我的程序
AppVerName=我的程序 1.5
AppPublisher=我的公司
AppPublisherURL=http://www.example.com/
AppSupportURL=http://www.example.com/
AppUpdatesURL=http://www.example.com/
DefaultDirName={pf}\我的程序
DefaultGroupName=我的程序
OutputDir=userdocs:Inno Setup Examples Output
OutputBaseFilename=setup
Compression=lzma
SolidCompression=true
WizardImageFile=compiler:WizModernImage-Is.bmp

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked

[Files]
Source: compiler:Examples\MyProg.exe; DestDir: {app}; Flags: ignoreversion
;如果不是使用本人增强版本INNO,则使用定时回调插件
#ifndef ISVersion
Source: InnoCallback.dll; DestDir: {tmp}; Flags: dontcopy noencryption
#endif

[Code]
#ifndef ISVersion
type
 TTimerProc = procedure(H: LongWord; MSG: LongWord; idEvent: LongWord; dwTime: LongWord);

function WrapTimerProc(CallBack: TTimerProc; ParamCount: Integer): LongWord;
  external 'InnoCallback@files:InnoCallBack.dll stdcall';

function SetTimer(hWnd: LongWord; nIDEvent, uElapse: LongWord; lpTimerFunc: LongWord): LongWord;
  external 'SetTimer@user32.dll stdcall';
#endif

Const
  DrawTextDemo = '文本在水波中的演示';
  DrawTextMoveDemo = '动态移动演示';
var
  MoveB_X, MoveT_Y: Integer;
  DT_X, DT_Y: Integer;
  DB_X, DB_Y: Integer;
  DrawBitmapDemo: TBitmap;
  DrawMoveBtn: Array[1..4] Of TButton;

  WaterHandle:Integer;

#ifdef ISVersion
  Timer: TTimer;
#endif

//手动移动操作
Procedure DrawMoveBtnClick(Sender: TObject);
Begin
  Case TButton(Sender).Tag of
    1:
    Begin
      DT_X := DT_X - 1;
      DB_X := DB_X - 1;
    End;
    2:
    Begin
      DT_Y := DT_Y - 1;
      DB_Y := DB_Y - 1;
    End;
    3:
    Begin
      DT_Y := DT_Y + 1;
      DB_Y := DB_Y + 1;
    End;
    4:
    Begin
      DT_X := DT_X + 1;
      DB_X := DB_X + 1;
    End;
  End;
  //移动文本
  WaterDrawText(WaterHandle, 0, DT_X, DT_Y, DrawTextDemo);
  //移动图片
  WaterDrawBitmap(WaterHandle, 0, DB_X, DB_Y, DrawBitmapDemo.Handle, True, clDefault);
End;

#ifdef ISVersion
procedure Timer_OnTimer(Sender: TObject);
Begin
  MoveT_Y := MoveT_Y + 1;
  If MoveT_Y >= WizardForm.WizardBitmapImage.Height then MoveT_Y := 0;
  WaterDrawText(WaterHandle, 1, 50, MoveT_Y, DrawTextMoveDemo);

  MoveB_X := MoveB_X + 1;
  If MoveB_X >= WizardForm.WizardBitmapImage.Width then MoveB_X := 0 - DrawBitmapDemo.Width;
  WaterDrawBitmap(WaterHandle, 1, MoveB_X, 80, DrawBitmapDemo.Handle, True, clDefault);
End;
#else
procedure MyTimerProc(H: LongWord; MSG: LongWord; idEvent:LongWord; dwTime:LongWord);
begin
  MoveT_Y := MoveT_Y + 1;
  If MoveT_Y >= WizardForm.WizardBitmapImage.Height then MoveT_Y := 0;
  WaterDrawText(WaterHandle, 1, 50, MoveT_Y, DrawTextMoveDemo);

  MoveB_X := MoveB_X + 1;
  If MoveB_X >= WizardForm.WizardBitmapImage.Width then MoveB_X := 0 - DrawBitmapDemo.Width;
  WaterDrawBitmap(WaterHandle, 1, MoveB_X, 80, DrawBitmapDemo.Handle);
end;
#endif

procedure InitializeWizard();
var
  F: AnsiString;
  #ifndef ISVersion
  TimerCallBack: LongWord;
  #endif
begin
  WaterSupportAuthor(True);
  //支持本人作品, 建议开启标识显示.
  //只有开启该功能后, 才可以使用WaterDraw****相关API的功能

  F:= ExpandConstant('{tmp}\WizardImage.bmp');
  WizardForm.WizardBitmapImage.Bitmap.SaveToFile(F);
  WaterHandle := WaterInit(WizardForm.WelcomePage.Handle, 2, 2);
  WaterSetBounds(WaterHandle, WizardForm.WizardBitmapImage.Left, WizardForm.WizardBitmapImage.Top, WizardForm.WizardBitmapImage.Width, WizardForm.WizardBitmapImage.Height);
  WaterSetFile(WaterHandle, AnsiString(F));
  WaterSetActive(WaterHandle, True);
  DeleteFile(F);

  //创建动态显示文本或位图的定时器
  #ifdef ISVersion
  Timer := TTimer.Create(WizardForm);
  Timer.OnTimer := @Timer_OnTimer;
  Timer.Interval := 100;
  Timer.Enabled := True;
  #else
  TimerCallBack := WrapTimerProc(@MyTimerProc, 4);
  SetTimer(0, 0, 100, TimerCallBack);
  #endif

  //创建手动操作移动按钮
  DrawMoveBtn[1] := TButton.Create(WizardForm);
  With DrawMoveBtn[1] Do
  Begin
    Tag := 1;
    Caption := '左移';
    Parent := WizardForm;
    Width := 30;
    Left := WizardForm.WizardBitmapImage.Width + 10;
    Top := WizardForm.WizardBitmapImage.Height div 2;
    OnClick := @DrawMoveBtnClick;
  End;

  DrawMoveBtn[2] := TButton.Create(WizardForm);
  With DrawMoveBtn[2] Do
  Begin
    Tag := 2;
    Caption := '上移';
    Parent := WizardForm;
    Width := 30;
    Left := WizardForm.WizardBitmapImage.Width + 40;
    Top := WizardForm.WizardBitmapImage.Height div 2 - 25;
    OnClick := @DrawMoveBtnClick;
  End;

  DrawMoveBtn[3] := TButton.Create(WizardForm);
  With DrawMoveBtn[3] Do
  Begin
    Tag := 3;
    Caption := '下移';
    Parent := WizardForm;
    Width := 30;
    Left := WizardForm.WizardBitmapImage.Width + 40;
    Top := WizardForm.WizardBitmapImage.Height div 2 + 25;
    OnClick := @DrawMoveBtnClick;
  End;

  DrawMoveBtn[4] := TButton.Create(WizardForm);
  With DrawMoveBtn[4] Do
  Begin
    Tag :=4;
    Caption := '右移';
    Parent := WizardForm;
    Width := 30;
    Left := WizardForm.WizardBitmapImage.Width + 70;
    Top := WizardForm.WizardBitmapImage.Height div 2;
    OnClick := @DrawMoveBtnClick;
  End;

  //静态显示的文本
  DT_X := 20;
  DT_Y := 50;
  WaterDrawTextBrush(WaterHandle, 0, clBlack, bsClear);
  WaterDrawTextFont(WaterHandle, 0, '宋体', 9, clRed, 134);
  WaterDrawText(WaterHandle, 0, DT_X, DT_Y, DrawTextDemo);

  //静态显示的位图
  DB_X := 50;
  DB_Y := 160;
  DrawBitmapDemo:= TBitmap.Create;
  DrawBitmapDemo.LoadFromFile(ExpandConstant('{commonappdata}\Microsoft\User Account Pictures\guest.bmp'));
  WaterDrawBitmap(WaterHandle, 0, DB_X, DB_Y, DrawBitmapDemo.Handle, True, clDefault);

  //竖向移动的文本
  MoveT_Y := 0;
  WaterDrawTextBrush(WaterHandle, 1, clBlack, bsClear);
  WaterDrawTextFont(WaterHandle, 1, '宋体', 12, clYellow, 134);
  WaterDrawText(WaterHandle, 1, 50, MoveT_Y, DrawTextMoveDemo);

  //横行移动的位图
  MoveB_X := 0;
  WaterDrawBitmap(WaterHandle, 1, MoveB_X, 80, DrawBitmapDemo.Handle, True, clDefault);
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  Case CurPageID of
    wpWelcome : WaterSetParentWindow(WaterHandle, WizardForm.WelcomePage.Handle);  //将水波移动到另一个句柄上
    wpFinished: WaterSetParentWindow(WaterHandle, WizardForm.FinishedPage.Handle); //将水波移动到另一个句柄上
  end;
end;

//释放所有水波对象
procedure DeinitializeSetup();
begin
  WaterAllFree;
end;
