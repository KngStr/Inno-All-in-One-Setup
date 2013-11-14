; *** Inno Setup version 4.2.2+ Romanian messages ***
;
;
;
; Romanian translation:
; Sorin Pohontu
; contact: sorin.pohontu@assist.ro
; http://www.frontline.ro
;
;
;
; $jrsoftware: issrc/Files/Default.isl,v 1.58 2004/04/07 20:17:13 jr Exp $

[LangOptions]
LanguageName=Romanian
LanguageID=$0418
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
SetupAppTitle= Instalare
SetupWindowTitle= Instalare - %1
UninstallAppTitle= Dezinstalare
UninstallAppFullTitle= Dezinstalare %1

; *** Misc. common
InformationTitle= Info
ConfirmTitle= Confirmare
ErrorTitle= Eroare

; *** SetupLdr messages
SetupLdrStartupMessage=Acesta este programul de instalare al %1. Doriti sa continuati ?
LdrCannotCreateTemp=Nu pot crea fisierele temporare. Instalarea se va incheia aici
LdrCannotExecTemp=Nu pot executa fisierul din directorul temporar. Instalarea se va incheia aici

; *** Startup error messages
LastErrorMessage=%1.%n%nEroare %2: %3
SetupFileMissing=Fisierul %1 lipseste din directorul de instalare. Va rugam corectati problema sau obtineti o noua copie a programului.
SetupFileCorrupt=Fisierele de instalare a programului sunt corupte. Va rugam obtineti o alta copie a programului.
SetupFileCorruptOrWrongVer=Fisierele de instalare sunt corupte sau sunt incompatibile cu aceasta versiune a programului de instalare. Va rugam corectati problema sau obtineti o noua copie a programului.
NotOnThisPlatform=Acest program nu ruleaza sub %1.
OnlyOnThisPlatform=Acest program trebuie sa ruleze sub %1.
WinVersionTooLowError=Acest program necesita %1 versiunea %2 sau ulterioara.
WinVersionTooHighError=Acest program nu poate fi instalat sub %1 versiunea %2 sau ulterioara.
AdminPrivilegesRequired=Trebuie sa aveti drepturi de Administrator pentru a instala acest program.
PowerUserPrivilegesRequired=Trebuie sa aveti drepturi de Administrator sau Power User pentru a instala acest program.
SetupAppRunningError=S-a detectat ca programul %1 ruleaza.%n%nVa rugam inchideti toate instantele, apoi apasati OK pentru a continua sau Anuleaza pentru a parasi programul de instalare.
UninstallAppRunningError=S-a detectat ca programul %1 ruleaza.%n%nVa rugam inchideti toate instantele, apoi apasati OK pentru a continua sau Anuleaza pentru a parasi programul de instalare.

; *** Misc. errors
ErrorCreatingDir=Nu pot crea directorul "%1"
ErrorTooManyFilesInDir=Nu pot crea un fisier in directorul "%1" deoarece acesta contine prea multe fisiere

; *** Setup common messages
ExitSetupTitle=Instalare
ExitSetupMessage=Procesul de instalare nu s-a incheiat. Daca parasiti programul acum, aplicatia nu se va instala.%n%nPuteti rula ulterior programul de instalare pentru a finaliza procesul.%n%nParasiti instalarea ?
AboutSetupMenuItem=&Despre Setup...
AboutSetupTitle=Despre Setup
AboutSetupMessage=%1 versiunea %2%n%3%n%n%1 pe Internet:%n%4
AboutSetupNote=Romanian translation:%nSorin Pohontu%nhttp://www.frontline.ro

; *** Buttons
ButtonBack=< &Inapoi
ButtonNext=&Continua >
ButtonInstall=&Instaleaza
ButtonOK=OK
ButtonCancel=Anuleaza
ButtonYes=&Da
ButtonYesToAll=Da tot &timpul
ButtonNo=&Nu
ButtonNoToAll=N&u tot timpul
ButtonFinish=&Finalizare
ButtonBrowse=&Selecteaza...
ButtonWizardBrowse=&Selecteaza...
ButtonNewFolder=Creeaza un director &nou

; *** "Select Language" dialog messages
SelectLanguageTitle=Selectare limba
SelectLanguageLabel=Selectati limba pe care doriti sa o utilizati in timpul instalarii:

; *** Common wizard text
ClickNext=Apasati Continua pentru pasul urmator sau Anuleaza pentru a parasi programul.
BeveledLabel=
BrowseDialogTitle=Selectare director
BrowseDialogLabel=Selecteaza un director din lista de mai jos, apoi apasa OK.
NewFolderName=New Folder

; *** "Welcome" wizard page
WelcomeLabel1=Bine ati venit in programul de instalare al [name].
WelcomeLabel2=Acesta va instala [name/ver] pe sistemul dumneavoastra.%n%nEste recomandat sa inchideti toate celelalte aplicatii care ruleaza in acest moment, inainte de a continua.

; *** "Password" wizard page
WizardPassword=Protectie
PasswordLabel1=Aceasta instalare este protejata de o parola.
PasswordLabel3=Va rugam introduceti parola, apoi apasati Continua. Parola este case-sensitive.
PasswordEditLabel=&Parola:
IncorrectPassword=Parola introdusa este incorecta. Mai incercati o data.

; *** "License Agreement" wizard page
WizardLicense=Acceptul licentei de utilizare
LicenseLabel=Va rugam sa cititi urmatoarele informatii inainte de a continua.
LicenseLabel3=Va rugam sa cititi urmatorul "Accept al licentei de utilizare". Este necesar sa acceptati termenii acestei licente pentru a putea continua instalarea.
LicenseAccepted=&Accept termenii licentei
LicenseNotAccepted=&Nu accept termenii licentei

; *** "Information" wizard pages
WizardInfoBefore=Informatii
InfoBeforeLabel=Va rugam sa cititi aceste informatii suplimentare inainte de a continua.
InfoBeforeClickLabel=Cand sunteti gata sa continuati instalarea, apasati Continua.
WizardInfoAfter=Informatii
InfoAfterLabel=Va rugam sa cititi aceste informatii suplimentare inainte de a continua.
InfoAfterClickLabel=Cand sunteti gata sa continuati instalarea, apasati Continua.

; *** "User Information" wizard page
WizardUserInfo=Informatii despre utilizator
UserInfoDesc=Va rugam introduceti informatiile despre utilizator.
UserInfoName=Nume &utilizator:
UserInfoOrg=&Organizatie:
UserInfoSerial=Numar &serial:
UserInfoNameRequired=Trebuie sa introduceti numele.

; *** "Select Destination Directory" wizard page
WizardSelectDir=Selectati directorul destinatie
SelectDirDesc=Unde doriti sa instalati [name]?
SelectDirLabel3=Selectati directorul in care doriti sa instalati [name], apoi apasati Continua.
SelectDirBrowseLabel=Pentru a continua, apasati Continua. Daca doriti sa selectati un alt director, apasati Selecteaza.
DiskSpaceMBLabel=Acest program necesita cel putin [mb] Mb pe disc.
ToUNCPathname=Programul nu poate fi instalat pe o cale de retea. Daca doriti instalarea pe o cale de retea, trebuie sa mapati calea la o unitate de retea.
InvalidPath=Trebuie introdusa calea completa, incluzand litera unitatii.%n%nExemplu:%nC:\APP%n%nsau calea de retea de forma:%n\\server\share
InvalidDrive=Unitatea selectata nu exista sau nu este accesibila. Va rugam selectati o alta unitate.
DiskSpaceWarningTitle=Nu exista spatiu suficient pe disc
DiskSpaceWarning=Programul de instalare necesita un spatiu minim de %1 KB, dar unitatea selectata are disponibil doar %2 KB.%n%nDoriti sa continuati ?
DirNameTooLong=Numele directorului sau calea este prea lunga.
InvalidDirName=Numele directorului nu este valid.
BadDirName32=Numele directorului nu poate contine nici unul din urmatoarele caractere: :%n%n%1
DirExistsTitle=Director existent
DirExists=Directorul:%n%n%1%n%ndeja exista. Doriti sa instalati in acest director ?
DirDoesntExistTitle=Director inexistent
DirDoesntExist=Directorul%n%n%1%n%nnu exista. Doriti sa fie creat ?

; *** "Select Components" wizard page
WizardSelectComponents=Selectare componente
SelectComponentsDesc=Care componente ar trebui instalate ?
SelectComponentsLabel2=Selectati componentele care doriti sa fie instalate; deselectati componentele pe care nu doriti sa le instalati. Apasati Continua cand sunteti gata sa continuati instalarea.
FullInstallation=Instalare completa
; if possible don't translate 'Compact' as 'Minimal' (I mean 'Minimal' in your language)
CompactInstallation=Instalare compacta
CustomInstallation=Instalare personalizata
NoUninstallWarningTitle=Componenta exista 
NoUninstallWarning=S-a detectat ca urmatoarele componente sunt deja instalate in sistem:%n%n%1%n%nDeselectarea acestor componente nu va duce la dezinstalarea lor din sistem.%n%nDoriti sa continuati ?
ComponentSize1=%1 KB
ComponentSize2=%1 MB
ComponentsDiskSpaceMBLabel=Selectia curenta necesita cel putin [mb] MB.

; *** "Select Additional Tasks" wizard page
WizardSelectTasks=Optiuni suplimentare
SelectTasksDesc=Care optiuni suplimentare doriti?
SelectTasksLabel2=Selectati optiunile suplimentare dorite pentru instalarea [name], apoi apasati Continua.

; *** "Select Start Menu Folder" wizard page
WizardSelectProgramGroup=Selectati directorul din meniul Start
SelectStartMenuFolderDesc=Unde doriti sa adaug link-urile catre aplicatie?
SelectStartMenuFolderLabel3=Programul de instalare va crea link-urile catre program in urmatorul director din meniul Start.
SelectStartMenuFolderBrowseLabel=Pentru a continua, apasati Continua. Daca doriti sa selectati un alt director, apasati Selecteaza.
NoIconsCheck=Nu adauga &link-uri
MustEnterGroupName=Trebuie sa introduceti numele unui director.
GroupNameTooLong=Numele directorului sau calea este prea lunga.
InvalidGroupName=Numele directorului nu este valid.
BadGroupName=Numele directorului nu poate contine nici unul din urmatoarele caractere:%n%n%1
NoProgramGroupCheck2=Nu crea &director in meniul Start

; *** "Ready to Install" wizard page
WizardReady=Gata de instalare
ReadyLabel1=Programul este in punctul de a incepe instalarea [name] pe acest sistem.
ReadyLabel2a=Apasati Instaleaza pentru a continua, sau Inapoi daca doriti sa revedeti sau sa modificati setarile facute anterior.
ReadyLabel2b=Apasati Instaleaza pentru a continua.
ReadyMemoUserInfo=Informatii utilizator:
ReadyMemoDir=Director destinatie:
ReadyMemoType=Tipul instalarii:
ReadyMemoComponents=Componente selectate:
ReadyMemoGroup=Director in meniu Start:
ReadyMemoTasks=Optiuni suplimentare:

; *** "Preparing to Install" wizard page
WizardPreparing=Pregatire instalare
PreparingDesc=Programul de instalare pregateste instalarea [name].
PreviousInstallNotCompleted=Instalarea / dezinstalarea versiunii anterioare a programului nu este completa. Trebuie sa restartati sistemul pentru a termina instalarea anterioara.%n%nDupa restart, rulati inca o data programul de instalare al [name].
CannotContinue=Programul de instalare nu poate continua. Apasati Anuleaza pentru a parasi instalarea.

; *** "Installing" wizard page
WizardInstalling=Instalare
InstallingLabel=Va rugam asteptati pana cand instalarea [name] ia sfarsit.

; *** "Setup Completed" wizard page
FinishedHeadingLabel=Finalizare instalare [name]
FinishedLabelNoIcons=Programul a terminat instalarea [name].
FinishedLabel=Programul a terminat instalarea [name]. Aplicatia poate fi lansata utilizand link-urile create.
ClickFinish=Apasati Finalizare pentru a parasi programul de instalare.
FinishedRestartLabel=Pentru a completa instalarea [name], sistemul dvs. trebuie restartat. Doriti sa restartati acum?
FinishedRestartMessage=Pentru a completa instalarea [name], sistemul dvs. trebuie restartat. %n%nDoriti sa restartati acum?
ShowReadmeCheck=Da, doresc sa citesc fisierul README
YesRadio=&Da, doresc restartarea sistemului acum
NoRadio=&Nu, voi restarta mai tarziu
; used for example as 'Run MyProg.exe'
RunEntryExec=Ruleaza %1
; used for example as 'View Readme.txt'
RunEntryShellExec=Citeste %1

; *** "Setup Needs the Next Disk" stuff
ChangeDiskTitle=Urmatorul disc
SelectDiskLabel2=Va rugam introduceti Discul %1 si apasati OK.%n%nDaca fisierele de pe acest disc se afla intr-un alt director decat cel afisat mai jos, introduceti calea corecta sau apasati Selecteaza.
PathLabel=&Cale:
FileNotInDir2=Fisierul "%1" nu poate fi gasit in "%2". Va rugam introduceti discul corect sau selectati un alt director.
SelectDirectoryLabel=Va rugam specificati locatia urmatorului disc.

; *** Installation phase messages
SetupAborted=Programul de instalare nu s-a incheiat cu succes.%n%nVa rugam corectati problema si porniti instalarea din nou.
EntryAbortRetryIgnore=Apasati 'Retry' pentru a incerca inca o data, 'Ignore' pentru a trece oricum de acest pas sau 'Abort' pentru a opri instalarea.

; *** Installation status messages
StatusCreateDirs=Creare directoare ...
StatusExtractFiles=Extragere fisiere ...
StatusCreateIcons=Creare link-uri ...
StatusCreateIniEntries=Creare intrari INI ...
StatusCreateRegistryEntries=Creare intrari in Registry ...
StatusRegisterFiles=Inregistrare fisiere ...
StatusSavingUninstall=Salvare informatii de dezinstalare ...
StatusRunProgram=Finalizare instalare ...
StatusRollback=Anulare modificari ...

; *** Misc. errors
ErrorInternal2=Eroare interna: %1
ErrorFunctionFailedNoCode=%1 a esuat
ErrorFunctionFailed=%1 a esuat; cod %2
ErrorFunctionFailedWithMessage=%1 a esuat; cod %2.%n%3
ErrorExecutingProgram=Nu pot executa:%n%1

; *** Registry errors
ErrorRegOpenKey=Eroare la deschiderea cheii din registri:%n%1\%2
ErrorRegCreateKey=Eroare la crearea urmatoarei chei in registri:%n%1\%2
ErrorRegWriteKey=Eroare la scrierea urmatoarei chei in registri:%n%1\%2

; *** INI errors
ErrorIniEntry=Eroare la crearea inregistrarilor INI in fisierul "%1".

; *** File copying errors
FileAbortRetryIgnore=Apasati 'Retry' pentru a incerca inca o data, 'Ignore' pentru a trece peste acest fisier (nerecomandat) sau 'Abort' pentru a opri instalarea.
FileAbortRetryIgnore2=Apasati 'Retry' pentru a incerca inca o data, 'Ignore' pentru a trece oricum de acest pas (nerecomandat) sau 'Abort' pentru a opri instalarea.
SourceIsCorrupted=Fisierul sursa este corupt
SourceDoesntExist=Fisierul sursa "%1" nu exista
ExistingFileReadOnly=Fisierul existent este marcat read-only.%n%nApasati 'Retry' pentru a schimba atributele fisierului si a incerca inca o data, 'Ignore' pentru a trece peste acest fiser sau 'Abort' pentru a opri instalarea.
ErrorReadingExistingDest=A aparut o eroare in tip ce citeam fisierul:
FileExists=Fisierul exista.%n%nDoriti sa il suprascrieti ?
ExistingFileNewer=Fisierul existent este mai nou decat cel care se instaleaza acum. Este recomandat sa pastrati fisierul existent.%n%nDoriti sa pastrati fisierul existent ?
ErrorChangingAttr=A aparut o eroare in tip ce incercam sa modific atributele fisierului:
ErrorCreatingTemp=A aparut o eroare in tip ce incercam sa creez un fisier in directorul destinatie:
ErrorReadingSource=A aparut o eroare in tip ce incercam sa citesc fisierul sursa:
ErrorCopying=A aparut o eroare in tip ce incercam sa copii fisierul:
ErrorReplacingExistingFile=A aparut o eroare in timp ce incercam sa inlocuiesc fisierul:
ErrorRestartReplace=Eroare inlocuire la restart:
ErrorRenamingTemp=A aparut o eroare in tip ce incercam sa redenumesc fisierul din directorul destinatie:
ErrorRegisterServer=Nu pot sa inregistrez DLL/OCX: %1
ErrorRegisterServerMissingExport=Nu pot gasi DllRegisterServer
ErrorRegisterTypeLib=Nu pot sa inregistrez tipul de librarie: %1

; *** Post-installation errors
ErrorOpeningReadme=A aparut o eroare la deschiderea fisierului README.
ErrorRestartingComputer=Programul de instalare nu poate restarta sistemul. Va rugam sa incercati sa restartati manual sistemul.

; *** Uninstaller messages
UninstallNotFound=Fisierul "%1" nu exista. Nu pot dezinstala.
UninstallOpenError=Fisierul "%1" nu poate fi deschis. Nu pot dezinstala
UninstallUnsupportedVer=Fisierul de dezinstalare "%1" are un format necunoscut acestei versiuni de program. Nu pot dezinstala
UninstallUnknownEntry=O intrare necunoscuta (%1) a fost gasita in fisierul de dezinstalare
ConfirmUninstall=Doriti sa dezinstalati %1 si componentele sale aditionale?
OnlyAdminCanUninstall=Trebuie sa aveti drepturi de Administrator pentru a dezinstala acest program.
UninstallStatusLabel=Va rugam asteptati pana cand dezinstalarea %1 ia sfarsit..
UninstalledAll=%1 a fost dezinstalat cu succes.
UninstalledMost=%1 a fost dezinstalat.%n%nUnele fisiere nu au putut fi sterse. Acestea pot if sterse manual.
UninstalledAndNeedsRestart=Pentru a termina dezinstalarea %1, sistemul trebuie restartat.%n%nDoriti sa restartati sistemul acum?
UninstallDataCorrupted=Fisierul "%1" este corupt. Nu pot dezinstala

; *** Uninstallation phase messages
ConfirmDeleteSharedFileTitle=Stergere fisiere 'Shared' ?
ConfirmDeleteSharedFile2=Sistemul indica faptul ca urmatorul fisier nu mai este utilizat de nici un alt program. Doriti sa stergeti acest fisier ?%n%nDaca acest fisier este totusi utilizat de un alt pogram, acesta din urma nu va mai functiona corect. Daca nu sunteti sigur, alegeti 'Nu'. Lasand fisierul pe sistem nu va afecta cu nimic.
SharedFileNameLabel=Nume fisier:
SharedFileLocationLabel=Locatie:
WizardUninstalling=Progres dezinstalare
StatusUninstalling=Dezinstalare %1...

; The custom messages below aren't used by Setup itself, but if you make
; use of them in your scripts, you'll want to translate them.

[CustomMessages]

NameAndVersion=%1 versiunea %2
AdditionalIcons=Iconite aditionale:
CreateDesktopIcon=Creeaza o iconita pe &desktop
CreateQuickLaunchIcon=Creeaza o iconita &Quick Launch
ProgramOnTheWeb=%1 pe Internet
UninstallProgram=Dezinstalare %1
LaunchProgram=Lanseaza %1
AssocFileExtension=&Asociaza %1 cu extensia de fisiere %2
AssocingFileExtension=Asociere %1 cu extensia de fisiere %2 ...

