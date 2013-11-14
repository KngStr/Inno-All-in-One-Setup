; *** Inno Setup version 5.1.0+ Albanian messages *** - translated by Flakron Bytyqi 
; email : flakron_19@yahoo.com
;
; To download user-contributed translations of this file, go to:
;   http://www.jrsoftware.org/is3rdparty.php
;
; Note: When translating this text, do not add periods (.) to the end of
; messages that didn't have them already, because on those messages Inno
; Setup adds the periods automatically (appending a period would result in
; two periods being displayed).

[LangOptions]
; The following three entries are very important. Be sure to read and 
; understand the '[LangOptions] section' topic in the help file.
LanguageName=Albanian
LanguageID=$041c
LanguageCodePage=0
; If the language you are translating to requires special font faces or
; sizes, uncomment any of the following entries and change them accordingly.
;DialogFontName=
;DialogFontSize=8
;WelcomeFontName=Verdana
;WelcomeFontSize=12
;TitleFontName=Arial
;TitleFontSize=29
;CopyrightFontName=Arial
;CopyrightFontSize=8

[Messages]

; *** Application titles
SetupAppTitle=Instalimi
SetupWindowTitle=Instalimi i - %1
UninstallAppTitle=Uninstalimi
UninstallAppFullTitle=Uninstalimi i %1

; *** Misc. common
InformationTitle=Informacion
ConfirmTitle=Konfirmo
ErrorTitle=Gabim

; *** SetupLdr messages
SetupLdrStartupMessage=Kjo do të instaloj %1. A dëshiron të vazhdosh?
LdrCannotCreateTemp=Nuk mund të krijohej një fajll i përkohshëm. Instalimi u ndal
LdrCannotExecTemp=Nuk mund të ekzekutohej një fajll në direktoriumin e përkohshem. Instalimi u ndal

; *** Startup error messages
LastErrorMessage=%1.%n%nGabim %2: %3
SetupFileMissing=Fajlli %1 po mungon prej direktoriumit instalues. Ju lutem rregollone problemin ose merrni një kopje të re të programit.
SetupFileCorrupt=Fajllat instalues janë të korruptuar. Ju lutem merrni një kopje të re të programit.
SetupFileCorruptOrWrongVer=Fajllat instalues janë të korruptuar, ose janë inkompaktibil me këtë verzion të instaluesit. Ju lutem rregullone problemin ose merrni një kopje të re të programit.
NotOnThisPlatform=Ky program nuk do të punoj në %1.
OnlyOnThisPlatform=Ky program duhet të punoj në  %1.
OnlyOnTheseArchitectures=Ky program mund të instalohet vetëm në verzionet e Windows të dizajnuara për këtë arkitekturë të procesorëve:%n%n%1
MissingWOW64APIs=Ky verzion i Windows që po e përdorni nuk i kryen funksionet që i kërkon Instalimi për të bërë Instalim 64-bitësh. Për ta rregulluar këtë problem, ju lutem instalone Service Pack %1.
WinVersionTooLowError=Këti programi i nevojitet %1 verzioni %2 ose mëtej.
WinVersionTooHighError=Ky program nuk mund të instalohet në %1 verzioni %2 ose mëtej.
AdminPrivilegesRequired=Ju duhet të jeni Administrator që ta instaloni këtë program.
PowerUserPrivilegesRequired=Ju duhet të jeni Administrator ose Power User për ta instaluar këtë program.
SetupAppRunningError=Instalimi ka detektuar që %1 momentalisht është duke punuar.%n%nJu lutem ndalni të gjitha punët, pastaj klikoni Mirë që të vazhdoni, ose Anulo që ta ndalni Instalimin.
UninstallAppRunningError=Instalimi ka detektuar që %1 momentalisht është duke punuar.%n%nJu lutem ndalni të gjitha punët, pastaj klikoni Mirë që të vazhdoni, ose Anulo që ta ndalni Instalimin.

; *** Misc. errors
ErrorCreatingDir=Instalimi nuk mundi të krijoi direktoriumin "%1"
ErrorTooManyFilesInDir=E pamundur të krijohet fajlli në direktoriumin "%1" sepse ka shumë fajlla në të

; *** Setup common messages
ExitSetupTitle=Ndale Instalimin
ExitSetupMessage=Instalimi nuk është kompletuar. Në qoftë se e ndalni tani, programi nuk do të instalohet.%n%nJu mundeni tjera herë ta lëshoni instalimin që ta përfundoni instalimin.%n%nTë ndalet Instalimi?
AboutSetupMenuItem=&Për Instalimin...
AboutSetupTitle=Për Instalimin
AboutSetupMessage=%1 verzioni %2%n%3%n%n%1 web faqja:%n%4
AboutSetupNote=
TranslatorNote= Translated from Flakron Bytyqi (flakron_19@yahoo.com)

; *** Buttons
ButtonBack=< &Prapa
ButtonNext=&Vazhdo >
ButtonInstall=&Instalo
ButtonOK=Mirë
ButtonCancel=Anulo
ButtonYes=&Po
ButtonYesToAll=PO të &gjithave
ButtonNo=&Jo
ButtonNoToAll=J&O të gjithave
ButtonFinish=&Përfundo
ButtonBrowse=&Lokalizo...
ButtonWizardBrowse=L&okalizo...
ButtonNewFolder=&Krijo follder të ri

; *** "Select Language" dialog messages
SelectLanguageTitle=Zgjedhe gjuhën e instalimit
SelectLanguageLabel=Zgjedhe gjuhën që do të përdoret gjatë instalimit:

; *** Common wizard text
ClickNext=Kliko Vazhdo për të vazhduar, ose Anulo për ta ndalur Instalimin.
BeveledLabel=
BrowseDialogTitle=Lokalizo për follderin
BrowseDialogLabel=Zgjedhe follderin në këtë listë, pastaj kliko Mirë.
NewFolderName=Follderi i ri

; *** "Welcome" wizard page
WelcomeLabel1=Mirë se vini në Magjistarin e Instalimit të [name]
WelcomeLabel2=Kjo do të instaloj [name/ver] në kompjuterin tënd.%n%nËshtë e rekomanduar që t'i mbyllni të gjtiha programet para se të vazhdoni.

; *** "Password" wizard page
WizardPassword=Fjalëkalimi
PasswordLabel1=Ky Instalim është i mbrojtur me Fjalëkalim.
PasswordLabel3=Ju lutem shkruane fjalëkalimin, pastaj klikoni Vazhdo për të vazhduar. Fjalëkalimet janë të ndijshme ndaj madhësisë së shkronjave (p.sh. A dhe a).
PasswordEditLabel=&Fjalëkalimi:
IncorrectPassword=Fjalëkalimin që e dhatë nuk është korrekt. Ju lutem provoni përsëri.

; *** "License Agreement" wizard page
WizardLicense=Liçenca
LicenseLabel=Ju lutem lexoni këto informacione të rëndësishme para se të vazhdoni.
LicenseLabel3=Ju lutem lexone këtë Liçencë. Ju duhet të pajtoheni me kushtet e Liçencës para se të vazhdoni me instalimin.
LicenseAccepted=Unë e &pranoj Liçencën
LicenseNotAccepted=Unë &nuk e pranoj Liçencën

; *** "Information" wizard pages
WizardInfoBefore=Informacion
InfoBeforeLabel=Ju lutem lexoni këto informacione të rëndësishme para se të vazhdoni.
InfoBeforeClickLabel=Kur të jeni të gatshëm me Instalimin, kliko Vazhdo.
WizardInfoAfter=Informacion
InfoAfterLabel=Ju lutem lexoni këto informacione të rëndësishme para se të vazhdoni.
InfoAfterClickLabel=Kur të jeni të gatshëm me Instalimin, kliko Vazhdo.

; *** "User Information" wizard page
WizardUserInfo=Informacionet e përdoruesit
UserInfoDesc=Ju lutem shkruani informacionet tuaja.
UserInfoName=&Emri i përdoruesit:
UserInfoOrg=&Organizata:
UserInfoSerial=&Numri serial:
UserInfoNameRequired=Ju duhet të shkruani një emër.

; *** "Select Destination Location" wizard page
WizardSelectDir=Zgjedhe destinacionin
SelectDirDesc=Ku duhet [name] të instalohet?
SelectDirLabel3=Instalimi do të instaloj [name] në këtë follder.
SelectDirBrowseLabel=Që të vazhdosh, kliko Vazhdo. Nëse dëshiron të zgjedhësh një follder tjetër, kliko Lokalizo.
DiskSpaceMBLabel=Së paku [mb] MB të lirë të diskut nevojiten.
ToUNCPathname=Instalimi nuk mund të instaloj në një UNC shteg. Nëse jeni duke u munduar që të instaloni në një rrjetë, juve ju duhet një hartë e diskut të rrjetës.
InvalidPath=Ju duhet ta shkruani tërë shtegun me shkronjën e diskut; p.sh:%n%nC:\APP%n%nose një UNC shteg në formën:%n%n\\server\share
InvalidDrive=Disku ose UNC e ndarë e zgjedhur nga ju, nuk ekziston ose nuk është e arritshme. Ju lutem zgjedheni një tjetër.
DiskSpaceWarningTitle=Nuk ka mjaft hapësirë në disk
DiskSpaceWarning=Instalimit i duhen së paku %1 KB të hapësirës së lirë që të instaloj, por disku i zgjedhur ka vetëm %2 KB në dispozicion.%n%nA dëshironi të vazhdoni edhe ashtu?
DirNameTooLong=Emri i follderit ose shtegut është shumë i gjatë.
InvalidDirName=Emri i follderit nuk është valid.
BadDirName32=Emri i follderit nuk mund të ketë asnjërën nga këto karaktere:%n%n%1
DirExistsTitle=Follderi ekziston
DirExists=Follderi:%n%n%1%n%ntanimë ekziston. A dëshironi edhe ashtu të instaloni në atë follder?
DirDoesntExistTitle=Follderi nuk ekziston
DirDoesntExist=Follderi:%n%n%1%n%nnuk ekziston. A dëshironi që follderi të krijohet?

; *** "Select Components" wizard page
WizardSelectComponents=Zgjedhi komponentet
SelectComponentsDesc=Cilat komponente duhet të instalohen?
SelectComponentsLabel2=Zgjedhi komponentet që dëshironi të instalohen; pastroj komponentet që nuk dëshironi të instalohen. Kliko Vazhdo kur të jeni gati të vazhdoni.
FullInstallation=Instalimi i plotë
; if possible don't translate 'Compact' as 'Minimal' (I mean 'Minimal' in your language)
CompactInstallation=Instalimi kompakt
CustomInstallation=Instalimi profesional
NoUninstallWarningTitle=Komponenta ekziston
NoUninstallWarning=Instalimi ka detektuar që këta komponenta tashmë janë të instaluar në kompjuterin tuaj:%n%n%1%n%nMoszgjedhja e tyre nuk do t'i uninstaloj ato.%n%nA dëshironi edhe ashtu të vazhdoni?
ComponentSize1=%1 KB
ComponentSize2=%1 MB
ComponentsDiskSpaceMBLabel=Zgjedhjes aktuale i nevojiten se paku [mb] MB të hapësirës së lirë të diskut.

; *** "Select Additional Tasks" wizard page
WizardSelectTasks=Zgjedhi punët shtesë
SelectTasksDesc=Cilat punët shtesë duhet të bëhen?
SelectTasksLabel2=Zgjedhi punët të cilat dëshiron që Instalimi t'i bëjë gjatë instalimit të [name], pastaj kliko Vazhdo.

; *** "Select Start Menu Folder" wizard page
WizardSelectProgramGroup=Zgjedhe follderin e menus Start
SelectStartMenuFolderDesc=Ku duhet Instalimi t'i vendos shkurtesat e programit?
SelectStartMenuFolderLabel3=Instalimi do t'i vendos shkrutesat në follderin vijues të menus Start.
SelectStartMenuFolderBrowseLabel=Që të vazhdosh, kliko Vazhdo. Nëse dëshiron të zgjedhësh një follder tjetër, kliko Lokalizo.
MustEnterGroupName=Ju duhet ta shkruani emrin e follderit.
GroupNameTooLong=Shtegu ose emri i follderit është shumë i gjatë.
InvalidGroupName=Emri i follderit nuk është valid.
BadGroupName=Emri i follderit nuk mund t'i ketë karakteret vijuese:%n%n%1
NoProgramGroupCheck2=&Mos krijo follder në menun Start

; *** "Ready to Install" wizard page
WizardReady=I gatshëm për të instaluar
ReadyLabel1=Instalimi është i gatshëm që ta instaloj [name] në komjuterin tuaj.
ReadyLabel2a=Kliko Instalo që të vazhdosh me instalimin, ose kliko Prapa nëse dëshiron t'i ndryshosh vendimet tuaja.
ReadyLabel2b=Kliko Instalo që të vazhdosh me instalimin.
ReadyMemoUserInfo=Informacione të përdoruesit:
ReadyMemoDir=Destinacioni:
ReadyMemoType=Lloji i instalimit:
ReadyMemoComponents=Zgjedhi komponentet:
ReadyMemoGroup=Follderi i menus Start:
ReadyMemoTasks=Punët shtesë:

; *** "Preparing to Install" wizard page
WizardPreparing=Duke u pregaditur për të instaluar
PreparingDesc=Instalimi është duke u pregaditur që të instaloj [name] në kompjuterin tuaj.
PreviousInstallNotCompleted=Instalimi/Uninstalimi i një programi nuk është mbaruar. Ju duhet ta ristartoni kompjuterin tuaj që të përfundohet ai instalim.%n%nPas ristartimit të kompjuterit tuaj, lëshone Instalimin që të kompletohet instalimi i [name].
CannotContinue=Instalimi nuk mund të vazhdoj. Ju lutem klikoni Anulo që të dilni nga programi.

; *** "Installing" wizard page
WizardInstalling=Duke instaluar
InstallingLabel=ju lutem pritni derisa Instalimi ta instaloj [name] në kompjuterin tuaj.

; *** "Setup Completed" wizard page
FinishedHeadingLabel=Duke kompletuar [name] Magjistarin Instalimi
FinishedLabelNoIcons=Instalimi ka përfunduar instalimin e [name] në kompjuterin tuaj.
FinishedLabel=Instalimi ka përfunduar instalimin e [name] në kompjuterin tuaj. Aplikacioni mund të lëshohet duke i zgjedhur ikonat e instaluar.
ClickFinish=Kliko Përfundo që të dalësh nga Instalimi.
FinishedRestartLabel=Që të përfundoj instalimi i [name], Instalimi duhet ta ristartoj kompjuterin tuaj. A dëshironi ta ristartorni kompjuterin tani?
FinishedRestartMessage=Që të kompletohet instalimi i [name], Instalimi duhet ta ristartoj kompjuterin tuaj.%n%nA dëshironi ta ristartoni kompjuterin tani?
ShowReadmeCheck=Po, dua ta shoh fajllin MË LEXO
YesRadio=&Po, ristartoje kompjuterin tani
NoRadio=&Jo, do ta ristartoj kompjuterin më vonë
; used for example as 'Run MyProg.exe'
RunEntryExec=Lësho %1
; used for example as 'View Readme.txt'
RunEntryShellExec=Shiko %1

; *** "Setup Needs the Next Disk" stuff
ChangeDiskTitle=Instalimit i duhet disku tjetër
SelectDiskLabel2=Ju lutem futeni diskun %1 dhe klikoni Mirë.%n%nNëse fajllat në këtë disk mund të gjenden në një follder tjetër që nuk është paraqitur këtu, shkruane shtegun ose klikoni Lokalizo.
PathLabel=&Shtegu:
FileNotInDir2=Fajlli "%1" nuk është gjetur në "%2". Ju lutem futeni diskun e duhur ose zgjedhne një follder tjetër.
SelectDirectoryLabel=Ju lutem specifikone lokaconin e diskut tjetër.

; *** Installation phase messages
SetupAborted=Instalimi nuk është përfunduar.%n%nJu lutem rregullone problemin dhe lëshone Instalimin përsëri.
EntryAbortRetryIgnore=Kliko Riprovo që të provosh përsëri, Injoro që të vazhdosh edhe ashtu, ose Ndërpreje që ta ndalësh instalimin.

; *** Installation status messages
StatusCreateDirs=Duke i krujuar direktoriumet...
StatusExtractFiles=Duke i ekstraktuar fajllat...
StatusCreateIcons=Duke i krijuar shkrutesat...
StatusCreateIniEntries=Duke i krijuar hyrjet INI...
StatusCreateRegistryEntries=Duke i krjuar hyrjet e regjistrit...
StatusRegisterFiles=Duke i regjistruar fajllat...
StatusSavingUninstall=Duke ruajtur informacione të uninstalimit...
StatusRunProgram=Duke e përfunduar instalimin...
StatusRollback=Duke e rikthyer gjendjen para instalimit...

; *** Misc. errors
ErrorInternal2=Gabim i brendshëm: %1
ErrorFunctionFailedNoCode=%1 dështoi
ErrorFunctionFailed=%1 dështoi; kodi %2
ErrorFunctionFailedWithMessage=%1 dështoi; kodi %2.%n%3
ErrorExecutingProgram=Nuk mund të ekzekutohej fajlli:%n%1

; *** Registry errors
ErrorRegOpenKey=Gabim gjatë hapjes së qelësit të regjistrit:%n%1\%2
ErrorRegCreateKey=Gabim gjatë krijimit të qelësit të regjistrit:%n%1\%2
ErrorRegWriteKey=Gabim gjatë shkruarjes së qelësit të regjistrit:%n%1\%2

; *** INI errors
ErrorIniEntry=Gabim duke krijuar hyrje INI në fajllin "%1".

; *** File copying errors
FileAbortRetryIgnore=Kliko Riprovo që të provosh përsëri, Injoro që të kalosh këtë fajll (nuk është e rekomanduar), ose Ndërpreje që ta ndalësh instalimin.
FileAbortRetryIgnore2=Kliko Riprovo që të provosh përsëri, Injoro që të vazhdosh edhe ashtu (nuk është e rekomanduar), ose Ndërpreje që ta ndalësh instalimin.
SourceIsCorrupted=Fajlli burimor është i korruptuar
SourceDoesntExist=Fajlli burimor "%1" nuk ekziston
ExistingFileReadOnly=Fajlli ekzistues është i shënuar si read-only.%n%nKliko Riprovo që ta largosh atributin read-only dhe të provosh përsëri, Injoro që ta kalosh këtë fajll, ose Ndërpreje që ta ndalësh instalimin.
ErrorReadingExistingDest=Një gabim ndodhi gjatë leximit të fajllit ekzistues:
FileExists=Fajlli tashmë ekziston.%n%nA dëshiron që Instalimi ta mbishkruaj?
ExistingFileNewer=Fajlli ekzistues është më i ri sesa ai që dëshiron Instalimi ta instaloj. Është e rekomanduar që ta mbani fajllin ekzistues.%n%nA dëshironi që ta mbani fajllin ekzistues?
ErrorChangingAttr=Një gabim ndodhi gjatë ndrrimit të atributeve të fajllit ekzistues:
ErrorCreatingTemp=Një gabim ndodhi gajtë krijimit të një fajlli në direktoriumin destinues:
ErrorReadingSource=Një gabim ndodhi gjatë leximit të fajllit burimor:
ErrorCopying=Një gabim ndodhi gjatë kopjimit të një fajlli:
ErrorReplacingExistingFile=Një gabim ndodhi gjatë zëvendësimit të fajllit ekzistues:
ErrorRestartReplace=RistartoZëvendëso dështoi:
ErrorRenamingTemp=Një gabim ndodhi gjatë ndërrimit të emrit të një fajlli në direktoriumin destinues:
ErrorRegisterServer=Nuk mund të regjistrohej DLL/OCX: %1
ErrorRegisterServerMissingExport=DllRegisterServer eksportimi nuk u gjet
ErrorRegisterTypeLib=Nuk mund të regjistrohej libraria: %1

; *** Post-installation errors
ErrorOpeningReadme=Një gabim ndodhi gajtë hapjes së fajllit MËLEXO.
ErrorRestartingComputer=Instalimi nuk mundi ta ristartoj kompjuterin. Ju lutem bëne këtë manualisht.

; *** Uninstaller messages
UninstallNotFound=Fajlli "%1" nuk ekziston. Nuk mund të uninstaloj.
UninstallOpenError=Fajlli "%1" nuk mund të hapej. Nuk mund të uninstaloj
UninstallUnsupportedVer=Fajlli log i uninstalimit "%1" është në format që nuk e njeh ky verzion i uninstalimit. Nuk mund të uninstaloj
UninstallUnknownEntry=Një hyrje e panjohur (%1) është gjetur në log të uninstalimit
ConfirmUninstall=A jeni i sigurt që dëshironi kompletisht ta largoni %1 dhe të gjitha komponentet e tij?
UninstallOnlyOnWin64=Ky instalim mundet vetëm të uninstalohet në verzionet 64 bit të Windows.
OnlyAdminCanUninstall=Ky instalim mund të uninstalohet vetëm nga përdoruesit me privilegje të administruese.
UninstallStatusLabel=Ju lutem prtini deri sa %1 të largohet nga kompjuteri juaj.
UninstalledAll=%1 është larguar me sukses nga kompjuteri juaj.
UninstalledMost=%1 uninstalimi u kompletua.%n%nDisa elemente nuk mund të largohen. Ato mund të largohen manualisht.
UninstalledAndNeedsRestart=Që të kompletohet uninstalimi i %1, kompjuteri juaj duhet të ristartohet.%n%nA dëshironi ta ristartoni tani?
UninstallDataCorrupted="%1" fajlli është korruptuar. Nuk mund të uninstaloj

; *** Uninstallation phase messages
ConfirmDeleteSharedFileTitle=A të largohet Fajlli i Ndarë?
ConfirmDeleteSharedFile2=Sistemi tregon që fajlli i ndarë nuk është në përdorim nga asnjë program. A dëshironi që Uninstalimi ta largoj këtë Fajll të Ndarë?%n%nNëse ka programe që e përdorin dhe fajlli largohet, programet nuk do të funksionojn si duhet. Nëse nuk jeni i sigurt, kliko Jo. Që ta leni fajllin në sistemin tuaj nuk do ta dëmtoj sistemin.
SharedFileNameLabel=Emri i fajllit:
SharedFileLocationLabel=Vendi:
WizardUninstalling=Statusi i uninstalimit
StatusUninstalling=Duke uninstaluar %1...

; The custom messages below aren't used by Setup itself, but if you make
; use of them in your scripts, you'll want to translate them.

[CustomMessages]

NameAndVersion=%1 verzioni %2
AdditionalIcons=Ikonat shtesë:
CreateDesktopIcon=Krijo një &ikon në dektop
CreateQuickLaunchIcon=Krijo një ikon në &Quick Launch
ProgramOnTheWeb=%1 në internet
UninstallProgram=Uninstalo %1
LaunchProgram=Lësho %1
AssocFileExtension=&Lidhe %1 me %2 ekstensionet e fajllave
AssocingFileExtension=Duke e lidhur %1 me %2 ekstensionet e fajllave...
