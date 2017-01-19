; -- Example.iss --
; restools
; http://restools.hanzify.org
; 插件名：webctrl.dll
; 插件功能：网络连接检测，创建网页页面。
; 插件大小：9 KB

; V2 增强操作函数，可以同时创建多达 256 个 Web 窗口。
; V2 例子中演示了建立一个小型浏览器以体现该版本中的函数如何使用。比起 V1 重点在于能同时创建多个 Web 窗口。
; V2.1 删除 InitWebCtrl 和 UninitWebCtrl 函数, 增加 FreeAllWebWnd. 改善某些情况下不能卸载插件的问题.

#include "WebCtrl.Ish"

[Setup]
AppName=My Application
AppVersion=1.5
DefaultDirName={pf}\My Application
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "file.htm"; Flags: dontcopy
Source: "wizard.htm"; Flags: dontcopy
Source: "1.gif"; Flags: dontcopy
Source: "2.gif"; Flags: dontcopy
Source: "3.gif"; Flags: dontcopy

[code]
function GetSystemMetrics(nIndex: Integer): Integer; external 'GetSystemMetrics@user32.dll stdcall';
function GetWindowLong(Wnd: HWnd; Index: Integer): Longint; external 'GetWindowLong{#A}@user32.dll stdcall';
function SetWindowLong(Wnd: HWnd; Index: Integer; NewLong: Longint): Longint; external 'SetWindowLong{#A}@user32.dll stdcall';
////////////////////////////////////////////////////////////////////////////////////

const
  SM_CXSCREEN = 0;
  SM_CYSCREEN = 1;
  
  WS_EX_CLIENTEDGE = $200;
  GWL_EXSTYLE = -20;

var
  UrlPage, HtmlPage, HtmlTextPage: TWizardPage;
  WebHWND1, WebHWND2, WebHWND3, WebHWND4: HWND;
  WebHWND_Browser: HWND;
  Form_Browser: TForm;
  AddrEdit: TNewEdit;
  GoBtn: TNewButton;

function InitializeSetup(): Boolean;
begin
  PDir('{#WebCtrl_Dll}');

  WebHWND1 := 0;
  WebHWND2 := 0;
  WebHWND3 := 0;
  WebHWND4 := 0;
  Result := True;
end;

procedure DeinitializeSetup();
begin
  WizardForm.Hide;
  FreeAllWebWnd;
end;

procedure GoBackBtnOnClick(Sender: TObject);
begin
  WebPageAction(WebHWND_Browser, WEBPAGE_GOBACK);
end;

procedure GoForwardBtnOnClick(Sender: TObject);
begin
  WebPageAction(WebHWND_Browser, WEBPAGE_GOFORWARD);
end;

procedure StopBtnOnClick(Sender: TObject);
begin
  WebPageAction(WebHWND_Browser, WEBPAGE_STOP);
end;

procedure RefreshBtnOnClick(Sender: TObject);
begin
  WebPageAction(WebHWND_Browser, WEBPAGE_REFRESH);
end;

procedure HomeBtnOnClick(Sender: TObject);
begin
  WebPageAction(WebHWND_Browser, WEBPAGE_GOHOME);
end;

procedure GoBtnOnClick(Sender: TObject);
begin
  DisplayHTMLPage(WebHWND_Browser, AddrEdit.Text);
end;

procedure BrowserFormResize(Sender: TObject);
var
  W: Integer;
begin
  WebWndSetBounds(WebHWND_Browser, 0, ScaleY(35), Form_Browser.ClientWidth,
         Form_Browser.ClientHeight - ScaleY(35));
  W := Form_Browser.Width - ScaleX(285);
  if W <= 0 then W := 1;
  AddrEdit.Width := W;
  GoBtn.SetBounds(AddrEdit.Left + AddrEdit.Width + ScaleX(2), ScaleY(5), ScaleX(30),
       WizardForm.CancelButton.Height);
end;

procedure EditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DisplayHTMLPage(WebHWND_Browser, AddrEdit.Text);
end;

procedure WizardBtnOnClick(Sender: TObject);
var
  ScreenWidth, ScreenHeight: Integer;
  Btn: TNewButton;
begin
  Form_Browser := TForm.Create(WizardForm);
  try
    Form_Browser.Caption := 'ThinBrowser';
    Form_Browser.BorderIcons := [biSystemMenu, biMaximize];
    ScreenWidth := GetSystemMetrics(SM_CXSCREEN);
    ScreenHeight := GetSystemMetrics(SM_CYSCREEN);
    Form_Browser.SetBounds((ScreenWidth - ScaleX(600)) div 2, (ScreenHeight - ScaleY(400)) div 2,
         ScaleX(600), ScaleY(400));
    WebHWND_Browser := NewWebWnd(Form_Browser.Handle, 0, 0, Form_Browser.ClientWidth,
         Form_Browser.ClientHeight);
    SetWindowLong(Form_Browser.Handle, GWL_EXSTYLE, GetWindowLong(
         WebHWND_Browser, GWL_EXSTYLE) or WS_EX_CLIENTEDGE);

    Btn := TNewButton.Create(Form_Browser);
    Btn.SetBounds(ScaleX(5), ScaleY(5), ScaleX(40), WizardForm.CancelButton.Height);
    Btn.Caption := '&Back';
    Btn.OnClick := @GoBackBtnOnClick;
    Btn.Parent := Form_Browser;
    
    Btn := TNewButton.Create(Form_Browser);
    Btn.SetBounds(ScaleX(47), ScaleY(5), ScaleX(55), WizardForm.CancelButton.Height);
    Btn.Caption := '&Forward';
    Btn.OnClick := @GoForwardBtnOnClick;
    Btn.Parent := Form_Browser;
    
    Btn := TNewButton.Create(Form_Browser);
    Btn.SetBounds(ScaleX(104), ScaleY(5), ScaleX(40), WizardForm.CancelButton.Height);
    Btn.Caption := '&Stop';
    Btn.OnClick := @StopBtnOnClick;
    Btn.Parent := Form_Browser;

    Btn := TNewButton.Create(Form_Browser);
    Btn.SetBounds(ScaleX(146), ScaleY(5), ScaleX(50), WizardForm.CancelButton.Height);
    Btn.Caption := '&Refresh';
    Btn.OnClick := @RefreshBtnOnClick;
    Btn.Parent := Form_Browser;

    Btn := TNewButton.Create(Form_Browser);
    Btn.SetBounds(ScaleX(198), ScaleY(5), ScaleX(40), WizardForm.CancelButton.Height);
    Btn.Caption := '&Home';
    Btn.OnClick := @HomeBtnOnClick;
    Btn.Parent := Form_Browser;

    AddrEdit := TNewEdit.Create(Form_Browser);
    AddrEdit.Left := ScaleX(240);
    AddrEdit.Top := ScaleY(6);
    AddrEdit.Parent := Form_Browser;
    AddrEdit.Text := 'about:blank';
    AddrEdit.OnKeyPress := @EditKeyPress;

    GoBtn := TNewButton.Create(Form_Browser);
    GoBtn.Caption := '&Go';
    GoBtn.OnClick := @GoBtnOnClick;
    GoBtn.Parent := Form_Browser;

    BrowserFormResize(Form_Browser);
    Form_Browser.OnResize := @BrowserFormResize;
    Form_Browser.ActiveControl := AddrEdit;
    Form_Browser.ShowModal();
    FreeWebWnd(WebHWND_Browser);
  finally
    Form_Browser.Free();
  end;
end;

procedure InitializeWizard();
var
  State: DWord;
  s: string;
  BrowserBtn: TNewButton;
begin
  State := 0;
  s := '';
// 如果需要进行网址连接测试，取消下面代码的注释
//  s := 'http://www.google.cn';

  if CheckConnectState(s, State) then
    MsgBox('网络已经连接。', mbInformation, MB_OK)
  else
    MsgBox('网络未连接。', mbCriticalError, MB_OK);
  MsgBox(inttostr(State), mbInformation, MB_OK);

  ExtractTemporaryFile('wizard.htm');
  ExtractTemporaryFile('file.htm');
  ExtractTemporaryFile('1.gif');
  ExtractTemporaryFile('2.gif');
  ExtractTemporaryFile('3.gif');
  
  WebHWND1 := NewWebWnd(WizardForm.WelcomePage.Handle, 0, 0, WizardForm.WizardBitmapImage.Width, WizardForm.WelcomePage.Height);
  DisplayHTMLPage(WebHWND1, ExpandConstant('{tmp}\wizard.htm'));

  UrlPage := CreateCustomPage(wpWelcome, '测试 Web 页面', '网址: http://www.google.cn');

  HtmlPage := CreateCustomPage(UrlPage.ID, '测试 HTML文件 页面', '文件: file.htm');

  HtmlTextPage := CreateCustomPage(HtmlPage.ID, '测试 HTML文本 页面', '临时自定义 HTML 字符串');

  BrowserBtn := TNewButton.Create(WizardForm);
  BrowserBtn.Left := WizardForm.ClientWidth - WizardForm.CancelButton.Left - WizardForm.CancelButton.Width;
  BrowserBtn.Top := WizardForm.CancelButton.Top;
  BrowserBtn.Width := WizardForm.CancelButton.Width;
  BrowserBtn.Height := WizardForm.CancelButton.Height;
  BrowserBtn.Caption := '&Browser...';
  BrowserBtn.OnClick := @WizardBtnOnClick;
  BrowserBtn.Parent := WizardForm;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpWelcome then
    WebWndSetParent(WebHWND1, WizardForm.WelcomePage.Handle)
  else
  if CurPageID = wpFinished then
    WebWndSetParent(WebHWND1, WizardForm.FinishedPage.Handle)
  else
  if (CurPageID = UrlPage.ID) and (WebHWND2 = 0) then
  begin
    WebHWND2 := NewWebWnd(UrlPage.Surface.Handle, 0, 0, UrlPage.Surface.Width, UrlPage.Surface.Height);
    DisplayHTMLPage(WebHWND2, 'http://www.google.cn')
  end else
  if (CurPageID = HtmlPage.ID) and (WebHWND3 = 0) then
  begin
    WebHWND3 := NewWebWnd(HtmlPage.Surface.Handle, 0, 0, HtmlPage.Surface.Width, HtmlPage.Surface.Height);
    DisplayHTMLPage(WebHWND3, ExpandConstant('{tmp}\file.htm'));
  end
  else
  if (CurPageID = HtmlTextPage.ID) and (WebHWND4 = 0) then
  begin
    WebHWND4 := NewWebWnd(HtmlTextPage.Surface.Handle, 0, 0, HtmlTextPage.Surface.Width, HtmlTextPage.Surface.Height);
    DisplayHTMLStr(WebHWND4, '<b>I''m a <u>HTML text</u></b>');
  end;
end;
