;InnoSetupVersion=5.1.7

[Setup]
AppName=Inno Setup Script Includes
AppVerName={cm:NameAndVersion,ISSI,5.1.9.0}
AppVersion=5.1.9.0
DefaultDirName=C:\ISSI
DefaultGroupName=Inno Setup Script Includes
OutputBaseFilename=ISSI-5.1.9.0-Setup
Compression=lzma
WizardImageFile=embedded\WizardImage.bmp
WizardSmallImageFile=embedded\WizardSmallImage.bmp

[Files]
Source: "{app}\issi_example.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_About_Button.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_App_Name.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Associate_Extension.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Background_Image.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Background_Image_Switch.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Batch_Compile.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Beveled_Label.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Compile_DateTime.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Compression.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Custom_Code.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_CVS_Functions.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Download_Setup.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_FTP_Upload.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Full_And_Update.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Get_MD5.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_InstallShield_Skinning.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Languages.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Languages_LicenseFile.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Net_Detect.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_PAD_Generator.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Play_Midi.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Play_Wave.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Publish_Batch.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Screen_Saver.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Script_Backup.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Serial_Generator.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Serial_Generator_Batch_Compile.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Splash_Screen.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_UninsHs.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_UnZip.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Update.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_URL_Link.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Wizard_Images.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Wizard_Image_File.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\issi_example_Wizard_Image_Switch.iss"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\license.txt"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\readme.txt"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\_issi.cfg"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\_issi.isi"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\Include\islp_v4_2_2.iss"; DestDir: "{app}\Include"; Flags: ignoreversion 
Source: "{app}\Include\islp_v5_1_0.iss"; DestDir: "{app}\Include"; Flags: ignoreversion 
Source: "{app}\Include\issi_createdir.iss"; DestDir: "{app}\Include"; Flags: ignoreversion 
Source: "{app}\Include\issi_exe.iss"; DestDir: "{app}\Include"; Flags: ignoreversion 
Source: "{app}\Include\issi_md5.iss"; DestDir: "{app}\Include"; Flags: ignoreversion 
Source: "{app}\Include\issi_serial.iss"; DestDir: "{app}\Include"; Flags: ignoreversion 
Source: "{app}\Include\pad.ini"; DestDir: "{app}\Include"; Flags: ignoreversion 
Source: "{app}\Include\pad.xml"; DestDir: "{app}\Include"; Flags: ignoreversion 
Source: "{app}\Include\_issi_pad.iss"; DestDir: "{app}\Include"; Flags: ignoreversion 
Source: "{app}\Include\chiefzip\ChiefZip-Readme.txt"; DestDir: "{app}\Include\chiefzip"; Flags: ignoreversion 
Source: "{app}\Include\chiefzip\chiefzip.dll"; DestDir: "{app}\Include\chiefzip"; Flags: ignoreversion 
Source: "{app}\Include\isxdl\isxdl.dll"; DestDir: "{app}\Include\isxdl"; Flags: ignoreversion 
Source: "{app}\Include\uninshs\UninsHs-Readme.txt"; DestDir: "{app}\Include\uninshs"; Flags: ignoreversion 
Source: "{app}\Include\uninshs\UninsHs.exe"; DestDir: "{app}\Include\uninshs"; Flags: ignoreversion 
Source: "{app}\Include\wput\libeay32.dll"; DestDir: "{app}\Include\wput"; Flags: ignoreversion 
Source: "{app}\Include\wput\ssleay32.dll"; DestDir: "{app}\Include\wput"; Flags: ignoreversion 
Source: "{app}\Include\wput\wput.exe"; DestDir: "{app}\Include\wput"; Flags: ignoreversion 
Source: "{app}\Include\wput\wput_readme.txt"; DestDir: "{app}\Include\wput"; Flags: ignoreversion 
Source: "{app}\Include\pad-styler\pad.css"; DestDir: "{app}\Include\pad-styler"; Flags: ignoreversion 
Source: "{app}\Include\pad-styler\pad.xsl"; DestDir: "{app}\Include\pad-styler"; Flags: ignoreversion 
Source: "{app}\Include\pad-styler\silver.css"; DestDir: "{app}\Include\pad-styler"; Flags: ignoreversion 
Source: "{app}\Include\pad-styler\silver.xsl"; DestDir: "{app}\Include\pad-styler"; Flags: ignoreversion 
Source: "{app}\issi_example_Images\issi.ico"; DestDir: "{app}\issi_example_Images"; Flags: ignoreversion 
Source: "{app}\issi_example_Images\issi_164x314.bmp"; DestDir: "{app}\issi_example_Images"; Flags: ignoreversion 
Source: "{app}\issi_example_Images\issi_164x58.bmp"; DestDir: "{app}\issi_example_Images"; Flags: ignoreversion 
Source: "{app}\issi_example_Images\issi_200x100_round.bmp"; DestDir: "{app}\issi_example_Images"; Flags: ignoreversion 
Source: "{app}\issi_example_Images\issi_55x55.bmp"; DestDir: "{app}\issi_example_Images"; Flags: ignoreversion 
Source: "{app}\issi_example_Images\issi_800x600.bmp"; DestDir: "{app}\issi_example_Images"; Flags: ignoreversion 
Source: "{app}\issi_example_Images\sound.mid"; DestDir: "{app}\issi_example_Images"; Flags: ignoreversion 
Source: "{app}\issi_example_Images\sound.wav"; DestDir: "{app}\issi_example_Images"; Flags: ignoreversion 
Source: "{app}\Languages\_issi_Bosnian.isl"; DestDir: "{app}\Languages"; Flags: ignoreversion 
Source: "{app}\Languages\_issi_BrazilianPortuguese.isl"; DestDir: "{app}\Languages"; Flags: ignoreversion 
Source: "{app}\Languages\_issi_Catalan.isl"; DestDir: "{app}\Languages"; Flags: ignoreversion 
Source: "{app}\Languages\_issi_ChineseSimp.isl"; DestDir: "{app}\Languages"; Flags: ignoreversion 
Source: "{app}\Languages\_issi_ChineseTrad.isl"; DestDir: "{app}\Languages"; Flags: ignoreversion 
Source: "{app}\Languages\_issi_Czech.isl"; DestDir: "{app}\Languages"; Flags: ignoreversion 
Source: "{app}\Languages\_issi_Danish.isl"; DestDir: "{app}\Languages"; Flags: ignoreversion 
Source: "{app}\Languages\_issi_Dutch.isl"; DestDir: "{app}\Languages"; Flags: ignoreversion 
Source: "{app}\Languages\_issi_English.isl"; DestDir: "{app}\Languages"; Flags: ignoreversion 
Source: "{app}\Languages\_issi_French.isl"; DestDir: "{app}\Languages"; Flags: ignoreversion 
Source: "{app}\Languages\_issi_German.isl"; DestDir: "{app}\Languages"; Flags: ignoreversion 
Source: "{app}\Languages\_issi_Hungarian.isl"; DestDir: "{app}\Languages"; Flags: ignoreversion 
Source: "{app}\Languages\_issi_Italian.isl"; DestDir: "{app}\Languages"; Flags: ignoreversion 
Source: "{app}\Languages\_issi_Polish.isl"; DestDir: "{app}\Languages"; Flags: ignoreversion 
Source: "{app}\Languages\_issi_Russian.isl"; DestDir: "{app}\Languages"; Flags: ignoreversion 
Source: "{app}\Languages\_issi_Slovak.isl"; DestDir: "{app}\Languages"; Flags: ignoreversion 
Source: "{app}\Languages\_issi_Slovenian.isl"; DestDir: "{app}\Languages"; Flags: ignoreversion 
Source: "{app}\Languages\_issi_Spanish.isl"; DestDir: "{app}\Languages"; Flags: ignoreversion 
Source: "{app}\Languages\_issi_Swedish.isl"; DestDir: "{app}\Languages"; Flags: ignoreversion 
Source: "{app}\Languages\_issi_Turkish.isl"; DestDir: "{app}\Languages"; Flags: ignoreversion 
Source: "{app}\Languages\4_2_2\Bosnian.isl"; DestDir: "{app}\Languages\4_2_2"; Flags: ignoreversion 
Source: "{app}\Languages\4_2_2\Bulgarian.isl.txt"; DestDir: "{app}\Languages\4_2_2"; Flags: ignoreversion 
Source: "{app}\Languages\4_2_2\ChineseTrad.isl"; DestDir: "{app}\Languages\4_2_2"; Flags: ignoreversion 
Source: "{app}\Languages\4_2_2\Croatian.isl"; DestDir: "{app}\Languages\4_2_2"; Flags: ignoreversion 
Source: "{app}\Languages\4_2_2\Danish.isl"; DestDir: "{app}\Languages\4_2_2"; Flags: ignoreversion 
Source: "{app}\Languages\4_2_2\Hungarian.isl"; DestDir: "{app}\Languages\4_2_2"; Flags: ignoreversion 
Source: "{app}\Languages\4_2_2\Italian.isl"; DestDir: "{app}\Languages\4_2_2"; Flags: ignoreversion 
Source: "{app}\Languages\4_2_2\Japanese.isl"; DestDir: "{app}\Languages\4_2_2"; Flags: ignoreversion 
Source: "{app}\Languages\4_2_2\Korean.isl"; DestDir: "{app}\Languages\4_2_2"; Flags: ignoreversion 
Source: "{app}\Languages\4_2_2\Romanian.isl"; DestDir: "{app}\Languages\4_2_2"; Flags: ignoreversion 
Source: "{app}\Languages\4_2_2\Spanish.isl"; DestDir: "{app}\Languages\4_2_2"; Flags: ignoreversion 
Source: "{app}\Languages\4_2_2\SpanishStd.isl"; DestDir: "{app}\Languages\4_2_2"; Flags: ignoreversion 
Source: "{app}\Languages\4_2_2\Swedish.isl"; DestDir: "{app}\Languages\4_2_2"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Afrikaans.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Albanian.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Arabic.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Basque.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Belarusian.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Bosnian.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\BrazilianPortuguese.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Bulgarian.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\ChineseSimp.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\ChineseTrad.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Danish.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Estonian.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Finnish.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Galician.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Greek.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Hebrew.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Hungarian.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Icelandic.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Indonesian.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Italian.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Japanese.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Korean.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Lithuanian.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Luxemburgish.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Macedonian.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Malaysian.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\PortugueseStd.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Romanian.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Serbian.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Slovak.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Slovenian.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Spanish.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\SpanishArg.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\SpanishMex.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\SpanishNic.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\SpanishStd.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Swedish.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Tatarish.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Turkish.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Languages\5_1_0\Ukrainian.isl"; DestDir: "{app}\Languages\5_1_0"; Flags: ignoreversion 
Source: "{app}\Wizard_Images\1_164x314.bmp"; DestDir: "{app}\Wizard_Images"; Flags: ignoreversion 
Source: "{app}\Wizard_Images\1_55x55.bmp"; DestDir: "{app}\Wizard_Images"; Flags: ignoreversion 
Source: "{app}\Wizard_Images\2_164x314.bmp"; DestDir: "{app}\Wizard_Images"; Flags: ignoreversion 
Source: "{app}\Wizard_Images\2_55x55.bmp"; DestDir: "{app}\Wizard_Images"; Flags: ignoreversion 
Source: "{app}\Wizard_Images\3_164x314.bmp"; DestDir: "{app}\Wizard_Images"; Flags: ignoreversion 
Source: "{app}\Wizard_Images\3_55x55.bmp"; DestDir: "{app}\Wizard_Images"; Flags: ignoreversion 
Source: "{app}\Wizard_Images\4_164x314.bmp"; DestDir: "{app}\Wizard_Images"; Flags: ignoreversion 
Source: "{app}\Wizard_Images\4_55x55.bmp"; DestDir: "{app}\Wizard_Images"; Flags: ignoreversion 
Source: "{tmp}\setup.bmp"; DestDir: "{tmp}"; Flags: deleteafterinstall ignoreversion dontcopy 
Source: "{tmp}\WizardBitmapImage2.bmp"; DestDir: "{tmp}"; Flags: deleteafterinstall ignoreversion dontcopy 

[Icons]
Name: "{group}\{cm:ProgramOnTheWeb,Inno Setup Script Includes}"; Filename: "http://www.albartus.com"; 
Name: "{group}\{cm:UninstallProgram,Inno Setup Script Includes}"; Filename: "{uninstallexe}"; 

[CustomMessages]
af.NameAndVersion=%1 weergawe %2
af.AdditionalIcons=Bykomende ikone:
af.CreateDesktopIcon=Skep 'n &werksblad ikoon
af.CreateQuickLaunchIcon=Skep 'n &Quick Launch ikoon
af.ProgramOnTheWeb=% op die Web
af.UninstallProgram=Verwyder %1
af.LaunchProgram=Voer %1 uit
af.AssocFileExtension=&Assosieer %1 met die %2 leêr uitbreiding
af.AssocingFileExtension=Assosieer %1 met die %2 lêer uitbreiding...
af.IssiLanguageVersion=0x05010000
af.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
af.IssiTxtScriptSavePath=Select where %1 has to be saved.
af.IssiTxtFileExtractSuccess=File extracted.
af.IssiTxtFileCopyFailed=Failed to copy file.
af.IssiTxtFileExtractFailed=Failed to extract file.
af.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
af.IssiTxtProdNotInstalled=%1 is not installed.
af.IssiTxtDownloadingProd=Downloading: %1
af.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
af.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
af.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
af.IssiTxtLicencePrintFailed=Problems printing License file!
af.IssiTxtLicenceExtractFailed=Problems extracting License file!
af.IssiTxtLicencePrintButton=&Print License
af.IssiTxtAboutButton=&About...
af.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
af.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
al.NameAndVersion=%1 verzioni %2
al.AdditionalIcons=Ikonat shtesë:
al.CreateDesktopIcon=Krijo një &ikon në dektop
al.CreateQuickLaunchIcon=Krijo një ikon në &Quick Launch
al.ProgramOnTheWeb=%1 në internet
al.UninstallProgram=Uninstalo %1
al.LaunchProgram=Lësho %1
al.AssocFileExtension=&Lidhe %1 me %2 ekstensionet e fajllave
al.AssocingFileExtension=Duke e lidhur %1 me %2 ekstensionet e fajllave...
al.IssiLanguageVersion=0x05010000
al.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
al.IssiTxtScriptSavePath=Select where %1 has to be saved.
al.IssiTxtFileExtractSuccess=File extracted.
al.IssiTxtFileCopyFailed=Failed to copy file.
al.IssiTxtFileExtractFailed=Failed to extract file.
al.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
al.IssiTxtProdNotInstalled=%1 is not installed.
al.IssiTxtDownloadingProd=Downloading: %1
al.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
al.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
al.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
al.IssiTxtLicencePrintFailed=Problems printing License file!
al.IssiTxtLicenceExtractFailed=Problems extracting License file!
al.IssiTxtLicencePrintButton=&Print License
al.IssiTxtAboutButton=&About...
al.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
al.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
ar.NameAndVersion=%1 ÇáÅÕÏÇÑ %2
ar.AdditionalIcons=ÅíŞæäÇÊ ÅÖÇİíÉ:
ar.CreateDesktopIcon=ÅäÔÇÁ ÅÎÊÕÇÑÇÊ ÓØÍ Çá&ãßÊÈ
ar.CreateQuickLaunchIcon=ÅäÔÇÁ ÅÎÊÕÇÑ İí ÇáÊÔÛíá ÇáÓÑíÚ
ar.ProgramOnTheWeb=%1 Úáì ÇáæíÈ
ar.UninstallProgram=ÅÒÇáÉ %1
ar.LaunchProgram=ÊÔÛíá %1
ar.AssocFileExtension=&ÅÑÊÈÇØ %1 ãÚ %2 ÅãÊÏÇÏ Çáãáİ
ar.AssocingFileExtension=ÑÈØ %1 ãÚ %2 ÇãÊÏÇÏ Çáãáİ...
ar.IssiLanguageVersion=0x05010000
ar.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
ar.IssiTxtScriptSavePath=Select where %1 has to be saved.
ar.IssiTxtFileExtractSuccess=File extracted.
ar.IssiTxtFileCopyFailed=Failed to copy file.
ar.IssiTxtFileExtractFailed=Failed to extract file.
ar.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
ar.IssiTxtProdNotInstalled=%1 is not installed.
ar.IssiTxtDownloadingProd=Downloading: %1
ar.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
ar.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
ar.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
ar.IssiTxtLicencePrintFailed=Problems printing License file!
ar.IssiTxtLicenceExtractFailed=Problems extracting License file!
ar.IssiTxtLicencePrintButton=&Print License
ar.IssiTxtAboutButton=&About...
ar.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
ar.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
brn.NameAndVersion=%1 âåğñ³³ %2
brn.AdditionalIcons=Äàäàòêîâûÿ çíà÷ê³:
brn.CreateDesktopIcon=Ñòâàğûöü ñïàñûëêó íà ñòàëå
brn.CreateQuickLaunchIcon=Ñòâàğûöü ñïàñûëêó &Õóòêàãà ïóñêà
brn.ProgramOnTheWeb=%1 ó ñåö³âå
brn.UninstallProgram=Äı³íñòàëÿâàöü %1
brn.LaunchProgram=Çàïóñ³öü %1
brn.AssocFileExtension=&Çâÿçàöü %1 ç %2 ôàéëàâûì ïàøûğıííåì
brn.AssocingFileExtension=Çâÿçâàåì %1 ç %2 ôàéëàâûì ïàøûğıííåì...
brn.IssiLanguageVersion=0x05010000
brn.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
brn.IssiTxtScriptSavePath=Select where %1 has to be saved.
brn.IssiTxtFileExtractSuccess=File extracted.
brn.IssiTxtFileCopyFailed=Failed to copy file.
brn.IssiTxtFileExtractFailed=Failed to extract file.
brn.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
brn.IssiTxtProdNotInstalled=%1 is not installed.
brn.IssiTxtDownloadingProd=Downloading: %1
brn.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
brn.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
brn.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
brn.IssiTxtLicencePrintFailed=Problems printing License file!
brn.IssiTxtLicenceExtractFailed=Problems extracting License file!
brn.IssiTxtLicencePrintButton=&Print License
brn.IssiTxtAboutButton=&About...
brn.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
brn.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
bs.NameAndVersion=%1 verzija %2
bs.AdditionalIcons=Dodatne ikone:
bs.CreateDesktopIcon=Kreiraj &desktop ikonu
bs.CreateQuickLaunchIcon=Kreiraj &Quick Launch ikonu
bs.ProgramOnTheWeb=%1 na Web-u
bs.UninstallProgram=Uninstall %1
bs.LaunchProgram=Pokreni %1
bs.AssocFileExtension=&Asociraj %1 sa %2 ekstenzijom
bs.AssocingFileExtension=Asociaram %1 sa %2 ekstenzijom...
bs.IssiLanguageVersion=0x05010000
bs.IssiTxtScriptBackup=MORATE NAPRAVITI BACKUPS VAŠIH SCRIPT-I!!!
bs.IssiTxtScriptSavePath=Izaberite gdje elite da %1 bude spašen.
bs.IssiTxtFileExtractSuccess=Datoteka raspakovana.
bs.IssiTxtFileCopyFailed=Nije uspjelo kopiranje datoteke.
bs.IssiTxtFileExtractFailed=Nije uspjelo raspakivanje datoteke.
bs.IssiTxtProdAlreadyInstalledPath=%1 je veæ instaliran u %2
bs.IssiTxtProdNotInstalled=%1 nije instaliran.
bs.IssiTxtDownloadingProd=Download-ujem: %1
bs.IssiTxtDownloadingPleaseWait=Molimo saèekajte dok instalacija download-uje %1 na vaè raèunar.
bs.IssiTxtDownloadingFailed=Instalacija ne moe download-ovati %1. pokušajte opet kasnije ili download-ujte i instalirajte %1 ruèno.%n%nInstalacija æe sada nastaviti normalno.
bs.IssiTxtLicencePrintOnDefaultPrinter=elite li da print-ate License na default-nom printeru?
bs.IssiTxtLicencePrintFailed=Problem prilikom printanja License datoteke!
bs.IssiTxtLicenceExtractFailed=Problem prilikom raspakivanja License datoteke!
bs.IssiTxtLicencePrintButton=&Print License
bs.IssiTxtAboutButton=&O instalaciji...
bs.IssiTxtProdUpdated=Trenutna instalacija %1%nje tekuæa.
bs.IssiRequiresNet=Ovaj software zahtjeva Microsoft .NET Framework %1.%n%nMolimo koristite Windows Update da instalirate ovu verziju,%ni nakon toga pokrenete instalaciju ponovo.
br.NameAndVersion=%1 versão %2
br.AdditionalIcons=Ícones adicionais:
br.CreateDesktopIcon=Criar um ícone na &Área de Trabalho
br.CreateQuickLaunchIcon=Criar um ícone na &Barra de Inicialização Rápida
br.ProgramOnTheWeb=%1 na Internet
br.UninstallProgram=Desinstalar %1
br.LaunchProgram=Executar %1
br.AssocFileExtension=&Associar %1 com a extensão de arquivo %2
br.AssocingFileExtension=Associando %1 com a extensão de arquivo...
br.IssiLanguageVersion=0x05010000 
br.IssiTxtScriptBackup=È BOM FAZER CÓPIAS DE SEGURANÇA DE SEUS SCRIPTS!!! 
br.IssiTxtScriptSavePath=Selecione onde %1 deve ser salvo. 
br.IssiTxtFileExtractSuccess=Arquivo extraído. 
br.IssiTxtFileCopyFailed=Falha ao copiar arquivo. 
br.IssiTxtFileExtractFailed=Falha ao extrair arquivo. 
br.IssiTxtProdAlreadyInstalledPath=%1 já está instalado em %2 
br.IssiTxtProdNotInstalled=%1 não está instalado. 
br.IssiTxtDownloadingProd=Baixando: %1 
br.IssiTxtDownloadingPleaseWait=Por favor espere enquanto o Instalador está baixando %1 para seu computador. 
br.IssiTxtDownloadingFailed=O Instalador não pode baixar %1. Tente novamente mais tarde ou baixe e instale %1 manualmente.%n%nSetup agora continuará a instalar normalmente. 
br.IssiTxtLicencePrintOnDefaultPrinter=Deseja imprimir a Licença na impressora padrão? 
br.IssiTxtLicencePrintFailed=Ocorreram problemas ao imprimir o arquivo de Licença! 
br.IssiTxtLicenceExtractFailed=Ocorreram problemas ao extrair o arquivo de Licença! 
br.IssiTxtLicencePrintButton=Im&primir Licença 
br.IssiTxtAboutButton=&Sobre... 
br.IssiTxtProdUpdated=A instalação atual de %1%nis é atual. 
br.IssiRequiresNet=Este aplicativo requer o Microsoft .NET Framework %1.%n%nUtilize o Windows Update para instalar a versão para seu Sist. Operacional,%nand e execute esta instalação novamente. 
bu.NameAndVersion=%1, âåğñèÿ %2
bu.AdditionalIcons=Äîïúëíèòåëíè èêîíè:
bu.CreateDesktopIcon=Èêîíà íà &ğàáîòíèÿ ïëîò
bu.CreateQuickLaunchIcon=Èêîíà â ëåíòàòà çà &áúğçî ñòàğòèğàíå
bu.ProgramOnTheWeb=%1 â WWW
bu.UninstallProgram=Äåèíñòàëèğàíå íà %1
bu.LaunchProgram=Ñòàğòèğàíå íà %1
bu.AssocFileExtension=&Àñîöèèğàíå íà %1 ñ ôàéëîâîòî ğàçøèğåíèå %2
bu.AssocingFileExtension=%1 ñå àñîöèèğà ñ ôàéëîâîòî ğàçøèğåíèå %2...
bu.IssiLanguageVersion=0x05010000
bu.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
bu.IssiTxtScriptSavePath=Select where %1 has to be saved.
bu.IssiTxtFileExtractSuccess=File extracted.
bu.IssiTxtFileCopyFailed=Failed to copy file.
bu.IssiTxtFileExtractFailed=Failed to extract file.
bu.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
bu.IssiTxtProdNotInstalled=%1 is not installed.
bu.IssiTxtDownloadingProd=Downloading: %1
bu.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
bu.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
bu.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
bu.IssiTxtLicencePrintFailed=Problems printing License file!
bu.IssiTxtLicenceExtractFailed=Problems extracting License file!
bu.IssiTxtLicencePrintButton=&Print License
bu.IssiTxtAboutButton=&About...
bu.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
bu.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
ca.NameAndVersion=%1 versió %2
ca.AdditionalIcons=Icones addicionals:
ca.CreateDesktopIcon=Crea una icona a l'&Escriptori
ca.CreateQuickLaunchIcon=Crea una icona a la &Barra de tasques
ca.ProgramOnTheWeb=%1 a Internet
ca.UninstallProgram=Desinstal·la %1
ca.LaunchProgram=Obre %1
ca.AssocFileExtension=&Associa %1 amb l'extensió de fitxer %2
ca.AssocingFileExtension=Associant %1 amb l'extensió de fitxer %2...
ca.IssiLanguageVersion=0x05010000
ca.IssiTxtScriptBackup=CAL QUE FEU CÒPIA DE SEGURETAT DELS VOSTRES SCRIPTS!!!
ca.IssiTxtScriptSavePath=Trieu el lloc on %1 serà desat.
ca.IssiTxtFileExtractSuccess=Fitxer extret.
ca.IssiTxtFileCopyFailed=Fallada en copiar el fitxer.
ca.IssiTxtFileExtractFailed=Fallada en extreure el fitxer.
ca.IssiTxtProdAlreadyInstalledPath=%1 ja està instal·lat a %2
ca.IssiTxtProdNotInstalled=%1 no està instal·lat.
ca.IssiTxtDownloadingProd=Descarregant: %1
ca.IssiTxtDownloadingPleaseWait=Si us plau, espereu mentre l'instal·lador descarrega %1 al vostre ordinador.
ca.IssiTxtDownloadingFailed=L'instal·lador no ha pogut descarregar %1. Intenteu-ho més tard o descarregueu i instal·leu %1 manualment.%n%nL'instal·lador ara continuarà el procés normalment.
ca.IssiTxtLicencePrintOnDefaultPrinter=Voleu imprimir el fitxer de llicència a la impressora predeterminada?
ca.IssiTxtLicencePrintFailed=S'ha detectat problemes en imprimir el fitxer de llicència!
ca.IssiTxtLicenceExtractFailed=S'ha detectat problemes en extreure el fitxer de llicència!
ca.IssiTxtLicencePrintButton=&Imprimeix Llicència
ca.IssiTxtAboutButton=&Sobre...
ca.IssiTxtProdUpdated=La instal·lació de %1%n ja està actualitzada.
ca.IssiRequiresNet=Aquest programa necessita Microsoft .NET Framework %1.%n%nSi us plau, useu Windows Update per instal·lar aquesta versió,%n i després executeu de nou el programa d'instal·lació.
cht.NameAndVersion=%1 ª©¥» %2
cht.AdditionalIcons=ªş¥[¹Ï¥Ü:
cht.CreateDesktopIcon=«Ø¥ß®à­±¹Ï¥Ü(&D)
cht.CreateQuickLaunchIcon=«Ø¥ß§Ö³t±Ò°Ê¹Ï¥Ü(&Q)
cht.ProgramOnTheWeb=%1 ªººô¯¸
cht.UninstallProgram=¸Ñ°£¦w¸Ë %1
cht.LaunchProgram=±Ò°Ê %1
cht.AssocFileExtension=±N %1 »PÀÉ®×°ÆÀÉ¦W %2 ²£¥ÍÃöÁp(&A)
cht.AssocingFileExtension=¥¿¦b±N %1 »PÀÉ®×°ÆÀÉ¦W %2 ²£¥ÍÃöÁp...
cht.IssiLanguageVersion=0x05010000
cht.IssiTxtScriptBackup=±z¥²¶·¬°§Aªºµ{§ÇÀÉ³Æ¥÷!!!
cht.IssiTxtScriptSavePath=¿ï¾ÜÀx¦s %1 ªº¦ì¸m¡C
cht.IssiTxtFileExtractSuccess=ÀÉ®×¤w¸g³Q¸ÑÀ£ÁY¡C
cht.IssiTxtFileCopyFailed=½Æ»sÀÉ®×¥¢±Ñ¡C
cht.IssiTxtFileExtractFailed=¸ÑÀ£ÁYÀÉ®×¥¢±Ñ
cht.IssiTxtProdAlreadyInstalledPath=%1 ¤w¸g¦b %2 ¦w¸Ë¡C
cht.IssiTxtProdNotInstalled=%1 ¨Ã¥¼¦w¸Ë¡C
cht.IssiTxtDownloadingProd=¤U¸ü¤¤: %1
cht.IssiTxtDownloadingPleaseWait=½Ğµy­Ô¡A¦w¸Ëµ{¦¡¥¿¦b±N %1 ¤U¸ü¨ì±zªº¹q¸£¤W¡C
cht.IssiTxtDownloadingFailed=¦w¸ËµLªk¤U¸ü %1¡C½Ğµy«á¦A¸Õ¤@¦¸©Î¦Û¦æ¤U¸ü %1¡C%n%n¦w¸Ëµ{¦¡²{¦b·|¥H¤@¯ë¼Ò¦¡¦w¸Ë¡C
cht.IssiTxtLicencePrintOnDefaultPrinter=±z·Q­n¦C¦L±ÂÅv¦X¬ù¨ì¹w³]¦Lªí¾÷¶Ü?
cht.IssiTxtLicencePrintFailed=¦C¦L±ÂÅv¦X¬ù®Éµo¥Í°İÃD¡C
cht.IssiTxtLicenceExtractFailed=¸ÑÀ£ÁY±ÂÅv¦X¬ù®Éµo¥Í°İÃD¡C
cht.IssiTxtLicencePrintButton=¦C¦L±ÂÅv¦X¬ù(&P)
cht.IssiTxtAboutButton=Ãö©ó(&A)...
cht.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
cht.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
chs.NameAndVersion=%1 °æ±¾ %2
chs.AdditionalIcons=¸½¼ÓÍ¼±ê:
chs.CreateDesktopIcon=ÔÚ×ÀÃæ´´½¨Í¼±ê(&d)
chs.CreateQuickLaunchIcon=ÔÚ¿ì½İÆô¶¯À¸´´½¨Í¼±ê(&Q)
chs.ProgramOnTheWeb=ÍøÂçÉÏµÄ %1
chs.UninstallProgram=Ğ¶ÔØ %1
chs.LaunchProgram=ÔËĞĞ %1
chs.AssocFileExtension=½« %1 ÓëÀ©Õ¹Ãû %2 Á¬½Ó(&A)
chs.AssocingFileExtension=ÕıÔÚ½« %1 ÓëÀ©Õ¹Ãû %2 Á¬½Ó...
chs.IssiLanguageVersion=0x05010000
chs.IssiTxtScriptBackup=Äã±ØĞë±¸·İ³ÌĞòÎÄ¼ş£¡£¡£¡
chs.IssiTxtScriptSavePath=Ñ¡Ôñ´æ·Å %1 Î»ÖÃ
chs.IssiTxtFileExtractSuccess=ÎÄ¼şÒÑ½âÑ¹Ëõ¡£¡C
chs.IssiTxtFileCopyFailed=¸´ÖÆÎÄ¼şÊ§°Ü¡£
chs.IssiTxtFileExtractFailed=½âÑ¹ËõÎÄ¼şÊ§°Ü
chs.IssiTxtProdAlreadyInstalledPath=%1 ÒÑ¾­ÔÚ %2 °²×°¡£
chs.IssiTxtProdNotInstalled=%1 Ã»ÓĞ°²×°
chs.IssiTxtDownloadingProd=ÏÂÔØÖĞ: %1
chs.IssiTxtDownloadingPleaseWait=ÇëÉÔµÈ£¬°²×°³ÌĞòÕıÔÚ½« %1 ÏÂÔØµ½ÄúµÄ¼ÆËã»úÉÏ¡£
chs.IssiTxtDownloadingFailed=°²×°ÎŞ·¨ÏÂÔØ %1¡£ÇëÉÔºóÔÙÊÔ»òÏÂÔØ %1¡£%n%n °²×°³ÌĞòÏÖ½«ÒÔÒ»°ãÄ£Ê½°²×°¡£
chs.IssiTxtLicencePrintOnDefaultPrinter=ÄãÏëÒªÏÔÊ¾ÊÚÈ¨Ğ­Òéµ½´òÓ¡»úÔ¤ÀÀÂğ£¿
chs.IssiTxtLicencePrintFailed=ÏÔÊ¾ÊÚÈ¨Ğ­ÒéÊ±·¢Éú´íÎó¡£
chs.IssiTxtLicenceExtractFailed=½âÑ¹ËõÊÚÈ¨Ğ­ÒéÊ±·¢ÉúÁË´íÎó¡£
chs.IssiTxtLicencePrintButton=ÏÔÊ¾ÊÚÈ¨Ğ­Òé(&P)
chs.IssiTxtAboutButton=¹ØÓÚ(&A)...
chs.IssiTxtProdUpdated=µ±Ç° %1%n µÄ°²×°³ÌĞòÒÑ¾­´ïµ½ÁËÈÕÆÚ¡£
chs.IssiRequiresNet=¸ÃÈí¼ş±ØĞè Microsoft .NET Framework %1.%n%nÇëÓÃ Windows Update À´°²×°¸Ã°æ±¾£¬%n ²¢ÖØĞÂÔËĞĞ°²×°³ÌĞò¡£
cz.NameAndVersion=%1 verze %2
cz.AdditionalIcons=Další zástupci:
cz.CreateDesktopIcon=Vytvoøit zástupce na &ploše
cz.CreateQuickLaunchIcon=Vytvoøit zástupce na panelu &Snadné spuštìní
cz.ProgramOnTheWeb=Aplikace %1 na internetu
cz.UninstallProgram=Odinstalovat aplikaci %1
cz.LaunchProgram=Spustit aplikaci %1
cz.AssocFileExtension=Vytvoøit &asociaci mezi soubory typu %2 a aplikací %1
cz.AssocingFileExtension=Vytváøí se asociace mezi soubory typu %2 a aplikací %1...
cz.IssiLanguageVersion=0x05002200
cz.IssiTxtScriptBackup=VYTVOØTE SI ZÁLOHU VAŠICH SKRIPTÙ!!!
cz.IssiTxtScriptSavePath=Vyberte kam se má %1 uloit.
cz.IssiTxtFileExtractSuccess=Soubor extrahován.
cz.IssiTxtFileCopyFailed=Selhalo kopírování souboru.
cz.IssiTxtFileExtractFailed=Selhala extrakce souboru.
cz.IssiTxtProdAlreadyInstalledPath=%1 je u instalován v %2
cz.IssiTxtProdNotInstalled=%1 není instalován.
cz.IssiTxtDownloadingProd=Stahuji: %1
cz.IssiTxtDownloadingPleaseWait=Prosím èekejte, prùvodce instalací stahuje %1 do vašeho poèítaèe.
cz.IssiTxtDownloadingFailed=Prùvodce instalací nemùe stáhnout %1. Zkuste to pozdìji nebo stáhnìte a instalujte %1 ruènì.%n%nPrùvodce instalací bude nyní pokraèovat v instalaci normálnì.
cz.IssiTxtLicencePrintOnDefaultPrinter=Chcete vytisknout licenèní smlouvu na vıchozí tiskárnì?
cz.IssiTxtLicencePrintFailed=Nastala chyba pøi tisku souboru s licenèní smlouvou!
cz.IssiTxtLicenceExtractFailed=Nastala chyba behem extrakce souboru s licenèní smlouvou!
cz.IssiTxtLicencePrintButton=&Tisknout licenèní smlouvu
cz.IssiTxtAboutButton=&O aplikaci...
cz.IssiTxtProdUpdated=Tato instalace %1%nje ji aktualizována.
cz.IssiRequiresNet=Tento software poaduje Microsoft .NET Framework %1.%n%nProsím pouijte Windows Update pro instalaci této verze%na spuste znovu tuto instalaci.
dk.NameAndVersion=%1 version %2
dk.AdditionalIcons=Ekstra ikoner:
dk.CreateDesktopIcon=Lav ikon på &skrivebordet
dk.CreateQuickLaunchIcon=Lav &hurtigstart-ikon
dk.ProgramOnTheWeb=%1 på internettet
dk.UninstallProgram=Afinstaller (fjern) %1
dk.LaunchProgram=Kør %1
dk.AssocFileExtension=&Sammenkæd %1 med filtypen %2
dk.AssocingFileExtension=Sammenkæder %1 med filtypen %2...
dk.IssiLanguageVersion=0x050100200
dk.IssiTxtScriptBackup=DU SKAL TAGE BACKUP AF DINE SCRIPTS!!!
dk.IssiTxtScriptSavePath=Vælg hvor %1 skal gemmes.
dk.IssiTxtFileExtractSuccess=Fil udpakket.
dk.IssiTxtFileCopyFailed=Fejl under kopiering af fil.
dk.IssiTxtFileExtractFailed=Fejl under udpakning af fil.
dk.IssiTxtProdAlreadyInstalledPath=%1 er allerede installeret i %2
dk.IssiTxtProdNotInstalled=%1 er ikke installeret.
dk.IssiTxtDownloadingProd=Henter: %1
dk.IssiTxtDownloadingPleaseWait=Vent venligst, men installationsprogrammet henter og gemmer %1 på din computer.
dk.IssiTxtDownloadingFailed=Installationsprogrammet kunne ikke hente %1. Prøv igen senere, eller hent og installér %1 manuelt.%n%nInstallationsprogrammet fortsætter nu med at installere normalt.
dk.IssiTxtLicencePrintOnDefaultPrinter=Vil du udskrive licensoplysningerne! til standardprinteren?
dk.IssiTxtLicencePrintFailed=Det opstod et problem under udskrivning af licensoplysningerne!
dk.IssiTxtLicenceExtractFailed=Det opstod et problem under udpakning af licensoplysningerne!!
dk.IssiTxtLicencePrintButton=&Udskriv licensoplysninger
dk.IssiTxtAboutButton=&Om...
dk.IssiTxtProdUpdated=Nuværende installation af %1%n er den seneste udgave.
dk.IssiRequiresNet=Denne softwarepakke bruger Microsoft .NET Framework %1.%n%nHent denne programpakke via Windows Update.%nStart derefter installationsprogrammet igen.
nl.NameAndVersion=%1 versie %2
nl.AdditionalIcons=Extra snelkoppelingen:
nl.CreateDesktopIcon=Maak een snelkoppeling op het &bureaublad
nl.CreateQuickLaunchIcon=Maak een snelkoppeling op de &Snel starten werkbalk
nl.ProgramOnTheWeb=%1 op het Web
nl.UninstallProgram=Verwijder %1
nl.LaunchProgram=&Start %1
nl.AssocFileExtension=&Koppel %1 aan de %2 bestandsextensie
nl.AssocingFileExtension=Bezig met koppelen van %1 aan de %2 bestandsextensie...
nl.IssiLanguageVersion=0x05010002
nl.IssiTxtScriptBackup=JE MOET BACKUPS VAN JE SCRIPT MAKEN!!!
nl.IssiTxtScriptSavePath=Selecteer waar %1 opgeslagen moet worden.
nl.IssiTxtFileExtractSuccess=File uitgepakt.
nl.IssiTxtFileCopyFailed=Kon file niet kopiëren.
nl.IssiTxtFileExtractFailed=Kon file niet uitpakken.
nl.IssiTxtProdAlreadyInstalledPath=%1 is al geïnstalleerd in %2
nl.IssiTxtProdNotInstalled=%1 is niet geïnstalleerd.
nl.IssiTxtDownloadingProd=Downloading: %1
nl.IssiTxtDownloadingPleaseWait=Even geduld terwijl Setup %1 download naar uw computer.
nl.IssiTxtDownloadingFailed=Setup kon %1 niet downloaden. Probeer het later nogmaals of download en installeer %1 handmatig.%n%nSetup zal nu de installatie voortzetten.
nl.IssiTxtLicencePrintOnDefaultPrinter=Wilt u de Licentie afdrukken met de standaard printer?
nl.IssiTxtLicencePrintFailed=Probleem tijdens het afdrukken van de Licentie file!
nl.IssiTxtLicenceExtractFailed=Probleem tijdens het uitpakken van de Licentie file!
nl.IssiTxtLicencePrintButton=&Licentie afdrukken
nl.IssiTxtAboutButton=&Info...
nl.IssiTxtProdUpdated=De huidige installatie van %1%nis al up to date.
nl.IssiRequiresNet=Deze software benodigd Microsoft .NET Framework %1.%n%nInstalleer deze versie via Windows Update,%nen dan herstart het installatie programma.
en.NameAndVersion=%1 version %2
en.AdditionalIcons=Additional icons:
en.CreateDesktopIcon=Create a &desktop icon
en.CreateQuickLaunchIcon=Create a &Quick Launch icon
en.ProgramOnTheWeb=%1 on the Web
en.UninstallProgram=Uninstall %1
en.LaunchProgram=Launch %1
en.AssocFileExtension=&Associate %1 with the %2 file extension
en.AssocingFileExtension=Associating %1 with the %2 file extension...
en.IssiLanguageVersion=0x05010000
en.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
en.IssiTxtScriptSavePath=Select where %1 has to be saved.
en.IssiTxtFileExtractSuccess=File extracted.
en.IssiTxtFileCopyFailed=Failed to copy file.
en.IssiTxtFileExtractFailed=Failed to extract file.
en.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
en.IssiTxtProdNotInstalled=%1 is not installed.
en.IssiTxtDownloadingProd=Downloading: %1
en.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
en.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
en.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
en.IssiTxtLicencePrintFailed=Problems printing License file!
en.IssiTxtLicenceExtractFailed=Problems extracting License file!
en.IssiTxtLicencePrintButton=&Print License
en.IssiTxtAboutButton=&About...
en.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
en.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
est.NameAndVersion=%1 versioon %2.
est.AdditionalIcons=Täiendavad ikoonid:
est.CreateDesktopIcon=Loo &töölaua ikoon
est.CreateQuickLaunchIcon=Loo &kiirkäivituse ikoon
est.ProgramOnTheWeb=% veebis.
est.UninstallProgram=Eemalda %1
est.LaunchProgram=Käivita %1
est.AssocFileExtension=&Seosta %1 faili %2 laiendiga.
est.AssocingFileExtension=Seostan %1 faili %2 laiendiga...
est.IssiLanguageVersion=0x05010000
est.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
est.IssiTxtScriptSavePath=Select where %1 has to be saved.
est.IssiTxtFileExtractSuccess=File extracted.
est.IssiTxtFileCopyFailed=Failed to copy file.
est.IssiTxtFileExtractFailed=Failed to extract file.
est.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
est.IssiTxtProdNotInstalled=%1 is not installed.
est.IssiTxtDownloadingProd=Downloading: %1
est.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
est.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
est.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
est.IssiTxtLicencePrintFailed=Problems printing License file!
est.IssiTxtLicenceExtractFailed=Problems extracting License file!
est.IssiTxtLicencePrintButton=&Print License
est.IssiTxtAboutButton=&About...
est.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
est.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
fi.NameAndVersion=%1 versio %2
fi.AdditionalIcons=Lisäkuvakkeet:
fi.CreateDesktopIcon=Luo kuvake työpöydälle
fi.CreateQuickLaunchIcon=Luo kuvake pikakäynnistyspalkkiin
fi.ProgramOnTheWeb=%1 Internetissä
fi.UninstallProgram=Poista %1
fi.LaunchProgram=Käynnistä %1
fi.AssocFileExtension=Yhdistä %1 tiedostopäätteeseen %2
fi.AssocingFileExtension=Yhdistä %1 tiedostopäätteeseen %2 ...
fi.IssiLanguageVersion=0x05010000
fi.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
fi.IssiTxtScriptSavePath=Select where %1 has to be saved.
fi.IssiTxtFileExtractSuccess=File extracted.
fi.IssiTxtFileCopyFailed=Failed to copy file.
fi.IssiTxtFileExtractFailed=Failed to extract file.
fi.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
fi.IssiTxtProdNotInstalled=%1 is not installed.
fi.IssiTxtDownloadingProd=Downloading: %1
fi.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
fi.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
fi.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
fi.IssiTxtLicencePrintFailed=Problems printing License file!
fi.IssiTxtLicenceExtractFailed=Problems extracting License file!
fi.IssiTxtLicencePrintButton=&Print License
fi.IssiTxtAboutButton=&About...
fi.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
fi.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
fr.NameAndVersion=%1 version %2
fr.AdditionalIcons=Icônes supplémentaires :
fr.CreateDesktopIcon=Créer une icône sur le &Bureau
fr.CreateQuickLaunchIcon=Créer une icône dans la barre de &Lancement rapide
fr.ProgramOnTheWeb=Page d'accueil de %1
fr.UninstallProgram=Désinstaller %1
fr.LaunchProgram=Exécuter %1
fr.AssocFileExtension=&Associer %1 avec l'extension de fichier %2
fr.AssocingFileExtension=Associe %1 avec l'extension de fichier %2...
fr.IssiLanguageVersion=0x05010001
fr.IssiTxtScriptBackup=VOUS DEVEZ FAIRE DES SAUVEGARDES DE VOS SCRIPTS !!!
fr.IssiTxtScriptSavePath=Sélectionnez l'endroit où %1 doit être sauvegardé.
fr.IssiTxtFileExtractSuccess=Fichier extrait.
fr.IssiTxtFileCopyFailed=Echec lors de la copie du fichier.
fr.IssiTxtFileExtractFailed=Echec lors de l'extraction du fichier.
fr.IssiTxtProdAlreadyInstalledPath=%1 est déjà installé dans le répertoire %2
fr.IssiTxtProdNotInstalled=%1 n'est pas installé.
fr.IssiTxtDownloadingProd=Téléchargement: %1
fr.IssiTxtDownloadingPleaseWait=Veuillez patienter pendant que l'installeur télécharge %1 sur votre ordinateur.
fr.IssiTxtDownloadingFailed=L'installeur ne peut télécharger %1. Essayez à nouveau plus tard ou téléchargez et installez %1 manuellement.%n%nL'installeur va à présent poursuivre normalement.
fr.IssiTxtLicencePrintOnDefaultPrinter=Voulez-vous imprimer la licence sur votre imprimante par défaut?
fr.IssiTxtLicencePrintFailed=Echec lors de l'impression du fichier de licence!
fr.IssiTxtLicenceExtractFailed=Echec lors de l'extraction du fichier de licence!
fr.IssiTxtLicencePrintButton=&Imprimer la licence
fr.IssiTxtAboutButton=&Au sujet de...
fr.IssiTxtProdUpdated=L'installation actuelle de %1%nest déjà à jour.
fr.IssiRequiresNet=Ce logiciel nécessite Microsoft .NET Framework %1.%n%nUtilisez Windows Update pour installer cette version,%net relancez cette installation.
ga.NameAndVersion=%1 versión %2
ga.AdditionalIcons=Iconas adicionais:
ga.CreateDesktopIcon=Crear unha icona no &escritorio
ga.CreateQuickLaunchIcon=Crear unha icona no Inicio &Rápido
ga.ProgramOnTheWeb=%1 na Web
ga.UninstallProgram=Desinstalar %1
ga.LaunchProgram=Iniciar %1
ga.AssocFileExtension=&Asociar %1 coa extensión de arquivo %2
ga.AssocingFileExtension=Asociando %1 coa extensión de arquivo %2...
ga.IssiLanguageVersion=0x05010000
ga.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
ga.IssiTxtScriptSavePath=Select where %1 has to be saved.
ga.IssiTxtFileExtractSuccess=File extracted.
ga.IssiTxtFileCopyFailed=Failed to copy file.
ga.IssiTxtFileExtractFailed=Failed to extract file.
ga.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
ga.IssiTxtProdNotInstalled=%1 is not installed.
ga.IssiTxtDownloadingProd=Downloading: %1
ga.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
ga.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
ga.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
ga.IssiTxtLicencePrintFailed=Problems printing License file!
ga.IssiTxtLicenceExtractFailed=Problems extracting License file!
ga.IssiTxtLicencePrintButton=&Print License
ga.IssiTxtAboutButton=&About...
ga.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
ga.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
gr.NameAndVersion=%1 İêäïóç %2
gr.AdditionalIcons=Åğéğëİïí åéêïíßäéá:
gr.CreateDesktopIcon=Äçìéïõñãßá åíüò &åéêïíéäßïõ óôçí åğéöÜíåéá åñãáóßáò
gr.CreateQuickLaunchIcon=Äçìéïõñãßá åíüò åéêïíéäßïõ óôç &ÃñŞãïñç Åêêßíçóç
gr.ProgramOnTheWeb=Ôï %1 óôï Internet
gr.UninstallProgram=ÁğåãêáôÜóôáóç ôïõ %1
gr.LaunchProgram=Åêêßíçóç ôïõ %1
gr.AssocFileExtension=%Áíôéóôïß÷éóç ôïõ %1 ìå ôçí %2 åğİêôáóç áñ÷åßïõ
gr.AssocingFileExtension=Ãßíåôáé áíôéóôïß÷éóç ôïõ %1 ìå ôçí %2 åğİêôáóç áñ÷åßïõ...
gr.IssiLanguageVersion=0x05010000
gr.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
gr.IssiTxtScriptSavePath=Select where %1 has to be saved.
gr.IssiTxtFileExtractSuccess=File extracted.
gr.IssiTxtFileCopyFailed=Failed to copy file.
gr.IssiTxtFileExtractFailed=Failed to extract file.
gr.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
gr.IssiTxtProdNotInstalled=%1 is not installed.
gr.IssiTxtDownloadingProd=Downloading: %1
gr.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
gr.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
gr.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
gr.IssiTxtLicencePrintFailed=Problems printing License file!
gr.IssiTxtLicenceExtractFailed=Problems extracting License file!
gr.IssiTxtLicencePrintButton=&Print License
gr.IssiTxtAboutButton=&About...
gr.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
gr.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
de.NameAndVersion=%1 Version %2
de.AdditionalIcons=Zusätzliche Symbole:
de.CreateDesktopIcon=&Desktop-Symbol anlegen
de.CreateQuickLaunchIcon=Symbol in der Schnellstartleiste anlegen
de.ProgramOnTheWeb=%1 im Internet
de.UninstallProgram=%1 entfernen
de.LaunchProgram=%1 starten
de.AssocFileExtension=&Registriere %1 mit der %2-Dateierweiterung
de.AssocingFileExtension=%1 wird mit der %2-Dateierweiterung registriert...
de.IssiLanguageVersion=0x05010000
de.IssiTxtScriptBackup=SIE MÜSSEN EIN BACKUP IHRER SKRIPTE ERSTELLEN!!!
de.IssiTxtScriptSavePath=Wählen Sie den Pfad, unter dem %1 gespeichert werden soll.
de.IssiTxtFileExtractSuccess=Datei extrahiert.
de.IssiTxtFileCopyFailed=Datei konnte nicht kopiert werden.
de.IssiTxtFileExtractFailed=Datei konnte nicht extrahiert werden.
de.IssiTxtProdAlreadyInstalledPath=%1 ist bereits in %2 installiert.
de.IssiTxtProdNotInstalled=%1 ist nicht installiert.
de.IssiTxtDownloadingProd=Download von: %1
de.IssiTxtDownloadingPleaseWait=Bitte warten Sie, während Setup %1 auf Ihren Computer herunterlädt.
de.IssiTxtDownloadingFailed=Setup konnte %1 nicht herunterladen. Bitte versuchen Sie es später nochmals, oder laden Sie %1 selbst herunter, und installieren Sie es manuell.%n%nSetup wird nun normal fortgesetzt.
de.IssiTxtLicencePrintOnDefaultPrinter=Wollen Sie die Lizenz über den Standarddrucker ausdrucken?
de.IssiTxtLicencePrintFailed=Es ist ein Problem beim Drucken der Lizenzdatei aufgetreten!
de.IssiTxtLicenceExtractFailed=Es ist ein Problem beim Extrahieren der Lizenzdatei aufgetreten!
de.IssiTxtLicencePrintButton=Lizenz &drucken
de.IssiTxtAboutButton=Ü&ber...
de.IssiTxtProdUpdated=Die aktuelle Installation von %1%n ist bereits auf dem neusten Stand.
de.IssiRequiresNet=Diese Software benötigt Microsoft .NET Framework %1.%n%nBitte verwenden Sie Windows Update, um diese Version zu installieren,%nund dann starten Sie das Setup noch einmal.
hu.NameAndVersion=%1 %2 verzió
hu.AdditionalIcons=További ikonok:
hu.CreateDesktopIcon=Ikon létrehozása az &Asztalon
hu.CreateQuickLaunchIcon=Ikon létrehozása a &Gyorsindítás eszköztáron
hu.ProgramOnTheWeb=%1 a weben
hu.UninstallProgram=%1 eltávolítása
hu.LaunchProgram=%1 elindítása
hu.AssocFileExtension=A(z) %1 &társítása a(z) %2 fájlkiterjesztéssel
hu.AssocingFileExtension=A(z) %1 társítása a(z) %2 fájlkiterjesztéssel...
hu.IssiLanguageVersion=0x05010000
hu.IssiTxtScriptBackup=KÉSZÍTSEN MENTÉST A SZKRIPTJEIRÕL!!!
hu.IssiTxtScriptSavePath=Válassza ki, hogy hova kerüljön mentésre a(z) %1 komponens.
hu.IssiTxtFileExtractSuccess=A fájl kibontva.
hu.IssiTxtFileCopyFailed=A fájl másolása nem lehetséges.
hu.IssiTxtFileExtractFailed=A fájl kibontása nem lehetséges.
hu.IssiTxtProdAlreadyInstalledPath=A(z) %1 már telepítve van a(z) %2-n.
hu.IssiTxtProdNotInstalled=%1 nincs telepítve.
hu.IssiTxtDownloadingProd=Letöltés: %1
hu.IssiTxtDownloadingPleaseWait=Kérem várjon amíg a telepítõ letölti a(z) %1 komponenst a számítógépre.
hu.IssiTxtDownloadingFailed=A Telepítõ nem tudta letölteni a(z) %1 komponenst. Próbálja meg késõbb vagy töltse le és telepítse a(z) %1 komponenst kézileg.%n%nA telepítõ folytatja a hagyományos telepítést.
hu.IssiTxtLicencePrintOnDefaultPrinter=Ki kivánja nyomtatni a Licenszt az alapértelmezett nyomtatóra??
hu.IssiTxtLicencePrintFailed=Hiba a Licenc fájl nyomtatása közben!
hu.IssiTxtLicenceExtractFailed=Hiba a Licenc fájl kibontása közben!
hu.IssiTxtLicencePrintButton=&Licenc nyomtatása
hu.IssiTxtAboutButton=&Névjegy...
hu.IssiTxtProdUpdated=A(z) %1 telepítése%nmár frissítve van.
hu.IssiRequiresNet=A szoftver használatához a Microsoft .NET Framework %1 verziójára van szükség.%n%nA Windows Update szolgáltatás használatával telepítse ezt a verziót,%nmajd futtassa újra a telepíto programot.
ice.NameAndVersion=%1 útgáfa %2
ice.AdditionalIcons=Fleiri íkonar: 
ice.CreateDesktopIcon=Stofna &desktop íkona 
ice.CreateQuickLaunchIcon=Stofna &Quick Launch íkona 
ice.ProgramOnTheWeb=%1 á Internetinu 
ice.UninstallProgram=Fjarlægja %1 
ice.LaunchProgram=Ræsa %1 
ice.AssocFileExtension=&Samtengja %1 viğ eftirfarandi %2 skráarendingu 
ice.AssocingFileExtension=Er ağ samtengja %1 viğ skráarendinguna %2 ... 
ice.IssiLanguageVersion=0x05010000
ice.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
ice.IssiTxtScriptSavePath=Select where %1 has to be saved.
ice.IssiTxtFileExtractSuccess=File extracted.
ice.IssiTxtFileCopyFailed=Failed to copy file.
ice.IssiTxtFileExtractFailed=Failed to extract file.
ice.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
ice.IssiTxtProdNotInstalled=%1 is not installed.
ice.IssiTxtDownloadingProd=Downloading: %1
ice.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
ice.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
ice.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
ice.IssiTxtLicencePrintFailed=Problems printing License file!
ice.IssiTxtLicenceExtractFailed=Problems extracting License file!
ice.IssiTxtLicencePrintButton=&Print License
ice.IssiTxtAboutButton=&About...
ice.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
ice.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
ind.NameAndVersion=%1 versi %2
ind.AdditionalIcons=Tambahan icon:
ind.CreateDesktopIcon=Buat icon di &desktop
ind.CreateQuickLaunchIcon=Buat icon &Quick Launch
ind.ProgramOnTheWeb=%1 di Web
ind.UninstallProgram=Deinstal %1
ind.LaunchProgram=Jalankan %1
ind.AssocFileExtension=&Asosiasikan %1 dengan ekstensi file %2
ind.AssocingFileExtension=Mengasosiasikan %1 dengan ekstensi file %2 ...
ind.IssiLanguageVersion=0x05010000
ind.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
ind.IssiTxtScriptSavePath=Select where %1 has to be saved.
ind.IssiTxtFileExtractSuccess=File extracted.
ind.IssiTxtFileCopyFailed=Failed to copy file.
ind.IssiTxtFileExtractFailed=Failed to extract file.
ind.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
ind.IssiTxtProdNotInstalled=%1 is not installed.
ind.IssiTxtDownloadingProd=Downloading: %1
ind.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
ind.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
ind.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
ind.IssiTxtLicencePrintFailed=Problems printing License file!
ind.IssiTxtLicenceExtractFailed=Problems extracting License file!
ind.IssiTxtLicencePrintButton=&Print License
ind.IssiTxtAboutButton=&About...
ind.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
ind.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
it.NameAndVersion=%1 versione %2
it.AdditionalIcons=Icone aggiuntive:
it.CreateDesktopIcon=Crea un'icona sul &desktop
it.CreateQuickLaunchIcon=Crea un'icona nella barra &Avvio veloce
it.ProgramOnTheWeb=%1 sul Web
it.UninstallProgram=Disinstalla %1
it.LaunchProgram=Avvia %1
it.AssocFileExtension=&Associa l'estensione %2 a %1
it.AssocingFileExtension=Associazione dell'estensione %2 a %1 in corso...
it.IssiLanguageVersion=0x05010000
it.IssiTxtScriptBackup=ESEGUIRE IL BACKUP DEI VOSTRI SCRIPTS!!!
it.IssiTxtScriptSavePath=Selezionare dove %1 deve essere salvato.
it.IssiTxtFileExtractSuccess=File estratto.
it.IssiTxtFileCopyFailed=Impossibile copiare il file.
it.IssiTxtFileExtractFailed=Impossibile estrarre il file.
it.IssiTxtProdAlreadyInstalledPath=%1 è già installato in %2
it.IssiTxtProdNotInstalled=%1 non è installato.
it.IssiTxtDownloadingProd=Download in corso: %1
it.IssiTxtDownloadingPleaseWait=Per favore, attendere mentre il Setup sta scaricando %1 nel computer.
it.IssiTxtDownloadingFailed=Setup non puà scaricare %1. Riprovre più tardi o scaricare ed installare %1 manualmente.%n%nSetup conituerà ora l'installazione normalmente.
it.IssiTxtLicencePrintOnDefaultPrinter=Stampare la licenza sulla stampante predefinita?
it.IssiTxtLicencePrintFailed=Problemi durante la stampa della licenza!
it.IssiTxtLicenceExtractFailed=Problemi durante l'estrazione del file della licenza!
it.IssiTxtLicencePrintButton=&Stampa licenza
it.IssiTxtAboutButton=&About...
it.IssiTxtProdUpdated=L'installazione corrente di %1%nè già aggiornata.
it.IssiRequiresNet=Questo software richede Microsoft .NET Framework %1.%n%nSi prega di usare Windows Update per installare questa versione,%n e poi rieseguire il programma di setup.
ja.NameAndVersion=%1 ƒo[ƒWƒ‡ƒ“ %2
ja.AdditionalIcons=’Ç‰Á‚ÌƒAƒCƒRƒ“:
ja.CreateDesktopIcon=ƒfƒXƒNƒgƒbƒv‚ÉƒAƒCƒRƒ“‚ğì¬‚·‚é(&D)
ja.CreateQuickLaunchIcon=ƒNƒCƒbƒNƒ‰ƒ“ƒ`ƒAƒCƒRƒ“‚ğì¬‚·‚é(&Q)
ja.ProgramOnTheWeb=ƒEƒFƒuã‚Ì %1
ja.UninstallProgram=ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ %1
ja.LaunchProgram=%1 ‚ğ‹N“®‚·‚é
ja.AssocFileExtension=%1 ‚ğƒtƒ@ƒCƒ‹Šg’£q %2 ‚ÉŠÖ˜A•t‚¯‚é
ja.AssocingFileExtension=%1 ‚ğƒtƒ@ƒCƒ‹Šg’£q %2 ‚ÉŠÖ˜A•t‚¯‚é...
ja.IssiLanguageVersion=0x05010000
ja.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
ja.IssiTxtScriptSavePath=Select where %1 has to be saved.
ja.IssiTxtFileExtractSuccess=File extracted.
ja.IssiTxtFileCopyFailed=Failed to copy file.
ja.IssiTxtFileExtractFailed=Failed to extract file.
ja.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
ja.IssiTxtProdNotInstalled=%1 is not installed.
ja.IssiTxtDownloadingProd=Downloading: %1
ja.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
ja.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
ja.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
ja.IssiTxtLicencePrintFailed=Problems printing License file!
ja.IssiTxtLicenceExtractFailed=Problems extracting License file!
ja.IssiTxtLicencePrintButton=&Print License
ja.IssiTxtAboutButton=&About...
ja.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
ja.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
kr.NameAndVersion=%1 ¹öÀü %2
kr.AdditionalIcons=¾ÆÀÌÄÜ »ı¼º:
kr.CreateDesktopIcon=¹ÙÅÁ È­¸é¿¡ ¾ÆÀÌÄÜ »ı¼º(&D)
kr.CreateQuickLaunchIcon=ºü¸¥ ½ÇÇà¿¡ ¾ÆÀÌÄÜ »ı¼º(&Q)
kr.ProgramOnTheWeb=À¥ »óÀÇ %1
kr.UninstallProgram=%1 Á¦°Å
kr.LaunchProgram=%1 ½ÇÇà
kr.AssocFileExtension=%2 È®ÀåÀÚ¸¦ %1 ¿¡ ¿¬°á(&A)
kr.AssocingFileExtension=%2 È®ÀåÀÚ¸¦ %1 ¿¡ ¿¬°á Áß...
kr.IssiLanguageVersion=0x05010000
kr.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
kr.IssiTxtScriptSavePath=Select where %1 has to be saved.
kr.IssiTxtFileExtractSuccess=File extracted.
kr.IssiTxtFileCopyFailed=Failed to copy file.
kr.IssiTxtFileExtractFailed=Failed to extract file.
kr.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
kr.IssiTxtProdNotInstalled=%1 is not installed.
kr.IssiTxtDownloadingProd=Downloading: %1
kr.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
kr.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
kr.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
kr.IssiTxtLicencePrintFailed=Problems printing License file!
kr.IssiTxtLicenceExtractFailed=Problems extracting License file!
kr.IssiTxtLicencePrintButton=&Print License
kr.IssiTxtAboutButton=&About...
kr.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
kr.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
li.NameAndVersion=%1 versija %2
li.AdditionalIcons=Papildomos piktogramos:
li.CreateDesktopIcon=Rodyti piktogramà &Darbalaukyje
li.CreateQuickLaunchIcon=Rodyti Sparèiosios &Paleisties piktogramà
li.ProgramOnTheWeb=„%1“ şiniatinklyje
li.UninstallProgram=Pağalinti „%1“
li.LaunchProgram=Paleisti „%1“
li.AssocFileExtension=&Susieti „%1“ programà su bylos plëtiniu %2
li.AssocingFileExtension=„%1“ programa susiejama su bylos plëtiniu %2...
li.IssiLanguageVersion=0x05010000
li.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
li.IssiTxtScriptSavePath=Select where %1 has to be saved.
li.IssiTxtFileExtractSuccess=File extracted.
li.IssiTxtFileCopyFailed=Failed to copy file.
li.IssiTxtFileExtractFailed=Failed to extract file.
li.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
li.IssiTxtProdNotInstalled=%1 is not installed.
li.IssiTxtDownloadingProd=Downloading: %1
li.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
li.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
li.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
li.IssiTxtLicencePrintFailed=Problems printing License file!
li.IssiTxtLicenceExtractFailed=Problems extracting License file!
li.IssiTxtLicencePrintButton=&Print License
li.IssiTxtAboutButton=&About...
li.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
li.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
lu.NameAndVersion=%1 Versioun %2
lu.AdditionalIcons=Zousätzlëch Ikonen:
lu.CreateDesktopIcon=Krééier eng &Desktop Ikon
lu.CreateQuickLaunchIcon=Krééier eng Schnellstart Ikon
lu.ProgramOnTheWeb=%1 um Internet
lu.UninstallProgram=Lösch %1
lu.LaunchProgram=Start %1
lu.AssocFileExtension=&Assoziéier %1 mat der Dateiextensioun %2
lu.AssocingFileExtension=Assoziéieren %1 mat der Dateiextensioun %2...
lu.IssiLanguageVersion=0x05010000
lu.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
lu.IssiTxtScriptSavePath=Select where %1 has to be saved.
lu.IssiTxtFileExtractSuccess=File extracted.
lu.IssiTxtFileCopyFailed=Failed to copy file.
lu.IssiTxtFileExtractFailed=Failed to extract file.
lu.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
lu.IssiTxtProdNotInstalled=%1 is not installed.
lu.IssiTxtDownloadingProd=Downloading: %1
lu.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
lu.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
lu.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
lu.IssiTxtLicencePrintFailed=Problems printing License file!
lu.IssiTxtLicenceExtractFailed=Problems extracting License file!
lu.IssiTxtLicencePrintButton=&Print License
lu.IssiTxtAboutButton=&About...
lu.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
lu.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
malay.NameAndVersion=%1 versi %2
malay.AdditionalIcons=Ikon tambahan:
malay.CreateDesktopIcon=Hasilkan ikon &desktop
malay.CreateQuickLaunchIcon=Hasilkan ikon &Lancar Pantas
malay.ProgramOnTheWeb=%1 di Internet
malay.UninstallProgram=Uninstall %1
malay.LaunchProgram=Jalankan perisian %1
malay.AssocFileExtension=&Kaitkan %1 dengan akhiran fail %2
malay.AssocingFileExtension=Mengaitkan %1 dengan akhiran fail %2 ...
malay.IssiLanguageVersion=0x05010000
malay.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
malay.IssiTxtScriptSavePath=Select where %1 has to be saved.
malay.IssiTxtFileExtractSuccess=File extracted.
malay.IssiTxtFileCopyFailed=Failed to copy file.
malay.IssiTxtFileExtractFailed=Failed to extract file.
malay.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
malay.IssiTxtProdNotInstalled=%1 is not installed.
malay.IssiTxtDownloadingProd=Downloading: %1
malay.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
malay.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
malay.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
malay.IssiTxtLicencePrintFailed=Problems printing License file!
malay.IssiTxtLicenceExtractFailed=Problems extracting License file!
malay.IssiTxtLicencePrintButton=&Print License
malay.IssiTxtAboutButton=&About...
malay.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
malay.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
pl.NameAndVersion=%1 wersja %2
pl.AdditionalIcons=Dodatkowe ikony:
pl.CreateDesktopIcon=Utwórz ikonê na &pulpicie
pl.CreateQuickLaunchIcon=Utwórz ikonê na pasku &szybkiego uruchamiania
pl.ProgramOnTheWeb=Strona WWW programu %1
pl.UninstallProgram=Deinstalacja programu %1
pl.LaunchProgram=Uruchom program %1
pl.AssocFileExtension=&Przypisz program %1 do rozszerzenia pliku %2
pl.AssocingFileExtension=Przypisywanie programu %1 do rozszerzenia pliku %2...
pl.IssiLanguageVersion=0x05010000
pl.IssiTxtScriptBackup=MUSISZ WYKONAÆ KOPIÊ BEZPIECZEÑSTWA SKRYPTÓW!!!
pl.IssiTxtScriptSavePath=Wybierz gdzie ma byæ zapisany skrypt %1.
pl.IssiTxtFileExtractSuccess=Plik wyodrêbniony.
pl.IssiTxtFileCopyFailed=B³¹d podczas kopiowania pliku.
pl.IssiTxtFileExtractFailed=B³¹d podczas wyodrêbniania pliku.
pl.IssiTxtProdAlreadyInstalledPath=%1 jest ju¿ zainstalowany w %2
pl.IssiTxtProdNotInstalled=%1 nie jest jeszcze zainstalowany.
pl.IssiTxtDownloadingProd=Pobieranie: %1
pl.IssiTxtDownloadingPleaseWait=Proszê czekaæ. Program instalacyjny pobiera %1 wymagany dla tego komputera.
pl.IssiTxtDownloadingFailed=Program instalacyjny nie mo¿e pobraæ %1. Proszê spróbowaæ póŸniej lub pobierz i zainstaluj %1 rêcznie.%n%nTeraz program instalacyjny bêdzie kontynuowa³ instalacjê w trybie normalnym.
pl.IssiTxtLicencePrintOnDefaultPrinter=Czy chcesz wydrukowaæ Umowê Licencyjn¹ na drukarce domyœlnej?
pl.IssiTxtLicencePrintFailed=Problemy z wydrukiem pliku Umowy Licencyjnej!
pl.IssiTxtLicenceExtractFailed=Problemy z wyodrêbnieniem pliku z Umow¹ Licencyjn¹!
pl.IssiTxtLicencePrintButton=&Drukuj Umowê Licencyjn¹
pl.IssiTxtAboutButton=&O programie
pl.IssiTxtProdUpdated=Bie¿¹ca instalacja %1%njest ju¿ aktualna.
pl.IssiRequiresNet=Ten program wymaga Microsoft .NET Framework %1.%n%nProszê u¿yj aplikacji Windows Update aby zainstalowaæ t¹ wersjê,%na nastêpnie ponownie uruchom program instalacyjny.
pt.NameAndVersion=%1 versão %2
pt.AdditionalIcons=Ícones adicionais:
pt.CreateDesktopIcon=Criar ícone no &Ambiente de Trabalho
pt.CreateQuickLaunchIcon=Criar ícone na barra de Iniciação &Rápida
pt.ProgramOnTheWeb=%1 na Web
pt.UninstallProgram=Desinstalar o %1
pt.LaunchProgram=Executar o %1
pt.AssocFileExtension=&Associar o %1 aos ficheiros com a extensão %2
pt.AssocingFileExtension=A associar o %1 aos ficheiros com a extensão %2...
pt.IssiLanguageVersion=0x05010000
pt.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
pt.IssiTxtScriptSavePath=Select where %1 has to be saved.
pt.IssiTxtFileExtractSuccess=File extracted.
pt.IssiTxtFileCopyFailed=Failed to copy file.
pt.IssiTxtFileExtractFailed=Failed to extract file.
pt.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
pt.IssiTxtProdNotInstalled=%1 is not installed.
pt.IssiTxtDownloadingProd=Downloading: %1
pt.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
pt.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
pt.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
pt.IssiTxtLicencePrintFailed=Problems printing License file!
pt.IssiTxtLicenceExtractFailed=Problems extracting License file!
pt.IssiTxtLicencePrintButton=&Print License
pt.IssiTxtAboutButton=&About...
pt.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
pt.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
ro.NameAndVersion=%1 versiunea %2
ro.AdditionalIcons=Iconişe adişionale:
ro.CreateDesktopIcon=Creeazã o iconişã pe &desktop
ro.CreateQuickLaunchIcon=Creeazã o iconişã &Quick Launch
ro.ProgramOnTheWeb=%1 pe Internet
ro.UninstallProgram=Dezinstalare %1
ro.LaunchProgram=Lanseazã %1
ro.AssocFileExtension=&Asociazã %1 cu extensia de fiºiere %2
ro.AssocingFileExtension=Asociere %1 cu extensia de fiºiere %2 ...
ro.IssiLanguageVersion=0x05010000
ro.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
ro.IssiTxtScriptSavePath=Select where %1 has to be saved.
ro.IssiTxtFileExtractSuccess=File extracted.
ro.IssiTxtFileCopyFailed=Failed to copy file.
ro.IssiTxtFileExtractFailed=Failed to extract file.
ro.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
ro.IssiTxtProdNotInstalled=%1 is not installed.
ro.IssiTxtDownloadingProd=Downloading: %1
ro.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
ro.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
ro.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
ro.IssiTxtLicencePrintFailed=Problems printing License file!
ro.IssiTxtLicenceExtractFailed=Problems extracting License file!
ro.IssiTxtLicencePrintButton=&Print License
ro.IssiTxtAboutButton=&About...
ro.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
ro.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
ru.NameAndVersion=%1, âåğñèÿ %2
ru.AdditionalIcons=Äîïîëíèòåëüíûå çíà÷êè:
ru.CreateDesktopIcon=Ñîçäàòü çíà÷îê íà &Ğàáî÷åì ñòîëå
ru.CreateQuickLaunchIcon=Ñîçäàòü çíà÷îê â &Ïàíåëè áûñòğîãî çàïóñêà
ru.ProgramOnTheWeb=Ñàéò %1 â Èíòåğíåòå
ru.UninstallProgram=Äåèíñòàëëèğîâàòü %1
ru.LaunchProgram=Çàïóñòèòü %1
ru.AssocFileExtension=Ñâ&ÿçàòü %1 ñ ôàéëàìè, èìåşùèìè ğàñøèğåíèå %2
ru.AssocingFileExtension=Ñâÿçûâàíèå %1 ñ ôàéëàìè %2...
ru.IssiLanguageVersion=0x05010000
ru.IssiTxtScriptBackup=ÂÛ ÄÎËÆÍÛ ÑÄÅËÀÒÜ ĞÅÇÅĞÂÍÛÅ ÊÎÏÈÈ ÂÀØÈÕ ÑÖÅÍÀĞÈÅÂ!
ru.IssiTxtScriptSavePath=Çàäàéòå ïóòü äëÿ ñîõğàíåíèÿ %1.
ru.IssiTxtFileExtractSuccess=Ôàéë èçâëå÷¸í.
ru.IssiTxtFileCopyFailed=Îøèáêà ïğè êîïèğîâàíèè ôàéëà.
ru.IssiTxtFileExtractFailed=Îøèáêà ïğè èçâëå÷åíèè ôàéëà.
ru.IssiTxtProdAlreadyInstalledPath=%1 óæå óñòàíîâëåí â %2
ru.IssiTxtProdNotInstalled=%1 íå óñòàíîâëåí.
ru.IssiTxtDownloadingProd=Çàãğóçêà: %1
ru.IssiTxtDownloadingPleaseWait=Ïîæàëóéñòà, ïîäîæäèòå îêîí÷àíèÿ çàãğóçêè %1 íà âàø êîìïüşòåğ.
ru.IssiTxtDownloadingFailed=Ïğîãğàììå óñòàíîâêè íå óäàëîñü çàãğóçèòü %1. Ïîïğîáóéòå ïîâòîğèòü ıòó îïåğàöèş ïîçæå, ëèáî çàãğóçèòå è óñòàíîâèòå %1 âğó÷íóş.%n%nÑåé÷àñ ïğîãğàììà óñòàíîâêè ïğîäîëæèò âûïîëíåíèå óñòàíîâêè â îáû÷íîì ğåæèìå.
ru.IssiTxtLicencePrintOnDefaultPrinter=Âû õîòèòå íàïå÷àòàòü Ëèöåíçèîííîå Ñîãëàøåíèå, èñïîëüçóÿ ïğèíòåğ ïî óìîë÷àíèş?
ru.IssiTxtLicencePrintFailed=Â ïğîöåññå ïå÷àòè Ëèöåíçèîííîãî Ñîãëàøåíèÿ âîçíèêëè ïğîáëåìû!
ru.IssiTxtLicenceExtractFailed=Â ïğîöåññå èçâëå÷åíèÿ Ëèöåíçèîííîãî Ñîãëàøåíèÿ âîçíèêëè ïğîáëåìû!
ru.IssiTxtLicencePrintButton=&Ïå÷àòü Ëèöåíçèîííîãî Ñîãëàøåíèÿ
ru.IssiTxtAboutButton=&Î ïğîãğàììå...
ru.IssiTxtProdUpdated=Òåêóùàÿ èíñòàëëÿöèÿ %1%nóæå ÿâëÿåòñÿ íàèáîëåå ñîâğåìåííîé.
ru.IssiRequiresNet=İòî ïğîãğàììíîå îáåñïå÷åíèå òğåáóåò íàëè÷èÿ Microsoft .NET Framework %1.%n%nÏîæàëóéñòà, óñòàíîâèòå óêàçàííóş âåğñèş ñ ïîìîùüş Windows Update,%nïîñëå ÷åãî ñíîâà çàïóñòèòå ïğîãğàììó óñòàíîâêè.
serb.NameAndVersion=%1 verzija %2
serb.AdditionalIcons=Dodatne ikone :
serb.CreateDesktopIcon=Napravi preèicu na Desktopu
serb.CreateQuickLaunchIcon=Napravi preèicu u Quick Lanch-u
serb.ProgramOnTheWeb=%1 na Internetu
serb.UninstallProgram=Brisanje %1
serb.LaunchProgram=Pokreni %1
serb.AssocFileExtension=Povei %1 sa %2 fajlovima
serb.AssocingFileExtension=Povezivanje %1 sa %2 fajlovima ...
serb.IssiLanguageVersion=0x05010000
serb.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
serb.IssiTxtScriptSavePath=Select where %1 has to be saved.
serb.IssiTxtFileExtractSuccess=File extracted.
serb.IssiTxtFileCopyFailed=Failed to copy file.
serb.IssiTxtFileExtractFailed=Failed to extract file.
serb.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
serb.IssiTxtProdNotInstalled=%1 is not installed.
serb.IssiTxtDownloadingProd=Downloading: %1
serb.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
serb.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
serb.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
serb.IssiTxtLicencePrintFailed=Problems printing License file!
serb.IssiTxtLicenceExtractFailed=Problems extracting License file!
serb.IssiTxtLicencePrintButton=&Print License
serb.IssiTxtAboutButton=&About...
serb.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
serb.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
slk.NameAndVersion=%1 verzia %2
slk.AdditionalIcons=Ïalší zástupcovia:
slk.CreateDesktopIcon=Vytvori zástupcu na &ploche
slk.CreateQuickLaunchIcon=Vytvori zástupcu na paneli &Rıchle spustenie
slk.ProgramOnTheWeb=Aplikácia %1 na internete
slk.UninstallProgram=Odinštalova aplikáciu %1 
slk.LaunchProgram=Spusti aplikáciu %1
slk.AssocFileExtension=Vytvori &asociáciu medzi súbormi typu %2 a aplikáciou %1
slk.AssocingFileExtension=Vytvára sa asociácia medzi súbormi typu %2 a aplikáciou %1...
slk.IssiLanguageVersion=0x05002200
slk.IssiTxtScriptBackup=VYTVORTE SI ZÁLOHU VAŠICH SKRIPTOV!!!
slk.IssiTxtScriptSavePath=Vyberte, kam se má %1 uloi.
slk.IssiTxtFileExtractSuccess=Súbor rozbalenı.
slk.IssiTxtFileCopyFailed=Zlyhalo kopírovanie súboru.
slk.IssiTxtFileExtractFailed=Zlyhalo rozbalovanie súboru.
slk.IssiTxtProdAlreadyInstalledPath=%1 je u nainštalovanı v %2
slk.IssiTxtProdNotInstalled=%1 nieje nainštalovanı.
slk.IssiTxtDownloadingProd=Sahujem: %1
slk.IssiTxtDownloadingPleaseWait=Prosím poèkajte, sprievodca inštaláciou sahuje %1 do vášho poèítaèa.
slk.IssiTxtDownloadingFailed=Sprievodca inštaláciou nemôe stiahnú %1. Skúste to neskôr, alebo stiahnite a nainštalujte %1 ruène.%n%nSprievodca inštaláciou bude teraz pokraèova v inštalácií normálne.
slk.IssiTxtLicencePrintOnDefaultPrinter=Chcete vytlaèi licenènú zmluvu na predvolenej tlaèiarni?
slk.IssiTxtLicencePrintFailed=Nastala chyba pri tlaèi súboru z licenènej zmluvy!
slk.IssiTxtLicenceExtractFailed=Nastala chyba behom rozba¾ovania súboru z licenènej zmluvy!
slk.IssiTxtLicencePrintButton=&Tlaèi licenènú zmluvu
slk.IssiTxtAboutButton=&O programe...
slk.IssiTxtProdUpdated=Táto inštalácia %1%nje u aktualizovaná.
slk.IssiRequiresNet=Tento software poaduje Microsoft .NET Framework %1.%n%nProsím pouite Windows Update pre inštaláciu tejto verzie%na spustite znovu túto inštaláciu.
slo.NameAndVersion=%1 razlièica %2
slo.AdditionalIcons=Dodatne ikone:
slo.CreateDesktopIcon=Ustvari ikono na &namizju
slo.CreateQuickLaunchIcon=Ustvari ikono za &hitri zagon
slo.ProgramOnTheWeb=%1 na spletu
slo.UninstallProgram=Odstrani %1
slo.LaunchProgram=Odpri %1
slo.AssocFileExtension=&Povei %1 s pripono %2
slo.AssocingFileExtension=Povezujem %1 s pripono %2...
slo.IssiLanguageVersion=0x05010000
slo.IssiTxtScriptBackup=IZDELUJTE VARNOSTNE KOPIJE VAŠIH SKRIPT!!!
slo.IssiTxtScriptSavePath=Izberite mapo za shranitev %1.
slo.IssiTxtFileExtractSuccess=Datoteka ekstrahirana.
slo.IssiTxtFileCopyFailed=Kopiranje datoteke ni uspelo.
slo.IssiTxtFileExtractFailed=Ekstrakcija datoteke ni uspela.
slo.IssiTxtProdAlreadyInstalledPath=%1 je e namešèen v %2
slo.IssiTxtProdNotInstalled=%1 ni namešèen.
slo.IssiTxtDownloadingProd=Prenašam: %1
slo.IssiTxtDownloadingPleaseWait=Poèakajte, da namestitev prenese %1 v vaš raèunalnik.
slo.IssiTxtDownloadingFailed=Namestitev ne more prenesti %1. elite poskusiti ponovno kasneje ali roèno namestiti %1.%n%nNamestitveni program bo zdaj nadaljeval z namešèanjem.
slo.IssiTxtLicencePrintOnDefaultPrinter=Ali elite tiskanje licenène pogodbe na privzeti tiskalnik?
slo.IssiTxtLicencePrintFailed=Teave pri tiskanju licenène pogodbe!
slo.IssiTxtLicenceExtractFailed=Teave pri ekstrakciji licenène pogodbe!
slo.IssiTxtLicencePrintButton=&Natisni licenèno pogodbo
slo.IssiTxtAboutButton=&O programu...
slo.IssiTxtProdUpdated=Imate namešèeno zadnjo razlièico programa %1.
slo.IssiRequiresNet=Ta program zahteva Microsoft .NET Framework %1.%n%nUporabite Windows Update za namestitev te razlièice,%nnato še enkrat odprite ta namestitveni program.
es.NameAndVersion=%1 versión %2
es.AdditionalIcons=Iconos adicionales:
es.CreateDesktopIcon=Crear un icono en el &escritorio
es.CreateQuickLaunchIcon=Crear un icono de Inicio Rápido
es.ProgramOnTheWeb=%1 en la Web
es.UninstallProgram=Desinstalar %1
es.LaunchProgram=Ejecutar %1
es.AssocFileExtension=&Asociar %1 con la extensión de archivo %2
es.AssocingFileExtension=Asociando %1 con la extensión de archivo %2...
es.IssiLanguageVersion=0x05010000
es.IssiTxtScriptBackup=¡¡¡DEBE HACER COPIAS DE SEGURIDAD DE SUS SCRIPTS !!!
es.IssiTxtScriptSavePath=Elija dónde tiene que ser guardado %1.
es.IssiTxtFileExtractSuccess=Archivo extraído.
es.IssiTxtFileCopyFailed=Se produjo un fallo al copiar el fichero.
es.IssiTxtFileExtractFailed=Se produjo un fallo al extraer el fichero.
es.IssiTxtProdAlreadyInstalledPath=%1 ya se encuentra instalado en %2
es.IssiTxtProdNotInstalled=%1 no está instalado.
es.IssiTxtDownloadingProd=Descargando: %1
es.IssiTxtDownloadingPleaseWait=Por favor, espere mientras el programa de instalación descarga %1 en su equipo.
es.IssiTxtDownloadingFailed=El programa de instalación no pudo descargar %1. Inténtelo más tarde o descargue e instale %1 manualmente.%n%nEl programa de instalación continuará ahora instalando normalmente.
es.IssiTxtLicencePrintOnDefaultPrinter=¿Desea imprimir la Licencia en la impresora predeterminada?
es.IssiTxtLicencePrintFailed=¡Se detectaron problemas al imprimir el archivo de Licencia!
es.IssiTxtLicenceExtractFailed=¡Se detectaron problemas al extraer el archivo de Licencia!
es.IssiTxtLicencePrintButton=&Imprimir Licencia
es.IssiTxtAboutButton=&Acerca de...
es.IssiTxtProdUpdated=La instalación existente de %1%nya se encuentra actualizada.
es.IssiRequiresNet=Este software necesita el Microsoft .NET Framework %1.%n%nPor favor, use Windows Update para instalar esta versión,%ny después vuelva a ejecutar el programa de instalación.
se.NameAndVersion=%1 version %2
se.AdditionalIcons=Återstående ikoner:
se.CreateDesktopIcon=Skapa en ikon på skrivbordet
se.CreateQuickLaunchIcon=Skapa en ikon i Snabbstartfältet
se.ProgramOnTheWeb=%1 på Webben
se.UninstallProgram=Avinstallera %1
se.LaunchProgram=Starta %1
se.AssocFileExtension=&Associera %1 med %2 filnamnstillägg
se.AssocingFileExtension=Associerar %1 med %2 filnamnstillägg...
se.IssiLanguageVersion=0x05010000
se.IssiTxtScriptBackup=DU MÅSTE GÖRA EN SÄKERHETSKOPIERING AV DINA BEFINTLIGA SKRIPTFILER!!!
se.IssiTxtScriptSavePath=Välj var %1 ska sparas.
se.IssiTxtFileExtractSuccess=Filen packades upp.
se.IssiTxtFileCopyFailed=Ett problem uppstod när filen skulle kopieras.
se.IssiTxtFileExtractFailed=Ett problem uppstod när filen skulle packas upp.
se.IssiTxtProdAlreadyInstalledPath=%1 är redan installerad i %2
se.IssiTxtProdNotInstalled=%1 är inte installerad.
se.IssiTxtDownloadingProd=Hämtar: %1
se.IssiTxtDownloadingPleaseWait=%1 hämtas till din dator. Var god vänta.
se.IssiTxtDownloadingFailed=Kunde inte hämta %1. Försök igen senare eller hämta och installera %1 manuellt.%n%nInstallationen fortsätter nu normalt.
se.IssiTxtLicencePrintOnDefaultPrinter=Vill du skriva ut licensen?
se.IssiTxtLicencePrintFailed=Ett problem uppstod när licensen skulle skrivas ut.
se.IssiTxtLicenceExtractFailed=Ett problem uppstod när licensen skulle packas upp.
se.IssiTxtLicencePrintButton=Skriv &ut
se.IssiTxtAboutButton=&Om...
se.IssiTxtProdUpdated=Nuvarande installation av %1 är aktuell.
se.IssiRequiresNet=Denna programvara kräver Microsoft .NET Framework %1.%n%nAnvänd Windows Update för att installera denna version.%noch kör installationsprogrammet igen.
tk.NameAndVersion=%1 sürüm %2
tk.AdditionalIcons=Ek simgleler:
tk.CreateDesktopIcon=Masaüstü simg&esi oluştur
tk.CreateQuickLaunchIcon=Hızlı Başlat simgesi &oluştur
tk.ProgramOnTheWeb=%1 Web Sitesi
tk.UninstallProgram=%1 Programını Kaldır
tk.LaunchProgram=%1 Programını Çalıştır
tk.AssocFileExtension=%2 dosya uzantılarını %1'e ata
tk.AssocingFileExtension=%2 dosya uzantıları %1'e atanıyor...
tk.IssiLanguageVersion=0x05010000
tk.IssiTxtScriptBackup=SCRİPTLERİNİZ İÇİN YEDEK ALMAK ZORUNDASINIZ!!!
tk.IssiTxtScriptSavePath=%1 için kaydedilme yolunu giriniz.
tk.IssiTxtFileExtractSuccess=Dosya çıkartıldı.
tk.IssiTxtFileCopyFailed=Dosya kopyalanması başarılamadı.
tk.IssiTxtFileExtractFailed=Dosya çıkartılması başarılamadı.
tk.IssiTxtProdAlreadyInstalledPath=%1 zaten %2 'de kurulu...
tk.IssiTxtProdNotInstalled=%1 kurulu değil.
tk.IssiTxtDownloadingProd=İndiriliyor: %1
tk.IssiTxtDownloadingPleaseWait=Lütfen %1 bilgisayarınıza yüklenirken bekleyiniz.
tk.IssiTxtDownloadingFailed=%1 Kur tarafından indirilemedi. Lütfen daha sonra tekrar deneyiniz veya kendiniz indirip kurunuz.%n%n Kur şimdi yüklemeye normal olarak devam edecektir.
tk.IssiTxtLicencePrintOnDefaultPrinter=Lisansı şimdi varsayılan yazıcı ıle yazdırmak istiyor musunuz?
tk.IssiTxtLicencePrintFailed=Lisansı yazdırmada sorunlar var!
tk.IssiTxtLicenceExtractFailed=Lisans dosyasının çıkarılmasında sorunlar var!
tk.IssiTxtLicencePrintButton=&Lisansı Yazdır
tk.IssiTxtAboutButton=&Hakkında...
tk.IssiTxtProdUpdated=Şimdiki %n%1%n yüklemesi zaten güncel.
tk.IssiRequiresNet=Bu yazılım Microsoft .NET Framework %1 gerektirmektedir. %n%n Lütfen bu sürümü yüklemek için Windows Update'i kullanınız, %nardından kurulum programını tekrar çalıştırınız.
ukr.NameAndVersion=%1, âåğñ³ÿ %2
ukr.AdditionalIcons=Äîäàòêîâ³ çíà÷êè:
ukr.CreateDesktopIcon=Ñòâîğèòè çíà÷îê íà &Ğîáî÷îìó ñòîë³
ukr.CreateQuickLaunchIcon=Ñòâîğèòè çíà÷îê íà &Ïàíåë³ øâèäêîãî äîñòóïó
ukr.ProgramOnTheWeb=Ñàéò %1 â ²íòåğíåò³
ukr.UninstallProgram=Äå³íñòàëşâàòè %1
ukr.LaunchProgram=Çàïóñòèòè %1
ukr.AssocFileExtension=Çâÿçàòè %1 ç ôàéëàìè, êîòğ³ ìàşòü ğîçøèğåííÿ %2
ukr.AssocingFileExtension=Çâÿçóâàííÿ %1 ç ôàéëàìè %2
ukr.IssiLanguageVersion=0x05010000
ukr.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
ukr.IssiTxtScriptSavePath=Select where %1 has to be saved.
ukr.IssiTxtFileExtractSuccess=File extracted.
ukr.IssiTxtFileCopyFailed=Failed to copy file.
ukr.IssiTxtFileExtractFailed=Failed to extract file.
ukr.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
ukr.IssiTxtProdNotInstalled=%1 is not installed.
ukr.IssiTxtDownloadingProd=Downloading: %1
ukr.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
ukr.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
ukr.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
ukr.IssiTxtLicencePrintFailed=Problems printing License file!
ukr.IssiTxtLicenceExtractFailed=Problems extracting License file!
ukr.IssiTxtLicencePrintButton=&Print License
ukr.IssiTxtAboutButton=&About...
ukr.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
ukr.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
baq.NameAndVersion=%1 %2 bertsioa
baq.AdditionalIcons=Ikono gehigarriak:
baq.CreateDesktopIcon=&Mahaigainean lasterbidea sortu
baq.CreateQuickLaunchIcon=&Ataza Barran lasterbidea sortu
baq.ProgramOnTheWeb=%1 sarean
baq.UninstallProgram=%1 desinstalatu
baq.LaunchProgram=%1 abiarazi
baq.AssocFileExtension=&Lotu %1 programa %2 fitxategi luzapenarekin
baq.AssocingFileExtension=%1 programa %2 fitxategi luzapenarekin lotzen...
baq.IssiLanguageVersion=0x05010000
baq.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
baq.IssiTxtScriptSavePath=Select where %1 has to be saved.
baq.IssiTxtFileExtractSuccess=File extracted.
baq.IssiTxtFileCopyFailed=Failed to copy file.
baq.IssiTxtFileExtractFailed=Failed to extract file.
baq.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
baq.IssiTxtProdNotInstalled=%1 is not installed.
baq.IssiTxtDownloadingProd=Downloading: %1
baq.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
baq.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
baq.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
baq.IssiTxtLicencePrintFailed=Problems printing License file!
baq.IssiTxtLicenceExtractFailed=Problems extracting License file!
baq.IssiTxtLicencePrintButton=&Print License
baq.IssiTxtAboutButton=&About...
baq.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
baq.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
arg.NameAndVersion=%1 versión %2
arg.AdditionalIcons=Iconos adicionales:
arg.CreateDesktopIcon=Crear íconos en el &escritorio
arg.CreateQuickLaunchIcon=Crear un ícono de inicio &rápido
arg.ProgramOnTheWeb=%1 en la Web
arg.UninstallProgram=Desinstalar %1
arg.LaunchProgram=Ejecutar %1
arg.AssocFileExtension=&Asociar %1 con la extensión %2
arg.AssocingFileExtension=Asociando %1 con la extensión %2...
arg.IssiLanguageVersion=0x05010000
arg.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
arg.IssiTxtScriptSavePath=Select where %1 has to be saved.
arg.IssiTxtFileExtractSuccess=File extracted.
arg.IssiTxtFileCopyFailed=Failed to copy file.
arg.IssiTxtFileExtractFailed=Failed to extract file.
arg.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
arg.IssiTxtProdNotInstalled=%1 is not installed.
arg.IssiTxtDownloadingProd=Downloading: %1
arg.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
arg.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
arg.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
arg.IssiTxtLicencePrintFailed=Problems printing License file!
arg.IssiTxtLicenceExtractFailed=Problems extracting License file!
arg.IssiTxtLicencePrintButton=&Print License
arg.IssiTxtAboutButton=&About...
arg.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
arg.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
nic.NameAndVersion=%1 version %2
nic.AdditionalIcons=Iconos Adicionales:
nic.CreateDesktopIcon=Crear un Icono en el Escritorio &desktop
nic.CreateQuickLaunchIcon=Crear un Icono en la Barra de Inicio &Rapido
nic.ProgramOnTheWeb=%1 en la web.
nic.UninstallProgram=DesInstalar %1
nic.LaunchProgram=Lanzar %1
nic.AssocFileExtension=&Asociar %1 con la extencion de archivos %2
nic.AssocingFileExtension=Asociando %1 on la extencion de archivos %2 ...
nic.IssiLanguageVersion=0x05010000
nic.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
nic.IssiTxtScriptSavePath=Select where %1 has to be saved.
nic.IssiTxtFileExtractSuccess=File extracted.
nic.IssiTxtFileCopyFailed=Failed to copy file.
nic.IssiTxtFileExtractFailed=Failed to extract file.
nic.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
nic.IssiTxtProdNotInstalled=%1 is not installed.
nic.IssiTxtDownloadingProd=Downloading: %1
nic.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
nic.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
nic.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
nic.IssiTxtLicencePrintFailed=Problems printing License file!
nic.IssiTxtLicenceExtractFailed=Problems extracting License file!
nic.IssiTxtLicencePrintButton=&Print License
nic.IssiTxtAboutButton=&About...
nic.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
nic.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
tat.NameAndVersion=%1, %2. sörememdä
tat.AdditionalIcons=Östämä tamğalar:
tat.CreateDesktopIcon=Östälös &tamğaların yasísı
tat.CreateQuickLaunchIcon=&Tiz Cibärü tamğasın yasísı
tat.ProgramOnTheWeb=%1 Säxifäse
tat.UninstallProgram=%1 beterü
tat.LaunchProgram=%1 cibärü
tat.AssocFileExtension=%2 birem quşımtasın %1 belän &kileşter
tat.AssocingFileExtension=%2 birem quşımtasın %1 belän kileşterü...
tat.IssiLanguageVersion=0x05010000
tat.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
tat.IssiTxtScriptSavePath=Select where %1 has to be saved.
tat.IssiTxtFileExtractSuccess=File extracted.
tat.IssiTxtFileCopyFailed=Failed to copy file.
tat.IssiTxtFileExtractFailed=Failed to extract file.
tat.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
tat.IssiTxtProdNotInstalled=%1 is not installed.
tat.IssiTxtDownloadingProd=Downloading: %1
tat.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
tat.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
tat.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
tat.IssiTxtLicencePrintFailed=Problems printing License file!
tat.IssiTxtLicenceExtractFailed=Problems extracting License file!
tat.IssiTxtLicencePrintButton=&Print License
tat.IssiTxtAboutButton=&About...
tat.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
tat.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.
heb.NameAndVersion=%1 âéøñä %2
heb.AdditionalIcons=ñéîìåğéí ğåñôéí:
heb.CreateDesktopIcon=öåø ÷éöåø ãøê òì &ùåìçï äòáåãä
heb.CreateQuickLaunchIcon=öåø ñéîìåï áùåøú ääøöä äîäéøä
heb.ProgramOnTheWeb=%1 áøùú
heb.UninstallProgram=äñø àú %1
heb.LaunchProgram=äôòì %1
heb.AssocFileExtension=&÷ùø àú %1 òí ñéåîú ä÷åáõ %2
heb.AssocingFileExtension=î÷ùø àú %1 òí ñéåîú ä÷åáõ %2
heb.IssiLanguageVersion=0x05010000
heb.IssiTxtScriptBackup=YOU HAVE TO MAKE BACKUPS OF YOUR SCRIPTS!!!
heb.IssiTxtScriptSavePath=Select where %1 has to be saved.
heb.IssiTxtFileExtractSuccess=File extracted.
heb.IssiTxtFileCopyFailed=Failed to copy file.
heb.IssiTxtFileExtractFailed=Failed to extract file.
heb.IssiTxtProdAlreadyInstalledPath=%1 is already installed in %2
heb.IssiTxtProdNotInstalled=%1 is not installed.
heb.IssiTxtDownloadingProd=Downloading: %1
heb.IssiTxtDownloadingPleaseWait=Please wait while Setup is downloading %1 to your computer.
heb.IssiTxtDownloadingFailed=Setup could not download %1. Try again later or download and install %1 manually.%n%nSetup will now continue installing normally.
heb.IssiTxtLicencePrintOnDefaultPrinter=Do you want to print License to default printer?
heb.IssiTxtLicencePrintFailed=Problems printing License file!
heb.IssiTxtLicenceExtractFailed=Problems extracting License file!
heb.IssiTxtLicencePrintButton=&Print License
heb.IssiTxtAboutButton=&About...
heb.IssiTxtProdUpdated=The current installation of %1%nis already up to date.
heb.IssiRequiresNet=This software requires the Microsoft .NET Framework %1.%n%nPlease use Windows Update to install this version,%nand then re-run the setup program.

[Languages]
; These files are stubs
; To achieve better results after recompilation, use the real language files
Name: "af"; MessagesFile: "embedded\af.isl"; LicenseFile: "embedded\afLicense.txt"; InfoBeforeFile: "embedded\afInfoBefore.txt"; 
Name: "al"; MessagesFile: "embedded\al.isl"; LicenseFile: "embedded\alLicense.txt"; InfoBeforeFile: "embedded\alInfoBefore.txt"; 
Name: "ar"; MessagesFile: "embedded\ar.isl"; LicenseFile: "embedded\arLicense.txt"; InfoBeforeFile: "embedded\arInfoBefore.txt"; 
Name: "brn"; MessagesFile: "embedded\brn.isl"; LicenseFile: "embedded\brnLicense.txt"; InfoBeforeFile: "embedded\brnInfoBefore.txt"; 
Name: "bs"; MessagesFile: "embedded\bs.isl"; LicenseFile: "embedded\bsLicense.txt"; InfoBeforeFile: "embedded\bsInfoBefore.txt"; 
Name: "br"; MessagesFile: "embedded\br.isl"; LicenseFile: "embedded\brLicense.txt"; InfoBeforeFile: "embedded\brInfoBefore.txt"; 
Name: "bu"; MessagesFile: "embedded\bu.isl"; LicenseFile: "embedded\buLicense.txt"; InfoBeforeFile: "embedded\buInfoBefore.txt"; 
Name: "ca"; MessagesFile: "embedded\ca.isl"; LicenseFile: "embedded\caLicense.txt"; InfoBeforeFile: "embedded\caInfoBefore.txt"; 
Name: "cht"; MessagesFile: "embedded\cht.isl"; LicenseFile: "embedded\chtLicense.txt"; InfoBeforeFile: "embedded\chtInfoBefore.txt"; 
Name: "chs"; MessagesFile: "embedded\chs.isl"; LicenseFile: "embedded\chsLicense.txt"; InfoBeforeFile: "embedded\chsInfoBefore.txt"; 
Name: "cz"; MessagesFile: "embedded\cz.isl"; LicenseFile: "embedded\czLicense.txt"; InfoBeforeFile: "embedded\czInfoBefore.txt"; 
Name: "dk"; MessagesFile: "embedded\dk.isl"; LicenseFile: "embedded\dkLicense.txt"; InfoBeforeFile: "embedded\dkInfoBefore.txt"; 
Name: "nl"; MessagesFile: "embedded\nl.isl"; LicenseFile: "embedded\nlLicense.txt"; InfoBeforeFile: "embedded\nlInfoBefore.txt"; 
Name: "en"; MessagesFile: "embedded\en.isl"; LicenseFile: "embedded\enLicense.txt"; InfoBeforeFile: "embedded\enInfoBefore.txt"; 
Name: "est"; MessagesFile: "embedded\est.isl"; LicenseFile: "embedded\estLicense.txt"; InfoBeforeFile: "embedded\estInfoBefore.txt"; 
Name: "fi"; MessagesFile: "embedded\fi.isl"; LicenseFile: "embedded\fiLicense.txt"; InfoBeforeFile: "embedded\fiInfoBefore.txt"; 
Name: "fr"; MessagesFile: "embedded\fr.isl"; LicenseFile: "embedded\frLicense.txt"; InfoBeforeFile: "embedded\frInfoBefore.txt"; 
Name: "ga"; MessagesFile: "embedded\ga.isl"; LicenseFile: "embedded\gaLicense.txt"; InfoBeforeFile: "embedded\gaInfoBefore.txt"; 
Name: "gr"; MessagesFile: "embedded\gr.isl"; LicenseFile: "embedded\grLicense.txt"; InfoBeforeFile: "embedded\grInfoBefore.txt"; 
Name: "de"; MessagesFile: "embedded\de.isl"; LicenseFile: "embedded\deLicense.txt"; InfoBeforeFile: "embedded\deInfoBefore.txt"; 
Name: "hu"; MessagesFile: "embedded\hu.isl"; LicenseFile: "embedded\huLicense.txt"; InfoBeforeFile: "embedded\huInfoBefore.txt"; 
Name: "ice"; MessagesFile: "embedded\ice.isl"; LicenseFile: "embedded\iceLicense.txt"; InfoBeforeFile: "embedded\iceInfoBefore.txt"; 
Name: "ind"; MessagesFile: "embedded\ind.isl"; LicenseFile: "embedded\indLicense.txt"; InfoBeforeFile: "embedded\indInfoBefore.txt"; 
Name: "it"; MessagesFile: "embedded\it.isl"; LicenseFile: "embedded\itLicense.txt"; InfoBeforeFile: "embedded\itInfoBefore.txt"; 
Name: "ja"; MessagesFile: "embedded\ja.isl"; LicenseFile: "embedded\jaLicense.txt"; InfoBeforeFile: "embedded\jaInfoBefore.txt"; 
Name: "kr"; MessagesFile: "embedded\kr.isl"; LicenseFile: "embedded\krLicense.txt"; InfoBeforeFile: "embedded\krInfoBefore.txt"; 
Name: "li"; MessagesFile: "embedded\li.isl"; LicenseFile: "embedded\liLicense.txt"; InfoBeforeFile: "embedded\liInfoBefore.txt"; 
Name: "lu"; MessagesFile: "embedded\lu.isl"; LicenseFile: "embedded\luLicense.txt"; InfoBeforeFile: "embedded\luInfoBefore.txt"; 
Name: "malay"; MessagesFile: "embedded\malay.isl"; LicenseFile: "embedded\malayLicense.txt"; InfoBeforeFile: "embedded\malayInfoBefore.txt"; 
Name: "pl"; MessagesFile: "embedded\pl.isl"; LicenseFile: "embedded\plLicense.txt"; InfoBeforeFile: "embedded\plInfoBefore.txt"; 
Name: "pt"; MessagesFile: "embedded\pt.isl"; LicenseFile: "embedded\ptLicense.txt"; InfoBeforeFile: "embedded\ptInfoBefore.txt"; 
Name: "ro"; MessagesFile: "embedded\ro.isl"; LicenseFile: "embedded\roLicense.txt"; InfoBeforeFile: "embedded\roInfoBefore.txt"; 
Name: "ru"; MessagesFile: "embedded\ru.isl"; LicenseFile: "embedded\ruLicense.txt"; InfoBeforeFile: "embedded\ruInfoBefore.txt"; 
Name: "serb"; MessagesFile: "embedded\serb.isl"; LicenseFile: "embedded\serbLicense.txt"; InfoBeforeFile: "embedded\serbInfoBefore.txt"; 
Name: "slk"; MessagesFile: "embedded\slk.isl"; LicenseFile: "embedded\slkLicense.txt"; InfoBeforeFile: "embedded\slkInfoBefore.txt"; 
Name: "slo"; MessagesFile: "embedded\slo.isl"; LicenseFile: "embedded\sloLicense.txt"; InfoBeforeFile: "embedded\sloInfoBefore.txt"; 
Name: "es"; MessagesFile: "embedded\es.isl"; LicenseFile: "embedded\esLicense.txt"; InfoBeforeFile: "embedded\esInfoBefore.txt"; 
Name: "se"; MessagesFile: "embedded\se.isl"; LicenseFile: "embedded\seLicense.txt"; InfoBeforeFile: "embedded\seInfoBefore.txt"; 
Name: "tk"; MessagesFile: "embedded\tk.isl"; LicenseFile: "embedded\tkLicense.txt"; InfoBeforeFile: "embedded\tkInfoBefore.txt"; 
Name: "ukr"; MessagesFile: "embedded\ukr.isl"; LicenseFile: "embedded\ukrLicense.txt"; InfoBeforeFile: "embedded\ukrInfoBefore.txt"; 
Name: "baq"; MessagesFile: "embedded\baq.isl"; 
Name: "arg"; MessagesFile: "embedded\arg.isl"; 
Name: "nic"; MessagesFile: "embedded\nic.isl"; 
Name: "tat"; MessagesFile: "embedded\tat.isl"; 
Name: "heb"; MessagesFile: "embedded\heb.isl"; LicenseFile: "embedded\hebLicense.txt"; InfoBeforeFile: "embedded\hebInfoBefore.txt"; 
