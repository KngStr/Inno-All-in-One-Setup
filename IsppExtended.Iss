//Author      : KngStr
//Link        : http://www.kngstr.com/
//Description :
//Modified    : 2013-11-14 11:40:59
//Tested Inno :


#define AddBaseName
#define AddBaseDll
#define AddBaseIsh
#define AddBaseExample
#define AddBaseExtensions
#define AddBaseDocs
#define AddBaseComponent
#define AddBaseTask
#define AddBaseSubDir

;插件文件添加
#sub AddFilesEx
  #define public
  #if FileExists(Plugins + "\" + AddBaseDll + ".dll")
    Source: {#Plugins}\{#AddBaseDll}.dll; DestDir: {app}\Plugins\{#AddBaseSubDir}; Components: {#AddBaseComponent}; Tasks: {#AddBaseTask}; Flags: ignoreversion; BeforeInstall: AddToDetaList
  #endif

  #if FileExists(Includes + "\" + AddBaseIsh + ".Ish")
    Source: {#Includes}\{#AddBaseIsh}.Ish; DestDir: {app}\Include\{#AddBaseSubDir}; Components: {#AddBaseComponent}; Tasks: {#AddBaseTask}; Flags: ignoreversion; BeforeInstall: AddToDetaList
  #elif FolderExists(Includes + "\" + AddBaseIsh)
    Source: {#Includes}\{#AddBaseIsh}\*; DestDir: {app}\Include\{#AddBaseIsh}; Components: {#AddBaseComponent}; Tasks: {#AddBaseTask}; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList
  #endif

  #if FileExists(Examples + "\" + AddBaseExample + ".Iss")
    Source: {#Examples}\{#AddBaseExample}.Iss; DestDir: {app}\Examples\{#AddBaseSubDir}; Components: {#AddBaseComponent}; Tasks: {#AddBaseTask}; Flags: ignoreversion; BeforeInstall: AddToDetaList
    #elif FolderExists(Examples + "\" + AddBaseExample)
    Source: {#Examples}\{#AddBaseExample}\*; DestDir: {app}\Examples\{#AddBaseExample}; Components: {#AddBaseComponent}; Tasks: {#AddBaseTask}; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList
  #endif

  #if FolderExists(Extensions + "\" + AddBaseExtensions)
    Source: {#Extensions}\{#AddBaseExtensions}\*; DestDir: {app}\Extensions\{#AddBaseExtensions}; Components: {#AddBaseComponent}; Tasks: {#AddBaseTask}; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList
  #endif

  #if FolderExists(Docs + "\" + AddBaseDocs)
    Source: {#Docs}\{#AddBaseDocs}\*; DestDir: {app}\Docs\{#AddBaseDocs}; Components: {#AddBaseComponent}; Tasks: {#AddBaseTask}; Flags: ignoreversion recursesubdirs; BeforeInstall: AddToDetaList
  #endif
#endsub

#define AddFiles(str fName, str fDll = "", str fIsh = "", str fExample = "", str fComponent = "", str fTask = "", str fSubDir = "") \
  AddBaseName = fName, \
  fDll == "" ? (AddBaseDll = fName) : (AddBaseDll = fDll), \
  fIsh == "" ? (AddBaseIsh = fName) : (AddBaseIsh = fIsh), \
  fExample == "" ? (AddBaseExample = fName) : (AddBaseExample = fExample), \
  AddBaseComponent = fComponent, \
  AddBaseTask = fTask, \
  AddBaseSubDir = "", \
  ((AddBaseExtensions = fName), (AddBaseDocs = fName)), \
  AddFilesEx, \
  AddBaseSubDir = fSubDir, \
  AddBaseSubDir == "" ?  "" : ((AddBaseDll = AddBaseSubDir + "\" + AddBaseDll), (AddBaseIsh = AddBaseSubDir + "\" + AddBaseIsh), (AddBaseExample = AddBaseSubDir + "\" + AddBaseExample), (AddBaseExtensions = AddBaseSubDir + "\" + AddBaseDocs), (AddBaseDocs = AddBaseSubDir + "\" + AddBaseDocs)) , \
  AddFilesEx

#define AddPlugin(str fName, str fDll = "", str fSubDir = "") \
  AddFiles(fName, fDll, "", "", "Plugins\" + fName, "", fSubDir)

#define AddExtensions(str fName) \
  AddFiles(fName, "", "", "", "Extensions\" + fName)

#define AddTask(str fName, str fDll = "", str fSubDir = "") \
  AddFiles(fName, fDll, "", "", "", fName, fSubDir)


;文件版本及编译时间
#define VerBuild(str FileName, Str Ver = "", Str Build = "") \
  Local[0] = GetFileVersion(FileName), \
  Local[0] == "0.0.0.0" ? Local[0] = Trim(GetFileProductVersion(FileName)) : Local[0], \
  Local[1] = GetFileDateTimeString(FileName, 'yymmdd', '', ''), \
  Local[0] + ' Build ' + Local[1]

;核心版本号
#define ISCmplr_VerStr(str Compiler, str Ver) \
  DeleteFile(GetEnv("Temp") + '\IS_ENHANCED.ini'), \
  Local[0] = FileExists(Compiler + '\..\islzma.dll'), \
  Local[0] ? "" : CopyFile('compiler:\islzma.dll', Compiler + '\..\islzma.dll'), \
  Exec(Compiler, '"' + SrcPath + 'Res\ISCmplr.ish"', "", 1, SW_HIDE), \
  Local[1] = StringChange(ReadIni(GetEnv("Temp") + '\IS_ENHANCED.ini', 'Main', Ver, ''), ' (a)', ''), \
  Exec("cmd", '/c del "' + Compiler + '\..\islzma.dll"', "", 1, SW_HIDE), \
  Exec("cmd", '/c del "' + GetEnv("Temp") + '\IS_ENHANCED.ini', "", 1, SW_HIDE), \
  StringChange(Local[1], ' (u)', '')
