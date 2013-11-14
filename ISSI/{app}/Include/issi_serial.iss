
; _ISSI_SERIAL.EXE source script
;
;  This script will generate _issi_md5.exe
;  This exe will read the _issi.ini and will
;  Get the MD5 from a string (or file)
;
;  ISSI_GetMD5OfString
;  ISSI_GetMD5OfFile
; (c) 2005 Jan Albartus / LOGAN Interactive

#define AppName "ISSI Serial Generator"
#define AppVersion "1.4"
#define AppPublisher "Jan Albartus"
#define AppURL "http://www.albartus.com"

[Setup]
AppName={#AppName}
AppVerName={#AppName} v{#AppVersion}
AppVersion={#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppUrl}
AppSupportURL={#AppUrl}
AppUpdatesURL={#AppUrl}
AppCopyright={#AppPublisher}
VersionInfoVersion={#AppVersion}
VersionInfoTextVersion={#AppVersion}
VersionInfoDescription=ISSI Executable Component
VersionInfoCompany={#AppPublisher}
OutputDir={#SourcePath}
OutputBaseFilename=_issi_serial
DisableStartupPrompt=true
DisableReadyPage=true
DisableFinishedPage=true
CreateAppDir=no
CreateUninstallRegKey=no
Uninstallable=no
Compression=lzma/ultra
SolidCompression=true
InternalCompressLevel=ultra

[Code]
function issiGetSerial( dummy: String ) : String;
Var
    myDashCounter:Integer;
    myX :Integer;
    mySerialRequest :String;
    mySerialGroups :Integer;
    mySerialGroupLength :Integer;
    mySerial        :String;
    myChrArray : Array[0..61] of String;
    myIndex:Integer;
    myOffset:Integer;
begin
  myChrArray[0]  := '0';
  myChrArray[1]  := '1';
	myChrArray[2]  := '2';
	myChrArray[3]  := '3';
	myChrArray[4]  := '4';
	myChrArray[5]  := '5';
	myChrArray[6]  := '6';
	myChrArray[7]  := '7';
	myChrArray[8]  := '8';
	myChrArray[9]  := '9';
	myChrArray[10]  := 'A';
	myChrArray[11]  := 'B';
	myChrArray[12]  := 'C';
	myChrArray[13]  := 'D';
	myChrArray[14]  := 'E';
	myChrArray[15]  := 'F';
	myChrArray[16]  := 'G';
	myChrArray[17]  := 'H';
  myChrArray[18]  := 'I';
	myChrArray[19]  := 'J';
	myChrArray[20]  := 'K';
	myChrArray[21]  := 'L';
	myChrArray[22]  := 'M';
	myChrArray[23]  := 'N';
	myChrArray[24]  := 'O';
	myChrArray[25]  := 'P';
	myChrArray[26]  := 'Q';
	myChrArray[27]  := 'R';
	myChrArray[28]  := 'S';
	myChrArray[29]  := 'T';
	myChrArray[30]  := 'U';
	myChrArray[31]  := 'V';
	myChrArray[32]  := 'W';
	myChrArray[33]  := 'X';
	myChrArray[34]  := 'Y';
	myChrArray[35]  := 'Z';
	myChrArray[36]  := 'a';
	myChrArray[37]  := 'b';
	myChrArray[38]  := 'c';
	myChrArray[39]  := 'd';
	myChrArray[40]  := 'e';
	myChrArray[41]  := 'f';
	myChrArray[42]  := 'g';
	myChrArray[43]  := 'h';
  myChrArray[44]  := 'i';
	myChrArray[45]  := 'j';
	myChrArray[46]  := 'k';
	myChrArray[47]  := 'l';
	myChrArray[48]  := 'm';
	myChrArray[49]  := 'n';
	myChrArray[50]  := 'o';
	myChrArray[51]  := 'p';
	myChrArray[52]  := 'q';
	myChrArray[53]  := 'r';
	myChrArray[54]  := 's';
	myChrArray[55]  := 't';
	myChrArray[56]  := 'u';
	myChrArray[57]  := 'v';
	myChrArray[58]  := 'w';
	myChrArray[59]  := 'x';
	myChrArray[60]  := 'y';
	myChrArray[61]  := 'z';

  mySerialGroupLength   :=  StrToInt(GetIniString('ISSI', 'SerialGroupLength','', ExpandConstant('{src}\Serials.ini')));
  mySerialGroups        :=  StrToInt(GetIniString('ISSI', 'SerialGroups','', ExpandConstant('{src}\Serials.ini')));
  mySerialRequest        :=GetIniString('ISSI', 'SerialRequest','', ExpandConstant('{src}\Serials.ini'));
  mySerial := '';
  myX := 0;
  myDashCounter := 0;
  
  if (mySerialRequest='0') then begin
        myIndex := 35;
        myOffset := 1;
  end;
  if (mySerialRequest='1') then begin
        myIndex := 35;
        myOffset := 1;
  end;
  if (mySerialRequest='Numbers') then begin
        myIndex := 9;
        myOffset := 0;
  end;

  if (mySerialRequest='All') then begin
        myIndex := 61;
        myOffset := 0;
  end;

  if (mySerialRequest='Capitals') then begin
        myIndex := 25;
        myOffset := 10;
  end;

  if (mySerialRequest='Letters') then begin
        myIndex := 51;
        myOffset := 10;
  end;

  While ( myX < (mySerialGroupLength * mySerialGroups) ) do begin
    mySerial := mySerial+myChrArray[random(myIndex)+myOffset];
      myDashCounter := myDashCounter+1;
      myX := myX+1;
      if (myDashCounter = mySerialGroupLength) then begin
        if not (myX = (mySerialGroupLength * mySerialGroups )) then begin
          mySerial := mySerial + '-';
          myDashCounter := 0;
          end;
      end;

  end;
  Result := mySerial;
end;

function issiUpdateSerialCount( dummy: String ) : String;
Var
    mySerialCounter :String;
begin
    mySerialCounter := IntToStr(StrToInt(GetIniString('ISSI', 'SerialCounter','', ExpandConstant('{src}\Serials.ini')))+1);
    if (mySerialCounter = '') then begin
      mySerialCounter:='0';
    end;
    Result := mySerialCounter
end;

function issiGetSerialCount( dummy: String ) : String;
Var
    mySerialCounter :String;
begin
    Result      :=  'Serial'+ GetIniString('ISSI', 'SerialCounter','', ExpandConstant('{src}\Serials.ini'));
end;

function issiGetSerialAppName( dummy: String ) : String;
begin
    Result      :=  GetIniString('ISSI', 'SerialAppName','', ExpandConstant('{src}\Serials.ini'));
end;

function InitializeSetup(): Boolean;
  var
      mykey          : String;
begin
      if Pos('/VERYSILENT', UpperCase(GetCmdTail)) = 0 then
        begin
          MsgBox( ExpandConstant('This file is only to be used by ISSI'), mbInformation, MB_OK );
          Result := False;
        end;
      if Pos('/VERYSILENT', UpperCase(GetCmdTail)) > 0 then
        begin
          ////
          Result := True;
        end;
end;

[INI]
Filename: "{src}\Serials.ini"; Section: "ISSI"; Key: "SerialCounter"; String: {code:issiUpdateSerialCount|''}
Filename: "{src}\Serials.ini"; Section: {code:issiGetSerialAppName|''}; Key: {code:issiGetSerialCount|''}; String: {code:issiGetSerial|''}
