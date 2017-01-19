;Пример распаковки 7zip архива, ?отображением прогресс бара ?окне Inno Setup пр?помощи is7z.dll v1.01
;Авто?пример??is7z.dll Павлов Дмитри?(aka ExpeditoR)
;пишите если чт?dimon-na-domu@mail.ru
;Если ва?понравилас?данн? библиотека, то загляните на мо?сайт http://mp3runner.narod.ru/
;?посмотрите другой мо?проект mp3runner.
[Setup]
AppName=My Program
AppVerName=My Program version 1.5
DefaultDirName={tmp}\My Program
DefaultGroupName=My Program
Compression=zip
OutputDir=userdocs:Inno Setup Examples Output
Uninstallable=no
CreateUninstallRegKey=no

[Files]
Source: {#PluginDir}\is7z.dll; DestDir: {tmp}; Flags: dontcopy
Source: 1.7z; DestDir: {app}; 

[Code]
var
ProgressBar : TNewProgressBar;
ExtractFile:TNewStaticText;
Button1:TButton;

procedure Extract7z (hWnd, hpb, hst: THandle; fpath, extractPath, pass:PAnsiChar); external 'Extract7z@files:is7z.dll stdcall';
procedure CancelExtract; external 'CancelExtract@files:is7z.dll stdcall';

procedure InitializeWizard();
begin
  ProgressBar := TNewProgressBar.Create(WizardForm);
  ExtractFile:=TNewStaticText.Create(WizardForm);
  with WizardForm.ProgressGauge do
    begin
      ProgressBar.Left := Left;
      ProgressBar.Top := Top + ScaleX(55);
      ProgressBar.Width := Width;
      ProgressBar.Height := Height;
      ProgressBar.Parent := WizardForm.InstallingPage;
      ProgressBar.max := 100;
      ProgressBar.Position := 0;
      ExtractFile.parent:=WizardForm.InstallingPage;
      ExtractFile.autosize:=false;
      ExtractFile.Width := Width;
      ExtractFile.top:=Top + ScaleX(35);
      ExtractFile.caption:='Extracting 7zip Files';
    end;
end;

procedure Button1OnClick(Sender: TObject);
begin
 CancelExtract;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  ErrCode: Integer;
begin
  If CurStep=ssPostInstall then
   begin
    Button1:=TButton.create(WizardForm);
    Button1.parent:=WizardForm;
    Button1.width:=135;
    Button1.caption:='Cancel';
    Button1.left:=260;
    Button1.top:=WizardForm.cancelbutton.top;
    Button1.OnClick:=@Button1OnClick;
    try
     Extract7z (wizardform.handle, progressbar.handle, ExtractFile.handle, PAnsiChar( ExpandConstant('{app}') + '\1.7z' ), PAnsiChar( ExpandConstant('{app}') ), '');
     Button1.visible:=false;

     ShellExec('', ExpandConstant('{app}'), '', '', SW_SHOW, ewNoWait, ErrCode);
     MsgBox('Pausing!', mbInformation, MB_OK);
    except
     MsgBox('Extract error!', mbInformation, MB_OK);
     Button1.visible:=false;
    end;
   end;
end;

