unit itdengine;


{ ITDEngine.pas - The engine that users of the DLL interact with, constructs the
                  GUI and calls the download engine to do the downloading

  By Nicholas Sherlock - http://www.sherlocksoftware.org }


interface

uses sysutils, windows, Classes, contnrs, liteui, downloadengine,
  itdstrings;

const
  ITDERR_SUCCESS = 0;
  ITDERR_USERCANCEL = 1;
  ITDERR_ERROR = 3;

  itdversion = '0.3.5';

  //GUI consts
  second_column = 140;
  vert_spacing = 3;
  box_width = 400;

var
  resultbuffer: string; //for returning huge strings

type
  EErrorcode = class(exception)
  public
    errcode: integer;
    constructor Create(code: Integer); reintroduce;
  end;

  TDLFile = class
  public
    urls: array of string;
    filename: string;
    size: cardinal;
    sizeunknown: boolean; //if, while downloading, we find that the predicted size is incorrect
    procedure addMirror(const url: string);
    constructor create(const url: string; const filename: string);
    procedure querysize(wine: TDownloadEngine);
  end;

  TUI = class
  private
    FDetailedMode, FSingleFileMode: boolean;
    FParent: hwnd;

    FStrings: TITDStrings;

    btnDetails: TLiteButton;

    lblTotalProgress, valTotalProgress: TLiteLabel;

    pnlContainer: TLitePanel;

    barCurrent, barTotal: TLiteProgress;

    lblFile, lblSpeed, lblStatus, lblElapsedTime, lblRemainingTime, lblCurrent,
      valFile, valSpeed, valStatus, valElapsedTime, valRemainingTime, valCurrent: tlitelabel;
    FSmoothBars: boolean;

    procedure DetailsClick(sender: TObject);
    procedure SetStatus(const value: string);
    procedure SetFilename(const value: string);
    procedure SetDetailsMode(const Value: boolean);
    procedure RearrangeUI;
    procedure SetSingleFileMode(const Value: boolean);
    procedure SetSmoothBars(const Value: boolean);
  public
    property SmoothBars: boolean read FSmoothBars write SetSmoothBars;
    property DetailedMode: boolean read FDetailedMode write SetDetailsMode;
    property SingleFileMode: boolean read FSingleFileMode write SetSingleFileMode;
    property Status: string write setstatus;
    property Filename: string write setfilename;
    constructor Create(parent: hwnd; strings: TITDStrings);
    destructor Destroy; override;
  end;

  TITDEngine = class
  private
    FWE: TDownloadEngine;

    FTotalStartTime, FFileStartTime: TDateTime;
    FTotalBytesWritten: cardinal; //Total bytes of all completely downloaded files so far

    FFiles: tobjectlist;

    FTotalSizeUnknown: boolean;

    FLastProgress: TDateTime;

    FDownloadDelay: integer;
    FCancel: boolean;

    //Defaults for newly-created UIs
    FDefaultSmooth, FDefaultDetailedMode: boolean;
    FDebugMessages: boolean;

    FOptions: tstringlist;
    FUIs: TObjectList;
    FUI: TUI; //currently selected UI
    FStrings: TITDStrings; //localization strings
    function getfile(index: integer): TDLFile;
    function downloadlist(files: tobjectlist): integer;
    function shouldcancel: Boolean;
    function getUI: TUI;
    procedure setUI(value: TUI);
    function DownloadProgress(stage: TDownloadStage;
      downbytes, bytestotal: longword; tag: TObject): boolean;

    function CalcTotalFilesSize: cardinal;

  public
    function UIByHandle(handle: hwnd): TUI;

    property UI: TUI read getUI write setUI; //currently selected UI
    property Strings: TITDStrings read FStrings write FStrings;

    function Count: integer;

    function PostPage(const url, data: string; out resultbuffer: string): boolean;

    procedure Cancel;
    function CreateUI(hosthwnd: hwnd): TUI;
    procedure AddFile(const url, filename: string; size: integer = 0);
    procedure AddMirror(const url, filename: string);
    procedure ClearFiles;
    procedure SetOption(const option, value: string);
    function GetOption(const option: string): string;
    function DownloadFile(const url, filename: string): integer;
    function DownloadFiles(surface: hwnd): integer;

    property Files[index: integer]: TDLFile read getfile;
    property DownloadDelay: integer read FDownloadDelay write FDownloadDelay;
    property DebugMessages: boolean read FDebugMessages write FDebugMessages;

    constructor Create;
    destructor Destroy; override;
  end;

var engine: TITDEngine;

implementation

uses formatting;

constructor eerrorcode.create(code: Integer);
begin
  inherited create('');
  errcode := code;
end;

procedure TUI.RearrangeUI;
begin
  barCurrent.visible := DetailedMode and not SingleFileMode;
  lblCurrent.visible := DetailedMode and not SingleFileMode;
  valCurrent.visible := DetailedMode and not SingleFileMode;

  lblFile.visible := DetailedMode;
  lblSpeed.visible := DetailedMode;
  lblStatus.visible := DetailedMode;
  lblElapsedTime.visible := DetailedMode;
  lblRemainingTime.visible := DetailedMode;

  valFile.visible := DetailedMode;
  valSpeed.visible := DetailedMode;
  valStatus.visible := DetailedMode;
  valElapsedTime.visible := DetailedMode;
  valRemainingTime.visible := DetailedMode;

  if barCurrent.visible then begin
    lblCurrent.top := barTotal.top + barTotal.height + 8;

    valCurrent.Top := lblCurrent.top;
    barCurrent.Top := lblCurrent.top + lblCurrent.height + vert_spacing;
  end;

  if SingleFileMode then begin
    lblFile.top := barTotal.top + barTotal.height + vert_spacing * 3;
  end else begin
    lblFile.top := barCurrent.top + barCurrent.height + vert_spacing * 3;
  end;
  valFile.top := lblFile.top;

  lblSpeed.top := lblFile.top + lblFile.height + vert_spacing;
  valSpeed.top := lblSpeed.top;

  lblStatus.top := valSpeed.top + valSpeed.height + vert_spacing;
  valStatus.top := lblStatus.top;

  lblelapsedtime.top := lblStatus.top + lblStatus.height + vert_spacing;
  valelapsedtime.top := lblElapsedTime.top;

  lblremainingtime.top := lblElapsedTime.top + lblElapsedTime.height + vert_spacing;
  valRemainingTime.Top := lblRemainingTime.top;

  if DetailedMode then begin
    btnDetails.Caption := FStrings[IS_HideDetails];
    btnDetails.Top := lblRemainingTime.top + lblRemainingTime.height + 8;

    lblTotalProgress.Caption := FStrings[IS_TotalProgress]; //WRONG
  end else begin
    btnDetails.Caption := FStrings[IS_ShowDetails];
    btnDetails.Top := barTotal.top + barTotal.height + 8;

    lblTotalProgress.Caption := valStatus.caption;
  end;

  pnlContainer.height := btnDetails.Top + btnDetails.height + 8;
end;

procedure TUI.SetDetailsMode(const Value: boolean);
begin
  FDetailedMode := Value;

  RearrangeUI;
end;

procedure tui.setfilename(const value: string);
begin
  valfile.caption := value;
end;

procedure TUI.SetSingleFileMode(const Value: boolean);
begin
  FSingleFileMode := Value;

  RearrangeUI;
end;

procedure TUI.SetSmoothBars(const Value: boolean);
begin
  FSmoothBars := Value;

  barCurrent.Smooth := value;
  barTotal.Smooth := value;
end;

procedure tui.setstatus(const value: string);
begin
  valstatus.caption := value;
  if not DetailedMode then
    lblTotalProgress.Caption := value;
end;

constructor tui.create(parent: hwnd; strings: TITDStrings);
begin
  liteui_init;
  FParent := parent;
  FStrings := strings;

  FSmoothBars := true;
  FDetailedMode := False;

  pnlContainer := TLitePanel.create(parent);
  pnlContainer.ParentFont := false;
  pnlContainer.font.name := 'MS Shell Dlg';
  pnlContainer.font.size := 14;
  pnlContainer.width := box_width;

  //The parent of all controls from now on is the main panel
  parent := pnlcontainer.handle;

  lblTotalProgress := TLiteLabel.create(parent);
  lblTotalProgress.AutoSize := true;
  pnlContainer.addChild(lblTotalProgress);

  valTotalProgress := TLiteLabel.create(parent);
  valTotalProgress.align := laRight;
  valTotalProgress.AutoSize := false;
  valTotalProgress.Width := 150;
  valTotalProgress.Left := box_width - valTotalProgress.Width;
  pnlContainer.addChild(valTotalProgress);

  barTotal := TLiteProgress.create(parent);
  barTotal.width := box_width;
  barTotal.Top := lblTotalProgress.Top + lblTotalProgress.Height + vert_spacing;
  pnlContainer.addchild(barTotal);

  lblCurrent := TLiteLabel.create(parent);
  lblCurrent.caption := Strings[IS_CurrentFile];
  pnlContainer.addchild(lblCurrent);

  valCurrent := TLiteLabel.create(parent);
  valCurrent.width := 150;
  valCurrent.align := laRight;
  valCurrent.AutoSize := false;
  valCurrent.caption := '';
  valCurrent.left := box_width - valcurrent.width;
  pnlContainer.addchild(valCurrent);

  barCurrent := TLiteProgress.create(parent);
  barCurrent.width := box_width;
  pnlContainer.addchild(barCurrent);

  lblFile := tlitelabel.create(parent);
  lblFile.autosize := true;
  lblFile.caption := Strings[IS_File];
  pnlContainer.addchild(lblFile);

  valFile := TLiteLabel.create(parent);
  valFile.caption := '';
  valFile.left := second_column;
  pnlContainer.addchild(valFile);

  lblSpeed := TLiteLabel.create(parent);
  lblSpeed.caption := Strings[IS_Speed];
  pnlContainer.addchild(lblSpeed);

  valSpeed := TLiteLabel.create(parent);
  valSpeed.caption := '';
  valSpeed.left := second_column;
  pnlContainer.addchild(valSpeed);

  lblStatus := TLiteLabel.create(parent);
  lblStatus.caption := strings[IS_Status];
  pnlContainer.addchild(lblStatus);

  valStatus := TLiteLabel.create(parent);
  valStatus.caption := '';
  valStatus.left := second_column;
  pnlContainer.addchild(valstatus);

  lblelapsedtime := TLiteLabel.create(parent);
  lblelapsedtime.caption := Strings[IS_ElapsedTime];
  pnlContainer.addchild(lblElapsedTime);

  valElapsedtime := TLiteLabel.create(parent);
  valElapsedTime.caption := '';
  valElapsedTime.left := second_column;
  pnlContainer.addchild(valElapsedTime);

  lblRemainingTime := TLiteLabel.create(parent);
  lblRemainingtime.caption := Strings[IS_RemainingTime];
  pnlContainer.addchild(lblRemainingTime);

  valRemainingtime := TLiteLabel.create(parent);
  valRemainingtime.caption := '';
  valremainingtime.left := second_column;
  pnlContainer.addchild(valRemainingTime);

  btnDetails := TLiteButton.create(parent);
  btnDetails.Left := box_width - btnDetails.Width;
  btnDetails.OnClick := DetailsClick;
  pnlContainer.addchild(btnDetails);

  FDetailedMode := false;
  FSingleFileMode := false;

  processmessages;
end;

destructor tui.destroy;
begin
  pnlContainer.free;

  inherited;
end;


procedure TUI.DetailsClick(sender: TObject);
begin
  DetailedMode := not DetailedMode;
end;

procedure TDLFile.addMirror(const url: string);
begin
  setlength(urls, length(urls) + 1);
  urls[high(urls)] := url;
end;

constructor TDLFile.create(const url, filename: string);
begin
  setlength(urls, 1);
  urls[0] := url;
  self.filename := filename;
end;

procedure tdlfile.querysize(wine: TDownloadEngine);
var swap: string;
  i: integer;
begin
  for i := 0 to high(urls) do
    if wine.getwebfilesize(urls[i], size) then begin
      { Since this mirror is the one which is the most likely
        to have a successful download, move it to the front of the mirror
        list }
      if i <> 0 then begin
        swap := urls[0];
        urls[0] := urls[i];
        urls[i] := swap;
      end;
      exit; //Success
    end;

  //Failed to resolve size
  size := 0;
end;

constructor TITDEngine.create;
begin
  inherited;
  FWE := TDownloadEngine.Create;

  FWE.TimeOut := 10000;
  FWE.Agent := 'InnoTools_Downloader';
  FWE.progress := DownloadProgress;

  FStrings := TITDStrings.create;
  FFiles := TObjectList.Create;
  FUIs := tobjectlist.create;
  FOptions := tstringlist.create;
  FCancel := false;
  FDownloadDelay := 0;

  FDefaultSmooth := false;
  FDefaultDetailedMode := false;
end;

procedure TITDEngine.AddMirror(const url, filename: string);
var i: integer;
begin
  for i := 0 to FFiles.Count - 1 do begin

    if AnsiCompareText(TDlFile(FFiles[i]).filename, filename) = 0 then begin
      TDlFile(FFiles[i]).addMirror(url);
    end;
  end;

end;

function TITDEngine.calcTotalFilesSize: cardinal;
var t1: integer;
begin
  FTotalSizeUnknown := false;
  result := FTotalBytesWritten; //Since these are removed from ffiles list
  for t1 := 0 to FFiles.count - 1 do begin
    result := result + TDLFile(FFiles[t1]).size;

    if TDLFile(files[t1]).size = 0 then
      FTotalSizeUnknown := true;
  end;
end;


destructor TITDEngine.destroy;
begin
  FWE.free;
  FUIs.free;
  FFiles.free;
  FOptions.free;
  FStrings.free;
  inherited;
end;

function TITDEngine.UIByHandle(handle: hwnd): TUI;
var t1: integer;
begin
  for t1 := 0 to FUIs.count - 1 do
    if tui(FUIs[t1]).FParent = handle then begin
      result := tui(FUIs[t1]);
      exit;
    end;
  result := CreateUI(handle);
end;

function TITDEngine.getUI: TUI;
begin
  result := FUI;
end;

function TITDEngine.PostPage(const url, data: string; out resultbuffer: string): boolean;
begin
  result := FWE.PostPage(url, data, resultbuffer);
end;

procedure TITDEngine.setUI(value: TUI);
begin
  FUI := value;
end;

function TITDEngine.shouldcancel: Boolean;
begin
  result := terminated or FCancel;
end;

function TITDEngine.getfile(index: integer): TDLFile;
begin
  result := TDLFile(FFiles[index]);
end;

procedure TITDEngine.Cancel;
begin
  FCancel := true;
end;

function TITDEngine.Count: integer;
begin
  result := FFiles.count;
end;

procedure TITDEngine.AddFile(const url, filename: string; size: integer = 0);
var f: TDLFile;
begin
  f := TDLFile.Create(url, filename);
  f.size := size;
  FFiles.Add(f);
end;

function TITDEngine.GetOption(const option: string): string;
begin
  if AnsiCompareText(option, 'ITD_Version') = 0 then
    result := itdversion
  else if AnsiCompareText(option, 'Debug_DownloadDelay') = 0 then
    result := inttostr(FDownloadDelay)
  else if AnsiCompareText(option, 'ITD_NoCache') = 0 then begin
    result := '0'; //Depreceated
  end else if AnsiCompareText(option, 'ITD_Agent') = 0 then begin
    result := FWE.Agent;
  end else if AnsiCompareText(option, 'UI_SmoothBars') = 0 then begin
    if FDefaultSmooth then result := '1' else result := '0';
  end else if AnsiCompareText(option, 'UI_DetailedMode') = 0 then begin
    if FDefaultDetailedMode then result := '1' else result := '0';
  end else if AnsiCompareText(option, 'Debug_Messages') = 0 then begin
    if FDebugMessages then result := '1' else result := '0'
  end else
    result := '';
end;

procedure TITDEngine.SetOption(const option, value: string);
var t1: integer;
begin
  if AnsiCompareText(option, 'Debug_DownloadDelay') = 0 then begin
    FDownloadDelay := strtoint(value);
  end else if AnsiCompareText(option, 'ITD_TimeOut') = 0 then begin
    FWE.timeout := strtoint(value);
  end else if AnsiCompareText(option, 'ITD_NoCache') = 0 then begin
        // fwe.nocache := (value = '1'); Depreceated
  end else if AnsiCompareText(option, 'ITD_Agent') = 0 then begin
    FWE.Agent := value;
  end else if AnsiCompareText(option, 'UI_SmoothBars') = 0 then begin
    FDefaultSmooth := value = '1';
    for t1 := 0 to FUIs.count - 1 do begin
      tui(FUIs[t1]).barCurrent.smooth := FDefaultSmooth;
      tui(FUIs[t1]).barTotal.smooth := FDefaultSmooth;
    end;
  end else if AnsiCompareText(option, 'UI_DetailedMode') = 0 then begin
    FDefaultDetailedMode := value = '1';
    for t1 := 0 to FUIs.count - 1 do begin
      tui(FUIs[t1]).DetailedMode := FDefaultDetailedMode;
    end;
  end else if AnsiCompareText(option, 'Debug_Messages') = 0 then
    FDebugMessages := (value = '1');
end;

function TITDEngine.CreateUI(hosthwnd: hwnd): TUI;
begin
  result := TUI.create(hosthwnd, strings);

  result.SmoothBars := FDefaultSmooth;
  result.DetailedMode := FDefaultDetailedMode;

  FUIs.Add(result);
end;

procedure TITDEngine.ClearFiles;
begin
  FFiles.Clear;
end;

function TITDEngine.DownloadFile(const url, filename: string): integer;
var f: TDLFile;
  list: tobjectlist;
begin
  f := TDLFile.Create(url, filename);
  list := TObjectList.Create;
  try
    list.Add(f);
    try
      result := downloadlist(list);
    except //don't allow our exceptions to percolate to the host process!
      on e: eerrorcode do
        Result := e.errcode;
    else
      result := ITDERR_ERROR; //unexpected and unknown error
    end;
  finally
    list.free;
  end;
end;

function TITDEngine.DownloadFiles(surface: hwnd): integer;
begin
  try
    ui := UIByHandle(surface); //set the UI to be used
    result := downloadlist(FFiles);
  except //don't allow our exceptions to percolate to the host process!
    on e: eerrorcode do
      Result := e.errcode;
  else
    result := ITDERR_ERROR; //unexpected and unknown error
  end;
end;


function max(i1, i2: double): double;
begin
  if i1 > i2 then
    result := i1 else
    result := i2;
end;

{Called by TDownloadEngine to report download progress of the file we gave it}

function TITDEngine.DownloadProgress(
  stage: TDownloadStage; downbytes, bytestotal: longword; tag: TObject): boolean;
var f: TDLFile;
  totalFileBytes: Cardinal;
  totalDownloaded: cardinal;

  procedure updateTotalBar;
  begin
    ui.barTotal.max := totalFileBytes;

    ui.barTotal.Marquee := FTotalSizeUnknown;

    if FTotalSizeUnknown then begin
      ui.valTotalProgress.caption := fileprogresstostr(TotalDownloaded, 0, true, strings);
    end else begin
      ui.valTotalProgress.caption := fileprogresstostr(TotalDownloaded, totalFileBytes, False, strings);
      ui.barTotal.position := TotalDownloaded;
      ui.barTotal.update;
    end;
  end;

  procedure UpdateCurrentBar;
  begin
    ui.barCurrent.Marquee := downbytes > f.size;
    if downbytes > f.size then begin
    //essentially, we don't know the proper size of the file, so let's not let on to the user.. :)
      ui.valcurrent.caption := fileprogresstostr(downbytes, 0, true, strings);
    end else begin
      ui.valcurrent.caption := fileprogresstostr(downbytes, f.size, false, strings);
      ui.barcurrent.position := downbytes;
      ui.barCurrent.Update;
    end;
  end;


begin
  if shouldcancel then begin
    result := false; //stop downloading!
    exit;
  end else
    result := true;

  if not assigned(UI) then exit;

  f := TDLFile(tag);

  if bytestotal <> 0 then begin
    f.size := bytestotal;
    ui.barcurrent.max := bytestotal;
  end;

   //Total downloaded is the total of completed files plus the progress on this file
  totalDownloaded := FTotalBytesWritten + downBytes;

   //Total bytes of files we are to download
  totalFileBytes := CalcTotalFilesSize;

  case stage of
    dsDone: begin
        f.size := downbytes;
        totalFileBytes := CalcTotalFilesSize; //just in case we have new information
        updateCurrentBar;
        updateTotalBar;
      end;
    dsStartingDownload: begin
        ui.status := FStrings[IS_StartingDownload];
        ui.filename := ExtractFileName(f.filename);
        ui.barcurrent.max := f.size;

        updateCurrentBar;

        ui.barCurrent.Marquee := true;

        if not ui.DetailedMode then
          ui.lblTotalProgress.caption := Format(Strings[IS_DownloadingSimple], [extractfilename(f.filename)]);

        processmessages;
      end;
    dsDownloading: begin

        if FDownloadDelay <> 0 then
          sleep(FDownloadDelay);

        if now < FLastProgress + 0.5 / SecsPerDay then
          exit;
        FLastProgress := now;

        if ui.DetailedMode then begin
          ui.lblTotalProgress.caption := Strings[IS_TotalProgress];
          ui.status := FStrings[IS_Downloading];
        end else
          ui.lblTotalProgress.caption := Format(Strings[IS_DownloadingSimple], [extractfilename(f.filename)]);

        if now - FFileStartTime > 0 then
          ui.valSpeed.caption := fileratetostr(round(downbytes / ((now - FFileStartTime) * secsperday)), strings);
        ui.valElapsedTime.caption := shorttimetostr(now - FTotalStartTime, strings);
        if not FTotalSizeUnknown then
          ui.valRemainingTime.caption := shorttimetostr(max((totalFileBytes / TotalDownloaded) * (now - FTotalStartTime) - (now - FTotalStartTime), 0), strings) else
          ui.valRemainingTime.caption := Strings[IS_Unknown];

        updateCurrentBar;

        updateTotalBar;

        processmessages;
      end;
  end;
end;

function TITDEngine.downloadlist(files: tobjectlist): integer;
var t1, i: integer;
  filestream: TFileStream;
  f: tdlfile;
  url: string;
  success: boolean;
begin
  FCancel := false;

  processmessages;
  if assigned(ui) then begin
    ui.status := FStrings[IS_GettingFileInformation];
    ui.barTotal.Marquee := true;
    ui.barCurrent.Marquee := true;

    ui.valElapsedTime.Caption := '';
    ui.valTotalProgress.caption := '';
    ui.valCurrent.caption := '';
    ui.barCurrent.Position := 0;

    ui.SingleFileMode := files.Count <= 1;
  end;

  try
    if assigned(ui) then begin
      for t1 := 0 to files.count - 1 do begin
        if FDownloadDelay > 0 then begin
      { If we want a download delay, simulate a delay in connecting to the server
        to get file size}
          for i := 1 to 8 do begin
            processmessages;
            sleep(100);
          end;
        end;
        if TDLFile(files[t1]).size = 0 then
          TDLFile(files[t1]).querysize(FWE);

        processmessages;
        if ShouldCancel then
          raise EErrorcode.Create(ITDERR_USERCANCEL);
      end;
    end;

    FTotalStartTime := now;
    FTotalBytesWritten := 0;

    while files.Count > 0 do begin //Loop over all files to be downloaded
      f := tdlfile(files[0]);

      FFileStartTime := now;

      filestream := TFileStream.Create(f.filename, fmCreate or fmShareDenyNone);
      try
        success := false;
        for url in f.urls do begin
          if FWE.DownloadWebFileToStream(url, filestream, f) then begin
            success := true;
            break;
          end;
        end;
        if not success then begin //couldn't get this file from any mirror
          if terminated then begin
            raise EErrorCode.create(ITDERR_USERCANCEL);
          end;

          if FDebugMessages then begin
            showmessage('Error: ' + FWE.LastError);
          end;
          raise EErrorcode.create(ITDERR_ERROR);
        end;

        FTotalBytesWritten := FTotalBytesWritten + filestream.Size;
      finally
        filestream.free;
      end;
      files.remove(f); //we have finished this file!
    end;

    result := ITDERR_SUCCESS; //done without incident!
    if assigned(ui) then begin
      ui.status := FStrings[IS_DownloadComplete];
      ui.filename := '';

      ui.valSpeed.caption := '';
      ui.valRemainingTime.caption := '';
    end;

  except
    //Download failed!
    if assigned(ui) then begin
      ui.status := FStrings[IS_DownloadFailed];
      ui.filename := '';
      ui.valCurrent.caption := '';
      ui.valSpeed.caption := '';
      ui.valRemainingTime.caption := '';

      ui.barCurrent.Marquee := false;
      ui.barTotal.Marquee := false;

      ui.barCurrent.Position := 0;

      ui.valTotalProgress.visible := false;
    end;

    raise;
  end;
end;

function itd_downloadfile(url: PChar; destfilename: PChar): integer; stdcall;
begin
  try
    result := engine.downloadfile(url, destfilename);
  except
    on e: EErrorCode do
      result := e.errcode;
  else
    result := ITDERR_ERROR;
  end;
end;

function itd_downloadfiles(surface: hwnd): integer; stdcall;
begin
  try
    result := engine.downloadfiles(surface);
  except
    on e: EErrorCode do
      result := e.errcode;
  else
    result := ITDERR_ERROR;
  end;
end;

procedure itd_clearfiles; stdcall;
begin
  engine.clearfiles;
end;

procedure itd_addmirror(url, destfilename: PChar); stdcall;
begin
  engine.AddMirror(url, destfilename);
end;

procedure itd_addfile(url, destfilename: PChar); stdcall;
begin
  engine.AddFile(url, destfilename);
end;

procedure itd_addfilesize(url: PChar; destfilename: PChar; size: integer); stdcall;
begin
  engine.AddFile(url, destfilename, size);
end;

procedure itd_initui(HostHwnd: dword); stdcall;
begin
  engine.createui(hosthwnd);
end;

procedure itd_cancel; stdcall;
begin
  engine.cancel;
end;

function itd_filecount: integer; stdcall;
begin
  result := engine.count;
end;

procedure itd_setoption(option, value: PChar); stdcall;
begin
  try
    engine.setoption(option, value);
  except
  end;
end;

function itd_getoption(option: PChar; buffer: PChar; length: integer): integer; stdcall;
var s: string;
begin
  s := engine.GetOption(option);
  StrLCopy(buffer, pchar(s), length - 1);
  result := StrLen(buffer);
end;

function itd_loadstrings(filename: PChar): boolean; stdcall;
begin
  try
    engine.Strings.loaddefaults;
    engine.Strings.appendfromfile(filename);
    result := true;
  except
    result := false;
  end;
end;

procedure itd_setstring(index: integer; value: pchar); stdcall;
begin
  engine.Strings[index] := value;
end;

function itd_getstring(index: integer): boolean; stdcall;
begin
  resultbuffer := engine.Strings[index];
  result := length(resultbuffer) > 0;
end;

function itd_postpage(url: pchar; buffer: pchar; length: integer): boolean; stdcall;
var data: string;
begin
  try
    setlength(data, length);
    Move(buffer^, data[1], length);
    result := engine.PostPage(url, data, resultbuffer);
  except
    result := false;
  end;
end;

function min(a, b: integer): integer;
begin
  if a < b then
    result := a
  else
    result := b;
end;


procedure itd_getresultstring(buffer: pchar; maxlen: integer); stdcall;
begin
  move(resultbuffer[1], buffer^, min(length(resultbuffer), maxlen));
end;

function itd_getfilesize(url: pchar; var size: cardinal): boolean; stdcall;
begin
  result := engine.FWE.GetWebFileSize(url, size);
end;

function itd_getresultlen: integer; stdcall;
begin
  result := length(resultbuffer);
end;

exports itd_downloadfile, itd_addfile, itd_addfilesize, itd_clearfiles, itd_downloadfiles, itd_initui,
  itd_cancel, itd_setoption, itd_getoption, itd_filecount, itd_setstring, itd_getstring, itd_loadstrings,
  itd_addmirror, itd_postpage, itd_getresultstring, itd_getresultlen, itd_getfilesize;

initialization
  engine := TITDEngine.create;
finalization
  engine.free;
end.

