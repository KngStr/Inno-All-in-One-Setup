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

[Files]
Source: "img.bmp"; Flags: dontcopy

[code]
var
  TreeView1: TTreeView;

procedure TreeView1OnMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  tn: TTreeNode;
begin
  tn := TreeView1.GetNodeAt(x, y);
  if htOnItem in TreeView1.GetHitTestInfoAt(X, Y) then
    if not tn.HasChildren then
      MsgBox('Children: ' + tn.Text, mbInformation, MB_OK);
  // 只有点击最底层子项才会弹出对话框。
end;

procedure TreeView1OnGetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  if Node.HasChildren then
  begin
    if Node.Expanded then
      Node.ImageIndex := 1
    else
      Node.ImageIndex := 0;
  end else
    Node.ImageIndex := 2;
end;

procedure TreeView1OnGetSelectedIndex(Sender: TObject; Node: TTreeNode);
begin
  if Node.HasChildren then
  begin
    if Node.Expanded then
      Node.SelectedIndex := 1
    else
      Node.SelectedIndex := 0;
  end else
    Node.SelectedIndex := 2;
end;

procedure InitializeWizard();
var
  MyTreeNode1, MyTreeNode2: TTreeNode;
  ImgList: TImageList;
  bmp: TBitmap;
  bmpStream: TFileStream;
begin
  WizardForm.WelcomeLabel1.Caption := 'TTreeView';

  TreeView1 := TTreeView.Create(WizardForm);
  TreeView1.Parent := WizardForm.WelcomePage;
//  TreeView1.BorderStyle := bsNone;
  
  TreeView1.SetBounds(WizardForm.WizardBitmapImage.Width + 4, 40,  WizardForm.WelcomePage.Width - WizardForm.WizardBitmapImage.Width - 8, WizardForm.WelcomePage.Height - 44);
  
  ImgList := TImageList.Create(WizardForm);
  ExtractTemporaryFile('img.bmp');
  bmp := TBitmap.Create;
  try
    bmpStream := TFileStream.Create(ExpandConstant('{tmp}\img.bmp'), fmOpenRead or fmShareDenyNone);
    // 用文件流载入文件可有效防止其他文件临时占用该文件（例如卡巴斯基的即时查毒有可能占用文件导致出错）
    try
      bmp.LoadFromStream(bmpStream);
      ImgList.AddMasked(bmp, clFuchsia);
      // 一般使用紫红色为掩码色，不过这里没有用掩码色进行处理。因为是白色背景，所以图片也用了白色背景。
    finally
      bmpStream.Free;
    end;
  finally
    bmp.Free;
  end;
  
  TreeView1.Images := ImgList;

  TreeView1.OnGetImageIndex := @TreeView1OnGetImageIndex;
  TreeView1.OnGetSelectedIndex := @TreeView1OnGetSelectedIndex;
  TreeView1.OnMouseUp := @TreeView1OnMouseUp;
  TreeView1.ReadOnly := True;
  
  with TreeView1.Items do
  begin

    {Adds a root node}
    Add(TreeView1.Selected, 'RootTreeNode1');

    {Sets MyTreeNode to first node in}
    {tree view and adds a child node to it}
    MyTreeNode1 := TreeView1.Items[0];
    AddChild(MyTreeNode1,'ChildNode1');

    {Adds a root node}
    Add(TreeView1.Selected, 'RootTreeNode2');

    {Sets MyTreeNode to third node in}
    {tree view and adds a child node to it}
    MyTreeNode2:=TreeView1.items[2];
    AddChild(MyTreeNode2,'ChildNode2');

    {Sets MyTreeNode to fourth node in}
    {tree view and adds a child node to it}
    MyTreeNode2:=TreeView1.items[3];
    AddChild(MyTreeNode2,'ChildNode2a');

    {Sets MyTreeNode to fifth node in}
    {tree view and adds a child node to it}

    MyTreeNode2:=TreeView1.items[4];
    Add(MyTreeNode2,'ChildNode2b');

    {add another root node}
    Add(TreeView1.Selected, 'RootTreeNode3');
  end;
  
  TreeView1.FullExpand;
end;

