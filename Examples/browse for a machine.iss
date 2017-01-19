;
; Inno Setup 5.0.8
;
; original code of Oliver Bock
; http://news.jrsoftware.org/news/innosetup.code/msg09691.html


[Setup]
AppName=BrowseMachine
AppVerName=BrowseMachine
DefaultDirName={pf}\BrowseMachine
DisableProgramGroupPage=yes
CreateAppDir=false
Uninstallable=false
OutputBaseFilename=Test Install
OutputDir=userdocs:Inno Setup Examples Output

[Code]
type
   BROWSEINFO = record
     hwndOwner: HWND;
     pidlRoot: PIDL;
     pszDisplayName: PAnsiChar;
     lpszTitle: PAnsiChar;
     ulFlags: UINT;
     lpfn: DWORD;
     lParam: LPARAM;
     iImage: Integer;
   end;

function SHGetSpecialFolderLocation(hwndOwner: HWND; nFolder: Integer; var pidl: DWORD): HRESULT;
external 'SHGetSpecialFolderLocation@shell32.dll stdcall';

function SHBrowseForFolder(var lpbi: BROWSEINFO): PIDL;
external 'SHBrowseForFolder@shell32.dll stdcall';

function SHGetPathFromIDList(aPidl: PIDL; path: PChar): Boolean;
external 'SHGetPathFromIDList@shell32.dll stdcall';

const
    BIF_BROWSEFORCOMPUTER = $1000;
    CSIDL_NETWORK = $12;

var
    ServerPage: TInputQueryWizardPage;

procedure BrowseComputer(Sender: TObject);
var
    display_name, title: string;
    bi: BROWSEINFO;
    network, server_pidl: DWORD;
    hwndParent: HWND;
    NullPos : Integer;
begin
    // Work out where My Network Places is.
    hwndParent := WizardForm.Handle;
    SHGetSpecialFolderLocation(hwndParent, CSIDL_NETWORK, network);

    // Invoke the Browse dialog.
    bi.hwndOwner := hwndParent;
    bi.pidlRoot := network;
    SetLength(display_name, 261);
    bi.pszDisplayName := PChar(display_name);
    title := 'Select the Server:';
    bi.lpszTitle := PChar(title);
    bi.ulFlags := BIF_BROWSEFORCOMPUTER;
    bi.lpfn := 0;
    bi.lParam := 0;
    server_pidl := SHBrowseForFolder(bi);
    if server_pidl <> 0 then begin
       // Extract the computer name.

       NullPos := Pos(#0, display_name);
       if NullPos > 0 then SetLength(display_name, NullPos - 1);

       ServerPage.Values[0] := display_name;
    end;
end;

procedure InitializeWizard;
var
  button : TButton;
begin
  // Create the page

  // If installing as client, make the machine name a simple edit
  // box and add a browse button.
  ServerPage := CreateInputQueryPage(
          wpWelcome,
          'Select Server',
          'What machine is your server on?',
          'You must tell us which machine you will use as a server so that the program can connect automatically when it is started.');
    ServerPage.Add('Machine name:', False);
    button := TButton.Create(WizardForm);
    button.Parent := ServerPage.Surface;
    button.Left := WizardForm.DirBrowseButton.Left;
    button.Top := ServerPage.Edits[0].Top - (WizardForm.DIREDIT.Top - WizardForm.DirBrowseButton.Top);
    button.Width := WizardForm.DirBrowseButton.Width;
    button.Height := WizardForm.DirBrowseButton.Height;
    button.Caption := WizardForm.DirBrowseButton.Caption;
    button.OnClick := @BrowseComputer;
    ServerPage.Edits[0].Width := WizardForm.DIREDIT.Width;
end;


function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo,
  MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
var
  S: String;
begin
  // Fill the 'Ready Memo' with the normal settings and the custom settings
  S := '';
  S := S + 'Server Machine:' + NewLine;
  S := S + Space + ServerPage.Values[0] + NewLine;

  Result := S;
end;