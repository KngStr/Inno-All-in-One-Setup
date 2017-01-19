; 演示如何使用增强的主体安装程序和增强的编译器。
; 脚本: restools ( http://restools.hanzify.org )
; 这里将会演示所有增强功能并提供相关解释。

; 其他更多的 VCL 属性和函数，具体请查看“Support Classes.txt”

#ifndef IS_ENHANCED
  #error Enhanced edition of Inno Setup (restools) is required to compile this script
#endif

[Setup]
AppName=My Program
AppVersion=1.5
DefaultDirName={pf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
SolidCompression=yes
Compression=lzma/ultra	
UsePreviousTasks=yes
;///////////////////////////////////////////////
; build 080805
; 这里增加一个选项打开组件列表的 TreeView 模式，类似一个树形控制窗口。
; 默认组件列表是原始模式，跟原版一样，只有添加了这个选项才会变成树形控制。
ComponentsListTVStyle=yes
;///////////////////////////////////////////////
; build 090424
; 这里增加一个选项 ComponentsListBtnImageFile，可以自定义 Radiobutton 和 CheckBox 的按钮图片。
ComponentsListBtnImageFile=btnimage.bmp
OutputDir=userdocs:Inno Setup Examples Output

[Types]
Name: "full"; Description: "Full installation"
Name: "compact"; Description: "Compact installation"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "program"; Description: "Program Files"; Types: full compact custom; Flags: fixed
;///////////////////////////////////////////////
; build 080815
; ItemHeightFixed := True;
; 长文字单行显示，鼠标移到该项上会以 Hint 的形式显示完整的一行
Name: "help"; Description: "Help File (这里加长文字作为换行情况下的测试，当 ItemHeightFixed 属性设置为 True 的时候，这一行文字会以单行显示)"; Types: full compact
Name: "help\help1"; Description: "Help File 1 (Test Bold)"; Flags: exclusive
Name: "help\help2"; Description: "Help File 2 (Test Italic)"; Flags: exclusive
Name: "readme"; Description: "Readme (Test Underline)"; Types: full
Name: "readme\readme1"; Description: "Readme 1 (Test StrikeOut)"; Types: full compact
;///////////////////////////////////////////////
; build 080805
; ComponentsListTVStyle 附带功能
; 默认所有组件初始都是展开的形式出现，如果你想某一项组件呈现“折叠”状态，这里设置标记“Collapsed”
Name: "readme\readme2"; Description: "Readme 2"; Types: full; Flags: Collapsed
Name: "readme\readme2\r1"; Description: "Readme 2..1"; Types: full compact
Name: "readme\readme2\r2"; Description: "Readme 2..2"; Types: full

[Files]
Source: "MyProg.exe"; DestDir: "{app}"; Components: program
Source: "MyProg1.chm"; DestDir: "{app}"; Components: help\help1
Source: "MyProg2.chm"; DestDir: "{app}"; Components: help\help2
Source: "Readme1.txt"; DestDir: "{app}"; Components: readme\readme1; Flags: isreadme
Source: "Readme2.txt"; DestDir: "{app}"; DestName: "Readme2_1.txt"; Components: readme\readme2\r1
Source: "Readme2.txt"; DestDir: "{app}"; DestName: "Readme2_2.txt"; Components: readme\readme2\r2

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"

[code]
procedure InitializeWizard();
begin
////////////////////////////////////////////////
// build 080805
// 以下代码会隐藏在最顶层的组件前面的连线，如果打开这个选项，那么唯一能展开这个组件的方法就是双击这个组件
//  WizardForm.ComponentsList.Showroot := False;

////////////////////////////////////////////////
// build 080815
// 该项设置为 True，以单行高显示每项，显示不完全的可以以 Hint 显示完整一行。
//  WizardForm.ComponentsList.ItemHeightFixed := True;

////////////////////////////////////////////////
// build 081121    [fsBold,fsItalic,fsUnderline,fsStrikeOut]
// 如果你需要对每一项做出重点标识，这是一个非常好的功能。
  WizardForm.ComponentsList.ItemFontStyle[2] := [fsBold];
  WizardForm.ComponentsList.ItemFontStyle[3] := [fsItalic];
  WizardForm.ComponentsList.ItemFontStyle[4] := [fsUnderline];
  WizardForm.ComponentsList.ItemFontStyle[5] := [fsStrikeOut];
  WizardForm.ComponentsList.SubItemFontStyle[5] := [fsBold];
  WizardForm.ComponentsList.SubItemFontStyle[4] := [fsItalic];
  WizardForm.ComponentsList.SubItemFontStyle[3] := [fsUnderline];
  WizardForm.ComponentsList.SubItemFontStyle[2] := [fsStrikeOut];
end;

