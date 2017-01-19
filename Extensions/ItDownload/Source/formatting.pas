unit formatting;


{ Formatting.pas - Utility routines for text formatting.

  By Nicholas Sherlock - http://www.sherlocksoftware.org }


interface

uses windows, sysutils, itdstrings;

function shorttimetostr(time: tdatetime; strings: TITDStrings): string;
function filesizetostr(size: longword; strings: TITDStrings): string;
function fileratetostr(bps: longword; strings: TITDStrings): string;
function fileprogresstostr(size, total: longword; totunknown: Boolean; strings: TITDStrings): string;

implementation

{Takes 'Here is my string %1 (%2)',['hey!','22'] and gives:
 Here is my string hey! (22)}

function strictformat(const format: string; vals: array of string): string;
var t1: integer;
begin
  result := format;
  for t1 := high(vals) downto 0 do {Downwards, so that %22 isn't matched by %2 !}
    result := stringreplace(result, '%' + inttostr(t1 + 1), vals[t1], [rfReplaceall]);
end;

function filesizetostr(size: longword; strings: TITDStrings): string;
begin
  if size < 1024 then
    result := format('%d ' + strings[IS_Byte], [size]) else
    if size < 1024 * 1024 then
      result := format('%d ' + strings[IS_Kilobyte], [size div 1024]) else
      if size < 1024 * 1024 * 1024 then
        result := format('%f ' + strings[is_megabyte], [size / (1024 * 1024)]) else
        result := format('%f ' + strings[is_gigabyte], [size / (1024 * 1024 * 1024)]);
end;

procedure getvalandrate(bps: LongWord; out rateval: string; out theunit: string; strings: TITDStrings);
begin
  if bps < 1024 then begin
    rateval := inttostr(bps);
    theunit := strings[IS_Byte];
  end else
    if bps < 1024 * 1024 then begin
      rateval := inttostr(bps div 1024);
      theunit := strings[IS_Kilobyte];
    end else
      if bps < 1024 * 1024 * 1024 then begin
        rateval := format('%f', [bps / (1024 * 1024)]);
        theunit := strings[IS_Megabyte];
      end else begin
        rateval := format('%f', [bps / (1024 * 1024 * 1024)]);
        theunit := strings[IS_Gigabyte];
      end;
end;

function fileprogresstostr(size, total: longword; totunknown: Boolean; strings: TITDStrings): string;
var r1, u1, r2, u2: string;
begin
  getvalandrate(size, r1, u1, strings);

  if not totunknown then
    getvalandrate(total, r2, u2, strings);

  if totunknown then
    result := strictformat(strings[IS_ProgressUnknownFormat], [r1, u1]) else
    result := strictformat(strings[IS_ProgressFormat], [r1, u1, r2, u2]);
end;

function fileratetostr(bps: longword; strings: TITDStrings): string;
var rateval, unt: string;
begin
  getvalandrate(bps, rateval, unt, strings);

  result := strictformat(strings[IS_Speedformat], [rateval, unt]);
end;

function shorttimetostr(time: tdatetime; strings: TITDStrings): string;
var l: cardinal;
  seconds, minutes, hours, days: integer;

  function postfix(i: integer; const singular, plural: string): string;
  begin
    result := inttostr(i);
    if i = 1 then
      result := result + ' ' + singular else
      result := result + ' ' + plural;
  end;
begin

  try
    {Likely to overflow if we are calc'ing time remaining and speed~0.
     Exception handler catches this case for us}
    l := round(time * secsperday);

    seconds := l mod 60;
    l := l div 60;

    minutes := l mod 60;
    l := l div 60;

    hours := l mod 24;
    l := l div 24;

    days := l;

    if AnsiCompareText(strings[IS_UseSimpleTime], 'Yes') = 0 then begin
      result := TimeToStr(time);
    end else begin
      if days > 0 then begin
        result := postfix(days, strings[IS_Day], strings[IS_Days]);
        if hours > 0 then result := result + ', ' + postfix(hours, strings[IS_Hour], strings[IS_Hours]);
      end else
        if hours > 0 then begin
          result := postfix(hours, Strings[IS_Hour], Strings[IS_Hours]);
          if minutes > 0 then result := result + ', ' + postfix(minutes, strings[IS_Minute], strings[IS_Minutes]);
        end else
          if minutes > 0 then begin
            result := postfix(minutes, Strings[IS_Minute], strings[IS_Minutes]);
            if seconds > 0 then result := result + ', ' + postfix(seconds, strings[IS_Second], strings[IS_Seconds]);
          end else
            result := postfix(seconds, Strings[IS_Second], Strings[IS_seconds]);
    end;
  except
    result := strings[IS_Unknown]; //due to overflow
  end;
end;

end.
