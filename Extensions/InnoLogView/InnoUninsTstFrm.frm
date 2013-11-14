VERSION 5.00
Object = "{BDE7D104-7E95-11D4-B68F-D74C9D5E7B57}#4.1#0"; "SCGrid.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form InnoUninsTstFrm 
   Caption         =   "InnoLogView"
   ClientHeight    =   8892
   ClientLeft      =   48
   ClientTop       =   336
   ClientWidth     =   11748
   LinkTopic       =   "Form1"
   ScaleHeight     =   8892
   ScaleWidth      =   11748
   StartUpPosition =   3  'Windows-Standard
   Begin VB.CommandButton bnReload 
      Caption         =   "Reload"
      Height          =   480
      Left            =   2448
      TabIndex        =   4
      Top             =   2412
      Width           =   1128
   End
   Begin VB.CommandButton cmdSaveAs 
      Caption         =   "Save as Text"
      Height          =   480
      Left            =   1224
      TabIndex        =   3
      Top             =   2412
      Width           =   1200
   End
   Begin MSComDlg.CommonDialog cdlg 
      Left            =   11196
      Top             =   2412
      _ExtentX        =   677
      _ExtentY        =   677
      _Version        =   393216
      CancelError     =   -1  'True
      DefaultExt      =   "dat"
   End
   Begin VB.CommandButton cmdOpen 
      Caption         =   "Open"
      Height          =   480
      Left            =   72
      TabIndex        =   2
      Top             =   2412
      Width           =   1128
   End
   Begin prjSCGrid.SCGrid MyGrid 
      Height          =   5916
      Left            =   36
      TabIndex        =   1
      Top             =   2916
      Width           =   11676
      _ExtentX        =   20595
      _ExtentY        =   10435
      DefaultWidth    =   120
      Cols            =   7
      FixedRows       =   1
      BackColor       =   -2147483632
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ScrollHBar      =   3
      ScrollVBar      =   2
      FocusRect       =   2
      ShowSplit       =   -1  'True
   End
   Begin VB.TextBox Text1 
      Height          =   2280
      Left            =   30
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "InnoUninsTstFrm.frx":0000
      Top             =   72
      Width           =   11676
   End
End
Attribute VB_Name = "InnoUninsTstFrm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'Private Declare Function ExtTextOut Lib "gdi32" Alias "ExtTextOutA" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal wOptions As Long, lpRect As Rect, ByVal lpString As String, ByVal nCount As Long, lpDx As Long) As Long


Private Declare Function InnoUninstallLog_Read Lib "AuIsUtil.dll" (ByVal fname As String, ByVal flag As Long) As Long
Private Declare Function InnoUninstallLog_CreateTextLog Lib "AuIsUtil.dll" (ByVal fname As String) As Long
Private Declare Function InnoUninstallLog_FindFirstRecord Lib "AuIsUtil.dll" (ByVal pattern As String, ByVal RecordType As Long, ByVal PatternStringIndex As Long) As Long
Private Declare Function InnoUninstallLog_FindNextRecord Lib "AuIsUtil.dll" (ByVal pattern As String, ByVal RecordType As Long, ByVal PatternStringIndex As Long) As Long
Private Declare Function InnoUninstallLog_FindGetString Lib "AuIsUtil.dll" (ByVal StringIndex As Long, ByVal data As String, ByVal cc As Long) As Long
Private Declare Function InnoUninstallLog_FindGetExtraData Lib "AuIsUtil.dll" () As Long
Private Declare Function InnoUninstallLog_FindGetEntryType Lib "AuIsUtil.dll" () As Long
Private Declare Function InnoUninstallLog_FindGetParamCount Lib "AuIsUtil.dll" () As Long
Private Declare Function InnoUninstallLog_GetLogHeader Lib "AuIsUtil.dll" (ByVal LogId As String, ByVal nLogId As Long, ByVal AppId As String, ByVal nAppId As Long, ByVal AppName As String, ByVal nAppName As Long, ByRef Version As Long, ByRef NumRecords As Long, ByRef EndOffset As Long, ByRef Flags As Long, ByRef crc As Long) As Long
Private Declare Function InnoUninstallLog_FindGetExtraDataFlags Lib "AuIsUtil.dll" (ByVal FlagStr As String, ByVal nData As Long) As Long

'Public Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Private Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long



Private MaxParam As Long
Private EntryCount As Long
Private FileName As String





Private Sub PrintLogHeader()
    Dim s As String
    Dim lid As String
    Dim aid As String
    Dim apn As String
    Dim ver As Long
    Dim nr As Long
    Dim eoff As Long
    Dim flg As Long
    Dim crc As Long
    Dim lcc As Long
    
    lcc = 255
    
    lid = String$(lcc, Chr$(0))
    aid = String$(lcc, Chr$(0))
    apn = String$(lcc, Chr$(0))
    
    InnoUninstallLog_GetLogHeader lid, lcc, aid, lcc, apn, lcc, ver, nr, eoff, flg, crc
    lid = Left$(lid, InStr(1, lid, Chr$(0)) - 1)
    aid = Left$(aid, InStr(1, aid, Chr$(0)) - 1)
    apn = Left$(apn, InStr(1, apn, Chr$(0)) - 1)
    
    s = s & "File: " & FileName & vbNewLine
    s = s & "UninstallLogId: " & lid & vbNewLine
    s = s & "AppId: " & aid & vbNewLine
    s = s & "AppName: " & apn & vbNewLine
    s = s & "Version : " & CStr(ver) & " Hex H" & Hex(ver) & vbNewLine
    s = s & "NumberOfRecords : " & CStr(nr) & " Hex H" & Hex(nr) & vbNewLine
    s = s & "EndOffset : " & CStr(eoff) & " Hex H" & Hex(eoff) & vbNewLine
    s = s & "Flags : " & CStr(flg) & " Hex H" & Hex(flg) & vbNewLine
    s = s & "CRC : " & CStr(crc) & " Hex H" & Hex(crc) & vbNewLine
    Text1.Text = s
    
    
    
    
End Sub



Private Sub bnReload_Click()
  UpdateData
End Sub

Private Sub cmdOpen_Click()
    On Error GoTo cmdOpen_Exit
    
    cdlg.Filter = "*.dat"
    cdlg.ShowOpen
    FileName = cdlg.FileName
    UpdateData

cmdOpen_Exit:
    
End Sub

Private Sub cmdSaveAs_Click()
    On Error GoTo cmdSaveAs_Exit
    cdlg.Filter = "*.txt"
    cdlg.DefaultExt = "*.txt"
    cdlg.FileName = ""
    cdlg.ShowSave
    InnoUninstallLog_CreateTextLog cdlg.FileName
    
cmdSaveAs_Exit:
    
End Sub

Private Sub Form_Load()

  ' Hook Form
'  Call WheelHook(Me.hWnd)
'  Call WheelHook(MyGrid.hWnd)

FileName = App.Path & "\unins000.dat"

MyGrid.CellMode(0, 0) = scTextBox
MyGrid.ColMode(0) = scTextBox
MyGrid.TextAlignment(0, 0) = scWordBreak
MyGrid.Text(0, 0) = "C:\Programme\Gemeinsame Dateien\BAUM Retec\BrailleServer\1.0"
MyGrid.ColWidth(0) = 120
MyGrid.ColWidth(1) = 200
MyGrid.ColWidth(2) = 260
MyGrid.ColWidth(3) = 260
MyGrid.ColWidth(4) = 260
MyGrid.ColWidth(5) = 260
MyGrid.ColWidth(6) = 260
MyGrid.DefaultTextAlign = scWordBreak
MyGrid.DefaultHeight = 60
'MyGrid.RowHeight(0) = 60
MyGrid.Text(-1, 0) = "UninstallType"
MyGrid.Text(-1, 1) = "Flags"
MyGrid.Text(-1, 2) = "Param 1"
MyGrid.Text(-1, 3) = "Param 2"
MyGrid.Text(-1, 4) = "Param 3"
MyGrid.Text(-1, 5) = "Param 4"
MyGrid.Text(-1, 6) = "Param 5"

UpdateData
  
 Call WheelHook(Me.hWnd)
 Call WheelHook(MyGrid.hWnd)
 Call WheelHook(Text1.hWnd)

End Sub


Private Sub UpdateData()

Dim lcc As Long
Dim sen As String
Dim lres As Long
Dim uiType As Long
Dim lFlag As Long
Dim ParamCount As Long
Dim idx As Long

lcc = 500
InnoUninstallLog_Read FileName, 0

PrintLogHeader


MaxParam = 0
EntryCount = 0

MyGrid.Redraw = False

MyGrid.Rows = 0
lcc = 255

lres = InnoUninstallLog_FindFirstRecord("", 0, 0)
While lres <> 0
    
    uiType = InnoUninstallLog_FindGetEntryType
    lFlag = InnoUninstallLog_FindGetExtraData
    ParamCount = InnoUninstallLog_FindGetParamCount
    

    EntryCount = EntryCount + 1
    MyGrid.Rows = EntryCount
    MyGrid.RowMode(EntryCount - 1) = scCellFixed
    MyGrid.Text(EntryCount - 1, 0) = GetUninstallType(uiType)
            
    If lFlag = 0 Then
        MyGrid.Text(EntryCount - 1, 1) = ""
    Else
        sen = String$(lcc, Chr$(0))
        InnoUninstallLog_FindGetExtraDataFlags sen, lcc - 1
        sen = Left$(sen, InStr(1, sen, Chr$(0)) - 1)
        If Len(sen) > 0 Then
            MyGrid.Text(EntryCount - 1, 1) = sen
        Else
            MyGrid.Text(EntryCount - 1, 1) = "H" & Hex(lFlag)
        End If
    End If
            
    
    For idx = 0 To ParamCount - 1
        sen = String$(lcc, Chr$(0))
        InnoUninstallLog_FindGetString idx, sen, lcc - 1
        sen = Left$(sen, InStr(1, sen, Chr$(0)) - 1)
        MyGrid.Text(EntryCount - 1, 2 + idx) = sen
    Next
    MyGrid.AdjustHeight EntryCount - 1
    
    
    lres = InnoUninstallLog_FindNextRecord("", 0, 0)
Wend

MyGrid.Redraw = True
    

End Sub

Private Function GetUninstallType(tp As Long) As String
    Dim s As String
    
    Select Case tp
        Case 1:
            s = "Userdefined"
        Case &H10:
            s = "StartInstall"
        Case &H11:
            s = "EndInstall"
        Case &H20:
            s = "CompiledCode"
        Case &H80:
            s = "Run"
        Case &H81:
            s = "DeleteDirOrFiles"
        Case &H82:
            s = "DeleteFile"
        Case &H83:
            s = "DeleteGroupOrItem"
        Case &H84:
            s = "IniDeleteEntry"
        Case &H85:
            s = "IniDeleteSection"
        Case &H86:
            s = "RegDeleteEntireKey"
        Case &H87:
            s = "RegClearValue"
        Case &H88:
            s = "RegDeleteKeyIfEmpty"
        Case &H89:
            s = "RegDeleteValue"
        Case &H8A:
            s = "DecrementSharedCount"
        Case &H8B:
            s = "RefreshFileAssoc"
        Case &H8C:
            s = "MutexCheck"
        Case Else:
            s = "Unknown"
    End Select
    s = s & "(" & Hex(tp) & ")"
    GetUninstallType = s
End Function


Private Sub Form_Resize()
    If Me.Height > 3300 Then
        MyGrid.Height = Me.Height - 3300
    End If
    MyGrid.Width = Me.Width - 140
    Text1.Width = Me.Width - 120
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Call WheelUnHook(Me.hWnd)
    Call WheelUnHook(MyGrid.hWnd)
    Call WheelUnHook(Text1.hWnd)
   
'        MyGrid.SetSubclassLock
End Sub

Public Sub MouseWheel(ByVal MouseKeys As Long, ByVal Rotation As Long, ByVal Xpos As Long, ByVal Ypos As Long)
  Dim ctl As Control
  Dim bHandled As Boolean
  Dim bOver As Boolean
  
  Debug.Print "Scroll " & IIf(Rotation < 0, "Down", "Up")
    
    
  For Each ctl In Controls
    ' Is the mouse over the control
    On Error Resume Next
    bOver = (ctl.Visible And IsOver(ctl.hWnd, Xpos, Ypos))
    On Error GoTo 0
    
    If bOver Then
      ' If so, respond accordingly
      bHandled = True
      Select Case True
      
        Case TypeOf ctl Is SCGrid
            bHandled = True
            If Rotation > 0 Then
                If MyGrid.CurrentRow > 0 Then
                    MyGrid.CurrentRow = MyGrid.CurrentRow - 1
                End If
            Else
                If MyGrid.CurrentRow < (MyGrid.Rows - 1) Then
                    MyGrid.CurrentRow = MyGrid.CurrentRow + 1
                End If
            End If
          
        Case TypeOf ctl Is ListBox, TypeOf ctl Is TextBox, TypeOf ctl Is ComboBox
          ' These controls already handle the mousewheel themselves, so allow them to:
          If ctl.Enabled Then ctl.SetFocus
          
        Case Else
          bHandled = False

      End Select
      If bHandled Then Exit Sub
    End If
    bOver = False
  Next ctl
  
  ' Scroll was not handled by any controls, so treat as a general message send to the form
'  Me.Caption = "Form Scroll " & IIf(Rotation < 0, "Down", "Up")
End Sub


Private Sub MyGrid_CellOver(ByVal Row As Integer, ByVal Col As Integer)
    MyGrid.ToolTipText = MyGrid.Text(Row, Col)
End Sub

Private Sub MyGrid_KeyDown(KeyCode As Integer, Shift As Integer)
'    Text1.Text = Text1.Text & " KD(" & Hex(KeyCode) & ")SH(" & Hex(Shift) & ")"
    
End Sub

Private Sub MyGrid_KeyPress(KeyAscii As Integer)
'    Text1.Text = Text1.Text & " " & Hex(KeyAscii)
End Sub

Private Sub MyGrid_KeyUp(KeyCode As Integer, Shift As Integer)
'    Text1.Text = Text1.Text & " KU(" & Hex(KeyCode) & ")SH(" & Hex(Shift) & ")"
    Dim lc As Long
    Dim lr As Long
    
'    MyGrid.CurrentPos lr, lc
    If Shift = 0 Then
    
        Select Case KeyCode
            Case &H21
                ' Bild up
                If MyGrid.CurrentRow < 12 Then
                    MyGrid.CurrentRow = 0
                Else
                    MyGrid.CurrentRow = MyGrid.CurrentRow - 12
                End If
    '            MyGrid.SetFocus
                
    '            MyGrid.CurrentPos(
            Case &H22
                If MyGrid.CurrentRow < MyGrid.Rows - 12 Then
                    MyGrid.CurrentRow = MyGrid.CurrentRow + 12
                Else
                     MyGrid.CurrentRow = MyGrid.Rows - 1
                End If
            
            Case &H24
                ' Pos1
                MyGrid.CurrentCol = 0
            Case &H23
                ' Ende
                MyGrid.CurrentCol = MyGrid.Cols - 1
        End Select

    End If
    ' CTRL
    If Shift = 2 Then
        Select Case KeyCode
            Case &H24
                ' Pos1
                MyGrid.CurrentRow = 0
            Case &H23
            ' Ende
                MyGrid.CurrentRow = MyGrid.Rows - 1
        End Select
    End If
End Sub

