unit liteui;

{ LiteUI.pas - A unit for simple GUI without the huge "forms" unit.
  By Nicholas Sherlock - http://www.sherlocksoftware.org }

interface

uses SysUtils, windows, messages, commctrl, contnrs, ProcedureToMethod;

{Certain windows messages are sent to the parent of the control who
 would ideally handle them in an OO model. This is a major pain in
 the ass. Here, we translate those messages into ones that we handle
 specially}
const CM_BASE = WM_USER + 100;
  CM_COMMAND = CM_BASE;

const CLASS_LITEUI_LABEL = 'LiteUI_Label';
CLASS_LITEUI_PANEL = 'LiteUI_Panel';

type
  TLiteHandleControl = class
  private
    function IncomingWndproc(h: hwnd; m: cardinal; w: wparam; l: lparam): LRESULT; stdcall;
    function GetHandle: HWND;
  protected
    fhandle, fparent: hwnd;
    fstub, foldwndproc: pointer;
    procedure CreateHandle; virtual; abstract;
  public
    procedure DefaultHandler(var Message); override;
    property Handle: HWND read gethandle;
    constructor create(parent: HWND); virtual;
    destructor Destroy; override;
  end;

  TLiteNotifyEvent = procedure(sender: TObject) of object;

  TLiteFont = class
  private
    fhandle: HFONT;
    fsize: integer;
    fname: string;
    fonchange: TLiteNotifyEvent;
    function GetHandle: HFONT;
    procedure SetSize(value: integer);
    procedure SetName(const value: string);
    procedure RebuildHandle;
  public
    property handle: hfont read gethandle;
    property size: integer read fsize write setsize;
    property name: string read fname write setname;
    property OnChange: TLiteNotifyevent read fonchange write fonchange;
    constructor create;
    destructor Destroy; override;
  end;

  TLiteComponent = class(TLiteHandleControl)
  private
    fParentFont: boolean;
    fChildren: tobjectlist;
    fVisible: boolean;
    procedure SetLeft(value: integer);
    procedure SetTop(value: integer);
    function GetTop: integer;
    function GetLeft: integer;
    function GetHeight: integer;
    function GetWidth: integer;
    procedure SetWidth(value: integer);
    procedure SetHeight(value: integer);
    procedure SetParentFont(value: boolean);
    function GetVisible: boolean;
    procedure SetVisible(value: boolean);
    function GetBoundsRect: Trect;
  protected
    fFont: TLiteFont;
    function FindComponent(handle: hwnd): TLiteComponent;
    procedure FontChanged(sender: tobject); virtual;
    procedure WMCommand(var message: TWMCommand); message WM_COMMAND;
    procedure WMGetFont(var message:TWMGetFont); message WM_GETFONT;
  public
    procedure Invalidate;
    procedure Update;
    procedure AddChild(child: TLiteComponent);
    property Font: TLiteFont read ffont write ffont;
    property Left: integer read getleft write setleft;
    property Top: integer read gettop write settop;
    property Width: integer read getwidth write setwidth;
    property Height: integer read getheight write setheight;
    property ParentFont: boolean read fparentfont write setparentfont;
    property BoundsRect: TRect read getboundsrect;
    property Visible: boolean read GetVisible write SetVisible;
    constructor create(parent: HWND); override;
    destructor Destroy; override;
  end;

  TNotifyEvent = procedure(sender: TObject) of object;

  TLiteButton = class(TLiteComponent)
  private
    fOnClick: TNotifyEvent;
    fCaption: string;
    procedure SetCaption(const Value: string);
  protected
    procedure CreateHandle; override;
    procedure CNCommand(var msg: TWMCommand); message CM_COMMAND;
  public
    property OnClick: TNotifyEvent read fOnClick write fOnClick;
    property Caption: string read fCaption write SetCaption;
  end;

  TLitePanel = class(TLiteComponent)
  protected
    procedure CreateHandle; override;
  end;

  TLiteLabelAlign = (laLeft, laRight, laMiddle);
  TLiteLabel = class(TLiteComponent)
  private
    fAutoSize: boolean;
    fCaption: string;
    fAlign: TLiteLabelAlign;
    procedure resize;
    function GetCaption: string;
    procedure SetCaption(const value: string);
    procedure SetAutoSize(value: boolean);
  protected
    procedure FontChanged(sender: tobject); override;
    procedure WMPaint(var message: TWMPaint); message wm_paint;
    procedure CreateHandle; override;
  public
    constructor create(parent: hwnd); override;
    destructor Destroy; override;
    property AutoSize: boolean read fautosize write setautosize;
    property Caption: string read getcaption write setcaption;
    property Align: TLiteLabelAlign read falign write falign;
  end;

  TLiteProgress = class(TLiteComponent)
  private
    fsmooth: Boolean;
    fMarquee: boolean;
    fPosition: integer;

    procedure setsmooth(value: boolean);

    procedure setmax(value: integer);
    procedure setmin(value: integer);
    procedure setPosition(value: integer);

    function getmax: integer;
    function getmin: integer;
    function getPosition: integer;
    procedure SetMarquee(const Value: boolean);
  protected
    procedure CreateHandle; override;
  public
    property Min: integer read getmin write setmin;
    property Max: integer read getmax write setmax;
    property Position: integer read getposition write setposition;
    property Smooth: boolean read fsmooth write setsmooth;
    property Marquee: boolean read fMarquee write SetMarquee;
    constructor create(parent: hwnd); override;
    destructor Destroy; override;
  end;

procedure liteui_init;

procedure ShowMessage(const message: string);

procedure ProcessMessages;
procedure HandleMessage;

var Terminated: boolean;

implementation

type twindowproc = function(h: HWND; m: cardinal; w: wparam; l: LPARAM): LRESULT; stdcall;

var labelclass,panelclass: ATOM;

procedure ProcessMessages;
var msg: tagMSG;
begin
  while (not terminated) and PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do begin
    if msg.message = WM_QUIT then begin
      terminated := True;
      PostQuitMessage(0);
    end else begin
      TranslateMessage(Msg);
      DispatchMessage(Msg);
    end;
  end;
end;

procedure HandleMessage;
var msg: tagMSG;
begin
  if GetMessage(Msg, 0, 0, 0) then begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end else begin
    terminated := True;
    PostQuitMessage(0);
  end;
end;

procedure ShowMessage(const message: string);
begin
  MessageBox(0, pchar(message), 'Message', MB_OK);
end;

function rect(left, top, right, bottom: Integer): trect;
begin
  result.Left := left;
  result.top := top;
  result.right := right;
  result.bottom := bottom;
end;

procedure liteui_init;
var icc: tagINITCOMMONCONTROLSEX;
  wndclass: tagWNDCLASSEX;
begin
  icc.dwSize := sizeof(icc);
  icc.dwICC := ICC_PROGRESS_CLASS;
  InitCommonControlsEx(icc);

  fillchar(wndclass, sizeof(wndclass), 0);
  wndclass.cbSize := sizeof(wndclass);
//  wndclass.style := CS_VREDRAW or CS_HREDRAW;
  wndclass.lpfnWndProc := @defwindowproc;
  wndclass.hInstance := hInstance;
  wndclass.hbrBackground := 0;
  wndclass.lpszClassName := CLASS_LITEUI_LABEL;
  labelclass := RegisterClassEx(wndclass);
  if labelclass = 0 then showmessage('Liteui_Init: Error code ' + inttostr(getlasterror));

  fillchar(wndclass, sizeof(wndclass), 0);
  wndclass.cbSize := sizeof(wndclass);
  wndclass.lpfnWndProc := @defwindowproc;
  wndclass.hInstance := hInstance;
  wndclass.hbrBackground := COLOR_BTNFACE + 1;
  wndclass.lpszClassName := CLASS_LITEUI_PANEL;
  panelclass := RegisterClassEx(wndclass);
  if panelclass = 0 then showmessage('Liteui_Init: Error code ' + inttostr(getlasterror));

end;

procedure TLiteProgress.setmax(value: integer);
begin
  sendMessage(fhandle, PBM_SETRANGE32, min, value);
end;

procedure TLiteProgress.setmin(value: integer);
begin
  sendMessage(fhandle, PBM_SETRANGE32, value, max);
end;

procedure TLiteProgress.setposition(value: integer);
begin
  if fPosition <> value then begin
    fPosition := value;
    sendMessage(fhandle, PBM_SETPOS, value, 0);
  end;
end;

function TLiteProgress.getmax: integer;
begin
  result := sendmessage(fhandle, Pbm_getrange, lparam(False), wparam(nil));
end;

function TLiteProgress.getmin: integer;
begin
  result := sendmessage(fhandle, Pbm_getrange, lparam(True), wparam(nil));
end;

function TLiteProgress.getposition: integer;
begin
  result := fPosition;
end;

procedure TLiteProgress.SetMarquee(const Value: boolean);
begin
  if fMarquee <> value then begin
    fMarquee := Value;

    if fMarquee then begin
      SetWindowLong(fHandle, GWL_STYLE,
        GetWindowLong(fHandle, GWL_STYLE) or PBS_MARQUEE);
      PostMessage(fHandle, PBM_SETMARQUEE, 1, 50);
    end else begin
      SetWindowLong(fHandle, GWL_STYLE,
        GetWindowLong(fHandle, GWL_STYLE) and not PBS_MARQUEE);
      SendMessage(fhandle, PBM_SETPOS, Position, 0);
    end;
  end;
end;

procedure TLiteProgress.CreateHandle;
var flags: cardinal;
begin
  if fhandle <> 0 then
    DestroyWindow(fhandle);

  flags := WS_CHILD;
  if visible then
    flags := flags or WS_VISIBLE;
  if smooth then
    flags := flags or PBS_SMOOTH;
  if marquee then
    flags := flags or PBS_MARQUEE;

  fhandle := CreateWindowEx(0, PROGRESS_CLASS, nil, flags, 0, 0, 0, 0, fparent, 0, hinstance, nil);

  if marquee then
    PostMessage(fHandle, PBM_SETMARQUEE, 1, 50)
  else
    PostMessage(fHandle, PBM_SETMARQUEE, 0, 0);
end;

procedure TLiteProgress.setsmooth(value: boolean);
begin
  if fsmooth <> value then begin
    fsmooth := value;
    CreateHandle;
  end;
end;

constructor TLiteProgress.create(parent: hwnd);
begin
  fMarquee := false;
  fsmooth := false;
  inherited;
  width := 150;
  height := 20;
end;

destructor TLiteProgress.destroy;
begin
  inherited;
end;

procedure TLiteFont.rebuildhandle;
begin
  if fhandle <> 0 then
    DeleteObject(fhandle);

  fhandle := CreateFont(fsize, 0,
    0, 0, //orientation and escapement
    FW_NORMAL,
    0, //not italic
    0, //not underline
    0, //not strikeout
    ANSI_CHARSET,
    OUT_DEFAULT_PRECIS,
    CLIP_DEFAULT_PRECIS,
    DEFAULT_QUALITY,
    DEFAULT_PITCH,
    pchar(fname));

  if assigned(onchange) then onchange(self);
end;

function TLiteFont.gethandle: HFONT;
begin
  if fhandle = 0 then rebuildhandle;
  result := fhandle;
end;

procedure TLiteFont.setsize(value: integer);
begin
  fsize := value;
  rebuildhandle;
end;

procedure TLiteFont.setname(const value: string);
begin
  fname := value;
  rebuildhandle;
end;

constructor TLiteFont.create;
begin
  fhandle := 0;
  fsize := 12;
  fname := 'Arial';
  rebuildhandle;
end;

destructor TLiteFont.destroy;
begin
  if fhandle <> 0 then
    DeleteObject(fhandle);
  inherited;
end;

procedure tlitepanel.createhandle;
begin
  fHandle := CreateWindow(CLASS_LITEUI_PANEL,
  nil,
  WS_CHILD or WS_VISIBLE, 0, 0, 0, 0, fparent, 0, hInstance, nil);
end;

procedure TLiteButton.CreateHandle;
begin
  fHandle := CreateWindow(
    'BUTTON',
    'Button',
    WS_VISIBLE or WS_CHILD or BS_PUSHBUTTON,
    0, //x
    0, //y
    75, // button width
    25, // button height
    fParent,
    0,
    hInstance,
    nil);
end;

constructor TLiteHandleControl.create(parent: HWND);
begin
  fparent := parent;
  fhandle := 0;
  CreateHandle;
  foldwndproc := pointer(GetWindowLong(fhandle, GWL_WNDPROC));

  fstub := CreateStub(Self, @TLiteHandleControl.incomingwndproc);
  SetWindowLong(fhandle, GWL_WNDPROC, integer(fstub));
end;

destructor TLiteHandleControl.destroy;
begin
  if fhandle <> 0 then
    DestroyWindow(fhandle);
  DisposeStub(fstub);
  inherited;
end;

procedure TLiteHandleControl.DefaultHandler(var Message);
begin
  tmessage(message).result := CallWindowProc(foldwndproc, fhandle, tmessage(message).Msg, tmessage(message).WParam, tmessage(message).LParam);
end;

function TLiteHandleControl.gethandle: HWND;
begin
  result := fhandle;
end;

function TLiteHandleControl.IncomingWndproc(h: hwnd; m: cardinal; w: wparam; l: lparam): LRESULT;
var message: TMessage;
begin
  message.Msg := m;
  message.lparam := l;
  message.WParam := w;
  message.Result := 0;

  Dispatch(message);

  result := message.Result;
end;

procedure TLiteComponent.SetParentFont(value: boolean);
begin
  fparentfont := value;

  if value then begin
     PostMessage(fHandle, WM_SetFont, SendMessage(fParent, WM_GetFont, 0, 0), 1);
  end else begin
    fontchanged(fFont);
  end;
end;

procedure TLiteComponent.Update;
begin
  Invalidate;
  UpdateWindow(fhandle);
end;

procedure TLiteComponent.WMCommand(var message: TWMCommand);
var msg: TWMCommand;
begin
  msg := message;
  msg.Msg := CM_COMMAND;
  FindComponent(message.Ctl).Dispatch(msg);
end;

procedure TLiteComponent.WMGetFont(var message: TWMGetFont);
begin
 if fParentFont then
  message.result:=SendMessage(fParent, WM_GETFONT, 0, 0)
 else
  message.result:=fFont.handle;
end;

procedure TLiteComponent.Invalidate;
begin
  InvalidateRect(fhandle, nil, false);
end;

function TLiteComponent.FindComponent(handle: hwnd): TLiteComponent;
var
  I: Integer;
begin
  for I := 0 to fChildren.Count - 1 do
    if TLiteComponent(fchildren[i]).Handle = handle then begin
      result := TLiteComponent(fchildren[i]);
      exit;
    end;
  result := nil;
end;

procedure TLiteComponent.FontChanged(sender: tobject);
begin
  if (not fParentFont) and (fhandle <> 0) then
    PostMessage(fhandle, WM_SetFont, wparam(TLiteFont(sender).handle), 1);
end;

procedure TLiteComponent.AddChild(child: TLiteComponent);
begin
  fchildren.add(Child);
end;

constructor TLiteComponent.create(parent: HWND);
begin
  fVisible := true;
  ffont := TLiteFont.create;
  ffont.OnChange := fontchanged;
  fchildren := tobjectlist.create;

  inherited;

  parentfont := true;
end;

destructor TLiteComponent.destroy;
begin
  inherited;

  ffont.free;
  fchildren.free;
end;

procedure TLiteComponent.setleft(value: integer);
begin
  setwindowpos(fhandle, 0, value, top, 0, 0, SWP_NOZORDER or SWP_NOSIZE or SWP_NOACTIVATE);
end;

procedure TLiteComponent.settop(value: integer);
begin
  setwindowpos(fhandle, 0, left, value, 0, 0, SWP_NOZORDER or SWP_NOSIZE or SWP_NOACTIVATE);
end;

procedure TLiteComponent.SetVisible(value: boolean);
var flags: cardinal;
begin
  if fVisible <> value then begin
    fVisible := value;

    if handle <> 0 then begin
      flags := SWP_NOSIZE or SWP_NOMOVE or SWP_NOZORDER or SWP_NOACTIVATE;

      if fVisible then
        flags := flags or SWP_SHOWWINDOW
      else
        flags := flags or SWP_HIDEWINDOW;

      SetWindowPos(Handle, 0, 0, 0, 0, 0, flags);
    end;
  end;
end;

function TLiteComponent.gettop: integer;
begin
  result := boundsrect.top;
end;

function TLiteComponent.GetVisible: boolean;
begin
  result := fVisible;
end;

function TLiteComponent.getleft: integer;
begin
  result := BoundsRect.Left;
end;

function TLiteComponent.getheight: integer;
var r: TRect;
begin
  r := boundsrect;
  result := r.bottom - r.top;
end;

function TLiteComponent.getwidth: integer;
var r: TRect;
begin
  r := boundsrect;
  result := r.right - r.left;
end;

function TLiteComponent.getboundsrect: TRect;
begin
  GetWindowRect(fhandle, result);
  ScreenToClient(fparent, result.TopLeft);
  ScreenToClient(fparent, result.BottomRight);
  Inc(result.bottomright.x);
  Inc(result.bottomright.y);
end;

procedure TLiteComponent.SetWidth(value: integer);
begin
  setwindowpos(fhandle, 0, 0, 0, value, height, SWP_NOZORDER or SWP_NOMOVE);
end;

procedure TLiteComponent.SetHeight(value: integer);
begin
  setwindowpos(fhandle, 0, 0, 0, width, value, SWP_NOZORDER or SWP_NOMOVE);
end;

procedure TLiteLabel.SetAutosize(value: boolean);
begin
  if fautosize <> value then begin
    fautosize := value;
    resize;
  end;
end;

procedure TLiteLabel.resize;
var s: size;
  dc: hdc;
  metrics: TTextMetric;
begin
  if fAutoSize then begin
    dc := GetDC(fhandle);
    try
      SelectObject(dc, SendMessage(fHandle, WM_GetFont, 0, 0));
      GetTextMetrics(dc, metrics);

      GetTextExtentPoint32(dc, pchar(caption), length(caption), s);
      if (width<>s.cx) or (height<>metrics.tmHeight) then begin
        width := s.cx;
        height := metrics.tmHeight;
      end;
    finally
      ReleaseDC(fhandle, dc);
    end;
  end;
end;

procedure TLiteLabel.fontchanged(sender: tobject);
begin
  inherited;
  resize;
end;

function TLiteLabel.getcaption: string;
begin
  result := fcaption;
end;

procedure TLiteLabel.setcaption(const value: string);
begin
  if fCaption<>value then begin
  fcaption := value;
  resize;
  invalidate;
  end;
end;

procedure TLiteLabel.WMPaint(var message: TWMPaint);
const clred = $000000FF;
var paint: tagPAINTSTRUCT;
  s: SIZE;
begin
  beginpaint(fhandle, paint);
  try
    if paint.fErase then
      FillRect(paint.hdc, rect(0, 0, width, height), COLOR_BTNFACE + 1);

    SetBkMode(paint.hdc, TRANSPARENT);

    if fparentfont then
      SelectObject(paint.hdc, sendmessage(fparent, wm_getfont, 0, 0)) else
      SelectObject(paint.hdc, ffont.handle);

    GetTextExtentPoint32(paint.hdc, pchar(caption), length(caption), s);

    case align of
      laLeft, laMiddle: TextOut(paint.hdc, 0, 0, pchar(caption), length(caption));
      laRight: TextOut(paint.hdc, width - s.cx - 1, 0, pchar(caption), length(caption));
    end;
  finally
    endpaint(fhandle, paint);
  end;
  message.result := 0; //we have processed this message
end;

procedure TLiteLabel.CreateHandle;
begin
  fhandle := createwindow(CLASS_LITEUI_LABEL, nil {No caption yet}, WS_CHILD or WS_VISIBLE, 0, 0, 0 {no x}, 0 {no y}, fparent, 0, hinstance, nil);
  if fhandle = 0 then
    showmessage('TLiteLabel::CreateHandle - ' + SysErrorMessage(GetLastError));
end;

constructor TLiteLabel.create(parent: hwnd);
begin
  inherited create(parent);

  autosize:=true;
//  PostMessage(fhandle, WM_SETFONT, sendmessage(fparent, wm_getfont, 0, 0), 0);
end;

destructor TLiteLabel.destroy;
begin
  inherited;
end;

procedure TLiteButton.SetCaption(const Value: string);
begin
  fCaption := Value;
  SetWindowText(fHandle, pchar(value));
end;

procedure TLiteButton.CNCommand(var msg: TWMCommand);
begin
  OnClick(self);
end;

end.

