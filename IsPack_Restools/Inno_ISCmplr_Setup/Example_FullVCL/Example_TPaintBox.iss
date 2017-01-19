; 演示如何使用增强的主体安装程序和增强的编译器。
; 脚本: restools ( http://restools.hanzify.org )
; 这里将会演示所有增强功能并提供相关解释。

; 其他更多的 VCL 属性和函数，具体请查看“Support Classes.txt”

; 调试环境下显示有点迟缓，但是在脱离调试的环境下运行，显示速度是相当的快的。

; 这是在 Delphi Demo 下的经典排序例子，通过实际的演算，显示效果来直观的判断算法的优劣。
; 由于 InnoSetup 在多线程下极容易产生错误，因此无法使用多线程组件来实现这个例子，实在是有点可惜了。

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

[code]
function GetTickCount: DWORD; external 'GetTickCount@kernel32.dll stdcall';

type
  TSortArray =  array[0..114] of Integer;
  
var
  Panel: TPanel;
  RandomBtn, ExecBtn: TButton;
  BubbleSortBox, SelectionSortBox, QuickSortBox: TPaintBox;
  BubbleSortArray, SelectionSortArray, QuickSortArray: TSortArray;
  BubbleSortTickCntLabel, SelectionSortTickCntLabel, QuickSortTickCntLabel: TLabel;

procedure RandomizeArrays;
var
  I: Integer;
begin
  Randomize;
  for I := 0 to 114 do
  begin
    BubbleSortArray[I] := Random(160);
    SelectionSortArray[I] := BubbleSortArray[I];
    QuickSortArray[I] := BubbleSortArray[I];
  end;
end;

procedure PaintLine(Canvas: TCanvas; I, Len: Integer);
begin
  Canvas.MoveTo(0, I * 2 + 1);
  Canvas.LineTo(Len, I * 2 + 1);
end;

procedure PaintArray(Box: TPaintBox; const A: TSortArray);
var
  I: Integer;
begin
  with Box do
  begin
    Canvas.Pen.Color := clRed;
    for I := 0 to 114 do PaintLine(Canvas, I, A[I]);
  end;
end;

procedure BubbleSortBoxPaint(Sender: TObject);
begin
  PaintArray(BubbleSortBox, BubbleSortArray);
end;

procedure SelectionSortBoxPaint(Sender: TObject);
begin
  PaintArray(SelectionSortBox, SelectionSortArray);
end;

procedure QuickSortBoxPaint(Sender: TObject);
begin
  PaintArray(QuickSortBox, QuickSortArray);
end;

procedure VisualSwap(FBox: TPaintBox; FA, FB, FI, FJ: Integer);
begin
  with FBox do
  begin
    Canvas.Pen.Color := clBtnFace;
    PaintLine(Canvas, FI, FA);
    PaintLine(Canvas, FJ, FB);
    Canvas.Pen.Color := clRed;
    PaintLine(Canvas, FI, FB);
    PaintLine(Canvas, FJ, FA);
  end;
end;

procedure BubbleSortProc;
var
  I, J, T: Integer;
begin
  for I := 114 downto 0 do
  begin
    for J := 0 to 114 - 1 do
    begin
      if BubbleSortArray[J] > BubbleSortArray[J + 1] then
      begin
        VisualSwap(BubbleSortBox, BubbleSortArray[J], BubbleSortArray[J + 1], J, J + 1);
        T := BubbleSortArray[J];
        BubbleSortArray[J] := BubbleSortArray[J + 1];
        BubbleSortArray[J + 1] := T;
        Application.ProcessMessages;
      end;
      Application.ProcessMessages;
    end;
    Application.ProcessMessages;
  end;
end;

procedure SelectionSortProc;
var
  I, J, T: Integer;
begin
  for I := 0 to 114 - 1 do
  begin
    for J := 114 downto I + 1 do
    begin
      if SelectionSortArray[I] > SelectionSortArray[J] then
      begin
        VisualSwap(SelectionSortBox, SelectionSortArray[I], SelectionSortArray[J], I, J);
        T := SelectionSortArray[I];
        SelectionSortArray[I] := SelectionSortArray[J];
        SelectionSortArray[J] := T;
        Application.ProcessMessages;
      end;
      Application.ProcessMessages;
    end;
    Application.ProcessMessages;
  end;
end;

procedure QuickSortProc(iLo, iHi: Integer);
var
  Lo, Hi, Mid, T: Integer;
begin
  Lo := iLo;
  Hi := iHi;
  Mid := QuickSortArray[(Lo + Hi) div 2];
  repeat
    while QuickSortArray[Lo] < Mid do Lo := Lo + 1;
    while QuickSortArray[Hi] > Mid do Hi := Hi - 1;
    if Lo <= Hi then
    begin
      VisualSwap(QuickSortBox, QuickSortArray[Lo], QuickSortArray[Hi], Lo, Hi);
      T := QuickSortArray[Lo];
      QuickSortArray[Lo] := QuickSortArray[Hi];
      QuickSortArray[Hi] := T;
      Lo := Lo + 1;
      Hi := Hi - 1;
    end;
    Application.ProcessMessages;
  until Lo > Hi;
  if Hi > iLo then QuickSortProc(iLo, Hi);
  if Lo < iHi then QuickSortProc(Lo, iHi);
  Application.ProcessMessages;
end;
  
  
procedure RandomBtnOnClick(Sender: TObject);
begin
  RandomBtn.Enabled := False;
  RandomizeArrays;
  BubbleSortBox.Repaint;
  SelectionSortBox.Repaint;
  QuickSortBox.Repaint;
  BubbleSortTickCntLabel.Hide;
  SelectionSortTickCntLabel.Hide;
  QuickSortTickCntLabel.Hide;
  ExecBtn.Enabled := True;
end;

procedure ExecBtnOnClick(Sender: TObject);
var
  Start: DWord;
begin
  ExecBtn.Enabled := False;
  Start := GetTickCount;
  BubbleSortProc;
  BubbleSortTickCntLabel.Caption := 'TickCount: ' + IntToStr(GetTickCount - Start);
  BubbleSortTickCntLabel.Show;
  Start := GetTickCount;
  SelectionSortProc;
  SelectionSortTickCntLabel.Caption := 'TickCount: ' + IntToStr(GetTickCount - Start);
  SelectionSortTickCntLabel.Show;
  Start := GetTickCount;
  QuickSortProc(0, 114);
  QuickSortTickCntLabel.Caption := 'TickCount: ' + IntToStr(GetTickCount - Start);
  QuickSortTickCntLabel.Show;
  RandomBtn.Enabled := True;
end;

procedure InitializeWizard();
var
  h, t, w: Integer;
begin
  RandomizeArrays;
  
  Panel := TPanel.Create(WizardForm);
  Panel.Parent := WizardForm.WelcomePage;
  Panel.Align := alClient;
  Panel.BevelOuter := bvNone;

  Panel.ParentBackground := False;   

  h := WizardForm.NextButton.Height;
  t := WizardForm.NextButton.Top;
  
  RandomBtn := TButton.Create(WizardForm);
  RandomBtn.Caption := 'Randomize Arrays';
  RandomBtn.SetBounds(ScaleX(10), t, ScaleX(110), h);
  RandomBtn.Parent := WizardForm;
  RandomBtn.OnClick := @RandomBtnOnClick;
  RandomBtn.Enabled := False;

  ExecBtn := TButton.Create(WizardForm);
  ExecBtn.Caption := 'Start Sorting';
  ExecBtn.SetBounds(ScaleX(130), t, ScaleX(80), h);
  ExecBtn.Parent := WizardForm;
  ExecBtn.OnClick := @ExecBtnOnClick;

  w := WizardForm.WelcomePage.Width div 3;
  h := WizardForm.WelcomePage.Height;

  with TLabel.Create(WizardForm) do
  begin
    Parent := Panel;
    SetBounds(2, 20, 1, 1);
    Caption := 'Bubble Sort:';
    BubbleSortBox := TPaintBox.Create(WizardForm);
    BubbleSortBox.Parent := Panel;
    BubbleSortBox.SetBounds(2, 30 + Height, W - 4, 233);
    BubbleSortBox.OnPaint := @BubbleSortBoxPaint;
    BubbleSortTickCntLabel := TLabel.Create(WizardForm);
    BubbleSortTickCntLabel.Parent := Panel;
    BubbleSortTickCntLabel.SetBounds(2, BubbleSortBox.Top + 240, 1, 1);
    BubbleSortTickCntLabel.Hide;
  end;

  with TLabel.Create(WizardForm) do
  begin
    Parent := Panel;
    SetBounds(w + 2, 20, 1, 1);
    Caption := 'Selection Sort:';
    SelectionSortBox := TPaintBox.Create(WizardForm);
    SelectionSortBox.Parent := Panel;
    SelectionSortBox.SetBounds(w + 2, 30 + Height, W - 4, 233);
    SelectionSortBox.OnPaint := @SelectionSortBoxPaint;
    SelectionSortTickCntLabel := TLabel.Create(WizardForm);
    SelectionSortTickCntLabel.Parent := Panel;
    SelectionSortTickCntLabel.SetBounds(w + 2, SelectionSortBox.Top + 240, 1, 1);
    SelectionSortTickCntLabel.Hide;
  end;
  
  with TLabel.Create(WizardForm) do
  begin
    Parent := Panel;
    SetBounds(w * 2 + 2, 20, 1, 1);
    Caption := 'Quick Sort:';
    QuickSortBox := TPaintBox.Create(WizardForm);
    QuickSortBox.Parent := Panel;
    QuickSortBox.SetBounds(w * 2 + 2, 30 + Height, W - 4, h - 32 - Height);
    QuickSortBox.OnPaint := @QuickSortBoxPaint;
    QuickSortTickCntLabel := TLabel.Create(WizardForm);
    QuickSortTickCntLabel.Parent := Panel;
    QuickSortTickCntLabel.SetBounds(w * 2 + 2, QuickSortBox.Top + 240, 1, 1);
    QuickSortTickCntLabel.Hide;
  end;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  Application.Title := 'Sorting Demo';
  WizardForm.Caption := 'Sorting Demo';
  WizardForm.NextButton.Hide;
  WizardForm.CancelButton.Caption := 'Close';
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := False;
end;




