; *** Inno Setup version 4.2.2+ English messages ***
;
;   Preveo na Bosanski Fikret Hasovic (fikret.hasovic@gmail.com)
;
;
; $jrsoftware: issrc/Files/Default.isl,v 1.61 2005/02/17 02:23:56 jr Exp $

[LangOptions]
LanguageName=Bosanski
LanguageID=$0409
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
SetupAppTitle=Instalacija
SetupWindowTitle=Instalacija - %1
UninstallAppTitle=Deinstalacija
UninstallAppFullTitle=%1 Deinstalacija

; *** Misc. common
InformationTitle=Informacija
ConfirmTitle=Potvrda
ErrorTitle=Greška

; *** SetupLdr messages
SetupLdrStartupMessage=Zapoèeli ste instalaciju programa %1. Želite li nastaviti?
LdrCannotCreateTemp=Ne mogu kreirati privremenu datoteku. Instalacija prekinuta
LdrCannotExecTemp=Ne mogu izvršiti datoteku u privremenom folderu. Instalacija prekinuta

; *** Startup error messages
LastErrorMessage=%1.%n%nGreška %2: %3
SetupFileMissing=Datoteka %1 se ne nalazi u instalacijskom folderu. Molimo vas riješite problem ili nabavite novu kopiju programa.
SetupFileCorrupt=Instalacijske datoteke sadrže grešku. Molimo nabavite novu kopiju programa.
SetupFileCorruptOrWrongVer=Instalacijske datoteke sadrže grešku, ili nisu kompatibilne sa ovom verzijom instalacije. Molimo vas riješite problem ili nabavite novu kopiju programa.
NotOnThisPlatform=Ovaj program neæe raditi na %1.
OnlyOnThisPlatform=Ovaj program se mora pokrenuti na %1.
WinVersionTooLowError=Ovaj program zahtjeva %1 verziju %2 ili noviju.
WinVersionTooHighError=Ovaj program ne može biti instaliran na %1 verziji %2 ili novijoj.
AdminPrivilegesRequired=Morate imati administratorska prava pri instaliranju ovog programa.
PowerUserPrivilegesRequired=Morate imati administratorska prava ili biti èlan grupe Power Users prilikom instaliranja ovog programa.
SetupAppRunningError=Instalacija je detektovala da je %1 pokrenut.%n%nMolimo zatvorite program i sve njegove kopije i potom kliknite Dalje za nastavak ili Odustani za prekid.
UninstallAppRunningError=Deinstalacija je detektovala da je %1 is currently running.%n%nMolimo zatvorite program i sve njegove kopije i potom kliknite Dalje za nastavak ili Odustani za prekid.

; *** Misc. errors
ErrorCreatingDir=Instalacija nije mogla kreirati folder "%1"
ErrorTooManyFilesInDir=Instalacija nije mogla kreirati datoteku u folderu "%1" because it contains too many fileszato što on sadrži previše datoteka

; *** Setup common messages
ExitSetupTitle=Prekid instalacije
ExitSetupMessage=Instalacija nije izvršena. Ako sad izadjete, program neæe biti instaliran.%n%nInstalaciju možete pokrenuti kasnije ako želite završiti instalaciju.%n%nPrekid instalacije?
AboutSetupMenuItem=&O instalaciji...
AboutSetupTitle=O instalaciji
AboutSetupMessage=%1 verzija %2%n%3%n%n%1 home page:%n%4
AboutSetupNote=

; *** Buttons
ButtonBack=< Na&zad
ButtonNext=Da&lje >
ButtonInstall=&Instaliraj
ButtonOK=U redu
ButtonCancel=Otkaži
ButtonYes=&Da
ButtonYesToAll=Da za &sve
ButtonNo=&Ne
ButtonNoToAll=N&e za sve
ButtonFinish=&Završi
ButtonBrowse=&Izaberi...
ButtonWizardBrowse=Iza&beri...
ButtonNewFolder=&Napravi novi folder

; *** "Select Language" dialog messages
SelectLanguageTitle=Izaberite jezik instalacije
SelectLanguageLabel=Izberite jezik koji želite koristiti pri instalaciji:

; *** Common wizard text
ClickNext=Kliknite na Dalje za nastavak ili Otkaži za prekid instalacije.
BeveledLabel=
BrowseDialogTitle=Izaberite folder
BrowseDialogLabel=Izaberite folder iz liste ispod, pa onda kliknite U redu.
NewFolderName=Novi folder

; *** "Welcome" wizard page
WelcomeLabel1=Dobrodošli u instalaciju programa [name]
WelcomeLabel2=Ovaj program æe instalirati [name/ver] na vaše raèunar.%n%nPreporuèujemo da zatvorite sve programe prije nastavka.

; *** "Password" wizard page
WizardPassword=Lozinka
PasswordLabel1=Instalacija je zaštiæena lozinkom.
PasswordLabel3=Upišite lozinku i kliknite Dalje za nastavak. Lozinke su osjetljive na mala i velika slova.
PasswordEditLabel=&Lozinka:
IncorrectPassword=Upisana je pogrešna lozinka. Pokušajte ponovo.

; *** "License Agreement" wizard page
WizardLicense=Ugovor o korištenju
LicenseLabel=Molimo vas, prije nastavka, pažljivo proèitajte slijedeæe važne informacije.
LicenseLabel3=Molimo vas, pažljivo proèitajte Ugovor o korištenju. Morate prihvatiti uslove ugovora kako bi mogli nastaviti s instalacijom.
LicenseAccepted=&Prihvatam ugovor
LicenseNotAccepted=&Ne prihvatam ugovor

; *** "Information" wizard pages
WizardInfoBefore=Informacija
InfoBeforeLabel=Molimo vas, proèitajte sljedeæe važne informacije prije nastavka.
InfoBeforeClickLabel=Kada budete spremni nastaviti instalaciju odaberite Dalje.
WizardInfoAfter=Informacija
InfoAfterLabel=Molimo vas, proèitajte sljedeæe važne informacije prije nastavka.
InfoAfterClickLabel=Kada budete spremni nastaviti instalaciju odaberite Dalje.

; *** "User Information" wizard page
WizardUserInfo=Informacije o korisniku
UserInfoDesc=Unesite informacije o vama.
UserInfoName=&Ime korisnika:
UserInfoOrg=&Organizacija:
UserInfoSerial=&Serijski broj:
UserInfoNameRequired=Morate upisati ime.

; *** "Select Destination Location" wizard page
WizardSelectDir=Odaberite odredišni folder
SelectDirDesc=Gdje æe biti instaliran program [name]?
SelectDirLabel3=Instalacija æe instalirati [name] u sljedeæi folder.
SelectDirBrowseLabel=Za nastavak, kliknite Dalje. Ako želite izabrati drugi folder, kliknite Izaberi.
DiskSpaceMBLabel=Ovaj program zahtjeva najmanje [mb] MB slobodnog prostora na disku.
ToUNCPathname=Instalacija ne može instalirati na UNC putanju. Ako pokušavate instalirati na mrežu, morate mapirati mrežni disk.
InvalidPath=Morate unijeti punu putanju zajedno sa slovom diska; npr:%n%nC:\APP%n%nili UNC putanju u obliku:%n%n\\server\share
InvalidDrive=Disk ili UNC share koji ste odabrali ne postoji ili je nedostupan. Odaberite neki drugi.
DiskSpaceWarningTitle=Nedovoljno prostora na disku
DiskSpaceWarning=Instalacija zahtjeva bar %1 KB slobodnog prostora, a odabrani disk ima samo %2 KB na raspolaganju.%n%nDa li želite nastaviti?
DirNameTooLong=The folder name or path is too long.
InvalidDirName=The folder name is not valid.
BadDirName32=Naziv foldera ne smije sadržavati ni jedan od sljedeæih karaktera:%n%n%1
DirExistsTitle=Folder postoji
DirExists=Folder:%n%n%1%n%nveæ postoji. Želite li svejedno instalirati u njega?
DirDoesntExistTitle=Folder ne postoji
DirDoesntExist=Folder:%n%n%1%n%nne postoji. Želite li ga napraviti?

; *** "Select Components" wizard page
WizardSelectComponents=Odaberite komponente
SelectComponentsDesc=Koje komponente želite instalirati?
SelectComponentsLabel2=Odaberite komponente koje želite instalirati ili uklonite kvaèicu uz komponente koje ne želite. Kliknite Dalje kad budete spremni da nastavite.
FullInstallation=Puna instalacija
; if possible don't translate 'Compact' as 'Minimal' (I mean 'Minimal' in your language)
CompactInstallation=Kompakt (minimalna) instalacija
CustomInstallation=Instalacija prema želji
NoUninstallWarningTitle=Komponente postoje
NoUninstallWarning=Instalacija je detektovala da na vašem raèunaru veæ postoje slijedeæe komponente:%n%n%1%n%nNeodabir tih komponenata ne dovodi do njihove deinstalacije.%n%nŽelite li ipak nastaviti?
ComponentSize1=%1 KB
ComponentSize2=%1 MB
ComponentsDiskSpaceMBLabel=Trenutni izbor zahtjeva bar [mb] MB prostora na disku.

; *** "Select Additional Tasks" wizard page
WizardSelectTasks=Izaberite dodatne radnje
SelectTasksDesc=Koje dodatne radnje želite da se izvrše?
SelectTasksLabel2=Izaberite radnje koje æe se izvršiti tokom instalacije programa [name], onda kliknite Dalje.

; *** "Select Start Menu Folder" wizard page
WizardSelectProgramGroup=Izaberite programsku grupu
SelectStartMenuFolderDesc=Gdje æe instalacija napraviti shortcut-e?
SelectStartMenuFolderLabel3=Izaberite Start Menu folder u koji želite da instalacija kreira shortcut pa kliknite Dalje.
SelectStartMenuFolderBrowseLabel=Za nastavak, kliknite Dalje. Ako želite da izaberete drugi folder, kliknite Izaberi.
NoIconsCheck=&Ne kreiraj ikone
MustEnterGroupName=Morate unijeti ime programske grupe.
GroupNameTooLong=Naziv foldera ili putanje je predug.
InvalidGroupName=Naziv foldera nije ispravan.
BadGroupName=Naziv foldera ne smije sadržavati ni jedan od sljedeæih karaktera::%n%n%1
NoProgramGroupCheck2=&Ne kreiraj %1 programsku grupu

; *** "Ready to Install" wizard page
WizardReady=Spreman za instalaciju
ReadyLabel1=Instalacija je spremna instalirati [name] na vaš raèunar.
ReadyLabel2a=Kliknite na Instaliraj ako želite instalirati program ili na Nazad ako želite pregledati ili promjeniti postavke.
ReadyLabel2b=Kliknite na Instaliraj ako želite nastaviti sa instalacijom programa.
ReadyMemoUserInfo=Informacije o korisniku:
ReadyMemoDir=Odredišni folder:
ReadyMemoType=Tip instalacije:
ReadyMemoComponents=Odabrane komponente:
ReadyMemoGroup=Programska grupa:
ReadyMemoTasks=Dodatne radnje:

; *** "Preparing to Install" wizard page
WizardPreparing=Pripremam instalaciju
PreparingDesc=Instalacija se priprema da instalira [name] na vaš raèunar.
PreviousInstallNotCompleted=Instalacija/deinstalacija prethodnog programa nije završena. Morate restartati raèunar kako bi završili tu instalaciju.%n%nNakon restartanja raèunara, ponovno pokrenite Setup kako bi dovršili instalaciju [name].
CannotContinue=Instalacija ne može nastaviti. Molimo kliknite na Odustani za izlaz.

; *** "Installing" wizard page
WizardInstalling=Instaliram
InstallingLabel=Prièekajte dok se ne završi instalacija programa [name] na vaš raèunar.

; *** "Setup Completed" wizard page
FinishedHeadingLabel=Završavam instalaciju [name]
FinishedLabelNoIcons=Instalacija programa [name] je završena.
FinishedLabel=Instalacija programa [name] je završena. Program možete pokrenuti koristeæi instalirane ikone.
ClickFinish=Kliknite na Završi da biste izašli iz instalacije.
FinishedRestartLabel=Da biste instalaciju programa [name] završili, potrebno je restartati raèunar. Da li želite to sada uèiniti?
FinishedRestartMessage=Završetak instalacije programa [name] zahtjeva restart vašeg raèunara.%n%nDa li želite to sada uèiniti?
ShowReadmeCheck=Da, želim proèitati README datoteku.
YesRadio=&Da, restartaj raèunar sada
NoRadio=&Ne, restartaæu raèunar kasnije
; used for example as 'Run MyProg.exe'
RunEntryExec=Pokreni %1
; used for example as 'View Readme.txt'
RunEntryShellExec=Pogledati %1

; *** "Setup Needs the Next Disk" stuff
ChangeDiskTitle=Instalacija treba sljedeæi disk
SelectDiskLabel2=Molimo ubacite Disk %1 i kliknite U redu.%n%nAko datoteke na ovom disku mogu biti nadjene u folderu drugom od onog prokazanog ispod, unesite ispravnu putanju ili kliknite na Izaberi.
PathLabel=&Putanja:
FileNotInDir2=Datoteka "%1" ne postoji u "%2". Molimo vas ubacite odgovorajuæi disk ili odaberite drugi folder.
SelectDirectoryLabel=Molimo odaberite lokaciju sljedeæeg diska.

; *** Installation phase messages
SetupAborted=Instalacija nije završena.%n%nMolimo vas, riješite problem i opet pokrenite instalaciju.
EntryAbortRetryIgnore=Kliknite na Retry da pokušate opet, Ignore da nastavite, ili Abort da prekinete instalaciju.

; *** Installation status messages
StatusCreateDirs=Kreiram foldere...
StatusExtractFiles=Raspakujem datoteke...
StatusCreateIcons=Kreiram shortcut-e...
StatusCreateIniEntries=Kreiram INI datoteke...
StatusCreateRegistryEntries=Kreiram podatke za registry...
StatusRegisterFiles=Registrujem datoteke...
StatusSavingUninstall=Snimam deinstalacijske informacije...
StatusRunProgram=Završavam instalaciju...
StatusRollback=Poništavam promjene...

; *** Misc. errors
ErrorInternal2=Interna greška: %1
ErrorFunctionFailedNoCode=%1 nije uspjelo
ErrorFunctionFailed=%1 nije uspjelo; code %2
ErrorFunctionFailedWithMessage=%1 failed; code %2.%n%3
ErrorExecutingProgram=Ne mogu pokrenuti datoteku:%n%1

; *** Registry errors
ErrorRegOpenKey=Greška pri otvaranju registry kljuèa:%n%1\%2
ErrorRegCreateKey=Greška pri kreiranju registry kljuèa:%n%1\%2
ErrorRegWriteKey=Greška pri pisanju registry kljuèa:%n%1\%2

; *** INI errors
ErrorIniEntry=Greska pri kreiranju INI podataka u datoteci "%1".

; *** File copying errors
FileAbortRetryIgnore=Kliknite Retry da pokušate ponovo, Ignore da preskoèite ovu datoteku (ne preporuèuje se), ili Abort da prekinete instalaciju.
FileAbortRetryIgnore2=Kliknite Retry da pokušate ponovo, Ignore da preskoèite ovu datoteku (ne preporuèuje se), ili Abort da prekinete instalaciju.
SourceIsCorrupted=Izvorna datoteka je ošteæena
SourceDoesntExist=Izvorna datoteka "%1" ne postoji
ExistingFileReadOnly=Postojeæa datoteka je oznaèena "samo-za-èitanje" (read-only).%n%nKliknite Retry da uklonite oznaku "samo-za-èitanje" (read-only) i pokušati ponovo, Ignore da preskoèite ovu datoteku, ili Abort da prekinete instalaciju.
ErrorReadingExistingDest=Došlo je do greške prilikom pokušaja èitanja postojeæe datoteke:
FileExists=Datoteka veæ postoji.%n%nŽelite li pisati preko nje?
ExistingFileNewer=Postojeæa datoteka je novija od one koju pokušavate instalirati. Preporuèuje se zadržati postojeæu datoteku.%n%nŽelite li zadržati postojeæu datoteku?
ErrorChangingAttr=Pojavila se greška prilikom pokušaja promjene atributa postojeæe datoteke:
ErrorCreatingTemp=Pojavila se greška prilikom pokušaja kreiranja datoteke u odredišnom folderu:
ErrorReadingSource=Pojavila se greška prilikom pokušaja èitanja izvorne datoteke:
ErrorCopying=Pojavila se greška prilikom pokušaja kopiranja datoteke:
ErrorReplacingExistingFile=Pojavila se greška prilikom pokušaja zamjene datoteke:
ErrorRestartReplace=RestartReplace nije uspio:
ErrorRenamingTemp=Pojavila se greška prilikom pokušaja preimenovanja datoteke u odredišnom folderu:
ErrorRegisterServer=Ne mogu registrovati DLL/OCX: %1
ErrorRegisterServerMissingExport=DllRegisterServer export nije pronadjen
ErrorRegisterTypeLib=Ne mogu registrovati type library: %1

; *** Post-installation errors
ErrorOpeningReadme=Pojavila se greška prilikom pokušaja otvaranja README datoteke.
ErrorRestartingComputer=Instalacija ne može restartati vaš raèunar. Molimo vas, uèinite to ruèno.

; *** Uninstaller messages
UninstallNotFound=Datoteka "%1" ne postoji. Deinstalacija prekinuta.
UninstallOpenError=Datoteka "%1" se ne može otvoriti. Deinstalacija nije moguæa
UninstallUnsupportedVer=Deinstalacijska log datoteka "%1" je u formatu koji nije prepoznat od ove verzije deinstalera. Nije moguæa deinstalacija
UninstallUnknownEntry=Nepoznat zapis (%1) je pronadjen u deinstalacijskoj log datoteci
ConfirmUninstall=Da li ste sigurni da želite ukloniti %1 i sve njegove komponente?
OnlyAdminCanUninstall=Ova instalacija može biti uklonjena samo od korisnika sa administratorskim privilegijama.
UninstallStatusLabel=Molimo prièekajte dok %1 ne bude uklonjen s vašeg raèunara.
UninstalledAll=Program %1 je uspješno uklonjen sa vašeg raèunara.
UninstalledMost=Deinstalacija programa %1 je završena.%n%nNeke elemente nije bilo moguæe ukloniti. Molimo vas da to uèinite ruèno.
UninstalledAndNeedsRestart=Da bi završili deinstalaciju %1, Vaš raèunar morate restartati%n%nŽelite li to uèiniti sada? 
UninstallDataCorrupted="%1" datoteka je ošteæena. Deinstalacija nije moguæa.

; *** Uninstallation phase messages
ConfirmDeleteSharedFileTitle=Ukloni dijeljenu datoteku_
ConfirmDeleteSharedFile2=Sistem ukazuje da sljedeæe dijeljene datoteke ne koristi ni jedan drugi program. Želite li da Deinstalacija ukloni te dijeljene datoteke?%n%nAko neki programi i dalje koriste te datoteke, a one se obrišu, ti programi neæe ipravno raditi. Ako niste sigurni, odaberite Ne. Ostavljanje datoteka neæe uzrokovati štetu vašem sistemu.
SharedFileNameLabel=Datoteka:
SharedFileLocationLabel=Putanja:
WizardUninstalling=Status deinstalacije
StatusUninstalling=Deinstaliram %1...

; The custom messages below aren't used by Setup itself, but if you make
; use of them in your scripts, you'll want to translate them.

[CustomMessages]

NameAndVersion=%1 verzija %2
AdditionalIcons=Dodatne ikone:
CreateDesktopIcon=Kreiraj &desktop ikonu
CreateQuickLaunchIcon=Kreiraj &Quick Launch ikonu
ProgramOnTheWeb=%1 na Web-u
UninstallProgram=Uninstall %1
LaunchProgram=Pokreni %1
AssocFileExtension=&Asociraj %1 sa %2 ekstenzijom
AssocingFileExtension=Asociaram %1 sa %2 ekstenzijom...
