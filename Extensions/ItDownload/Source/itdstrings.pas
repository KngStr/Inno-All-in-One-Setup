unit itdstrings;

{ ITDStrings.pas - Strings used in the GUI for localization.

  By Nicholas Sherlock - http://www.sherlocksoftware.org }


interface

uses sysutils, classes, IniFiles;

type
  TDefaultString = record
    id: integer;
    text: string;
  end;

const
  IS_GettingFileInformation = 100;
  IS_StartingDownload = 101;
  IS_Downloading = 102;
  IS_DownloadComplete = 103;
  IS_DownloadFailed = 104;
  IS_DownloadingSimple = 105;

  IS_TitleCaption = 200;
  IS_TitleDescription = 201;

  IS_MessageFailRetryContinue = 250;
  IS_MessageFailRetry = 251;

  IS_File = 300;
  IS_Speed = 301;
  IS_Status = 302;
  IS_ElapsedTime = 303;
  IS_RemainingTime = 304;
  IS_CurrentFile = 305;
  IS_TotalProgress = 306;

  IS_Unknown = 400;

  IS_Second = 450;
  IS_Seconds = 451;
  IS_Minute = 452;
  IS_Minutes = 453;
  IS_Hour = 454;
  IS_Hours = 455;
  IS_Day = 456;
  IS_Days = 457;
  IS_SpeedFormat = 458;
  IS_ProgressFormat = 459;
  IS_ProgressUnknownFormat = 460;
  IS_UseSimpleTime = 461;

  IS_Byte = 470;
  IS_Kilobyte = 471;
  IS_Megabyte = 472;
  IS_Gigabyte = 473;

  IS_ShowDetails = 500;
  IS_HideDetails = 501;
  IS_Retry = 502;

  //Updater example strings

  IS_Update_Caption = 600;
  IS_Update_Description = 601;
  IS_Update_Checking = 602;
  IS_Update_NewAvailable = 603;
  IS_Update_NoNewAvailable = 604;
  IS_Update_WantToCheck = 605;
  IS_Update_Failed = 606;
  IS_Update_WillLaunch = 607;
  IS_Update_WillLaunchWithPath = 608;

const
  DefaultStrings: array[0..45] of TDefaultString = (
    (id: IS_GettingFileInformation; text: 'Getting file information...'),
    (id: IS_StartingDownload; text: 'Starting download...'),
    (id: IS_Downloading; text: 'Downloading...'),
    (id: IS_DownloadingSimple; text: 'Downloading (%s)...'),
    (id: IS_DownloadComplete; text: 'Download complete!'),
    (id: IS_DownloadFailed; text: 'Download failed.'),

    (id: IS_TitleCaption; text: 'Downloading additional files'),
    (id: IS_TitleDescription; text: 'Please wait while setup downloads additional files...'),

    (id: IS_MessageFailRetryContinue; text: 'Sorry, the files could not be downloaded. ' +
    'Click ''Retry'' to try downloading the files again, or click ''Next'' to continue installing anyway.'),

    (id: IS_MessageFailRetry; text: 'Sorry, the files could not be downloaded. ' +
    'Click ''Retry'' to try downloading the files again, or click ''Cancel'' to terminate setup.'),

    (id: IS_File; text: 'File:'),
    (id: IS_Speed; text: 'Speed:'),
    (id: IS_Status; text: 'Status:'),
    (id: IS_ElapsedTime; text: 'Elapsed time:'),
    (id: IS_RemainingTime; text: 'Remaining time:'),
    (id: IS_CurrentFile; text: 'Current file:'),
    (id: IS_TotalProgress; text: 'Total progress:'),
    (id: IS_Unknown; text: 'Unknown'), // as in time remaining

    (id: IS_Second; text: 'second'),
    (id: IS_Seconds; text: 'seconds'),
    (id: IS_Minute; text: 'minute'),
    (id: IS_Minutes; text: 'minutes'),
    (id: IS_Hour; text: 'hour'),
    (id: IS_Hours; text: 'hours'),
    (id: IS_Day; text: 'day'),
    (id: IS_Days; text: 'days'),
    (id: IS_SpeedFormat; text: '%1 %2/s'),
    (id: IS_ProgressFormat; text: '%1 %2 of %3 %4'),
    (id: IS_ProgressUnknownFormat; text: '%1 %2 of unknown'),
    (id: IS_UseSimpleTime; text: 'No'),

    (id: IS_Byte; text: 'B'),
    (id: IS_Kilobyte; text: 'KB'),
    (id: IS_Megabyte; text: 'MB'),
    (id: IS_Gigabyte; text: 'GB'),

    (id: IS_ShowDetails; text: 'Details'),
    (id: IS_HideDetails; text: 'Hide'),
    (id: IS_Retry; text: 'Retry'),

    //Updater example strings
    (id: IS_Update_Caption; text: 'Update setup'),
    (id: IS_Update_Description; text: 'Checking for updates...'),
    (id: IS_Update_Checking; text: 'Checking for updates...'),
    (id: IS_Update_NewAvailable; text: 'There is a newer installer available. The new version is %2, the current version is %1. Would you like to download it?'),
    (id: IS_Update_NoNewAvailable; text: 'This installer is up to date.'),
    (id: IS_Update_WantToCheck; text: 'Would you like setup to check if a newer version of this program is available? (Requires an internet connection)'),
    (id: IS_Update_Failed; text: 'I was unable to check for an update, I will continue ' +
      'with the installation of the current version, %1.'),
    (id: IS_Update_WillLaunch; text: 'The new installer has been downloaded. It will now be launched.'),
    (id: IS_Update_WillLaunchWithPath; text: 'The new installer has been saved to "%1". It will now be launched.')
    );


type
  TITDStrings = class
  private
    fstrings: TMemIniFile;

    function GetText(index: integer): string;
    procedure SetText(index: integer; value: string);
  public
    procedure AppendFromFile(const filename: string);

    procedure LoadDefaults;

    constructor Create;
    destructor Destroy; override;

    property Text[index: integer]: string read getText write setText; default;
  end;

implementation

function TITDStrings.GetText(index: integer): string;
var i: integer;
begin
  result := fstrings.ReadString('Strings', inttostr(index), '<default>');
  if result = '<default>' then begin
    for i := 0 to high(defaultstrings) do
      if defaultstrings[i].id = index then begin
        result := defaultstrings[i].text;
        exit;
      end;
    result := ''; //not found
  end;
end;

procedure TITDStrings.SetText(index: integer; value: string);
begin
  fstrings.WriteString('Strings', inttostr(index), value);
end;

{Add the contents of the file at 'filename' into the list}

procedure TITDStrings.AppendFromFile(const filename: string);
var keys: TStringlist;
  temp: TMemIniFile;
  t1: integer;
begin
  temp := TMemIniFile.create(filename);
  try
    keys := tstringlist.create;
    try
      temp.ReadSection('Strings', keys);
      for t1 := 0 to keys.count - 1 do
        fstrings.WriteString('Strings', keys[t1], temp.ReadString('Strings', keys[t1], ''));
    finally
      keys.free;
    end;


  finally
    temp.free;
  end;
end;

constructor TITDStrings.Create;
begin
  fstrings := TMemIniFile.Create('');
  LoadDefaults;
end;

procedure TITDStrings.LoadDefaults;
var t1: integer;
begin
  fstrings.Clear;
  for t1 := Low(DefaultStrings) to High(DefaultStrings) do
    fstrings.WriteString('Strings', inttostr(defaultstrings[t1].id), defaultstrings[t1].text);

end;

destructor TITDStrings.Destroy;
begin
  fstrings.free;
  inherited;
end;


end.

