[Files]
Source: compiler:GifLib.dll; DestDir: {tmp}; Flags: dontcopy noencryption

[Code]
//初始化创建Gif图像组件于父句柄
function GifInit(HWD: HWND):Integer;
external 'GifInit@files:GifLib.dll stdcall';

//设置Gif图像组件大小与位置
Procedure GifSetBounds(Handle, Left, Top, Width, Height: Integer);
external 'GifSetBounds@files:GifLib.dll stdcall';

//设置Gif图像组件图片文件
Procedure GifSetFile(Handle: Integer; FileName: AnsiString);
external 'GifSetFile@files:GifLib.dll stdcall';

//设置Gif图像组件父句柄
Procedure GifSetParentWindow(Handle: Integer; HWND: HWND);
external 'GifSetParentWindow@files:GifLib.dll stdcall';

//释放指定句柄的Gif图像组件
Procedure GifFree(Handle: Integer);
external 'GifFree@files:GifLib.dll stdcall';

//释放全部Gif图像组件
Procedure GifAllFree;
external 'GifAllFree@files:GifLib.dll stdcall';
