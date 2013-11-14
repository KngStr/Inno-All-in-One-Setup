;Created by South.Tver 02.2010

;Ú.Í. BtnGetText Ì‡ ·ÓÎ¸¯Ëı ÚÂÍÒÚ‡ı (Í‡Í ‚ ÔËÏÂÂ BtnPrint.iss) ·Û‰ÂÚ ÔËÎË˜ÌÓ ÚÓÏÓÁËÚ¸,
;ÚÓ ‚ÓÚ ‡Ì‡ÎÓ„Ë˜Ì˚È ÔËÏÂ ·ÂÁ BtnGetText

;2010-12-18 D8Team ÃÌº”£¨πˆ∂Ø∫∫◊÷Ã· æ≤‚ ‘

#include "botva2.ish"

[Setup]
AppName=BtnPrint by South.Tver
AppVerName=BtnPrint by South.Tver (∫∫◊÷≤‚ ‘)
DefaultDirName={pf}\BtnPrint
OutputBaseFilename=setup
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: Files\*; Flags: dontcopy

[CustomMessages]
AboutText=D8»Ìº˛∑‚◊∞ºº ıÕ≈∂”(“‘œ¬ºÚ≥∆ D8Õ≈∂”)£¨ «“ª∏ˆ◊®◊¢”⁄»Ìº˛∑‚◊∞£¨÷¬¡¶”⁄Ã·∏ﬂ»Ìº˛∑‚◊∞÷ ¡ø£¨%n%nº”øÏ∑‚◊∞»Ìº˛ÀŸ∂»£¨ºı…Ÿ∑‚◊∞»Ìº˛¥ÌŒÛ£¨≤ª∂œ‘⁄»Ìº˛∑‚◊∞µƒ¡Ï”Ú◊∑«Û–¬∏ﬂ∂»µƒ◊®“µ»Ìº˛∑‚◊∞Õ≈∂” %n%n%nD8Õ≈∂”£¨◊˜Œ™π˙ƒ⁄ ˝“ª ˝∂˛µƒ »Ìº˛∑‚◊∞/»Ìº˛¥Ú∞¸ Õ≈∂”£¨%n%nª„ºØ¡À¥Û¡ø Nsis º∞ Inno Ω≈±æ÷∆◊˜∏ﬂ ÷°£∆æΩËÕ≈∂”∂‡ƒÍµƒ∞≤◊∞∞¸÷∆◊˜æ≠—È£¨ª˝¿€¡À“ªÃ◊øÏÀŸ∏ﬂ–ßµƒ¥Ú∞¸∑Ω∞∏°£%n%nÕ¨ ±Œ™π„¥Û»Ìº˛ø™∑¢π´Àæ°¢»Ìº˛œ¬‘ÿ’æ°¢”Œœ∑œ¬‘ÿ’æ°¢÷˜Ã‚œ¬‘ÿ’æµ»∏˜÷÷–Ë“™ π”√µΩ»Ìº˛∑‚◊∞µƒ∏ˆ»ÀªÚπ´Àæ£¨%n%nÃ·π©“ª∏ˆ ∏ﬂ–ß¬ °¢∏ﬂ∆∑÷ °¢µÕ≥…±æ µƒ»Ìº˛∑‚◊∞∑Ω∞∏°£◊Ó¥Û≥Ã∂»ºı…Ÿƒ˙µƒ ±º‰’º”√£¨Œ™ƒ˙Ω⁄ °∏¸∂‡µƒ»À¡¶£¨ºı…Ÿ»À‘±≈‡—µµ»∏˜∑Ω√Êµƒ≤ª±ÿ“™ø™÷ß°£

[Code]
type
  TTimerProc = procedure(HandleW, msg, idEvent, TimeSys: LongWord);

var
  hBtn: HWND;
  CurSimbol: integer;
  TimerID: Longword;
  TestText: ansistring;

function SetTimer(hWnd, nIDEvent, uElapse, lpTimerFunc: LongWord): LongWord; external 'SetTimer@user32.dll stdcall';
function KillTimer(hWnd, nIDEvent: LongWord): LongWord; external 'KillTimer@user32.dll stdcall';
function WrapTimerProc(callback:TTimerProc; paramcount:integer):LongWord; {# CallbackCtrl_External };

procedure OnTimer(HandleW, msg, idEvent, TimeSys: LongWord);
begin
  if CurSimbol >= Length(TestText) then
  begin
    KillTimer(0, TimerID);
    Exit;
  end;
  //≈–∂œ «∑ÒÀ´◊÷Ω⁄◊÷∑˚°££®◊¢£∫∫∫◊÷æ˘Œ™À´◊÷Ω⁄£©
  if Ord(TestText[CurSimbol + 1]) > 127 then
    CurSimbol := CurSimbol + 2
  else
    CurSimbol := CurSimbol + 1;
  BtnSetText(hBtn, PAnsiChar(Copy(TestText, 1, CurSimbol)));
end;

procedure BtnClick(hBtn: HWND);
begin
  if not BtnGetChecked(hBtn) then
  begin
    KillTimer(0, TimerID);
    BtnSetText(hBtn, '');
    CurSimbol := 0;
  end
  else
    TimerID := SetTimer(0, 0, 100, WrapTimerProc(@OnTimer, 4));
end;

function InitializeSetup: boolean;
begin
  PDir('{# Botva2_Dll }');
  PDir('{# CallbackCtrl_Dll }');
  Result := True;
end;

procedure InitializeWizard;
var
  Font:TFont;
begin
  with WizardForm do
  begin
    InnerNotebook.Hide;
    OuterNotebook.Hide;
    Bevel.Hide;
    NextButton.Width := 0;
    CancelButton.Width := 0;
    Position := poScreenCenter; //¥∞ÃÂŒª÷√
    ClientWidth := 600;
    ClientHeight := 500;
  end;

  ExtractTemporaryFile('button2.png');

  hBtn := BtnCreate(WizardForm.Handle, -50, -150, WizardForm.ClientWidth + 100,
    WizardForm.ClientHeight + 250, ExpandConstant('{tmp}\button2.png'), 18, True);
  CurSimbol := 0;

  TestText := '≤‚ ‘∫∫◊÷ ' +
    CustomMessage('AboutText') + #13#10 +
    '≤‚ ‘ÕÍ±œ£°';

  Font:=TFont.Create;
  with Font do begin
    Name:='Tahoma';
    Size:=12;
  end;
  BtnSetFont(hBtn,Font.Handle);
  BtnSetTextAlignment(hBtn, 40, 30, balLeft);
  BtnSetFontColor(hBtn, $DAE369, $FF0000, $00FF00, $0000FF);
  BtnSetEvent(hBtn, BtnClickEventID, WrapBtnCallback(@BtnClick, 1));
end;

procedure DeinitializeSetup();
begin
  KillTimer(0, TimerID);
  gdipShutdown;
end;
