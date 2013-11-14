; Translation made with Translator 1.32 (http://www2.arnes.si/~sopjsimo/translator.html)
; $Translator:NL=%n:TB=%t
;
; *** Inno Setup version 5.1.0+ Afrikaans messages ***
;
; Created by: Hermien Brits
; E-mail:     hermien@hmk.co.za
;

[LangOptions]
LanguageName=Afrikaans
LanguageID=$0436
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

DialogFontName=
[Messages]

; *** Application titles
SetupAppTitle=Installasie
SetupWindowTitle=Installasie - %1
UninstallAppTitle=Verwyder
UninstallAppFullTitle=Verwyder %1

; *** Misc. common
InformationTitle=Inligting
ConfirmTitle=Bevestig
ErrorTitle=Fout

; *** SetupLdr messages
SetupLdrStartupMessage=Hierdie program sal %1 installeer. Wil u voortgaan?
LdrCannotCreateTemp=Onmoontlik om 'n tydelike leêr te skep. Installasie gestaak
LdrCannotExecTemp=Onmoontlik om 'n uitvoerbare leêr in die tydelike gids te skep. Installasie gestaak

; *** Startup error messages
LastErrorMessage=%1.%n%nFout %2: %3
SetupFileMissing=Die leêr %1 word vermis in die installasie gids. Korrigeer die fout of verkry 'n nuwe weergawe van die program.
SetupFileCorrupt=Die installasie leêrs is korrup. Verkry 'n nuwe weergawe van die program.
SetupFileCorruptOrWrongVer=Die installasie leêrs is korrup, of onversoenbaar met hierdie weergawe van Installeerder. Korrigeer die problem of verkry 'n nuwe weergawe van die program.
NotOnThisPlatform=Hierdie program sal nie loop op %1 nie.
OnlyOnThisPlatform=Hierdie program moet geloop word op %1.
OnlyOnTheseArchitectures=Hierdie program kan net geinstalleer word op weergawes van Windows ontwerp vir die volgende verwerker argitekture:%n%n%1
MissingWOW64APIs=Die weergawe van Windows wat u gebruik sluit nie die funksionaliteit in wat die Installeerder vereis vir 'n 64-bis installasie nie. Om hierdie probleem te korrigeer, installeer asb. Service Pack %1.
WinVersionTooLowError=Hierdie program vereis %1 weergawe %2 of nuuter.
WinVersionTooHighError=Hierdie program kan nie geinstalleer word op %1 weergawe %2 of nuuter nie.
AdminPrivilegesRequired=U moet ingeteken wees as 'n administreerder om hierdie program te installeer.
PowerUserPrivilegesRequired=U moet aangeteken wees as 'n administreerder of as 'n lid van die Power Users groep om hierdie program te installeer.
SetupAppRunningError=Die installeerder het opgetel dat %1 op die oomblik loop.%n%nMaak asb. nou alle kopieë daarvan toe, en kliek dan Aanvaar om voort te gaan, of Kanselleer om die installasie te verlaat.
UninstallAppRunningError=Verwyder het opgetel dat %1 op die oomblik oop is.%n%nMaak asb. alle kopieë daarvan toe, en kliek dan op Aanvaar om voort te gaan, of Kanselleer om die verwyderaar te verlaat.

; *** Misc. errors
ErrorCreatingDir=Die installeerder kon nie die gids %1 skep nie
ErrorTooManyFilesInDir=Onmoontlik om 'n leêr in die gids "%1" te skep omdat dit te veel leêrs bevat

; *** Setup common messages
ExitSetupTitle=Verlaat Installeerder
ExitSetupMessage=Installasie is nog nie voltooi nie. Indien u dit nou verlaat, sal die program nie geinstalleer wees nie.%n%nU kan die Installeerder later weer uitvoer om die installasie te voltooi.%n%nVerlaat die Installeerder?
AboutSetupMenuItem=&Meer oor die Installeerder...
AboutSetupTitle=Meer oor die Installeerder
AboutSetupMessage=%1 weergawe %2%n%3%n%n%1 tuisblad: %n%4
AboutSetupNote=

; *** Buttons
TranslatorNote= 
ButtonBack=< &Terug
ButtonNext=&Volgende >
ButtonInstall=&Installeer
ButtonOK=Aanvaar
ButtonCancel=Kanselleer
ButtonYes=Ja
ButtonYesToAll=Ja vir &Almal
ButtonNo=&Nee
ButtonNoToAll=N&ee vir Almal
ButtonFinish=&Voltooi
ButtonBrowse=&Rondblaai...
ButtonWizardBrowse=R&ondblaai...
ButtonNewFolder=&Skep Nuwe Gids

; *** "Select Language" dialog messages
SelectLanguageTitle=Kies Installeerder Taal
SelectLanguageLabel=Kies die taal om te gebruik gedurende die installasie:

; *** Common wizard text
ClickNext=Kliek Volgende om voort te gaan, of Kanselleer om die installeerder te verlaat.
BeveledLabel=
BrowseDialogTitle=Blaai Rond Vir Gids
BrowseDialogLabel=Kies 'n gids in die lys hieronder, en kliek Aanvaar.
NewFolderName=Nuwe Gids

; *** "Welcome" wizard page
WelcomeLabel1=Welkom by die [name] Installasie Guru
WelcomeLabel2=Hierdie program sal [name/ver] installeer op u rekenaar.%n%nDit word aanbeveel dat u alle ander programme toemaak voor dat u voortgaan.

; *** "Password" wizard page
WizardPassword=Wagwoord
PasswordLabel1=Hierdie installasie word deur 'n wagwoord beskerm.
PasswordLabel3=Verskaf asb. die wagwoord, en kliek Volgende om voor te gaan. Wagwoorde is sensitief vir hoofletters.
PasswordEditLabel=&Wagwoord:
IncorrectPassword=Die wagwoord wat u ingesleutel het is nie korrek nie. Probeer asb. weer.

; *** "License Agreement" wizard page
WizardLicense=Lisensie Ooreenkoms
LicenseLabel=Lees asb. die volgende belangrike inligting voordat u voortgaan.
LicenseLabel3=Lees asb. die volgende Lisensie Ooreenkoms. U moet die terme van hierdie ooreenkoms aanvaar voordat u voortgaan met die installasie.
LicenseAccepted=Ek &aanvaar die ooreenkoms
LicenseNotAccepted=Ek aan&vaar nie die ooreenkoms nie.

; *** "Information" wizard pages
WizardInfoBefore=Inligting
InfoBeforeLabel=Lees asb. die volgende belangrike inligting voordat u voortgaan.
InfoBeforeClickLabel=Wanneer u gereed is op voort te gaan met die Installasie, kliek Volgende.
WizardInfoAfter=Inligting
InfoAfterLabel=Lees asb. die volgende belangrike inligting voordat u voortgaan.
InfoAfterClickLabel=Wanneer u gereed is op voort te gaan met die Installasie, kliek Volgende.

; *** "User Information" wizard page
WizardUserInfo=Gebruiker Inligting
UserInfoDesc=Sleutel asb. u inligting in.
UserInfoName=&Gebruiker Naam:
UserInfoOrg=&Organisasie:
UserInfoSerial=&Registrasie Nommer:
UserInfoNameRequired=U moet 'n naam insleutel.

; *** "Select Destination Location" wizard page
WizardSelectDir=Kies Bestemming Ligging
SelectDirDesc=Waar moet [naam] geinstalleer word?
SelectDirLabel3=Die installeerder sal [name] installeer in die volgende gids.
SelectDirBrowseLabel=Om voort te gaan, kliek Volgende. Indien u 'n ander gids wil kies, click Rondblaai.
DiskSpaceMBLabel=Ten minste [mb] MB oop hardeskyf spasie word benodig.
ToUNCPathname=Die installeerder kan nie installeer na 'n UNC gidsnaam nie. Indien u probeer om te installeer op 'n netwerk, sal u 'n netwerk aandrywer moet afbeeld.
InvalidPath=U moet 'n volledige pad insleutel met 'n aandrywer letter; bv.:%n%nC:\APP%n%nof 'n UNC pad in die vorm:%n%n\\server\share
InvalidDrive=Die aandrywer of UNC netwerk gids wat u gekies het bestaan nie of is nie toeganklik nie. Kies asb. 'n ander een.
DiskSpaceWarningTitle=Onvoldoende Aandrywer Spasie
DiskSpaceWarning=Die installasie vereis ten minste %1 KB oop spasie, maar die gekose aandrywer het slegs %2 KB spasie beskikbaar.%n%nWil u voortgaan ten spyte daarvan?
DirNameTooLong=Die gids naam of pad is te lank.
InvalidDirName=Die gidsnaam is ongeldig.
BadDirName32=Gidsname mag nie een van die volgende karakters bevat nie:%n%n%1
DirExistsTitle=Gids Bestaan
DirExists=Die gids:%n%n%1%n%nbestaan alreeds. Wil u ten spyte daarvan steeds daarheen installeer?
DirDoesntExistTitle=Gids Bestaan Nie
DirDoesntExist=Die gids:%n%n%1%n%n bestaan nie. Wil u die gids skep?

; *** "Select Components" wizard page
WizardSelectComponents=Kies Komponente
SelectComponentsDesc=Watter komponente moet geinstalleer word?
SelectComponentsLabel2=Kies die komponente wat u wil installeer; deselekteer die komponente wat u nie wil installeer nie. Kliek Volgende wanneer u gereed is om voort te gaan.
FullInstallation=Volledige Installasie
; if possible don't translate 'Compact' as 'Minimal' (I mean 'Minimal' in your language)
CompactInstallation=Kompakte Installasie
CustomInstallation=Pasgemaakte Installasie
NoUninstallWarningTitle=Komponente Bestaan
NoUninstallWarning=Die installeerder het opgetel dat die volgende komponente reeds op u rekenaar geinstaleer is:%n%n%1%n%nOm die komponente te deselekteer sal hulle nie verwyder nie.%n%nWil u ten spyte daarvan voortgaan?
ComponentSize1=%1 KB
ComponentSize2=%1 MB
ComponentsDiskSpaceMBLabel=Huidige seleksie vereis ten minste [mb] MB aandrywer spasie.

; *** "Select Additional Tasks" wizard page
WizardSelectTasks=Kies Bykomende Take
SelectTasksDesc=Watter bykomente take moet uigevoer word?
SelectTasksLabel2=Kies die bykomende take wat u wil hê die Installeerder moet uitvoer tydens die [name] installasie, en kliek dan Volgende.

; *** "Select Start Menu Folder" wizard page
WizardSelectProgramGroup=Kies Start Menu Gids
SelectStartMenuFolderDesc=Waar moet die Installeerder die program se kortpaaie plaas?
SelectStartMenuFolderLabel3=Die installeerder sal die program se kortpaaie in die volgende Start Menu gids plaas.
SelectStartMenuFolderBrowseLabel=Om voort te gaan, kliek Volgende. Indien u 'n ander gids wil kies, kliek Rondblaai.
MustEnterGroupName=U moet 'n gidsnaam insleutel.
GroupNameTooLong=Die gidsnaam of pad is te lank.
InvalidGroupName=Die gidsnaam is ongeldig.
BadGroupName=Die gidsnaam mag nie enige van die volgende karakters bevat nie:%n%n%1
NoProgramGroupCheck2=&Moenie 'n Start Menu gids skep nie

; *** "Ready to Install" wizard page
WizardReady=Gereed om te Installeer
ReadyLabel1=Die installeerder is nou gereed om [name] te begin installeer op u rekenaar.
ReadyLabel2a=Kliek Installeer om voort te gaan met die installasie, of kliek Terug indien u enige keuses wil hersien of verander.
ReadyLabel2b=Kliek Installeer om voort te gaan met die installasie.
ReadyMemoUserInfo=Gebruiker inligting:
ReadyMemoDir=Bestemming ligging:
ReadyMemoType=Installasie tipe:
ReadyMemoComponents=Geselekteerder komponente:
ReadyMemoGroup=Start Menu gids:
ReadyMemoTasks=Bykomende take:

; *** "Preparing to Install" wizard page
WizardPreparing=Voorbereiding om te Installeer
PreparingDesc=Die installeerder is besig om voor te berei om [name] op u rekenaar te installeer.
PreviousInstallNotCompleted=Die installasie/verwydering van 'n vorige program is nie voltooi nie. U moet u rekenaar restart om daardie installasie te voltooi.%n%nNadat u die rekenaar restart het, kan u die instaleerder weer uitvoer om die installasie van [name] te voltooi.
CannotContinue=Die installeerder kan nie voortgaan nie. Kliek asb. Kanselleer om dit te verlaat.

; *** "Installing" wizard page
WizardInstalling=Besig om te Installeer
InstallingLabel=Wag asb. terwyl [name] op u rekenaar geinstalleer word.

; *** "Setup Completed" wizard page
FinishedHeadingLabel=Voltooi die [name] Installasie Guru
FinishedLabelNoIcons=Die [name] installasie is voltooi.
FinishedLabel=Die [name] installasie is voltooi. Die program kan uitgevoer word deur die geinstalleerde ikone te gebruik.
ClickFinish=Kliek Voltooi om die installeerder te verlaat.
FinishedRestartLabel=Om die [name] installasie te voltooi, moet u rekenaar restart word. Wil u die rekenaar nou restart?
FinishedRestartMessage=Om die [name] installasie te voltooi, moet u rekenaar restart word.%n%nWil u die rekenaar nou restart?
ShowReadmeCheck=Ja, ek wil die README leêr besigtig
YesRadio=&Ja, restart die rekenaar nou
NoRadio=&Nee, ek sal die rekenaar later restart
; used for example as 'Run MyProg.exe'
RunEntryExec=Voer %1 uit
; used for example as 'View Readme.txt'
RunEntryShellExec=Besigtig %1

; *** "Setup Needs the Next Disk" stuff
ChangeDiskTitle=Installeerder Benodig Volgende Disket
SelectDiskLabel2=Plaas asb. Disket %1 in die aandrywer en kliek Aanvaar.%n%nIndien die leêrs in 'n ander gids gevind kan word as die een hieronder, sleutel die korrekte pad in of kliek Rondblaai.
PathLabel=&Pad:
FileNotInDir2=Die leêr "%1" kan nie gevind word in "%2" nie. Plaas asb. die korrekte disket in die aandrywer of kies 'n ander gids.
SelectDirectoryLabel=Spesifiseer asb. die ligging van die volgende disket.

; *** Installation phase messages
SetupAborted=Die installasie was nie voltooi nie.%n%nKorrigeer asb. die probleem en voer die installeerder weer uit.
EntryAbortRetryIgnore=Kliek Probeer Weer om weer te probeer, Ignoreer om ten spyte hiervan voort te gaan, of Stop om die installasie te kanselleer.

; *** Installation status messages
StatusCreateDirs=Skepping van gidse...
StatusExtractFiles=Uithaal van leêrs...
StatusCreateIcons=Skepping van kortpaaie...
StatusCreateIniEntries=Skepping van INI inskrywings...
StatusCreateRegistryEntries=Skepping van registrasie inskrywings...
StatusRegisterFiles=Registrering van leêrs...
StatusSavingUninstall=Stoor van verwyderingsinligting...
StatusRunProgram=Voltooiing van installasie...
StatusRollback=Terugdraai van veranderinge...

; *** Misc. errors
ErrorInternal2=Interne fout: %1
ErrorFunctionFailedNoCode=%1 gefaal
ErrorFunctionFailed=%1 gefaal; kode %2
ErrorFunctionFailedWithMessage=%1 gefaal; kode %2.%n%3
ErrorExecutingProgram=Onmoontlik om die volgende leêr uit te voer:%n%1

; *** Registry errors
ErrorRegOpenKey=Fout terwyl register sleutel oopgemaak word:%n%1\%2
ErrorRegCreateKey=Fout terwyl register sleutel geskep word:%n%1\%2
ErrorRegWriteKey=Fout terwyl geskryf word na register sleutel:%n%1\%2

; *** INI errors
ErrorIniEntry=Fout terwyl INI inskrywing in die leêr "%1" gemaak word.

; *** File copying errors
FileAbortRetryIgnore=Kliek Probeer Weer om weer te probeer, Ignoreer om hierdie leêr oor te slaap (nie aanbeveel nie), of Stop om die installasie te verlaat.
FileAbortRetryIgnore2=Kliek Probeer Weer om weer te probeer, Ignoreer om voort te gaan ten spyte hiervan (nie aanbeveel nie), of Stop om die installasie te verlaat.
SourceIsCorrupted=Die bron leêr is korrup
SourceDoesntExist=Die bron leêr "%1" bestaan nie
ExistingFileReadOnly=Die bestaande leêr is gemerl as lees-alleenlik.%n%nKliek Probeer Weer om die lees-alleenlik attribuut te verwyder en weer te probeer, Ignoreer om hierdie leêr oor te slaan, of Stop om die installasie te verlaat.
ErrorReadingExistingDest='n Fout het gebeur terwyl die bestaande leêr gelees is:
FileExists=Die leêr bestaan alreeds.%n%nWil u die leêr oorskryf?
ExistingFileNewer=Die bestaande leêr is nuuter as die een wat die Installeerder probeer installeer. Dit word aanbeveel dat u die bestaande leêr hou.%n%nWil u die bestaande leêr hou?
ErrorChangingAttr='n Fout het gebeur terwyl die attribute van die bestaande leêr verander is:
ErrorCreatingTemp='n Fout het gebeur toe 'n leêr in die bestaande gids geskep is:
ErrorReadingSource='n Fout het gebeur terwyl die bronleêr gelees is:
ErrorCopying='n Fout het gebeur terwyl 'n leêr gekopieer is:
ErrorReplacingExistingFile='n Fout het gebeur toe die bestaande leêr oorskryf is:
ErrorRestartReplace=HerbeginVerander gefaal:
ErrorRenamingTemp='n Fout het gebeur terwyl 'n leêr in die bestemmingsgids van naam verander is:
ErrorRegisterServer=Onmoontlik om die DLL/OCX te registreer: %1
ErrorRegisterServerMissingExport=DllRegisterServer nie gevind
ErrorRegisterTypeLib=Onmoontlik om die biblioteek tipe te registreer: %1

; *** Post-installation errors
ErrorOpeningReadme='n Fout het gebeur terwyl die README leêr oopgemaak is.
ErrorRestartingComputer=Die installeerder kon nie die rekenaar restart nie. Doen dit asb. manueel.

; *** Uninstaller messages
UninstallNotFound=Leêr "%1" bestaan nie. Kan nie installeer nie.
UninstallOpenError=Leêr "%1" kan nie oopgemaak word nie. Onmoontlik om te verwyder.
UninstallUnsupportedVer=Die verwyder logboek leêr "%1" se formaat word nie herken deur hierdie weergawe van die verwyderaar nie. Onmoontlik om te verwyder
UninstallUnknownEntry='n Onbekende inskrywing (%1) is teëgekom in die verwyder logboek
ConfirmUninstall=Is u seker dat u %1 en al die komponente daarvan heeltemal wil verwyder?
UninstallOnlyOnWin64=Hierdie installasie kan slegs verwyder word op 64-bis Windows.
OnlyAdminCanUninstall=Hierdie installasie kan slegs verwyder word deur 'n gebruiker met administratiewe regte.
UninstallStatusLabel=Wag asb. terwyl %1 van u rekenaar verwyder word.
UninstalledAll=%1 is suksesvol verwyder vanaf u rekenaar.
UninstalledMost=%1 verwydering voltooi.%n%nSommige elemente kan nie verwyder word nie. Hierdie elemente kan manueel verwyder word.
UninstalledAndNeedsRestart=Om die verwydering van %1 te voltooi, moet u rekenaar restart word.%n%nWil u nou restart?
UninstallDataCorrupted="%1" leêr is korrup. Onmoontlik om te verwyder

; *** Uninstallation phase messages
ConfirmDeleteSharedFileTitle=Verwyder Gedeelde Leêr?
ConfirmDeleteSharedFile2=Die stelsel dui aan dat die volgende gedeelde leêrs nie meer deur enige programme gebruik word nie. Moet die verwyderaar die gedeelde leêr verwyder?%n%nIndien enige programme hierdie leêr steeds gebruik en dit verwyder is, sal daardie programme nie meer reg funksioneer nie. Indien u onseker is, kies Nee. Indien die leêr op u stelsel gelaat word, sal dit geen skade doen nie.
SharedFileNameLabel=Leêrnaam:
SharedFileLocationLabel=Ligging:
WizardUninstalling=Verwyderingstatus
StatusUninstalling=Verwyder %1...
[CustomMessages]

NameAndVersion=%1 weergawe %2
AdditionalIcons=Bykomende ikone:
CreateDesktopIcon=Skep 'n &werksblad ikoon
CreateQuickLaunchIcon=Skep 'n &Quick Launch ikoon
ProgramOnTheWeb=% op die Web
UninstallProgram=Verwyder %1
LaunchProgram=Voer %1 uit
AssocFileExtension=&Assosieer %1 met die %2 leêr uitbreiding
AssocingFileExtension=Assosieer %1 met die %2 lêer uitbreiding...
