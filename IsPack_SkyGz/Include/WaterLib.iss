[Files]
Source: compiler:WaterLib.dll; DestDir: {tmp}; Flags: dontcopy noencryption

[Code]
//初始化创建水波图像组件于父句柄
//HWD		创建水波效果到该句柄上
//DrawTextSize	初始化在水波效果上的文本数量, 如不使用设为0
//DrawBmpSize	初始化在水波效果上的位图数量, 如不使用设为0
function WaterInit(HWD: HWND; DrawTextSize, DrawBmpSize: Integer):Integer;
external 'WaterInit@files:WaterLib.dll stdcall';

//设置水波图像组件大小与位置
Procedure WaterSetBounds(Handle, Left, Top, Width, Height: Integer);
external 'WaterSetBounds@files:WaterLib.dll stdcall';

//ClickBlob	点击画面时产生的水滴效果幅度，0 表示禁用
//Damping	水滴阻尼系数
//RandomBlob	随机产生的水滴最大幅度，0 表示禁用
//RandomDelay	随机产生水滴的延时
//TrackBlob	鼠标移动轨迹下水滴的幅度，0 表示禁用
Procedure WaterSetType(Handle, ClickBlob, Damping, RandomBlob, RandomDelay, TrackBlob: Integer);
external 'WaterSetType@files:WaterLib.dll stdcall';

//设置水波图像组件图片文件
Procedure WaterSetFile(Handle: Integer; FileName: AnsiString);
external 'WaterSetFile@files:WaterLib.dll stdcall';

//设置水波图像组件是否启动水波效果
Procedure WaterSetActive(Handle: Integer; Active: Boolean);
external 'WaterSetActive@files:WaterLib.dll stdcall';

//设置水波图像组件父句柄
Procedure WaterSetParentWindow(Handle: Integer; HWND: HWND);
external 'WaterSetParentWindow@files:WaterLib.dll stdcall';

//清空画面上的水滴效果
Procedure WaterClear(Handle: Integer);
external 'WaterClear@files:WaterLib.dll stdcall';

//释放指定句柄的水波图像组件
Procedure WaterFree(Handle: Integer);
external 'WaterFree@files:WaterLib.dll stdcall';

//释放全部水波图像组件
Procedure WaterAllFree;
external 'WaterAllFree@files:WaterLib.dll stdcall';

//设置是否支持作者, True支持则显示SkyGz.Com标识, False不支持则关闭标识显示
Procedure WaterSupportAuthor(SupportAuthor: Boolean);
external 'WaterSupportAuthor@files:WaterLib.dll stdcall';

//以下API需要启动支持作者的标识显示时才可使用
//主要功能作用是在水波效果图上画文本和位图
procedure WaterDrawTextBrush(Handle, Index: Integer; BrushColor: TColor; BrushStyle: TBrushStyle);
external 'WaterDrawTextBrush@files:WaterLib.dll stdcall';

Procedure WaterDrawTextFont(Handle, Index: Integer; FontName: AnsiString; FontSize: Integer; FontColor: TColor; FontCharset: Byte);
external 'WaterDrawTextFont@files:WaterLib.dll stdcall';

procedure WaterDrawBmpBrush(Handle, Index: Integer; BrushColor: TColor; BrushStyle: TBrushStyle);
external 'WaterDrawBmpBrush@files:WaterLib.dll stdcall';

Procedure WaterDrawBmpFont(Handle, Index: Integer; FontName: AnsiString; FontSize: Integer; FontColor: TColor; FontCharset: Byte);
external 'WaterDrawBmpFont@files:WaterLib.dll stdcall';

Procedure WaterDrawBitmap(Handle, Index: Integer; X, Y: Integer; HBitmap: LongWord; Transparent: Boolean; TransparentColor: TColor);
external 'WaterDrawBitmap@files:WaterLib.dll stdcall';

Procedure WaterDrawText(Handle, Index: Integer; X, Y: Integer; S: AnsiString);
external 'WaterDrawText@files:WaterLib.dll stdcall';