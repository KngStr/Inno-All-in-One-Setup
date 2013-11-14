; 演示如何使用增强的主体安装程序和增强的编译器。
; 脚本: restools ( http://restools.hanzify.org )
; 这里将会演示所有增强功能并提供相关解释。

; 其他更多的 VCL 属性和函数，具体请查看“Support Classes.txt”

#ifdef IS_ENHANCED
  #if (Ver < 0x5020300) || (Pos('ee', IS_Ver_Str) < 1)
    #pragma error 'Enhanced edition of Inno Setup (5.2.3.ee1 or higher) is required to compile this script'
  #endif
#else
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=My Application
AppVersion=1.5
DefaultDirName={pf}\My Application
SolidCompression=yes
Compression=lzma/ultra	
PrivilegesRequired=none
OutputDir=userdocs:Inno Setup Examples Output

#ifdef UNICODE
[Files]
Source: "menu_imglist.bmp"; Flags: dontcopy
#endif

[code]
function GetSystemMetrics(nIndex: Integer): Integer; external 'GetSystemMetrics@user32.dll stdcall';

const
  SM_CYMENU = 15;
  
procedure MenuOnClick(Sender: TObject);
begin
  if TMenuItem(Sender).HelpContext > 0 then
    MsgBox(TMenuItem(Sender).Name + '.Caption: "' +  TMenuItem(Sender).Caption + '" -- hCtx:' + IntToStr(TMenuItem(Sender).HelpContext), mbInformation, MB_OK);
end;

procedure WizardFormOnResize(Sender: TObject);
begin
  WizardForm.DisableAlign;
  try
    WizardForm.OuterNotebook.Height := WizardForm.ClientHeight - ScaleY(45);
    WizardForm.Bevel.Top := WizardForm.OuterNotebook.Height + 5;
    WizardForm.CancelButton.Left := WizardForm.ClientWidth - WizardForm.CancelButton.Width - ScaleY(10);
    WizardForm.CancelButton.Top := WizardForm.OuterNotebook.Height + ScaleY(10);
  finally
    WizardForm.EnableAlign;
  end;
end;

procedure InitializeWizard();
var
  Panel: TPanel;
  StatusBar: TStatusBar;
#ifdef UNICODE
  ImgList: TImageList;
  bmp: TBitmap;
  bmpStream: TFileStream;
#endif
begin
	WizardForm.NextButton.Hide;
  WizardForm.Height := WizardForm.Height + GetSystemMetrics(SM_CYMENU);

  { Panel }
  Panel := TPanel.Create(WizardForm);
  Panel.Parent := WizardForm.WelcomePage;
  Panel.Align := alClient;
  Panel.BevelOuter := bvNone;
  Panel.Font.Size := 10;
  Panel.Font.Style := [fsBold];
  Panel.Caption := 'Click right mouse button to test popup menu!'; 

  Panel.ParentBackground := False;

  { StatusBar }
  StatusBar := TStatusBar.Create(WizardForm);
  StatusBar.Parent := WizardForm;
  StatusBar.ThemeBackground := False;
  
  WizardForm.BorderStyle := bsSizeable;
  WizardForm.CancelButton.BringToFront;
  WizardForm.OnResize := @WizardFormOnResize;
  
  WizardForm.OuterNotebook.Align := alTop;
  WizardForm.Bevel.Align := alTop;

  { MainMenu }
  NewMenu(WizardForm, 'MyMainMenu', [

      NewSubMenu('&File', 0, 'mFile', [
            NewItem('&New', TextToShortCut('Ctrl+N'), False, True, @MenuOnClick, 11, 'miNew'),
            NewItem('&Open...', TextToShortCut('Ctrl+O'), False, True, @MenuOnClick, 12, 'miOpen'),
            NewItem('&Save...', TextToShortCut('Ctrl+S'), False, True, @MenuOnClick, 13, 'miSave'),
            NewItem('Save &As...', 0, False, True, @MenuOnClick, 14, 'miSaveAs'),
            NewLine,
            NewItem('E&xit', 0, False, True, @MenuOnClick, 15, 'miExit')
      ], True), // NewSubMenu - File
      
      NewSubMenu('&Edit', 0, 'mEdit', [
            NewItem('&Undo', TextToShortCut('Ctrl+Z'), False, True, @MenuOnClick, 21, 'miUndo'),
            NewItem('&Redo', TextToShortCut('Shift+Ctrl+Z'), False, True, @MenuOnClick, 22, 'miRedo'),
            NewLine,
            NewItem('Cu&t', TextToShortCut('Ctrl+X'), False, True, @MenuOnClick, 23, 'miCut'),
            NewItem('&Copy', TextToShortCut('Ctrl+C'), False, True, @MenuOnClick, 24, 'miCopy'),
            NewItem('&Paste', TextToShortCut('Ctrl+V'), False, True, @MenuOnClick, 25, 'miPaste'),
            NewItem('De&lete', TextToShortCut('Del'), False, True, @MenuOnClick, 26, 'miDelete'),
            NewItem('Select &All', TextToShortCut('Ctrl+A'), False, True, @MenuOnClick, 27, 'miSelectAll'),
            NewLine,
            NewItem('&Word Wrap', 0, False, True, @MenuOnClick, 28, 'miWordWrap')
      ], True), // NewSubMenu - Edit
      
      NewSubMenu('&Search', 0, 'mSearch', [
            NewItem('&Find...', TextToShortCut('Ctrl+F'), False, True, @MenuOnClick, 31, 'miFind'),
            NewItem('&Find Next', TextToShortCut('F3'), False, True, @MenuOnClick, 32, 'miFindNext'),
            NewItem('&Replace...', TextToShortCut('Ctrl+H'), False, True, @MenuOnClick, 33, 'miReplace'),
            NewLine,
            NewItem('&Go to Line...', TextToShortCut('Ctrl+G'), False, True, @MenuOnClick, 34, 'miGotoLine')
      ], True), // NewSubMenu - Search
      
      NewSubMenu('&Help', 0, 'mHelp', [
            NewItem('&Inno Setup Help', 0, False, True, @MenuOnClick, 41, 'miInnoSetupHelp'),
            NewLine,
            NewItem('&About Inno Setup', 0, False, True, @MenuOnClick, 42, 'miAboutInnoSetup')
      ], True) // NewSubMenu - Help
      
  ]); // NewMenu - MyMainMenu

  { PopupMenu }
  Panel.PopupMenu := NewPopupMenu(WizardForm, 'MyPopupMenu', paLeft, True, [
      NewItem('&Undo', TextToShortCut('Ctrl+Z'), False, True, @MenuOnClick, 11, 'piUndo'),
      NewItem('&Redo', TextToShortCut('Shift+Ctrl+Z'), False, True, @MenuOnClick, 12, 'piRedo'),
      NewLine,
      NewItem('Cu&t', TextToShortCut('Ctrl+X'), False, True, @MenuOnClick, 13, 'piCut'),
      NewItem('&Copy', TextToShortCut('Ctrl+C'), False, True, @MenuOnClick, 14, 'piCopy'),
      NewItem('&Paste', TextToShortCut('Ctrl+V'), False, True, @MenuOnClick, 15, 'piPaste'),
      NewItem('De&lete', TextToShortCut('Del'), False, True, @MenuOnClick, 16, 'piDelete'),
      NewItem('Select &All', TextToShortCut('Ctrl+A'), False, True, @MenuOnClick, 17, 'piSelectAll'),
      NewLine,
      NewItem('&Word Wrap', 0, False, True, @MenuOnClick, 18, 'piWordWrap')
  ]);
  
#ifdef UNICODE
  ImgList := TImageList.Create(WizardForm);
  ExtractTemporaryFile('menu_imglist.bmp');
  bmp := TBitmap.Create;
  try
    bmpStream := TFileStream.Create(ExpandConstant('{tmp}\menu_imglist.bmp'), fmOpenRead or fmShareDenyNone);
    // 用文件流载入文件可有效防止其他文件临时占用该文件（例如卡巴斯基的即时查毒有可能占用文件导致出错）
    try
      bmp.LoadFromStream(bmpStream);
      ImgList.AddMasked(bmp, clFuchsia);
      // 一般使用紫红色为掩码色。
      
      WizardForm.Menu.Images := ImgList;
      Panel.PopupMenu.Images := ImgList;

      // New
      WizardForm.Menu.Items.Items[0].Items[0].ImageIndex := 0;
      // Open
      WizardForm.Menu.Items.Items[0].Items[1].ImageIndex := 1;
      // Save
      WizardForm.Menu.Items.Items[0].Items[2].ImageIndex := 2;

      // Undo
      WizardForm.Menu.Items.Items[1].Items[0].ImageIndex := 10;
      Panel.PopupMenu.Items.Items[0].ImageIndex := 10;
      // Redo
      WizardForm.Menu.Items.Items[1].Items[1].ImageIndex := 11;
      Panel.PopupMenu.Items.Items[1].ImageIndex := 11;
      // Cut
      WizardForm.Menu.Items.Items[1].Items[3].ImageIndex := 4;
      Panel.PopupMenu.Items.Items[3].ImageIndex := 4;
      // Copy
      WizardForm.Menu.Items.Items[1].Items[4].ImageIndex := 5;
      Panel.PopupMenu.Items.Items[4].ImageIndex := 5;
      // Paste
      WizardForm.Menu.Items.Items[1].Items[5].ImageIndex := 6;
      Panel.PopupMenu.Items.Items[5].ImageIndex := 6;
      // Delete
      WizardForm.Menu.Items.Items[1].Items[6].ImageIndex := 12;
      Panel.PopupMenu.Items.Items[6].ImageIndex := 12;
      // Word Wrap
      WizardForm.Menu.Items.Items[1].Items[9].ImageIndex := 13;
      Panel.PopupMenu.Items.Items[9].ImageIndex := 13;

      // Find
      WizardForm.Menu.Items.Items[2].Items[0].ImageIndex := 7;
      // Find Next
      WizardForm.Menu.Items.Items[2].Items[1].ImageIndex := 8;
      // Replace
      WizardForm.Menu.Items.Items[2].Items[2].ImageIndex := 9;

      // Inno Setup Help
      WizardForm.Menu.Items.Items[3].Items[0].ImageIndex := 3;
    finally
      bmpStream.Free;
    end;
  finally
    bmp.Free;
  end;
#endif
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  Application.Title := 'Menu''s Demo';
  WizardForm.Caption := 'Menu''s Demo';
  WizardForm.NextButton.Hide;
  WizardForm.CancelButton.Caption := 'Close';
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := False;
end;

procedure DeinitializeSetup();
begin
  WizardForm.OnResize := nil;
end;











