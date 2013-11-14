; *** Inno Setup version 5.1.0+ Estonian messages ***
; Translation made with Translator 1.32 (http://www2.arnes.si/~sopjsimo/translator.html)

; Estonian translation by rix
; E-mail: admin@mmaailm.net
; Last modification date: 2005-6-01
; Tõlge on valminud Märt Kelderi esialgse versiooni baasil ning kohandatud uuemale versioonile.

;
; To download user-contributed translations of this file, go to:
;   http://www.jrsoftware.org/is3rdparty.php
;
; Note: When translating this text, do not add periods (.) to the end of
; messages that didn't have them already, because on those messages Inno
; Setup adds the periods automatically (appending a period would result in
; two periods being displayed).
;
; $jrsoftware: issrc/Files/Languages/Estonian.isl,v 1.7 2005/06/01 16:58:26 jr Exp $

[LangOptions]
LanguageName=Estonian
LanguageID=$0425
; If the language you are translating to requires special font faces or
; sizes, uncomment any of the following entries and change them accordingly.
;DialogFontName=MS Shell Dlg
;DialogFontSize=8
;DialogFontStandardHeight=13
;TitleFontName=Arial
;TitleFontSize=29
;WelcomeFontName=Verdana
;WelcomeFontSize=12
;CopyrightFontName=Arial
;CopyrightFontSize=8

LanguageCodePage=0
DialogFontName=
DialogFontSize=8
WelcomeFontName=Verdana
WelcomeFontSize=12
TitleFontName=Arial
TitleFontSize=29
CopyrightFontName=Arial
CopyrightFontSize=8
[Messages]

; *** Application titles
SetupAppTitle=Paigaldaja
SetupWindowTitle=%1 paigaldamine
UninstallAppTitle=Kustutamine
UninstallAppFullTitle=%1 kustutamine

; *** Misc. common
InformationTitle=Informatsioon
ConfirmTitle=Kinnitus
ErrorTitle=Viga

; *** SetupLdr messages
SetupLdrStartupMessage=%1 paigaldatakse. Kas te soovite jätkata?
LdrCannotCreateTemp=Ei suutnud tekitada ajutist faili. Paigaldamine katkestati
LdrCannotExecTemp=Ei suutnud käivitada faili ajutises kataloogis. Paigaldamine katkestati

; *** Startup error messages
LastErrorMessage=%1.%n%nViga %2: %3
SetupFileMissing=Fail %1 puudub paigaldamise kaustast. Palun parandage see viga või leidke uus versioon programmist.
SetupFileCorrupt=Paigaldaja failid on rikutud. Palun laadige paigaldaja uuesti alla.
SetupFileCorruptOrWrongVer=Paigaldaja failid on rikutud või ei tööta selle paigaldaja versiooniga. Palun parandage see viga või leidke uus versioon programmist.
NotOnThisPlatform=%1 - programm ei tööta sellel platvormil.
OnlyOnThisPlatform=%1 - programm töötab ainult sellel platvormil.
OnlyOnTheseArchitectures=Seda programmi saab installida ainult Windowsi versioonidel, mis on mõeldud järgmistele protsessori arhitektuuridele:%n%n%1
MissingWOW64APIs=Teie poolt kasutatava Windowsi versioon ei sisalda Paigaldamise poolt vajatud funktsionaalsust 64-bit paigaldamisteks. Selle probleemi parandamiseks installige Service Pack %1.
WinVersionTooLowError=Programmi töötamiseks on vaja %1 versiooni %2 või uuemat.
WinVersionTooHighError=Seda programmi ei saa paigaldada %1 versioon %2 või uuemale.
AdminPrivilegesRequired=Te peate administraatorina sisse logima, et seda programmi paigaldada.
PowerUserPrivilegesRequired=Te peate administraatorina või "Power userina" sisse logima, et seda programmi paigaldada.
SetupAppRunningError=%1 töötab hetkel.%n%nPalun pange programm kinni, jätkamiseks vajutage OK, katkestamiseks Cancel.
UninstallAppRunningError=%1 töötab hetkel.%n%nPalun pange programm kinni, jätkamiseks vajutage OK, katkestamiseks Cancel.

; *** Misc. errors
ErrorCreatingDir=Paigaldaja ei suutnud teha kataloogi "%1"
ErrorTooManyFilesInDir=Ei suutnud lisada faili kataloogi "%1", seal on juba liiga palju faile

; *** Setup common messages
ExitSetupTitle=Väljuge paigaldajast
ExitSetupMessage=Paigaldamine pole valmis. Kui te praegu väljute, siis programmi ei paigaldata.%n%nPaigaldamise lõpetamiseks võite te paigaldaja mõni teine kord uuesti käivitada.%n%nVäljute paigaldajast?
AboutSetupMenuItem=&Paigaldajast...
AboutSetupTitle=Paigaldajast
AboutSetupMessage=%1 versioon %2%n%3%n%n%1 koduleht:%n%4
AboutSetupNote=

; *** Buttons
TranslatorNote=
ButtonBack=< &Tagasi
ButtonNext=&Edasi >
ButtonInstall=&Paigalda
ButtonOK=Sobib
ButtonCancel=Loobu
ButtonYes=&Jah
ButtonYesToAll=Jah &kõigile
ButtonNo=&Ei
ButtonNoToAll=E&i kõigile
ButtonFinish=&Lõpeta
ButtonBrowse=&Sirvi...

; *** "Select Language" dialog messages
ButtonWizardBrowse=Si&rvi...
ButtonNewFolder=&Loo uus kaust
SelectLanguageTitle=Valige paigaldaja keel
SelectLanguageLabel=Valige paigaldamise keel:

; *** Common wizard text
ClickNext=Jätkamiseks vajutage Edasi, katkestamiseks Loobu.
BeveledLabel=

; *** "Welcome" wizard page
BrowseDialogTitle=Sirvi kausta
BrowseDialogLabel=Valige listist kaust ja klikkige OK.
NewFolderName=Uus kaust
WelcomeLabel1=[name]  paigaldaja
WelcomeLabel2=Nüüd paigaldatakse [name/ver] teie arvutisse.%n%nEnne jätkamist on soovitatav sulgeda kõik programmid.

; *** "Password" wizard page
WizardPassword=Salasõna
PasswordLabel1=See paigaldaja on kaitstud salasõnaga.
PasswordLabel3=Palun sisestage salasõna ja vajutage Edasi. Salasõnad on tõstutundlikud.
PasswordEditLabel=&Salasõna:
IncorrectPassword=Sisestatud salasõna on vale. Palun proovige uuesti.

; *** "License Agreement" wizard page
WizardLicense=Kasutamistingimused
LicenseLabel=Palun lugege see oluline informatsioon läbi enne kui jätkate.
LicenseLabel3=Palun lugege kasutamistingimusi. Te peate nendega nõustuma enne kui paigaldaja saab jätkata.
LicenseAccepted=Ma &nõustun tingimustega
LicenseNotAccepted=Ma &ei nõustu tingimustega

; *** "Information" wizard pages
WizardInfoBefore=Informatsioon
InfoBeforeLabel=Palun lugege see oluline informatsioon läbi enne kui jätkate.
InfoBeforeClickLabel=Kui olete valmis, vajutage Edasi.
WizardInfoAfter=Informatsioon
InfoAfterLabel=Palun lugege see oluline informatsioon läbi enne kui jätkate.
InfoAfterClickLabel=Kui olete valmis, vajutage Edasi.

; *** "User Information" wizard page
WizardUserInfo=Informatsioon kasutaja kohta
UserInfoDesc=Palun sisestage oma andmed.
UserInfoName=&Kasutajanimi:
UserInfoOrg=&Organisatsioon:
UserInfoSerial=&Seeria number:
UserInfoNameRequired=Te peate nime sisestama.

; *** "Select Destination Directory" wizard page
WizardSelectDir=Valige programmile kaust
SelectDirDesc=Kuhu [name] paigaldada?
SelectDirLabel3=Paigaldaja installib [name] järgnevasse kausta.
SelectDirBrowseLabel=Jätkamiseks kliki Järgmine. Kui soovite valida teise kausta, klikkige Sirvi.
DiskSpaceMBLabel=Programm vajab vähemalt [mb] MB kõvakettaruumi.
ToUNCPathname=Paigaldaja ei saa paigaldada UNC kataloogi. Kui te üritate programmi võrku paigaldada, siis peate võrguketta enne määrama.
InvalidPath=Te peate sisestama täis tee koos ketta nimega;
InvalidDrive=Ketas või UNC share mille valisite, ei eksisteeri või pole ligipääsetav. Palun valige mõni teine.
DiskSpaceWarningTitle=Liiga vähe ruumi kõvakettal
DiskSpaceWarning=Paigaldamiseks on vaja vähemalt %1 KB kõvakettaruumi, aga kettal on vaba ainult %2 KB.%n%nKas te soovite sellegipoolest jätkata?
DirNameTooLong=Kausta nimi või teerada on liiga pikk
InvalidDirName=Kausta nimi on vigane.
BadDirName32=Kausta nimed ei tohi sisaldada järgmisi märke:%n%n%1
DirExistsTitle=Kaust on olemas
DirExists=Kaust:%n%n%1%n%non juba olemas. Kas Te soovite sellegipoolest sinna paigaldada?
DirDoesntExistTitle=Kausta pole
DirDoesntExist=Kausta:%n%n%1%n%npole. Kas te tahate, et see kaust luuakse?

; *** "Select Components" wizard page
WizardSelectComponents=valige komponendid
SelectComponentsDesc=Missugused komponendid paigaldada?
SelectComponentsLabel2=Valige komponendid, mida paigaldada; kustutage komponendid, mida Te ei soovi paigaldada. Kui valmis olete, vajutage edasi.
FullInstallation=Täielik paigaldamine
; if possible don't translate 'Compact' as 'Minimal' (I mean 'Minimal' in your language)
CompactInstallation=Kompaktne paigaldamine
CustomInstallation=Kohandatud paigaldamine
NoUninstallWarningTitle=Komponendid eksisteerivad
NoUninstallWarning=paigaldaja avastas, et järgmised komponendid on juba olemas Teie arvutis:%n%n%1%n%nNende mittevalimine ei kustuta neid.%n%nKas Te soovite sellegipoolest jätkata?
ComponentSize1=%1 KB
ComponentSize2=%1 MB
ComponentsDiskSpaceMBLabel=Praegu valitud komponentidele on vaja [mb] MB kettaruumi.

; *** "Select Additional Tasks" wizard page
WizardSelectTasks=Valige täiendavad ülesanded
SelectTasksDesc=Millised täiendavad ülesanded täita?
SelectTasksLabel2=Valige millised täiendavad ülesanded [name] paigaldaja peab täitma ja vajutage Edasi.

; *** "Select Start Menu Folder" wizard page
WizardSelectProgramGroup=Valige Start menüü kaust
SelectStartMenuFolderDesc=Kuhu luua programmi otseteed?
SelectStartMenuFolderLabel3=Paigaldaja loob programmi lühiteed järgnevasse Start Menüü kausta.
SelectStartMenuFolderBrowseLabel=Jätkamiseks kliki Järgmine. Kui soovite valida teise kausta, klikkige Sirvi.
MustEnterGroupName=Te peate sisestama kausta nime.
GroupNameTooLong=Kausta nimi või teerada on liiga pikk.
InvalidGroupName=Kausta nimi on vigane.
BadGroupName=Kausta nimi ei tohi sisaldada järgmiseid märke:%n%n%1
NoProgramGroupCheck2=&Ära loo Start menüü kausta

; *** "Ready to Install" wizard page
WizardReady=Valmis paigaldama
ReadyLabel1=Paigaldaja on valmis paigaldama [name] Teie arvutisse.
ReadyLabel2a=Lõpetamiseks vajutage Paigalda.
ReadyLabel2b=Jätkamiseks vajutage Paigalda.
ReadyMemoUserInfo=Kasutaja informatsioon:
ReadyMemoDir=Sihtkaust:
ReadyMemoType=paigaldamise tüüp:
ReadyMemoComponents=Valitud komponendid:
ReadyMemoGroup=Start Menüü kaust:
ReadyMemoTasks=Lisaülesanded:

; *** "Preparing to Install" wizard page
WizardPreparing=Paigaldamiseks valmistumine
PreparingDesc=Paigaldaja valmistub paigaldama [name] sinu arvutisse.
PreviousInstallNotCompleted=Eelmise programmi paigaldamine/kustutamine ei olnud lõpetanud. Te peate arvuti restartima ja lõpetama selle paigaldamise.%n%nPärast restarti käivitage [name] Paigaldaja uuesti.
CannotContinue=Paigaldaja ei saa jätkata. Väljumiseks vajutage Loobu.

; *** "Installing" wizard page
WizardInstalling=Paigaldamine
InstallingLabel=Palun oodake kuni [name] paigaldatakse Teie arvutisse.

; *** "Setup Completed" wizard page
FinishedHeadingLabel=[name] paigaldamise lõpetamine
FinishedLabelNoIcons=[name] paigaldamine on lõpetatud.
FinishedLabel=[name] paigaldamine on lõpetatud. Programmi saab käivitada klikkides mõnd tekitatud ikooni.
ClickFinish=Väljumiseks vajutage Lõpeta.
FinishedRestartLabel=[name] paigaldamise lõpetamiseks peab arvuti restartima, kas Te soovite kohe restartida?
FinishedRestartMessage=[name] paigaldamise lõpetamiseks peab arvuti restartima, %n%nkas Te soovite kohe restartida?
ShowReadmeCheck=Jah, ma sooviksin näha Readme faili
YesRadio=&Jah, soovin arvuti nüüd restartida
NoRadio=&Ei, ma soovin arvuti hiljem restartida
; used for example as 'Run MyProg.exe'
RunEntryExec=Käivita %1
; used for example as 'View Readme.txt'
RunEntryShellExec=Vaata %1

; *** "Setup Needs the Next Disk" stuff
ChangeDiskTitle=Paigaldaja vajab järgmist diski
SelectDiskLabel2=Palun sisesta disk %1 ja kliki OK.%n%nKui diskil olevad failid on olemas ka kuskil mujal, sisesta õige asukoht või kliki Sirvi.
PathLabel=&Asukoht:
FileNotInDir2=Faili "%1" ei suudetud leida asukohas "%2". Palun sisesta õige disk või vali teine kaust.
SelectDirectoryLabel=Palun täpsusta asukoht järgneval diskil.

; *** Installation phase messages
SetupAborted=Paigaldamist ei lõpetetud.%n%nPalun parandage viga ja käivitage paigaldaja uuesti.
EntryAbortRetryIgnore=Uuesti proovimiseks vajutage Retry, jätkamiseks Ignore või lõpetamisks Loobu.

; *** Installation status messages
StatusCreateDirs=Kaustade loomine...
StatusExtractFiles=Failide lahtipakkimine...
StatusCreateIcons=Otseteede loomine...
StatusCreateIniEntries=INI sisendite loomine...
StatusCreateRegistryEntries=Registrisse lisamine...
StatusRegisterFiles=Failide registreerimine...
StatusSavingUninstall=Info salvestamise kustutamiseks...
StatusRunProgram=Paigaldamise lõpetamine...
StatusRollback=Tehtud muudatuste kustutamine...

; *** Misc. errors
ErrorInternal2=Sisemine viga: %1
ErrorFunctionFailedNoCode=%1 luhtus
ErrorFunctionFailed=%1 luhtus; code %2
ErrorFunctionFailedWithMessage=%1 luhtus; code %2.%n%3
ErrorExecutingProgram=Ei saanud käivitada faili:%n%1

; *** Registry errors
ErrorRegOpenKey=Ei saanud avada regirty võtit:%n%1\%2
ErrorRegCreateKey=Ei saanud luua regirty võtit:%n%1\%2
ErrorRegWriteKey=Ei saanud kirjutada regirty võtit:%n%1\%2

; *** INI errors
ErrorIniEntry=Viga INI sisestuse tekitamisel failis "%1".

; *** File copying errors
FileAbortRetryIgnore=Uuesti proovimiseks vajutage Retry, faili vahelejätmiseks Ignore (ei soovita) või lõpetamiseks Abort.
FileAbortRetryIgnore2=Uuesti proovimiseks vajutage Retry, faili vahelejätmiseks Ignore (ei soovita) või lõpetamiseks Abort.
SourceIsCorrupted=Fail on rikutud
SourceDoesntExist=Faili "%1" ei eksisteeri
ExistingFileReadOnly=Fail on märgitud Read only.%n%nRead only atribuudi kustutamiseks vajutage Retry, faili vahelejätmiseks Ignore (ei soovita) või lõpetamiseks Abort
ErrorReadingExistingDest=Faili lugemisel tekkis viga:
FileExists=Fail on olemas.%n%nKas soovite, et paigaldaja selle üle kirjutaks?
ExistingFileNewer=Olemasolev fail on uuem kui see, mida paigaldaja üritab paigaldada. Soovitatav on olemasolev fail alles hoida.%n%nSoovite olemasoleva faili alles hoida?
ErrorChangingAttr=Faili atribuutide muutmisel ilmnes viga:
ErrorCreatingTemp=Faili loomisek sihtkataloogi ilmnes viga:
ErrorReadingSource=Faili lugemisel ilmnes viga:
ErrorCopying=Faili kopeerimisel ilmnes viga:
ErrorReplacingExistingFile=Olemasoleva faili asendamisel ilmnes viga:
ErrorRestartReplace=Faili asendamine peale restarti ei õnnestunud:
ErrorRenamingTemp=Faili nime muutmisel sihtkataloogis ilmnes viga:
ErrorRegisterServer=Ei saa registreerida DLL/OCX: %1
ErrorRegisterServerMissingExport=DllRegisterServer eksporti ei leitud
ErrorRegisterTypeLib=Võimatu registreerida library tüüpi: %1

; *** Post-installation errors
ErrorOpeningReadme=Readme faili avamisel ilmnes viga.
ErrorRestartingComputer=Paigaldaja ei suutnud arvutit restartida. Palun tehke seda käsitsi.

; *** Uninstaller messages
UninstallNotFound=Faili"%1" ei ole olemas. Ei saa kustutada.
UninstallOpenError=Faili"%1" ei saa avada. Ei saa kustutada.
UninstallUnsupportedVer=Kustutamise logi faili "%1" formaat on tundmatu. Ei saa kustutada
UninstallUnknownEntry=Tundmatu sisend (%1) leiti kustutaja logist
ConfirmUninstall=Olete kindel, et soovite kustutada %1 ja kõik tema komponendid?
UninstallOnlyOnWin64=Paigaldamine on eemaldatav ainult 64-bit Windowsitel.
OnlyAdminCanUninstall=Selle programmi saab kustutada ainult Teie arvuti administraator.
UninstallStatusLabel=Palun oodake kuni %1 kustutatakse.
UninstalledAll=%1 kustutamine õnnestus.
UninstalledMost=%1 kustutamine õnnestus.%n%nMõned failid jäid kustutamata. Need võib käsitsi kustutada.
UninstalledAndNeedsRestart=%1 kustutamise lõpetamiseks peab arvuti restartima.%n%nSoovite kohe restartida?
UninstallDataCorrupted="%1" fail on rikutud. Ei saa ksututada

; *** Uninstallation phase messages
ConfirmDeleteSharedFileTitle=Kustutada jagatud fail?
ConfirmDeleteSharedFile2=Süsteem kinnitab, et jagatud faili ei kasuta ükski teine programm. Kas te soovite, et kustutaja selle kustutaks?%n%nKui mõni programm seda siiski veel kasutab, siis ei pruugi ta enam korralikult töötada. Kui Te pole kindel, valige Ei. Faili allesjätmine ei tekita probleeme, kustutamine võib aga tekitada.
SharedFileNameLabel=Faili nimi:
SharedFileLocationLabel=Asukoht:
WizardUninstalling=Kustutamise staatus
StatusUninstalling=%1 - kustutan
[CustomMessages]
NameAndVersion=%1 versioon %2.
AdditionalIcons=Täiendavad ikoonid:
CreateDesktopIcon=Loo &töölaua ikoon
CreateQuickLaunchIcon=Loo &kiirkäivituse ikoon
ProgramOnTheWeb=% veebis.
UninstallProgram=Eemalda %1
LaunchProgram=Käivita %1
AssocFileExtension=&Seosta %1 faili %2 laiendiga.
AssocingFileExtension=Seostan %1 faili %2 laiendiga...
