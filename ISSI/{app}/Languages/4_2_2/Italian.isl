; *** Inno Setup version 4.2.1+ English messages ***
;
; To download user-contributed translations of this file, go to:
;   http://www.jrsoftware.org/is3rdparty.php
;
; Note: When translating this text, do not add periods (.) to the end of
; messages that didn't have them already, because on those messages Inno
; Setup adds the periods automatically (appending a period would result in
; two periods being displayed).
;
; $jrsoftware: issrc/Files/Default.isl,v 1.58 2004/04/07 20:17:13 jr Exp $
;
; Italian translation by Davide Moretti <dave@rimini.com>
;

[LangOptions]
LanguageName=Italian
LanguageID=$0410
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
SetupAppTitle=Installazione
SetupWindowTitle=Installazione - %1
UninstallAppTitle=Disinstallazione
UninstallAppFullTitle=Disinstallazione di %1

; *** Misc. common
InformationTitle=Informazioni
ConfirmTitle=Conferma
ErrorTitle=Errore

; *** SetupLdr messages
SetupLdrStartupMessage=Questo programma installerà %1. Si vuole continuare?
LdrCannotCreateTemp=Impossibile creare i file temporanei. Installazione interrotta
LdrCannotExecTemp=Impossibile eseguire i file nella directory temporanea. Installazione interrotta

; *** Startup error messages
LastErrorMessage=%1.%n%nErrore %2: %3
SetupFileMissing=Il file %1 non è presente nella directory di installazione. Correggere il problema o richiedere una nuova copia del programma.
SetupFileCorrupt=I file di installazione sono danneggiati. Richiedere una nuova copia del programma.
SetupFileCorruptOrWrongVer=I file di installazione sono danneggiati, o sono incompatibili con la presente versione del programma di installazione. Risolvere il problema o richiedere una nuova copia del programma.
NotOnThisPlatform=Questo programma non è compatibile con %1.
OnlyOnThisPlatform=Questo programma richiede %1.
WinVersionTooLowError=Questo programma richiede %1 versione %2 o successiva.
WinVersionTooHighError=Questo programma non può essere installato su %1 versione %2 o successiva.
AdminPrivilegesRequired=Per installare questo programma occorre essere connessi come amministratore.
PowerUserPrivilegesRequired=Per installare questo programma occorre essere connessi come amministratore o come utente appartenente al gruppo Power Users.
SetupAppRunningError=%1 è attualmente in esecuzione.%n%nChiudere tutte le istanze del programma e premere OK per continuare o Annulla per uscire.
UninstallAppRunningError=%1 è attualmente in esecuzione.%n%nChiudere tutte le istanze del programma e premere OK per continuare o Annulla per uscire.

; *** Misc. errors
ErrorCreatingDir=La cartella "%1" non può essere creata
ErrorTooManyFilesInDir=Impossibile creare un file nella cartella "%1" perchè contiene troppi file

; *** Setup common messages
ExitSetupTitle=Uscita dalla installazione
ExitSetupMessage=L'installazione non è completa. Uscendo ora, il programma non verrà istallato.%n%nE' possibile riprendere l'installazione interrotta in un altro momento.%n%nUscire dalla installazione?
AboutSetupMenuItem=&Informazioni su Installazione...
AboutSetupTitle=Informazioni su Installazione
AboutSetupMessage=%1 versione %2%n%3%n%nHome page di %1:%n%4
AboutSetupNote=

; *** Buttons
ButtonBack=< &Indietro
ButtonNext=&Avanti >
ButtonInstall=&Installa
ButtonOK=OK
ButtonCancel=Annulla
ButtonYes=&Si
ButtonYesToAll=Si a &Tutti
ButtonNo=&No
ButtonNoToAll=N&o a Tutti
ButtonFinish=&Termina
ButtonBrowse=&Sfoglia...
ButtonWizardBrowse=&Sfoglia...
ButtonNewFolder=&Crea nuova cartella

; *** "Select Language" dialog messages
SelectLanguageTitle=Lingua di installazione
SelectLanguageLabel=Selezionare la lingua da usare durante l'installazione:

; *** Common wizard text
ClickNext=Premere Avanti per continuare, o Annulla per uscire.
BeveledLabel=
BrowseDialogTitle=Sfoglia per cartelle
BrowseDialogLabel=Scegli una cartella dalla lista e seleziona OK.
NewFolderName=Nuova cartella

; *** "Welcome" wizard page
WelcomeLabel1=Benvenuti nel programma di installazione di [name]
WelcomeLabel2=Questo programma installerà [name/ver] sul vostro computer.%n%nSi consiglia di chiudere tutte le applicazioni attive prima di procedere.

; *** "Password" wizard page
WizardPassword=Password
PasswordLabel1=Questa installazione è protetta da password.
PasswordLabel3=Inserire la password e premere Avanti per continuare. Le password distinguono maiuscole/minuscole.
PasswordEditLabel=&Password:
IncorrectPassword=La password inserita non è corretta, riprovare.

; *** "License Agreement" wizard page
WizardLicense=Accordo di Licenza
LicenseLabel=Leggere le informazioni importanti che seguono prima di procedere.
LicenseLabel3=Leggere il seguente accordo di licenza. È necessario accettare i termini di questo accordo per poter procedere con l'installazione.
LicenseAccepted=&Accetto l'accordo di licenza
LicenseNotAccepted=&Non accetto l'accordo di licenza

; *** "Information" wizard pages
WizardInfoBefore=Informazioni
InfoBeforeLabel=Leggere le informazioni importanti che seguono prima di procedere.
InfoBeforeClickLabel=Quando siete pronti per proseguire con l'installazione, premere Avanti.
WizardInfoAfter=Informazioni
InfoAfterLabel=Leggere le informazioni importanti che seguono prima di procedere.
InfoAfterClickLabel=Quando siete pronti per proseguire con l'installazione, premere Avanti.

; *** "User Information" wizard page
WizardUserInfo=Informazioni Utente
UserInfoDesc=Inserire le seguenti informazioni.
UserInfoName=&Nome:
UserInfoOrg=&Società:
UserInfoSerial=&Numero di Serie:
UserInfoNameRequired=Per completare l'installazione è necessario fornire le informazioni richieste.

; *** "Select Destination Directory" wizard page
WizardSelectDir=Selezione della cartella di destinazione
SelectDirDesc=Dove si desidera installare [name]?:
SelectDirLabel3=Selezionare la cartella in cui installare [name] e premere Avanti.
SelectDirBrowseLabel=Selezionare Avanti per continuare. Per scegliere una cartella differente, selezionare Sfoglia.
DiskSpaceMBLabel=Il programma richiede almeno [mb] MB di spazio su disco.
ToUNCPathname=Impossibile eseguire l'installazione su un percorso UNC. Se si deve installare attraverso una rete, occorre connettere la risorsa come una unità di rete.
InvalidPath=Occorre inserire un percorso completo di lettera di unità; per esempio:%nC:\APP%n%noppure un percorso UNC nella forma:%n%n\\server\condivisione
InvalidDrive=L'unità o il percorso UNC selezionato non esiste o non è accessibile. Ripetere la selezione.
DiskSpaceWarningTitle=Spazio su disco insufficiente
DiskSpaceWarning=Sono necessari almeno %1 KB di spazio libero per eseguire l'installazione, mentre l'unità selezionata ha solo %2 KB disponibili.%n%nProcedere comunque con l'installazione?
DirNameTooLong=Il nome o percorso della cartella è troppo lungo.
InvalidDirName=Il nome della cartella non è valido.
BadDirName32=Il nome della cartella non può includere nessuno dei caratteri seguenti:%n%n%1
DirExistsTitle=Cartella già esistente
DirExists=La cartella:%n%n%1%n%nesiste già. Volete utilizzarla comunque?
DirDoesntExistTitle=Cartella inesistente
DirDoesntExist=La cartella:%n%n%1%n%nnon esiste. Creare la cartella?

; *** "Select Components" wizard page
WizardSelectComponents=Selezione componenti
SelectComponentsDesc=Quali componenti si desidera installare?
SelectComponentsLabel2=Selezionare i componenti da installare; escludere quelli che non si vogliono installare. Premere Avanti per continuare.
FullInstallation=Installazione completa
; if possible don't translate 'Compact' as 'Minimal' (I mean 'Minimal' in your language)
CompactInstallation=Installazione compatta
CustomInstallation=Installazione personalizzata
NoUninstallWarningTitle=Componente esistente
NoUninstallWarning=I seguenti componenti sono già installati sul vostro computer:%n%n%1%n%nDeselezionando questi componenti non verranno disinstallati.%n%nVolete continuare comunque?
ComponentSize1=%1 KB
ComponentSize2=%1 MB
ComponentsDiskSpaceMBLabel=La selezione corrente richiede almeno [mb] MB di spazio su disco.

; *** "Select Additional Tasks" wizard page
WizardSelectTasks=Selezione processi addizionali
SelectTasksDesc=Quali processi addizionali si vogliono eseguire?
SelectTasksLabel2=Selezionare i processi addizionali che verranno eseguiti durante l'installazione di [name], e premere Avanti.

; *** "Select Start Menu Folder" wizard page
WizardSelectProgramGroup=Selezione cartella del Menu Avvio/Start
SelectStartMenuFolderDesc=Dove si desiderano posizionare i collegamenti al programma?
SelectStartMenuFolderLabel3=Selezionare la cartella nel Menu Avvio/Start nella quale creare i collegamenti del programma, e premere Avanti.
SelectStartMenuFolderBrowseLabel=Selezionare Avanti per continuare. Per scegliere una cartella differente, selezionare Sfoglia.
NoIconsCheck=&Non creare icone
MustEnterGroupName=Occorre inserire il nome della cartella.
GroupNameTooLong=Il nome o percorso della cartella è troppo lungo.
InvalidGroupName=Il nome della cartella non è valido.
BadGroupName=Il nome della cartella non può includere nessuno dei caratteri seguenti:%n%n%1
NoProgramGroupCheck2=&Non creare una cartella nel menu Start

; *** "Ready to Install" wizard page
WizardReady=Pronto per l'installazione
ReadyLabel1=È ora possibile iniziare l'installazione di [name] sul computer.
ReadyLabel2a=Premere Installa per continuare con l'installazione, o premere indietro per rivedere o modificare le impostazioni.
ReadyLabel2b=Premere Installa per procedere con l'installazione.
ReadyMemoUserInfo=Informazioni Utente:
ReadyMemoDir=Cartella di destinazione:
ReadyMemoType=Tipo di installazione:
ReadyMemoComponents=Componenti selezionati:
ReadyMemoGroup=Cartella del menu Avvio/Start:
ReadyMemoTasks=Processi addizionali:

; *** "Preparing to Install" wizard page
WizardPreparing=Preparazione all'installazione
PreparingDesc=Si sta preperando l'installazione di [name] sul vostro computer.
PreviousInstallNotCompleted=L'installazione/disinstallazione precedente del programma non è stata completata. È necessario riavviare il computer per completare l'installazione.%n%nAl successivo riavvio del sistema eseguire di nuovo Setup per completare l'installazione di [name].
CannotContinue=L'installazione non può continuare. Premere Annulla per uscire.

; *** "Installing" wizard page
WizardInstalling=Installazione in corso
InstallingLabel=Attendere il completamento dell'installazione di [name] sul vostro computer.

; *** "Setup Completed" wizard page
FinishedHeadingLabel=Completamento dell'installazione di [name]
FinishedLabelNoIcons=L'installazione di [name] sul vostro computer è stata completata.
FinishedLabel=L'installazione di [name] sul vostro computer è stata completata. L'applicazione può essere eseguita selezionando l'icona installata.
ClickFinish=Premere Termina per uscire dal programma di installazione.
FinishedRestartLabel=Per completare l'installazione di [name], è necessario riavviare il computer. Riavviare ora?
FinishedRestartMessage=Per completare l'installazione di [name], é necessario riavviare il computer.%n%nRiavviare ora?
ShowReadmeCheck=Si, Desidero vedere il file LEGGIMI adesso
YesRadio=&Si, riavvia il computer adesso
NoRadio=&No, riavvio il computer più tardi
; used for example as 'Run MyProg.exe'
RunEntryExec=Esegui %1
; used for example as 'View Readme.txt'
RunEntryShellExec=Visualizza %1

; *** "Setup Needs the Next Disk" stuff
ChangeDiskTitle=Inserire il disco successivo
SelectDiskLabel2=Inserire il disco %1 e premere OK.%n%nSe i files su questo disco possono essere trovati in una cartella diversa da quella visualizzata sotto, inserire il percorso corretto o premere Sfoglia.
PathLabel=&Percorso:
FileNotInDir2=Il file "%1" non è stato trovato in "%2". Inserire il disco corretto o selezionare un'altra cartella.
SelectDirectoryLabel=Specificare il percorso del prossimo disco.

; *** Installation phase messages
SetupAborted=L'installazione non è completa.%n%nCorreggere il problema e riavviare il programma di installazione.
EntryAbortRetryIgnore=Premere Riprova per ritentare nuovamente, Ignora per procedere in ogni caso, o Annulla per terminare l'installazione.

; *** Installation status messages
StatusCreateDirs=Creazione cartelle...
StatusExtractFiles=Estrazione files...
StatusCreateIcons=Creazione collegamenti...
StatusCreateIniEntries=Creazione voci del file INI...
StatusCreateRegistryEntries=Creazione voci del registro...
StatusRegisterFiles=Registrazione files...
StatusSavingUninstall=Salvataggio informazioni di disinstallazione...
StatusRunProgram=Completamento installazione...
StatusRollback=Recupero delle modifiche...

; *** Misc. errors
ErrorInternal2=Errore Interno %1
ErrorFunctionFailedNoCode=%1 fallito
ErrorFunctionFailed=%1 fallito; codice %2
ErrorFunctionFailedWithMessage=%1 fallito; codice %2.%n%3
ErrorExecutingProgram=Impossibile eseguire il file:%n%1

; *** Registry errors
ErrorRegOpenKey=Errore di apertura della chiave di registro:%n%1\%2
ErrorRegCreateKey=Errore di creazione della chiave di registro:%n%1\%2
ErrorRegWriteKey=Errore di scrittura della chiave di registro:%n%1\%2

; *** INI errors
ErrorIniEntry=Errore di creazione voce nel file INI "%1".

; *** File copying errors
FileAbortRetryIgnore=Premere Riprova per tentare di nuovo, Ignora per tralasciare questo file (sconsigliato), o Annulla per terminare l'installazione.
FileAbortRetryIgnore2=Premere Riprova per tentare di nuovo, Ignora per proseguire comunque (sconsigliato), o Annulla per terminare l'installazione.
SourceIsCorrupted=Il file sorgente è danneggiato
SourceDoesntExist=Il file sorgente "%1" non esiste
ExistingFileReadOnly=Il file esistente ha l'attributo di sola lettura.%n%nPremere Riprova per rimuovere l'attributo di sola lettura e ritentare, Ignora per saltare questo file, o Annulla per terminare l'installazione.
ErrorReadingExistingDest=Si è verificato un errore durante la lettura del file esistente:
FileExists=Il file esiste già.%n%nSovrascriverlo?
ExistingFileNewer=Il file esistente è più recente rispetto al file che si sta installando. Si raccomanda di mantenere il file esistente.%n%nMantenere il file esistente?
ErrorChangingAttr=Si è verificato un errore durante il tentativo di modifica dell'attributo del file esistente:
ErrorCreatingTemp=Si è verificato un errore durante la creazione di un file nella cartella di destinazione:
ErrorReadingSource=Si è verificato un errore durante la lettura del file sorgente:
ErrorCopying=Si è verificato un errore durante la copia di un file:
ErrorReplacingExistingFile=Si è verificato un errore durante la sovrascrittura del file esistente:
ErrorRestartReplace=Errore durante RiavvioSostituzione:
ErrorRenamingTemp=Si è verificato un errore durante il tentativo di rinominare un file nella cartella di destinazione:
ErrorRegisterServer=Impossibile registrare la DLL/OCX: %1
ErrorRegisterServerMissingExport=DllRegisterServer export non trovato
ErrorRegisterTypeLib=Impossibile registrare il tipo di Libreria: %1

; *** Post-installation errors
ErrorOpeningReadme=Si è verificato un errore durante l'apertura del file LEGGIMI.
ErrorRestartingComputer=Impossibile riavviare il computer. Riavviare manualmente.

; *** Uninstaller messages
UninstallNotFound=Il file "%1" non esiste. Impossibile procedere con la disinstallazione.
UninstallOpenError=Il file "%1" non può essere aperto. Impossibile procedere con la disinstallazione.
UninstallUnsupportedVer=Il file log di disinstallazione "%1" è in un formato non riconosciuto da questa versione dell'uninstaller. Impossibile procedere con la disinstallazione.
UninstallUnknownEntry=Trovata una voce sconosciuta (%1) nel file di log della disinstallazione
ConfirmUninstall=Si è sicuri di voler rimuovere completamente %1 e tutti i suoi componenti?
OnlyAdminCanUninstall=Questa applicazione può essere disinstallata solo da un utente con privilegi di Amministratore.
UninstallStatusLabel=Attendere durante la rimozione di %1 dal vostro computer.
UninstalledAll=%1 è stato rimosso con successo dal vostro computer.
UninstalledMost=Disinstallazione di %1 completata.%n%nAlcuni elementi non possono essere rimossi. Dovranno essere rimossi manualmente.
UninstalledAndNeedsRestart=Per completare la disinstallazione di %1, è necessario riavviare il sistema.%n%nRiavviare adesso?
UninstallDataCorrupted=Il file "%1" è danneggiato. Impossibile procedere con la disinstallazione.

; *** Uninstallation phase messages
ConfirmDeleteSharedFileTitle=Rimuovere il file condiviso?
ConfirmDeleteSharedFile2=Il sistema indica che il seguente file condiviso non è utilizzato da altri programmi. Rimuovere il file?%n%nSe i file che si desiderano rimuovere vengono utilizzati da altre applicazioni, queste potrebbero non funzionare correttamente. In caso di dubbio, scegliere No. Lasciare i file nel sistema non comporta alcun danno.
SharedFileNameLabel=Nome file:
SharedFileLocationLabel=Posizione:
WizardUninstalling=Stato della disinstallazione
StatusUninstalling=Disinstallazione di %1 in corso...

; The custom messages below aren't used by Setup itself, but if you make
; use of them in your scripts, you'll want to translate them.

[CustomMessages]

NameAndVersion=%1 versione %2
AdditionalIcons=Icone addizionali:
CreateDesktopIcon=Crea un'icona sul &desktop
CreateQuickLaunchIcon=Crea un icona in &avvio veloce
ProgramOnTheWeb=%1 sul Web
UninstallProgram=Disinstalla %1
LaunchProgram=Esegui %1
AssocFileExtension=&Associa %1 ai file con estensione %2
AssocingFileExtension=Associazione di %1 ai file con estensione %2 in corso...
