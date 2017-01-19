[Files]
Source: compiler:FlashLib.dll; DestDir: {tmp}; Flags: noencryption nocompression

[Code]
//hWndParent　将FLASH创建在那个句柄上
//BmpTransparenthWnd 当FLASH在一个图像上时，并须要透明看到图像，就要指定该图像的句柄，
//			并且该FLASH的X, Y, nWidth, nHeight一定要与图像的一致，如不在图像上，可设置为0
//Transparent　是否透明
Function FlashLibInit(X, Y, nWidth, nHeight: Integer; hWndParent, BmpTransparenthWnd: HWND; Transparent: BOOL): HWND;
External 'FlashLibInit@files:FlashLib.dll Stdcall';

//退出时一定要执行该API，否则会报错
Procedure FlashLibFree(H: HWND);
External 'FlashLibFree@files:FlashLib.dll Stdcall';

//支持SWF、FLV
Function FlashLoadMovie(HWND: HWND; Path: AnsiString): Boolean;
External 'FlashLoadMovie@files:FlashLib.dll Stdcall';

Function FlashPlay(HWND: HWND): Boolean;
External 'FlashPlay@files:FlashLib.dll Stdcall';

Function FlashStop(HWND: HWND): Boolean;
External 'FlashStop@files:FlashLib.dll Stdcall';

Function FlashStopPlay(HWND: HWND): Boolean;
External 'FlashStopPlay@files:FlashLib.dll Stdcall';

Function FlashPutLoop(HWND: HWND; Loop: BOOL): Boolean;
External 'FlashStop@files:FlashLib.dll Stdcall';

Function FlashPutMenu(HWND: HWND; Menu: BOOL): Boolean;
External 'FlashPutMenu@files:FlashLib.dll Stdcall';

Function FlashPutStandardMenu(HWND: HWND; bEnable: BOOL): Boolean;
External 'FlashPutStandardMenu@files:FlashLib.dll Stdcall';

Function FlashBack(HWND: HWND): Boolean;
External 'FlashBack@files:FlashLib.dll Stdcall';

Function FlashForward(HWND: HWND): Boolean;
External 'FlashForward@files:FlashLib.dll Stdcall';

Function FlashRewind(HWND: HWND): Boolean;
External 'FlashRewind@files:FlashLib.dll Stdcall';

Function FlashZoom(HWND: HWND; Factor: DWORD): Boolean;
External 'FlashZoom@files:FlashLib.dll Stdcall';

Function FlashGotoFrame(HWND: HWND; FrameNum: DWORD): Boolean;
External 'FlashGotoFrame@files:FlashLib.dll Stdcall';

Function FlashSetVariableA(HWND: HWND; Name, Value: AnsiString): Boolean;
External 'FlashSetVariableA@files:FlashLib.dll Stdcall';
