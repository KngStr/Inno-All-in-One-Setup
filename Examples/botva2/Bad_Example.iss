;пример того, как не надо делать :)
;автор South.Tver 2012
;написано на коленке из скрипта чеклистбоксов

//настройки для чеклистбоксов
#define ScrollBarBkgImg     "sbbkg.png"
#define ScrollBarBtnImg     "sbbtn.png"
#define ScrollBarUpBtnImg   "sbupbtn.png"
#define ScrollBarDownBtnImg "sbdownbtn.png"
#define ScrollBarFrameImg   "sbframe.png"
//смещение основных объектов от краев чеклистбокса
#define FrameIndent         5
//ширина кнопки скроллбокса (она же ширина всего скроллбокса)
#define sbBtnWidth          18
//высота кнопки скроллбокса
#define sbBtnHeight         30
//высота кнопок перемотки скроллбара
#define sbUpDownBtnHeight   18

#define FontColor "$0000FF"
#define FontSize  10
#define FontName  "Curier"


#include "botva2.ish"
//#include "Units\CheckListBox.iss"


[Setup]
AppName=баловство
AppVerName=баловство
DefaultDirName={pf}\баловство
OutputBaseFilename=setup
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: Files\*; Flags: dontcopy

[Code]


type

  TmScrollBarChangePos = procedure (mp,cp:TPanel;pos:integer);
  TMemoInnerProc = procedure (clbind,itmind:integer);

  TimgMemo = record
    MainPanel        : TPanel;
    ChildPanel       : TPanel;
    FrameImg         : Longint;
    ImgPanel         : TPanel;
    Text             : AnsiString;
  end;

  TAMemo = array of TimgMemo;

  TmScrollBar = record
    bkgimg      : Longint;
    hbtn        : HWND;
    hUpBtn      : HWND;
    hDownBtn    : HWND;
    op          : Longint;
    PosMin,
    PosMax      : integer;
    IsMouseDown : boolean;
    CurStartPos : TPoint;
    Parent      : TimgMemo;
  end;

  TmASB = array of TmScrollBar;

  TmPaintStruct = record
    hdc: LongWord;
    fErase: BOOL;
    rcPaint: TRect;
    fRestore: BOOL;
    fIncUpdate: BOOL;
    rgbReserved: array[0..31] of Byte;
  end;

  TmNewWndProc = function(h:hWnd;Msg,wParam,lParam:Longint):Longint;

var
  mASB    : TmASB;
  AMemo   : TAMemo;
  CurMemo : integer;

function mAddr(P:TmNewWndProc;ParamCount:integer):LongWord; external 'wrapcallbackaddr@{tmp}\CallbackCtrl.dll stdcall delayload';
function mGetWindowLong(hWnd: HWND; nIndex: Integer): Longint;  external 'GetWindowLongA@user32.dll stdcall';
function mInvalidateRect(hWnd: HWND; lpRect: Longint; bErase: BOOL): BOOL; external 'InvalidateRect@user32.dll stdcall';
function mGetAncestor(hwnd: HWND; gaFlags: UINT): HWND; external 'GetAncestor@user32.dll stdcall';
function mGetClienTRect(hWnd: HWND; var lpRect: TRect): BOOL; external 'GetClientRect@user32.dll stdcall';
function mGetDC(hWnd: HWND): LongWord; external 'GetDC@user32.dll stdcall'; 
function mCreateCompatibleDC(DC: LongWord): LongWord; external 'CreateCompatibleDC@gdi32.dll stdcall';
function mCreateCompatibleBitmap(DC: LongWord; Width, Height: Integer): HBITMAP; external 'CreateCompatibleBitmap@gdi32.dll stdcall';
function mReleaseDC(hWnd: HWND; hDC: LongWord): Integer; external 'ReleaseDC@user32.dll stdcall';
function mSelectObject(DC: LongWord; p2: LongWord): LongWord; external 'SelectObject@gdi32.dll stdcall';
function mGetWindowRect(hWnd: HWND; var lpRect: TRect): BOOL; external 'GetWindowRect@user32.dll stdcall';
function mScreenToClient(hWnd: HWND; var lpPoint: TPoint): BOOL; external 'ScreenToClient@user32.dll stdcall';
function mCallWindowProc(lpPrevWndFunc: Longint; hWnd: HWND; Msg: UINT; wParam: Longint; lParam: Longint): Longint; external 'CallWindowProcA@user32.dll stdcall';
function mBitBlt(DestDC: LongWord; X, Y, Width, Height: Integer; SrcDC: LongWord; XSrc, YSrc: Integer; Rop: DWORD): BOOL; external 'BitBlt@gdi32.dll stdcall';
function mDeleteObject(p1: LongWord): BOOL; external 'DeleteObject@gdi32.dll stdcall';
function mBeginPaint(hWnd: HWND; var lpPaint: TmPaintStruct): LongWord; external 'BeginPaint@user32.dll stdcall';
function mEndPaint(hWnd: HWND; const lpPaint: TmPaintStruct): BOOL; external 'EndPaint@user32.dll stdcall';
function mSetWindowLong(hWnd: HWND; nIndex: Integer; dwNewLong: Longint): Longint; external 'SetWindowLongA@user32.dll stdcall';
function mGetCursorPos(var lpPoint: TPoint): BOOL; external 'GetCursorPos@user32.dll stdcall';
function mDeleteDC(DC: LongWord): BOOL; external 'DeleteDC@gdi32.dll stdcall';
function mIntersectRect(var lprcDst: TRect; const lprcSrc1, lprcSrc2: TRect): BOOL; external 'IntersectRect@user32.dll stdcall';
function mDrawText(hDC: LongWord; lpString: PAnsiChar; nCount: Integer; var lpRect: TRect; uFormat: UINT): Integer; external 'DrawTextA@user32.dll stdcall';
function mSetBkMode(DC: LongWord; BkMode: Integer): Integer; external 'SetBkMode@gdi32.dll stdcall'; 
function mSetTextColor(DC: LongWord; Color: DWORD): DWORD; external 'SetTextColor@gdi32.dll stdcall'; 
function mGetSysColor(nIndex: Integer): DWORD;  external 'GetSysColor@user32.dll stdcall';

function msbGetIndByParent(Parent:TimgMemo):integer; forward;
procedure msbSetPosition(ind, pos:integer); forward;
function msbGetPosition(ind:integer):integer; forward;

function iif(f:boolean;p1,p2:integer):integer;
begin
  if f then Result:=p1 else Result:=p2;
end;

//*********************************************************************************************************
//*********************************************************************************************************
//*********************************************************************************************************
//обработка WM_MOUSEWHEEL
var
  MemoMSW:boolean;

procedure MemoPerformMouseWheel(ind:integer;wParam,lParam:Longint);
var
  kf,wp,sbind,y,dY:integer;
begin
  dY:=5;  //кол-во процентов смещения скроллбара
  if wParam>0 then kf:=1 else kf:=-1;
  wp:=(DWORD(wParam*kf) shr 16)*kf;    //идиотизм
  y:=0;
  if (wp>0) and (AMemo[ind].ChildPanel.Top<0) then begin //смещаем панель вниз (колесо крутили вперед)
    y:=dY*(wp div 120);
    if (AMemo[ind].ChildPanel.Top+y)>0 then 
      y:=-AMemo[ind].ChildPanel.Top;
  end;
  if (wp<0) then
  if ((AMemo[ind].ChildPanel.Top+AMemo[ind].ChildPanel.Height)>AMemo[ind].MainPanel.Height) then begin //смещаем панель вверх (колесо крутили назад)
    y:=dY*(wp div 120);  //здесь wp<0
    if (AMemo[ind].ChildPanel.Top+AMemo[ind].ChildPanel.Height+y)<AMemo[ind].MainPanel.Height then 
      y:=AMemo[ind].MainPanel.Height-(AMemo[ind].ChildPanel.Top+AMemo[ind].ChildPanel.Height);
  end;
  if y<>0 then begin
    sbind:=msbGetIndByParent(AMemo[ind]);
    msbSetPosition(sbind,msbGetPosition(sbind)-y);
  end;
end;

function CursorInMemo(ind:integer;p:TPoint):boolean;
var
  rc:TRect;
begin
  mScreenToClient(AMemo[ind].MainPanel.Handle,p);
  mGetClientRect(AMemo[ind].MainPanel.Handle,rc);
  Result:=False;
  if (p.X>=rc.Left) and (p.X<=rc.Right) and (p.Y>=rc.Top) and (p.Y<=rc.Bottom) then Result:=True;
end;

function mNewWFProc(h:hWnd;Msg,wParam,lParam:Longint):Longint;
var
  Pt : TPoint;
begin
  case Msg of
    $2: begin
      mSetWindowLong(h,-4,mGetWindowLong(h,-21));
      MemoMSW:=False;
      Result:=mCallWindowProc(mGetWindowLong(h,-21),h,Msg,wParam,lParam);
    end;
    $20A: begin
      if (CurMemo>=0) then begin
        mGetCursorPos(Pt);
        if AMemo[CurMemo].ImgPanel.Visible and CursorInMemo(CurMemo,Pt) then begin
          Result:=0;
          MemoPerformMouseWheel(CurMemo,wParam,lParam);
        end else Result:=mCallWindowProc(mGetWindowLong(h,-21),h,Msg,wParam,lParam);
      end else Result:=mCallWindowProc(mGetWindowLong(h,-21),h,Msg,wParam,lParam);
    end; 
    else Result:=mCallWindowProc(mGetWindowLong(h,-21),h,Msg,wParam,lParam);
  end;
end;

procedure mSetNewWFProc;
begin
  CurMemo:=-1;
  mSetWindowLong(WizardForm.Handle,-21,mGetWindowLong(WizardForm.Handle,-4));
  mSetWindowLong(WizardForm.Handle,-4,mAddr(@mNewWFProc,4));
  MemoMSW:=True;
end;

//*********************************************************************************************************
//*********************************************************************************************************
//*********************************************************************************************************
//скроллбар
procedure mSetVisibility(ci:integer; Value:boolean);
begin
  AMemo[ci].ImgPanel.Visible:=Value;
end;

function msbGetInd(h:HWND):integer;
var
  i:integer;
begin
  Result:=-1;
  for i:=0 to GetArrayLength(mASB)-1 do
    if (mASB[i].hBtn=h) or (mASB[i].hUpBtn=h) or (mASB[i].hDownBtn=h) then begin
      Result:=i;
      Break;
    end;
end;

function msbGetIndByParent(Parent:TimgMemo):integer;
var
  i:integer;
begin
  Result:=-1;
  for i:=0 to GetArrayLength(mASB)-1 do
    if mASB[i].Parent.ImgPanel.Handle=Parent.ImgPanel.Handle then begin
      Result:=i;
      Break;
    end;
end;

procedure msbBtnMouseDown(h:HWND);
var
  Left,Top,Width,Height:integer;
  ind : integer;
begin
  ind:=msbGetInd(h);
  if ind=-1 then Exit;
  mGetCursorPos(mASB[ind].CurStartPos);
  mScreenToClient(h,mASB[ind].CurStartPos);
  mASB[ind].IsMouseDown:=True;
end;

procedure msbBtnMouseUp(h:HWND);
var
  ind : integer;
begin
  ind:=msbGetInd(h);
  if ind=-1 then Exit;
  mASB[ind].IsMouseDown:=False;
end;

function msbGetPosition(ind:integer):integer;
var
  Left,Top,Width,Height:integer;
begin
  BtnGetPosition(mASB[ind].hbtn,Left,Top,Width,Height);
  Result:=(Top-mASB[ind].PosMin)*100 div (mASB[ind].PosMax-mASB[ind].PosMin);
end;

procedure msbSetPosition(ind, pos:integer);
var
  Left,Top,Width,Height:integer;
begin
  if pos<0 then pos:=0;
  if pos>100 then pos:=100;
  BtnGetPosition(mASB[ind].hbtn,Left,Top,Width,Height);
  Top:=mASB[ind].PosMin+(pos*(mASB[ind].PosMax-mASB[ind].PosMin) div 100);
  BtnSetPosition(mASB[ind].hbtn,Left,Top,Width,Height);
  BtnRefresh(mASB[ind].hbtn);
  mASB[ind].Parent.MainPanel.Refresh;
  mASB[ind].Parent.ChildPanel.Refresh;
end;

function msbBtnProc(h:hWnd;Msg,wParam,lParam:Longint):Longint;
var
  Left,Top,Width,Height:integer;
  ind : integer;
  p     : TPoint;
  Parent: HWND;
begin
  ind:=msbGetInd(h);
  if ind=-1 then begin
    Result:=0;
    Exit;
  end;
  if Msg=$2 then mSetWindowLong(h,-4,mASB[ind].op);
  Result:=mCallWindowProc(mASB[ind].op,h,Msg,wParam,lParam);
  case Msg of
    $47: mASB[ind].Parent.ChildPanel.Top:=(mASB[ind].Parent.MainPanel.Height-mASB[ind].Parent.ChildPanel.Height)*msbGetPosition(ind) div 100;
    $200: if mASB[ind].IsMouseDown then begin
      Parent:=mGetAncestor(h,1);
      mGetCursorPos(p);
      mScreenToClient(Parent,p);
      BtnGetPosition(h,Left,Top,Width,Height);
      Top:=p.y-mASB[ind].CurStartPos.Y;
      if Top<mASB[ind].PosMin then Top:=mASB[ind].PosMin;
      if Top>mASB[ind].PosMax then Top:=mASB[ind].PosMax;
      BtnSetPosition(h,Left,Top,Width,Height);
      BtnRefresh(h);
      mASB[ind].Parent.MainPanel.Refresh;
      mASB[ind].Parent.ChildPanel.Refresh;
    end;
  end;
end;

procedure msbUpBtnClick(h:HWND);
var
  pos,ind,dX : integer;
begin
  dX:=5;
  ind:=msbGetInd(h);
  if ind=-1 then Exit;
  pos:=msbGetPosition(ind);
  if pos>0 then msbSetPosition(ind,iif((pos-dX)<0,0,pos-dX));
end;

procedure msbDownBtnClick(h:HWND);
var
  pos,ind,dX : integer;
begin
  dX:=5;
  ind:=msbGetInd(h);
  if ind=-1 then Exit;
  pos:=msbGetPosition(ind);
  if pos<100 then msbSetPosition(ind,iif((pos+dX)>100,100,pos+dX));
end;

function mScrollBarCreate(Parent: TimgMemo; sbWidth:integer; BtnWidth, BtnHeight, BtnShadowWidth:integer):TmScrollBar;
var
  bl:integer;
begin
  Result.Parent:=Parent;
  Result.PosMin:={#sbUpDownBtnHeight};
  Result.PosMax:=Parent.MainPanel.Height-BtnHeight-{#sbUpDownBtnHeight};
  Result.IsMouseDown:=False; 
  bl:=Parent.MainPanel.Width-sbWidth+((sbWidth div 2)-(BtnWidth div 2));
  Result.hbtn:=BtnCreate(Parent.MainPanel.Handle,bl,Result.PosMin,BtnWidth,BtnHeight,'{#ScrollBarBtnImg}',BtnShadowWidth,False);
  BtnSetEvent(Result.hbtn,BtnMouseDownEventID,WrapBtnCallback(@msbBtnMouseDown,1));
  BtnSetEvent(Result.hbtn,BtnMouseUpEventID,WrapBtnCallback(@msbBtnMouseUp,1));
  Result.op:=mSetWindowLong(Result.hbtn,-4,mAddr(@msbBtnProc,4));
  BtnRefresh(Result.hbtn);

  Result.hUpBtn:=BtnCreate(Parent.MainPanel.Handle,bl,0,BtnWidth,{#sbUpDownBtnHeight},'{#ScrollBarUpBtnImg}',0,False);
  BtnSetEvent(Result.hUpBtn,BtnClickEventID,WrapBtnCallback(@msbUpBtnClick,1));

  Result.hDownBtn:=BtnCreate(Parent.MainPanel.Handle,bl,Parent.MainPanel.Height-{#sbUpDownBtnHeight},BtnWidth,{#sbUpDownBtnHeight},'{#ScrollBarDownBtnImg}',0,False);
  BtnSetEvent(Result.hDownBtn,BtnClickEventID,WrapBtnCallback(@msbDownBtnClick,1));
end;

//*********************************************************************************************************
//*********************************************************************************************************
//*********************************************************************************************************
//чеклистбокс
function GetMemoByPanel(h:HWND):integer;
var
  i:integer;
begin
  Result:=-1;
  for i:=0 to GetArrayLength(AMemo)-1 do 
    if AMemo[i].ChildPanel.Handle=h then begin
      Result:=i;
      Break;
    end;
end; 

function mNewPanelProc(h:HWND;Msg,wParam,lParam:Longint):Longint; 
var
  MemDC,DC:LongWord;
  hParent:HWND;
  rp,r,rs,ir:TRect;
  hBMP:HBITMAP;
  ps:TmPaintStruct;
  p:TPoint;
  mi:integer;
  Color:Longint;
begin
  case Msg of
    $200: begin
      if (CurMemo=-1) or (AMemo[CurMemo].ChildPanel.Handle<>h) then CurMemo:=GetMemoByPanel(h);
      Result:=mCallWindowProc(mGetWindowLong(h,-21),h,Msg,wParam,lParam);
    end;
    $2: begin
      mSetWindowLong(h,-4,mGetWindowLong(h,-21));
      Result:=mCallWindowProc(mGetWindowLong(h,-21),h,Msg,wParam,lParam);
    end;
    $3,$5,$47,$46: begin
      Result:=mCallWindowProc(mGetWindowLong(h,-21),h,Msg,wParam,lParam);
      mInvalidateRect(h,0,False);
    end;
    $14: Result:=1;
    $F: begin
      Result:=0;
      hParent:=mGetAncestor(h,1);
      mGetClientRect(hParent,rp);
      DC:=mGetDC(hParent);
      MemDC:=mCreateCompatibleDC(DC);
      hBmp:=mCreateCompatibleBitmap(DC,rp.Right,rp.Bottom);
      mReleaseDC(hParent,DC);
      mSelectObject(MemDC,hBmp);

      SendMessage(hParent,$14,Longint(MemDC),0);
      mCallWindowProc(mGetWindowLong(hParent,-4),hParent,$F,Longint(MemDC),0);

      mGetWindowRect(h,rs);
      p.X:=rs.Left;
      p.Y:=rs.Top;
      mScreenToClient(hParent,p);
      rs.Left:=p.X;
      rs.Top:=p.Y;
      p.X:=rs.Right;
      p.Y:=rs.Bottom;
      mScreenToClient(hParent,p);
      rs.Right:=p.X;
      rs.Bottom:=p.Y;

      mi:=GetMemoByPanel(h);
      if (mi<>-1) and (AMemo[mi].ChildPanel.Handle=h) and (Length(AMemo[mi].Text)>0) then begin
        mSetBkMode(MemDC,1);
        mSelectObject(MemDC,AMemo[mi].ChildPanel.Font.Handle);
        if AMemo[mi].ChildPanel.Font.Color<0 then Color:=mGetSysColor(AMemo[mi].ChildPanel.Font.Color and $000000FF) 
          else Color:=AMemo[mi].ChildPanel.Font.Color;
        mSetTextColor(MemDC,Color);
        mDrawText(MemDC,PAnsiChar(AMemo[mi].Text),Length(AMemo[mi].Text),rs,$10);
      end;

      if wParam=0 then begin  
        DC:=mBeginPaint(h,ps);
        mBitBlt(Longint(DC),ps.rcPaint.Left,ps.rcPaint.Top,ps.rcPaint.Right-ps.rcPaint.Left,ps.rcPaint.Bottom-ps.rcPaint.Top, MemDC,rs.Left+ps.rcPaint.Left,rs.Top+ps.rcPaint.Top,$CC0020);
        mEndPaint(h,ps);
      end else begin
        mInterSectRect(ir,rp,rs);
        mBitBlt(LongWord(wParam),iif(rs.Left>0,0,-rs.Left),iif(rs.Top>0,0,-rs.Top),ir.Right-ir.Left,ir.Bottom-ir.Top,MemDC,ir.Left,ir.Top,$CC0020);
      end;

      mDeleteObject(hBmp);
      mDeleteDC(MemDC);
    end; 
    else Result:=mCallWindowProc(mGetWindowLong(h,-21),h,Msg,wParam,lParam);
  end;
end;

procedure msbSetVisibility(sbind:integer;Value:boolean);
begin                   
  ImgSetVisibility(mASB[sbind].bkgimg,Value);
  ImgApplyChanges(mASB[sbind].Parent.ImgPanel.Handle);
  BtnSetVisibility(mASB[sbind].hbtn,Value);
  BtnSetVisibility(mASB[sbind].hUpBtn,Value);
  BtnSetVisibility(mASB[sbind].hDownBtn,Value);
end;

function MemoCreate(Parent:TWinControl; Left,Top,Width,Height:integer):integer;
var
  l:integer;
begin
  if not MemoMSW then mSetNewWFProc; 

  l:=GetArrayLength(AMemo);
  SetArrayLength(AMemo,l+1);
  Result:=l;

  AMemo[l].ImgPanel:=TPanel.Create(Parent);
  AMemo[l].ImgPanel.Parent:=Parent;
  AMemo[l].ImgPanel.SetBounds(Left,Top,Width,Height);
  AMemo[l].ImgPanel.BevelOuter:=bsNone;
  mSetWindowLong(AMemo[l].ImgPanel.Handle,-21,mGetWindowLong(AMemo[l].ImgPanel.Handle,-4));
  mSetWindowLong(AMemo[l].ImgPanel.Handle,-4,mAddr(@mNewPanelProc,4));
  AMemo[l].FrameImg:=ImgLoad(AMemo[l].ImgPanel.Handle,'{#ScrollBarFrameImg}',0,0,Width,Height,True,False);

  AMemo[l].MainPanel:=TPanel.Create(AMemo[l].ImgPanel);
  AMemo[l].MainPanel.Parent:=AMemo[l].ImgPanel;
  AMemo[l].MainPanel.SetBounds({#FrameIndent},{#FrameIndent},Width-{#FrameIndent}*2,Height-{#FrameIndent}*2);
  AMemo[l].MainPanel.BevelOuter:=bsNone;
  mSetWindowLong(AMemo[l].MainPanel.Handle,-21,mGetWindowLong(AMemo[l].MainPanel.Handle,-4));
  mSetWindowLong(AMemo[l].MainPanel.Handle,-4,mAddr(@mNewPanelProc,4));

  AMemo[l].ChildPanel:=TPanel.Create(AMemo[l].MainPanel);
  AMemo[l].ChildPanel.Parent:=AMemo[l].MainPanel;
  AMemo[l].ChildPanel.SetBounds(0,0,Width-{#FrameIndent}*2-{#sbBtnWidth},0);  
  AMemo[l].ChildPanel.BevelOuter:=bsNone;
  AMemo[l].ChildPanel.Font.Color:=StrToInt('{#FontColor}');
  AMemo[l].ChildPanel.Font.Size:={#FontSize};
  AMemo[l].ChildPanel.Font.Name:='{#FontName}';

  mSetWindowLong(AMemo[l].ChildPanel.Handle,-21,mGetWindowLong(AMemo[l].ChildPanel.Handle,-4));
  mSetWindowLong(AMemo[l].ChildPanel.Handle,-4,mAddr(@mNewPanelProc,4));
 
  l:=GetArrayLength(mASB)
  SetArrayLength(mASB,l+1);
  mASB[l]:=mScrollBarCreate(AMemo[l],{#sbBtnWidth},{#sbBtnWidth},{#sbBtnHeight},0);
  mASB[l].bkgimg:=ImgLoad(AMemo[l].ImgPanel.Handle,'{#ScrollBarBkgImg}',Width-{#FrameIndent}-{#sbBtnWidth},{#FrameIndent},{#sbBtnWidth},Height-{#FrameIndent}*2,True,False);
  msbSetVisibility(l,False);
end;

procedure MemoLoadFromFile(mi:integer;FileName:AnsiString);
var
  r:TRect;
  DC:Longword;
  h:HWND;
  sbind,hh:integer;
begin
  if not LoadStringFromFile(FileName,AMemo[mi].Text) then Exit;
  SetLength(AMemo[mi].Text,3000);

  //SaveStringToFile('_'+FileName,AMemo[mi].Text,False);

  h:=AMemo[mi].ChildPanel.Handle;
  mGetClientRect(h,r);
  DC:=mGetDC(h);
  mSelectObject(DC,AMemo[mi].ChildPanel.Font.Handle);
  hh:=mDrawText(DC,PAnsiChar(AMemo[mi].Text),Length(AMemo[mi].Text),r,$410);
  mReleaseDC(h,DC);

  if hh=0 then begin
    AMemo[mi].Text:='';
    Exit;
  end;
  AMemo[mi].ChildPanel.Height:=hh;
  sbind:=msbGetIndByParent(AMemo[mi]);
  if sbind<>-1 then msbSetVisibility(sbind,AMemo[mi].ChildPanel.Height>AMemo[mi].MainPanel.Height);
  AMemo[mi].ChildPanel.Refresh;

end;

procedure InitializeWizard;
var
  m:integer;
  tt:AnsiString;
  f:boolean;
begin
  ExtractTemporaryFile('botva2.dll');
  ExtractTemporaryFile('CallbackCtrl.dll');

  with WizardForm do begin
    Width:=Width+150;
    InnerNotebook.Hide;
    OuterNotebook.Hide;
    Bevel.Hide;
  end;

  ImgLoad(WizardForm.Handle,'nfs.jpg',0,0,WizardForm.ClientWidth,WizardForm.ClientHeight,True,True);
  ImgApplyChanges(WizardForm.Handle);

  m:=MemoCreate(WizardForm,30,30,600,250);
  if FileExists(ExpandConstant('{src}\111.txt')) then MemoLoadFromFile(m,'111.txt')
    else MsgBox('Положи рядом с сетапом 111.txt в ANSI кодировке.'+#13#10+'Текст обрезается до 3000 символов.' + #13#10 + 'Хороший пример того, что скроллбоксы очень медленно скролят большие объекты.', mbInformation, MB_OK);

end;        

procedure DeinitializeSetup;
begin
  gdipShutdown;
  //WizardForm надо обязательно прибить, иначе ошибка вылезет. 
  //или писать ручное прибитие чеклистбоксов и вызывать его здесь
  WizardForm.Free;   
end;