; *** Inno Setup version 5.1.0+ Romanian messages (with diacrytics) ***
;
; Romanian translation:
; Perde Marius
; contact: emarius89@gmail.com
;
;
; $jrsoftware: issrc/Files/Default.isl,v 1.58 2004/04/07 20:17:13 jr Exp $

[LangOptions]
LanguageName=Romanian
LanguageID=$0418
LanguageCodePage=0
; If the language you are translating to requires special font faces or
; sizes, uncomment any of the following entries and change them accordingly.
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
SetupAppTitle=Instalare
SetupWindowTitle=Instalare - %1
UninstallAppTitle=Dezinstalare
UninstallAppFullTitle=Dezinstalare %1

; *** Misc. common
InformationTitle=Info
ConfirmTitle=Confirmare
ErrorTitle=Eroare

; *** SetupLdr messages
SetupLdrStartupMessage=Acesta este programul de instalare al %1. Doriþi sã continuaþi ?
LdrCannotCreateTemp=Nu pot crea fiºierele temporare. Instalarea se va incheia aici
LdrCannotExecTemp=Nu pot executa fiºierul din directorul temporar. Instalarea se va incheia aici

; *** Startup error messages
LastErrorMessage=%1.%n%nEroare %2: %3
SetupFileMissing=Fiºierul %1 lipseste din directorul de instalare. Vã rugãm corectaþi problema sau obþineþi o nouã copie a programului.
SetupFileCorrupt=Fiºierele de instalare a programului sunt corupte. Vã rugam obþineþi o altã copie a programului.
SetupFileCorruptOrWrongVer=Fiºierele de instalare sunt corupte sau sunt incompatibile cu aceastã versiune a programului de instalare. Vã rugãm corectaþi problema sau obþineþi o nouã copie a programului.
NotOnThisPlatform=Acest program nu ruleazã sub %1.
OnlyOnThisPlatform=Acest program trebuie sã ruleze sub %1.
OnlyOnTheseArchitectures=Acest program poate fi instalat doar pe versiuni de Windows proiectate pentru urmãtoarele arhitecturi de procesoare:%n%n%1
MissingWOW64APIs=Versiunea de Windows care ruleazã nu include funcþiile necesare programului pentru instalarea pe 64 de biþi. Pentru a corecta aceastã problemã, vã rugãm sã instalaþi Service Pack %1.
WinVersionTooLowError=Acest program necesitã %1 versiunea %2 sau ulterioarã.
WinVersionTooHighError=Acest program nu poate fi instalat sub %1 versiunea %2 sau ulterioarã.
AdminPrivilegesRequired=Trebuie sã aveþi drepturi de Administrator pentru a instala acest program.
PowerUserPrivilegesRequired=Trebuie sã aveþi drepturi de Administrator sau Power User pentru a instala acest program.
SetupAppRunningError=S-a detectat cã programul %1 ruleazã.%n%nVã rugãm închideþi toate instanþele, apoi apãsaþi OK pentru a continua sau Anuleazã pentru a pãrãsi programul de instalare.
UninstallAppRunningError=S-a detectat cã programul %1 ruleazã.%n%nVã rugãm închideþi toate instanþele, apoi apãsaþi OK pentru a continua sau Anuleazã pentru a pãrãsi programul de instalare.

; *** Misc. errors
ErrorCreatingDir=Nu pot crea directorul "%1"
ErrorTooManyFilesInDir=Nu pot crea un fiºier în directorul "%1" deoarece acesta conþine prea multe fiºiere

; *** Setup common messages
ExitSetupTitle=Instalare
ExitSetupMessage=Procesul de instalare nu s-a încheiat. Dacã pãrãsiþi programul acum, aplicaþia nu se va instala.%n%nPuteþi rula ulterior programul de instalare pentru a finaliza procesul.%n%nParasiti instalarea ?
AboutSetupMenuItem=&Despre Setup...
AboutSetupTitle=Despre Setup
AboutSetupMessage=%1 versiunea %2%n%3%n%n%1 pe Internet:%n%4
AboutSetupNote=

; *** Buttons
TranslatorNote=Romanian translation:%nPerde Marius
ButtonBack=< &Înapoi
ButtonNext=&Continuã >
ButtonInstall=&Instaleazã
ButtonOK=OK
ButtonCancel=Anuleazã
ButtonYes=&Da
ButtonYesToAll=Da tot &timpul
ButtonNo=&Nu
ButtonNoToAll=N&u tot timpul
ButtonFinish=&Finalizare
ButtonBrowse=&Selecteazã...
ButtonWizardBrowse=&Selecteazã...
ButtonNewFolder=Creeazã un director &nou

; *** "Select Language" dialog messages
SelectLanguageTitle=Selectare limbã
SelectLanguageLabel=Selectaþi limba pe care doriþi sã o utilizati în timpul instalãrii:

; *** Common wizard text
ClickNext=Apãsaþi Continuã pentru pasul urmãtor sau Anuleazã pentru a pãrãsi programul.
BeveledLabel=
BrowseDialogTitle=Selectare director
BrowseDialogLabel=Selecteazã un director din lista de mai jos, apoi apasã OK.
NewFolderName=New Folder

; *** "Welcome" wizard page
WelcomeLabel1=Bine aþi venit în programul de instalare al [name].
WelcomeLabel2=Acesta va instala [name/ver] pe sistemul dumneavoastrã.%n%nEste recomandat sã închideþi toate celelalte aplicaþii care ruleazã în acest moment, înainte de a continua.

; *** "Password" wizard page
WizardPassword=Protecþie
PasswordLabel1=Aceastã instalare este protejatã de o parola.
PasswordLabel3=Vã rugãm introduceþi parola, apoi apãsaþi Continuã. Parola este case-sensitive.
PasswordEditLabel=&Parola:
IncorrectPassword=Parola introdusã este incorectã. Mai încercaþi o datã.

; *** "License Agreement" wizard page
WizardLicense=Acceptul licenþei de utilizare
LicenseLabel=Vã rugãm sã citiþi urmãtoarele informaþii înainte de a continua.
LicenseLabel3=Vã rugãm sã citiþi urmãtoarea Licenþã. Este necesar sã acceptaþi termenii acestei licenþe pentru a putea continua instalarea.
LicenseAccepted=&Accept termenii licenþei
LicenseNotAccepted=&Nu accept termenii licenþei

; *** "Information" wizard pages
WizardInfoBefore=Informaþii
InfoBeforeLabel=Vã rugãm sã citiþi aceste informaþii suplimentare înainte de a continua.
InfoBeforeClickLabel=Când sunteþi gata sã continuaþi instalarea, apãsaþi Continuã.
WizardInfoAfter=Informaþii
InfoAfterLabel=Vã rugãm sã citiþi aceste informaþii suplimentare înainte de a continua.
InfoAfterClickLabel=Când sunteþi gata sã continuaþi instalarea, apãsaþi Continuã.

; *** "User Information" wizard page
WizardUserInfo=Informaþii despre utilizator
UserInfoDesc=Vã rugãm introduceþi informaþiile despre utilizator.
UserInfoName=Nume &utilizator:
UserInfoOrg=&Organizaþie:
UserInfoSerial=Numãr &serial:
UserInfoNameRequired=Trebuie sã introduceþi numele.

; *** "Select Destination Directory" wizard page
WizardSelectDir=Selectaþi directorul destinaþie
SelectDirDesc=Unde doriþi sã instalaþi [name]?
SelectDirLabel3=Selectaþi directorul în care doriþi sã instalaþi [name], apoi apãsaþi Continuã.
SelectDirBrowseLabel=Pentru a continua, apãsaþi Continuã. Dacã doriþi sã selectaþi un alt director, apãsaþi Selecteazã.
DiskSpaceMBLabel=Acest program necesitã cel putin [mb] Mb pe disc.
ToUNCPathname=Programul nu poate fi instalat pe o cale de reþea. Dacã doriþi instalarea pe o cale de reþea, trebuie sã mapaþi calea la acea unitate de reþea.
InvalidPath=Trebuie introdusã calea completã, incluzând litera unitãþii.%n%nExemplu:%nC:\APP%n%nsau calea de reþea de forma:%n\\server\share
InvalidDrive=Unitatea selectatã nu existã sau nu este accesibilã. Vã rugãm selectaþi o altã unitate.
DiskSpaceWarningTitle=Nu existã spaþiu suficient pe disc
DiskSpaceWarning=Programul de instalare necesitã un spaþiu minim de %1 KB, dar unitatea selectatã are disponibil doar %2 KB.%n%nDoriþi sã continuaþi ?
DirNameTooLong=Numele directorului sau calea este prea lungã.
InvalidDirName=Numele directorului nu este valid.
BadDirName32=Numele directorului nu poate conþine nici unul din urmatoarele caractere: :%n%n%1
DirExistsTitle=Director existent
DirExists=Directorul:%n%n%1%n%ndeja existã. Doriþi sã instalaþi în acest director ?
DirDoesntExistTitle=Director inexistent
DirDoesntExist=Directorul%n%n%1%n%nnu existã. Doriþi sã fie creat ?

; *** "Select Components" wizard page
WizardSelectComponents=Selectare componente
SelectComponentsDesc=Care componente ar trebui instalate ?
SelectComponentsLabel2=Selectaþi componentele care doriþi sã fie instalate; deselectaþi componentele pe care nu doriþi sã le instalaþi. Apãsaþi Continuã când sunteþi gata sã continuaþi instalarea.
FullInstallation=Instalare completã
; if possible don't translate 'Compact' as 'Minimal' (I mean 'Minimal' in your language)
CompactInstallation=Instalare compactã
CustomInstallation=Instalare personalizatã
NoUninstallWarningTitle=Componenta existã
NoUninstallWarning=S-a detectat cã urmatoarele componente sunt deja instalate în sistem:%n%n%1%n%nDeselectarea acestor componente nu va duce la dezinstalarea lor din sistem.%n%nDoriþi sã continuaþi ?
ComponentSize1=%1 KB
ComponentSize2=%1 MB
ComponentsDiskSpaceMBLabel=Selecþia curentã necesitã cel putin [mb] MB.

; *** "Select Additional Tasks" wizard page
WizardSelectTasks=Opþiuni suplimentare
SelectTasksDesc=Care opþiuni suplimentare doriþi?
SelectTasksLabel2=Selectaþi opþiunile suplimentare dorite pentru instalarea [name], apoi apãsaþi Continuã.

; *** "Select Start Menu Folder" wizard page
WizardSelectProgramGroup=Selectaþi directorul din meniul Start
SelectStartMenuFolderDesc=Unde doriþi sã adaug link-urile cãtre aplicaþie?
SelectStartMenuFolderLabel3=Programul de instalare va crea link-urile cãtre program în urmãtorul director din meniul Start.
SelectStartMenuFolderBrowseLabel=Pentru a continua, apãsaþi Continuã. Dacã doriþi sã selectaþi un alt director, apãsaþi Selecteazã.
MustEnterGroupName=Trebuie sã introduceþi numele unui director.
GroupNameTooLong=Numele directorului sau calea este prea lungã.
InvalidGroupName=Numele directorului nu este valid.
BadGroupName=Numele directorului nu poate conþine nici unul din urmãtoarele caractere:%n%n%1
NoProgramGroupCheck2=Nu crea &director în meniul Start

; *** "Ready to Install" wizard page
WizardReady=Gata de instalare
ReadyLabel1=Programul este în punctul de a începe instalarea [name] pe acest sistem.
ReadyLabel2a=Apãsaþi Instaleazã pentru a continua, sau Înapoi dacã doriþi sã revedeþi sau sã modificaþi setãrile fãcute anterior.
ReadyLabel2b=Apãsaþi Instaleazã pentru a continua.
ReadyMemoUserInfo=Informaþii utilizator:
ReadyMemoDir=Director destinaþie:
ReadyMemoType=Tipul instalãrii:
ReadyMemoComponents=Componente selectate:
ReadyMemoGroup=Director în meniu Start:
ReadyMemoTasks=Opþiuni suplimentare:

; *** "Preparing to Install" wizard page
WizardPreparing=Pregãtire instalare
PreparingDesc=Programul de instalare pregãteºte instalarea [name].
PreviousInstallNotCompleted=Instalarea / dezinstalarea versiunii anterioare a programului nu este completã. Trebuie sã restartaþi sistemul pentru a termina instalarea anterioarã.%n%nDupã restart, rulaþi încã o data programul de instalare al [name].
CannotContinue=Programul de instalare nu poate continua. Apãsaþi Anuleazã pentru a pãrãsi instalarea.

; *** "Installing" wizard page
WizardInstalling=Instalare
InstallingLabel=Vã rugãm aºteptaþi pânã când instalarea [name] ia sfarºit.

; *** "Setup Completed" wizard page
FinishedHeadingLabel=Finalizare instalare [name]
FinishedLabelNoIcons=Programul a terminat instalarea [name].
FinishedLabel=Programul a terminat instalarea [name]. Aplicaþia poate fi lansatã utilizând link-urile create.
ClickFinish=Apãsaþi Finalizare pentru a pãrãsi programul de instalare.
FinishedRestartLabel=Pentru a completa instalarea [name], sistemul dvs. trebuie restartat. Doriþi sã restartaþi acum?
FinishedRestartMessage=Pentru a completa instalarea [name], sistemul dvs. trebuie restartat. %n%nDoriþi sã restartaþi acum?
ShowReadmeCheck=Da, doresc sã citesc fisierul README
YesRadio=&Da, doresc restartarea sistemului acum
NoRadio=&Nu, voi restarta mai tarziu
; used for example as 'Run MyProg.exe'
RunEntryExec=Ruleazã %1
; used for example as 'View Readme.txt'
RunEntryShellExec=Citeºte %1

; *** "Setup Needs the Next Disk" stuff
ChangeDiskTitle=Urmãtorul disc
SelectDiskLabel2=Vã rugãm introduceþi Discul %1 ºi apãsaþi OK.%n%nDacã fiºierele de pe acest disc se aflã într-un alt director decât cel afiºat mai jos, introduceþi calea corectã sau apãsaþi Selecteazã.
PathLabel=&Cale:
FileNotInDir2=Fiºierul "%1" nu poate fi gãsit în "%2". Vã rugãm introduceþi discul corect sau selectaþi un alt director.
SelectDirectoryLabel=Vã rugãm specificaþi locaþia urmãtorului disc.

; *** Installation phase messages
SetupAborted=Programul de instalare nu s-a încheiat cu succes.%n%nVã rugãm corectaþi problema ºi porniþi instalarea din nou.
EntryAbortRetryIgnore=Apãsaþi 'Retry' pentru a încerca încã o datã, 'Ignore' pentru a trece oricum de acest pas sau 'Abort' pentru a opri instalarea.

; *** Installation status messages
StatusCreateDirs=Creare directoare ...
StatusExtractFiles=Extragere fiºiere ...
StatusCreateIcons=Creare link-uri ...
StatusCreateIniEntries=Creare intrãri INI ...
StatusCreateRegistryEntries=Creare intrãri în Registry ...
StatusRegisterFiles=Inregistrare fiºiere ...
StatusSavingUninstall=Salvare informaþii de dezinstalare ...
StatusRunProgram=Finalizare instalare ...
StatusRollback=Anulare modificãri ...

; *** Misc. errors
ErrorInternal2=Eroare internã: %1
ErrorFunctionFailedNoCode=%1 a eºuat
ErrorFunctionFailed=%1 a eºuat; cod %2
ErrorFunctionFailedWithMessage=%1 a eºuat; cod %2.%n%3
ErrorExecutingProgram=Nu pot executa:%n%1

; *** Registry errors
ErrorRegOpenKey=Eroare la deschiderea cheii din regiºtri:%n%1\%2
ErrorRegCreateKey=Eroare la crearea urmãtoarei chei în regiºtri:%n%1\%2
ErrorRegWriteKey=Eroare la scrierea urmãtoarei chei în regiºtri:%n%1\%2

; *** INI errors
ErrorIniEntry=Eroare la crearea înregistrãrilor INI în fiºierul "%1".

; *** File copying errors
FileAbortRetryIgnore=Apãsaþi 'Retry' pentru a încerca încã o datã, 'Ignore' pentru a trece peste acest fiºier (nerecomandat) sau 'Abort' pentru a opri instalarea.
FileAbortRetryIgnore2=Apãsaþi 'Retry' pentru a încerca încã o datã, 'Ignore' pentru a trece oricum de acest pas (nerecomandat) sau 'Abort' pentru a opri instalarea.
SourceIsCorrupted=Fiºierul sursã este corupt
SourceDoesntExist=Fiºierul sursã "%1" nu existã
ExistingFileReadOnly=Fiºierul existent este marcat read-only.%n%nApãsaþi 'Retry' pentru a schimba atributele fiºierului ºi a încerca încã o datã, 'Ignore' pentru a trece peste acest fiºier sau 'Abort' pentru a opri instalarea.
ErrorReadingExistingDest=A apãrut o eroare în timp ce citeam fiºierul:
FileExists=Fiºierul existã.%n%nDoriþi sã îl suprascrieþi ?
ExistingFileNewer=Fiºierul existent este mai nou decât cel care se instaleazã acum. Este recomandat sã pãstraþi fiºierul existent.%n%nDoriþi sã pãstraþi fisierul existent ?
ErrorChangingAttr=A apãrut o eroare în timp ce încercam sã modific atributele fiºierului:
ErrorCreatingTemp=A apãrut o eroare în timp ce încercam sã creez un fiºier în directorul destinaþie:
ErrorReadingSource=A apãrut o eroare în timp ce încercam sã citesc fiºierul sursã:
ErrorCopying=A apãrut o eroare în timp ce încercam sã copiez fiºierul:
ErrorReplacingExistingFile=A aparut o eroare in timp ce incercam sa inlocuiesc fisierul:
ErrorRestartReplace=Eroare înlocuire la restart:
ErrorRenamingTemp=A apãrut o eroare în timp ce încercam sã redenumesc fiºierul din directorul destinaþie:
ErrorRegisterServer=Nu pot sã înregistrez DLL/OCX: %1
ErrorRegisterServerMissingExport=Nu pot gãsi DllRegisterServer
ErrorRegisterTypeLib=Nu pot sã înregistrez tipul de librãrie: %1

; *** Post-installation errors
ErrorOpeningReadme=A apãrut o eroare la deschiderea fiºierului README.
ErrorRestartingComputer=Programul de instalare nu poate restarta sistemul. Vã rugãm sã încercaþi sã restartaþi manual sistemul.

; *** Uninstaller messages
UninstallNotFound=Fiºierul "%1" nu existã. Nu pot dezinstala.
UninstallOpenError=Fiºierul "%1" nu poate fi deschis. Nu pot dezinstala
UninstallUnsupportedVer=Fiºierul de dezinstalare "%1" are un format necunoscut acestei versiuni de program. Nu pot dezinstala
UninstallUnknownEntry=O intrare necunoscutã (%1) a fost gãsitã în fiºierul de dezinstalare
ConfirmUninstall=Doriþi sã dezinstalaþi %1 ºi componentele sale adiþionale?
UninstallOnlyOnWin64=Trebuie sã rulaþi o versiune de Windows pe 64 de biþi pentru a dezinstala acest program.
OnlyAdminCanUninstall=Trebuie sã aveþi drepturi de Administrator pentru a dezinstala acest program.
UninstallStatusLabel=Vã rugãm aºteptaþi pânã când dezinstalarea %1 ia sfarºit.
UninstalledAll=%1 a fost dezinstalat cu succes.
UninstalledMost=%1 a fost dezinstalat.%n%nUnele fiºiere nu au putut fi ºterse. Acestea pot fi ºterse manual.
UninstalledAndNeedsRestart=Pentru a termina dezinstalarea %1, sistemul trebuie restartat.%n%nDoriþi sã restartaþi sistemul acum?
UninstallDataCorrupted=Fiºierul "%1" este corupt. Nu pot dezinstala

; *** Uninstallation phase messages
ConfirmDeleteSharedFileTitle=ªtergere fiºiere 'Shared' ?
ConfirmDeleteSharedFile2=Sistemul indicã faptul cã urmãtorul fiºier nu mai este utilizat de nici un alt program. Doriþi sã ºtergeþi acest fiºier ?%n%nDacã acest fiºier este totuºi utilizat de un alt program, acesta din urmã nu va mai funcþiona corect. Dacã nu sunteþi sigur, alegeþi 'Nu'. Lãsând fiºierul pe sistem nu vã va afecta cu nimic.
SharedFileNameLabel=Nume fiºier:
SharedFileLocationLabel=Locaþie:
WizardUninstalling=Progres dezinstalare
StatusUninstalling=Dezinstalare %1...
[CustomMessages]

NameAndVersion=%1 versiunea %2
AdditionalIcons=Iconiþe adiþionale:
CreateDesktopIcon=Creeazã o iconiþã pe &desktop
CreateQuickLaunchIcon=Creeazã o iconiþã &Quick Launch
ProgramOnTheWeb=%1 pe Internet
UninstallProgram=Dezinstalare %1
LaunchProgram=Lanseazã %1
AssocFileExtension=&Asociazã %1 cu extensia de fiºiere %2
AssocingFileExtension=Asociere %1 cu extensia de fiºiere %2 ...

