[Setup]
AppName=My Program
AppVerName=My Program 1.5
DefaultDirName={pf}\My Program
OutputDir=userdocs:Inno Setup Examples Output
Compression=lzma
WizardImageFile=Monochrome.bmp
WizardSmallImageFile=Monochrome.bmp


[Code]
Procedure InitializeWizard();
begin
with WizardForm do begin
  Position:=poScreenCenter
  ClientWidth:=690
  ClientHeight:=496
  Font.Color:=65280
  Font.Name:='MS Sans Serif'
  Font.Style:=[]
  with Bevel do begin
    Left:=0
    Top:=313
    Width:=497
    Height:=2
    Visible:=False
  end;
  with CancelButton do begin
    Left:=576
    Top:=465
    Width:=78
    Height:=20
    BringToFront
  end;
  with NextButton do begin
    Left:=429
    Top:=465
    Width:=78
    Height:=20
    BringToFront
  end;
  with BackButton do begin
    Left:=303
    Top:=465
    Width:=78
    Height:=20
    BringToFront
  end;
  with OuterNotebook do begin
    Left:=0
    Top:=0
    Width:=690
    Height:=496
    with WelcomePage do begin
      Color:=0
      with WizardBitmapImage do begin
        Left:=0
        Top:=0
        Width:=690
        Height:=496
      end;
      with WelcomeLabel2 do begin
        Left:=205
        Top:=230
        Width:=465
        Height:=200
      end;
      with WelcomeLabel1 do begin
        Left:=205
        Top:=190
        Width:=465
        Height:=28
        Font.Color:=65280
        Font.Size:=8
      end;
    end;
    with InnerPage do begin
      with Bevel1 do begin
        Left:=0
        Top:=58
        Width:=499
        Height:=3
        Visible:=False
      end;
      with InnerNotebook do begin
        Left:=205
        Top:=79
        Width:=465
        Height:=354
        BringToFront
        Color:=0
        with LicensePage do begin
          with LicenseNotAcceptedRadio do begin
            Left:=0
            Top:=338
            Width:=465
            Height:=17
            Checked:=True
            Color:=clWindow
          end;
          with LicenseAcceptedRadio do begin
            Left:=0
            Top:=321
            Width:=465
            Height:=17
            Color:=clWindow
          end;
          with LicenseMemo do begin
            Left:=0
            Top:=38
            Width:=465
            Height:=282
            ReadOnly:=True
            ScrollBars:=ssVertical
          end;
          with LicenseLabel1 do begin
            Left:=0
            Top:=0
            Width:=465
            Height:=28
          end;
        end;
        with PasswordPage do begin
          with PasswordEdit do begin
            Left:=0
            Top:=50
            Width:=465
            Height:=21
            Font.Color:=clWindowText
          end;
          with PasswordEditLabel do begin
            Left:=0
            Top:=34
            Width:=465
            Height:=14
          end;
          with PasswordLabel do begin
            Left:=0
            Top:=0
            Width:=465
            Height:=28
          end;
        end;
        with InfoBeforePage do begin
          with InfoBeforeMemo do begin
            Left:=0
            Top:=24
            Width:=465
            Height:=327
            ScrollBars:=ssVertical
          end;
          with InfoBeforeClickLabel do begin
            Left:=0
            Top:=0
            Width:=465
            Height:=14
          end;
        end;
        with UserInfoPage do begin
          with UserInfoSerialEdit do begin
            Left:=0
            Top:=120
            Width:=465
            Height:=21
            Font.Color:=clWindowText
          end;
          with UserInfoSerialLabel do begin
            Left:=0
            Top:=104
            Width:=465
            Height:=14
          end;
          with UserInfoOrgEdit do begin
            Left:=0
            Top:=68
            Width:=465
            Height:=21
            Font.Color:=clWindowText
          end;
          with UserInfoOrgLabel do begin
            Left:=0
            Top:=52
            Width:=465
            Height:=14
          end;
          with UserInfoNameEdit do begin
            Left:=0
            Top:=16
            Width:=465
            Height:=21
            Font.Color:=clWindowText
          end;
          with UserInfoNameLabel do begin
            Left:=0
            Top:=0
            Width:=465
            Height:=14
          end;
        end;
        with SelectDirPage do begin
          with SelectDirBitmapImage do begin
            Left:=0
            Top:=0
            Width:=32
            Height:=32
            Visible:=False
          end;
          with DiskSpaceLabel do begin
            Left:=0
            Top:=340
            Width:=465
            Height:=14
          end;
          with DirBrowseButton do begin
            Left:=387
            Top:=289
            Width:=78
            Height:=23
          end;
          with DirEdit do begin
            Left:=0
            Top:=290
            Width:=377
            Height:=21
            Font.Color:=clWindowText
          end;
          with SelectDirBrowseLabel do begin
            Left:=0
            Top:=24
            Width:=465
            Height:=28
          end;
          with SelectDirLabel do begin
            Left:=0
            Top:=0
            Width:=465
            Height:=14
          end;
        end;
        with SelectComponentsPage do begin
          with ComponentsDiskSpaceLabel do begin
            Left:=0
            Top:=340
            Width:=417
            Height:=14
          end;
          with ComponentsList do begin
            Left:=0
            Top:=48
            Width:=465
            Height:=275
            Font.Color:=65280
            Color:=0
          end;
          with TypesCombo do begin
            Left:=0
            Top:=24
            Width:=465
            Height:=21
            Font.Color:=65280
            Color:=0
           end;
          with SelectComponentsLabel do begin
            Left:=0
            Top:=0
            Width:=465
            Height:=14
          end;
        end;
        with SelectProgramGroupPage do begin
          with SelectGroupBitmapImage do begin
            Left:=0
            Top:=0
            Width:=32
            Height:=32
            Visible:=False
          end;
          with NoIconsCheck do begin
            Left:=0
            Top:=312
            Width:=377
            Height:=20
            Color:=clWindow
          end;
          with GroupBrowseButton do begin
            Left:=387
            Top:=289
            Width:=78
            Height:=23
          end;
          with GroupEdit do begin
            Left:=0
            Top:=290
            Width:=377
            Height:=21
            Font.Color:=clWindowText
          end;
          with SelectStartMenuFolderBrowseLabel do begin
            Left:=0
            Top:=24
            Width:=465
            Height:=28
          end;
          with SelectStartMenuFolderLabel do begin
            Left:=0
            Top:=0
            Width:=465
            Height:=14
          end;
        end;
        with SelectTasksPage do begin
          with TasksList do begin
            Left:=0
            Top:=34
            Width:=465
            Height:=317
            Color:=0
          end;
          with SelectTasksLabel do begin
            Left:=0
            Top:=0
            Width:=465
            Height:=28
          end;
        end;
        with ReadyPage do begin
          with ReadyMemo do begin
            Left:=0
            Top:=34
            Width:=465
            Height:=317
            Color:=0
          end;
          with ReadyLabel do begin
            Left:=0
            Top:=0
            Width:=465
            Height:=28
          end;
        end;
        with PreparingPage do begin
          with PreparingErrorBitmapImage do begin
            Left:=0
            Top:=0
            Width:=16
            Height:=16
            Visible:=False
          end;
          with PreparingLabel do begin
            Left:=24
            Top:=0
            Width:=393
            Height:=14
            Visible:=False
          end;
        end;
        with InstallingPage do begin
          with FilenameLabel do begin
            Left:=0
            Top:=16
            Width:=465
            Height:=16
          end;
          with StatusLabel do begin
            Left:=0
            Top:=0
            Width:=465
            Height:=16
          end;
          with ProgressGauge do begin
            Left:=0
            Top:=42
            Width:=465
            Height:=21
            Min:=0
            Max:=100
          end;
        end;
        with InfoAfterPage do begin
          with InfoAfterMemo do begin
            Left:=0
            Top:=24
            Width:=465
            Height:=327
            ScrollBars:=ssVertical
          end;
          with InfoAfterClickLabel do begin
            Left:=0
            Top:=0
            Width:=465
            Height:=14
          end;
        end;
      end;
      with MainPanel do begin
        Left:=0
        Top:=0
        Width:=690
        Height:=496
        with WizardSmallBitmapImage do begin
          Left:=0
          Top:=0
          Width:=690
          Height:=496
        end;
        with PageDescriptionLabel do begin
          Left:=25
          Top:=25
          Width:=500
          Height:=14
          Color:=0
          Font.Color:=65280
        end;
        with PageNameLabel do begin
          Left:=15
          Top:=7
          Width:=500
          Height:=14
          Color:=0
          Font.Color:=65280
        end;
      end;
    end;
    with FinishedPage do begin
      Color:=0
      with WizardBitmapImage2 do begin
        Left:=0
        Top:=0
        Width:=690
        Height:=496
      end;
      with NoRadio do begin
        Left:=205
        Top:=227
        Width:=465
        Height:=17
      end;
      with YesRadio do begin
        Left:=205
        Top:=199
        Width:=465
        Height:=17
      end;
      with RunList do begin
        Left:=205
        Top:=199
        Width:=465
        Height:=149
        BorderStyle:=bsNone
      end;
      with FinishedLabel do begin
        Left:=205
        Top:=119
        Width:=465
        Height:=53
      end;
      with FinishedHeadingLabel do begin
        Left:=205
        Top:=79
        Width:=465
        Height:=24
        Font.Color:=65280
        Font.Size:=8
      end;
    end;
  end;
  with BeveledLabel do begin
    Left:=10
    Top:=478
    Width:=150
    Height:=14
    Enabled:=False
    Color:=0
  end;
end;
end;
