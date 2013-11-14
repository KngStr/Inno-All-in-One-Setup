; *** Inno Setup version 5.1.0+ Spanish (Nicaragua) messages ***
;
; To download user-contributed translations of this file, go to:
;   http://www.jrsoftware.org/is3rdparty.php
;
; Note: When translating this text, do not add periods (.) to the end of
; messages that didn't have them already, because on those messages Inno
; Setup adds the periods automatically (appending a period would result in
; two periods being displayed).
;
; Traduccion realizada por Omar Danilo Berroteran Silva el LKF, berroteranlkf@hotmail.com
; Desde Managua Capital de la republica de Nicaragua. En el mismo centro de America para todo el mundo.
; From Managua Republic of Nicaragua capital in the America center to all the world.
; The correct name is Castellan(Castellano) no Spanish, but this is the name that all people know so sorry.
; I hope be usefull.

[LangOptions]
; The following three entries are very important. Be sure to read and
; understand the '[LangOptions] section' topic in the help file.
LanguageName=Castellano-Nicaragua
LanguageID=$4c0a
LanguageCodePage=1252
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
SetupAppTitle=Asistente de Instalación
SetupWindowTitle=Asistente de Instalación - %1
UninstallAppTitle=Desinstalar
UninstallAppFullTitle=%1 Desinstalar

; *** Misc. common
InformationTitle=Información
ConfirmTitle=Confirmación
ErrorTitle=Error

; *** SetupLdr messages
SetupLdrStartupMessage=Esto Instalara %1. ¿Desea Continuar?
LdrCannotCreateTemp=Imposible crear un archivo temporal. Instalacion abortada
LdrCannotExecTemp=Imposible ejecutar un archivo del directorio Temporal.Instalacion Abortada

; *** Startup error messages
LastErrorMessage=%1.%n%nError %2: %3
SetupFileMissing=El Archivo %1 No se encuentra en el directorio de Instalacion. Corrija el problema u obtenga una nueva copia de este programa.
SetupFileCorrupt=Los archivos de Instalacion estan Corruptos. Obtenga una nueva copia en buen estado.
SetupFileCorruptOrWrongVer=Los archivos de Instalacion estan corruptos, o son imcompatibles con esta version del Asistente de Instalacion. Debe obtener una copia en buen estado.
NotOnThisPlatform=Este programa no correra en  %1.
OnlyOnThisPlatform=Este programa debe ser corrido en %1.
OnlyOnTheseArchitectures=Este programa puede solamente ser instalado en versiones de window diseñadas para la arquitectura de procesadores: %n%n%1
MissingWOW64APIs=Esta version de window no incluye las funciones requeridas para la instalacion a 64-bit. Para corregir esto, instale Service Pack %1.
WinVersionTooLowError=Este programa requiere %1 version %2 o superior.
WinVersionTooHighError=Este programa no puede ser instalado en %1 version %2 o superior.
AdminPrivilegesRequired=Debe iniciar session como administrador para instalar este programa.
PowerUserPrivilegesRequired=Debe iniciar session como administrador o como usuario de poder para instalar este programa.
SetupAppRunningError=El Asistente de Instalacion a detectado que %1 se esta ejecutando.%n%nPor favor cierre todas las instancias instances ahora, de click en siguiente para continuar, o Cancel para Salir.
UninstallAppRunningError=El Desinsataldor a detectado que  %1 se esta ejecutando actualmente.%n%nPor favor cierre todas las instancias instances ahora, de click en siguiente para continuar, o Cancel para Salir.

; *** Misc. errors
ErrorCreatingDir=El Asistente de Instalacion fue incapaz de crear el directorio "%1"
ErrorTooManyFilesInDir=Imposible crear un archivo en el Directorio "%1" por que contiene demasiados archivos.

; *** Setup common messages
ExitSetupTitle=Salir de el Asistente de Instalacion
ExitSetupMessage=El Asistente de Instalacion No esta completo. Si sale ahora, el programa no sera instalado.%n%nPuede ejecutar en cualquier momento El Asistente de Instalacion  para instalar el programa.%n%n ¿Salir del Asistente de Instalacion?
AboutSetupMenuItem=&Acerca de El Asistente de Instalacion ...
AboutSetupTitle=Acerca de El Asistente de Instalacion
AboutSetupMessage=%1 versión %2%n%3%n%n%1 direccion web:%n%4
AboutSetupNote=LKF.-Berroteran.
TranslatorNote=Traducción por Omar D Berroteran S the LKF

; *** Buttons
ButtonBack=< &Atras
ButtonNext=&Siguiente >
ButtonInstall=&Instalar
ButtonOK=OK
ButtonCancel=Cancelar
ButtonYes=S&i
ButtonYesToAll=Si A &Todo
ButtonNo=&No
ButtonNoToAll=N&o a todo
ButtonFinish=&Finalizar
ButtonBrowse=E&xplorar...
ButtonWizardBrowse=E&xplorar...
ButtonNewFolder=&Crear Nueva Carpeta

; *** "Select Language" dialog messages
SelectLanguageTitle=Elija un Idioma para El Asistente de Instalación.
SelectLanguageLabel=Seleccione el idioma a utilizar duratne la instalación:

; *** Common wizard text
ClickNext=Click en Siguiente para continuar, o en Cancelar para Salir.
BeveledLabel=
BrowseDialogTitle=Buscar una Carpeta
BrowseDialogLabel=Seleccione una carpeta en la lista de Abajo y de click en OK.
NewFolderName=Nueva Carpeta

; *** "Welcome" wizard page
WelcomeLabel1=Hola! El Asistente de Instalación para [name] le saluda
WelcomeLabel2=Este Asistente le guiara en el proceso de instalación de [name/ver] en su computador.%n%nEste asistente le recomienda que cierre todas las aplicaciones que este utilizando antes de continuar.

; *** "Password" wizard page
WizardPassword=Contraseña
PasswordLabel1=Esta instalación esta progegida por contraseña.
PasswordLabel3=Ingrese la Clave correcta y de click en Siguiente para continuar. La clave diferencia Mayúsculas de Minúsculas.
PasswordEditLabel=&Clave de Acceso:
IncorrectPassword=La Clave ingresada es incorrecta. Por favor intente nuevametne.

; *** "License Agreement" wizard page
WizardLicense=Aceptacion de terminos de Licencia
LicenseLabel=Por favor lea esta iformación antes de continuar, esto es importante.
LicenseLabel3=Por favor lea cuidadosamente el contrato de aceptación de licencia. Debe aceptar los terminos para continuar.
LicenseAccepted=&Acepto los terminos
LicenseNotAccepted=&No Acepto los terminos

; *** "Information" wizard pages
WizardInfoBefore=Información
InfoBeforeLabel=Por favor lea esta iformación antes de continuar, esto es importante.
InfoBeforeClickLabel=Cuando este listo para continuar con la instalacion, de click en Siguiente.
WizardInfoAfter=Información
InfoAfterLabel=Por favor lea esta iformación antes de continuar, esto es importante.
InfoAfterClickLabel=Cuando este listo para continuar con la instalacion, de click en Siguiente.

; *** "User Information" wizard page
WizardUserInfo=Información del Usuario
UserInfoDesc=Ingrese sus datos por favor:
UserInfoName=&Nombre de Usuario:
UserInfoOrg=&Organización:
UserInfoSerial=&Número de Serie:
UserInfoNameRequired=El nombre es requerido.

; *** "Select Destination Location" wizard page
WizardSelectDir=Seleccione una ubicacion de Destino
SelectDirDesc=Donde desea que [name] sea instalado?
SelectDirLabel3=Instalaré [name] enla siguiente carpeta.
SelectDirBrowseLabel=Para continuar de clik en siguiente. Si quiere elegir una carpeta diferente de click en Explorar.
DiskSpaceMBLabel=Al menos [mb] MB de espacio libre en el disco es requerido.
ToUNCPathname=No puedo instalar en una ruta UNC . Si esta intentanto instalar a una ubicación de red, Necesita mapear primero la ubicación.
InvalidPath=Debe ingresar una ruta completa incluyendo la letra de la unidad; por ejemplo:%n%nC:\APP%n%no una ruta UNC de la forma:%n%n\\server\share
InvalidDrive=La unidad o el recurso compartido UNC que selecciono no existe o esta inaccesible. Por seleccione otra o intente mas tarde.
DiskSpaceWarningTitle=No hay suficiente espacio en el disco destino
DiskSpaceWarning=Requiero al menos %1 KB de espacio libre para poder proceder, la unidad seleccionada tiene solamente %2 KB disponible.%n%nDo you want to continue anyway?
DirNameTooLong=El nombre de la carpeta o la ruta es demasiado largo.
InvalidDirName=El nombre del la carpeta no es valida.
BadDirName32=El nombre de la carpeta no puede incluir ninguno de los siguientes caracteres:%n%n%1
DirExistsTitle=Carpetas existentes
DirExists=La carpeta:%n%n%1%n%nya existe. Desea continuar instalando?
DirDoesntExistTitle=La carpeta no encontrada
DirDoesntExist=La carpeta:%n%n%1%n%ndoes no existe. Desea que la cree?

; *** "Select Components" wizard page
WizardSelectComponents=Selececcione componentes
SelectComponentsDesc=Que componentes desea instalar?
SelectComponentsLabel2=Seleccione los componentes que desea instalar; Desactive los componentes que no desea instalar. De click en siguiente cuando este listo para continuar.
FullInstallation=Instalacion completa
; if possible don't translate 'Compact' as 'Minimal' (I mean 'Minimal' in your language)
CompactInstallation=Instalacion Compacta
CustomInstallation=Personalizada
NoUninstallWarningTitle=Componentes Existentes
NoUninstallWarning=He detectado que los siguientes componentes estan instalados en su computador:%n%n%1%n%n estos componentes no seran desinstalados.%n%nDesea continuar?
ComponentSize1=%1 KB
ComponentSize2=%1 MB
ComponentsDiskSpaceMBLabel=La seleccion actual requiere al menos [mb] MB de espacio en disco.

; *** "Select Additional Tasks" wizard page
WizardSelectTasks=Seleccione Tareas Adicionales
SelectTasksDesc=Que tareas adicionales desea activar?
SelectTasksLabel2=Seleccion las tareas adicionales que desee que realice mientras instalo [name], luego de click en siguiente.

; *** "Select Start Menu Folder" wizard page
WizardSelectProgramGroup=Seleccione carpeta para el Menú inicio
SelectStartMenuFolderDesc=Donde debo ubicar el acceso directo del program?
SelectStartMenuFolderLabel3=Creare el acceso directo al programa en el siguiente carpeta del menu inicio.
SelectStartMenuFolderBrowseLabel=Para continuar de click en Siguiente. Si desea una carpeta diferente de click en explorar.
MustEnterGroupName=Debe ingresar un nombre de carpeta.
GroupNameTooLong=El nombre de la carpeta o ruta es demasiado largo.
InvalidGroupName=El nombre de la carpeta no es valido.
BadGroupName=El nombre del folder no puede inclir algunos de los siguientes caracteres :%n%n%1
NoProgramGroupCheck2=&No Crear Carpeta en el Menú Inicio

; *** "Ready to Install" wizard page
WizardReady=Listo para Instalar
ReadyLabel1=Estoy listo ahora para instalar [name] en tu computador.
ReadyLabel2a=Click en Instalar para continuar con la instalacion, o click en Atras si desea revizar o cambiar alguna configuracion.
ReadyLabel2b=Click en Instalar para continuar con la instalacion.
ReadyMemoUserInfo=Informacion de Usuario:
ReadyMemoDir=Ubicacion Destino:
ReadyMemoType=Tipo de Instalacion:
ReadyMemoComponents=Componentes Seleccionados:
ReadyMemoGroup=Foler Menu Inicio:
ReadyMemoTasks=Tareas Adicionales:

; *** "Preparing to Install" wizard page
WizardPreparing=Preparando para instalar
PreparingDesc=Me estoy preparando para instalar [name] en su computador.
PreviousInstallNotCompleted=La Instalacion o Desinstalacion de un programa no terminada satisfactoriamente. Se necesita reiniciar el computador para completar la instalacion.%n%Despues de esto, ejecute este programa nuevamente para instalar [name].
CannotContinue=No puedo continuar. De click en Cancel para salir.

; *** "Installing" wizard page
WizardInstalling=Installando...
InstallingLabel=Espere mientras instalo [name] en su computador.

; *** "Setup Completed" wizard page
FinishedHeadingLabel=Completando la instalacion de [name]
FinishedLabelNoIcons=He terminado de Instalar [name] en su computador.
FinishedLabel=He terminado de Instalar [name] en su computador. La aplicacion puede ser lanzada seleccionando los iconos instalados.
ClickFinish=Click en Finalizar para salir.
FinishedRestartLabel=Para completar la instalacion de [name], debo reiniciar su computador.%n%nDeseo que lo haga en este momento?
FinishedRestartMessage=Para completar la instalacion de [name], debo reiniciar su computador.%n%nDeseo que lo haga en este momento?
ShowReadmeCheck=Sí, Yo deseo ver el archvio leeme.
YesRadio=&Sí, reiniciar el computador ahora
NoRadio=&No, Yo reiniciare el computador mas tarde.
; used for example as 'Run MyProg.exe'
RunEntryExec=Ejecutar %1
; used for example as 'View Readme.txt'
RunEntryShellExec=Vista %1

; *** "Setup Needs the Next Disk" stuff
ChangeDiskTitle=Necesito el Proximo Disco
SelectDiskLabel2=Insert el Disco %1 y click en OK.%n%nSi los archivos en este disco pueden ser encontrados en un folder diferente del mostrado abajo, entre la ruta correcta o ubiquelo dando click en Explorar.
PathLabel=&Ruta:
FileNotInDir2=El archivo "%1" no puede ser localizado en "%2". Por favor introdusca el dico correcto o la ubicacion de este.
SelectDirectoryLabel=Por favor especifique la ubicacion del proximo disco.

; *** Installation phase messages
SetupAborted=La instalacion no fue completada.%n%nIntente corrigiendo el problema y pruebe nuevamente.
EntryAbortRetryIgnore=Click en Reintentar para probar nuevamente, Ignorar para proceder de cualquier manera(no recomendado), o Abortar para Salir.


; *** Installation status messages
StatusCreateDirs=Creando directorios...
StatusExtractFiles=Desenpacando Archivos...
StatusCreateIcons=Creating AccesosDirectos(Atajos)...
StatusCreateIniEntries=Creando entradas INI ...
StatusCreateRegistryEntries=Creando entradas de registro...
StatusRegisterFiles=Registrando Archivos...
StatusSavingUninstall=Guardando informacion de desinstalacion...
StatusRunProgram=Finalizando la Instalacion...
StatusRollback=Deshacer cambios Realizados...

; *** Misc. errors
ErrorInternal2=Error Interno: %1
ErrorFunctionFailedNoCode=%1 Fallo
ErrorFunctionFailed=%1 fallo; código %2
ErrorFunctionFailedWithMessage=%1 Fallo; código: %2.%n%3
ErrorExecutingProgram=Imposible ejectuar el archivo:%n%1

; *** Registry errors
ErrorRegOpenKey=Error abriendo la entrada de registro:%n%1\%2
ErrorRegCreateKey=Error creando  la entrada de registro:%n%1\%2
ErrorRegWriteKey=Error escribiendo en la llave de registro:%n%1\%2

; *** INI errors
ErrorIniEntry=Error creando entrada de archivo INI  "%1".

; *** File copying errors
FileAbortRetryIgnore=Click en Reintentar para probar nuevamente, Ignorar para omitir este archivo(no recomendado), o Abortar para Salir.
FileAbortRetryIgnore2=Click en Reintentar para probar nuevamente, Ignorar para proceder de cualquier manera(no recomendado), o Abortar para Salir.
SourceIsCorrupted=El archivo a instalar esta corrupto
SourceDoesntExist=El archivo origen "%1" no existe
ExistingFileReadOnly=El archivo existente en el destino esta marcado read-only.%n%nDe clieck en Reintentar para remover este atributo e intente nuevametne, Ignorar para omitir este archivo, o Abortar para cancelar la instalacion.
ErrorReadingExistingDest=Ocurrio un error mientras intentaba leer el archivo existente:
FileExists=El archivo actualmente Existe.%n%nDesea que lo reemplaze?
ExistingFileNewer=El archivo Existente es mas nuevo que el estoy intentanto instalar. Recomiento mantener este archivo.%n%nDesea conservar el archivo existente?
ErrorChangingAttr=Ocurrio un error mientras intentaba cambiar los atributos de un archivo existente:
ErrorCreatingTemp=Ocurrio un error mientras intentaba crar un archivo en el directorio de instalacion:
ErrorReadingSource=Ocurrio un error mientras intentaba leer un arhivo de instalacion:
ErrorCopying=Ocurrio un error mientras intentaba copiar un archivo:
ErrorReplacingExistingFile=Ocurrio un error mientras intentaba reemplazar el archivo existente:
ErrorRestartReplace=RestartReplace fallo:
ErrorRenamingTemp=Ocurrio un error mientras intentaba renombrar un archivo en el directorio de instalacion:
ErrorRegisterServer=Imposible registrar el DLL/OCX: %1
ErrorRegisterServerMissingExport=Exportacon DllRegisterServer no fue econtrado
ErrorRegisterTypeLib=Imposible registrar el tipo de libreria: %1

; *** Post-installation errors
ErrorOpeningReadme=Ha ocurrido un probelma mientras se intentanba abrir el archivo Leeme de esta aplicacion.
ErrorRestartingComputer=No pude reiniciar este computador. Por favor hacedlo manualmente.

; *** Uninstaller messages
UninstallNotFound=Archivo "%1" no existe. No puedo Desinstalar. (¿Que le hicistes che?, la prox. vez ten mas cuidado)
UninstallOpenError=Archivo "%1" No puede ser Abierto. No puedo Desinstalar (¿Que le hicistes che?, la prox. vez ten mas cuidado)
UninstallUnsupportedVer=El archivo log de la desinstalacion "%1" esta en un formato que no es reconocido por este desinstalador(¿Que le hicistes che?, la prox. vez ten mas cuidado). No puedo desinstalar
UninstallUnknownEntry=Una entrada desconocida (%1) fue encontrada en el log de desinstalacion (¿Que le hicistes che?, la prox. vez ten mas cuidado)
ConfirmUninstall=Esta seguro que quiere remover completamente %1 y todos sus componentes?
UninstallOnlyOnWin64=Esta instalacion puede ser solamente desinstalada en 64-bit Windows.
OnlyAdminCanUninstall=Esta instalacion puede ser solamente desinstalada por un usuario con privilegios administrativos.
UninstallStatusLabel=Por favor espere mientras %1 es removido de este sistema.
UninstalledAll=%1 fue satisfactoriamente Eliminado del sistema de tu computador.
UninstalledMost=%1 Desinsatalacion completa.%n%nAlgunos elementos nopuedieron ser removidos. Estos pueden ser removidos manualmente.
UninstalledAndNeedsRestart=Para completar la desinstalacion de %1, su computador debe ser reiniciada.%n%nDesea hacer esto ahora mismo?
UninstallDataCorrupted="%1" archivo corrupto. No puede ser desinstalado

; *** Uninstallation phase messages
ConfirmDeleteSharedFileTitle=¿Remover Archivos Compartidos?
ConfirmDeleteSharedFile2=El sistema indica que los siguientes archivos compartidos no estan siendo utilizados por programa alguno. Desea Eliminarlos?%n%nSi algun programa los utiliza y son removidos, este programa podria no funcionar adecuadamente. Si no esta seguro de click en NO.Dejar los archivo no causa desperfecto.
SharedFileNameLabel=Nombre del Archivo:
SharedFileLocationLabel=Locacion:
WizardUninstalling=Estado del Desinstalador
StatusUninstalling=Desinstalando %1...
[CustomMessages]

NameAndVersion=%1 version %2
AdditionalIcons=Iconos Adicionales:
CreateDesktopIcon=Crear un Icono en el Escritorio &desktop
CreateQuickLaunchIcon=Crear un Icono en la Barra de Inicio &Rapido
ProgramOnTheWeb=%1 en la web.
UninstallProgram=DesInstalar %1
LaunchProgram=Lanzar %1
AssocFileExtension=&Asociar %1 con la extencion de archivos %2
AssocingFileExtension=Asociando %1 on la extencion de archivos %2 ...
