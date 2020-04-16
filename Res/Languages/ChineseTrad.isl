; *** Inno Setup 版本 5.5.3+ 正體中文訊息 ***
[LangOptions]
LanguageName=<7e41><9ad4><4e2d><6587>
LanguageID=$0404
LanguageCodePage=950
; 下列項目用來定義安裝程式介面的字體和大小。
DialogFontName=細明體
DialogFontSize=9
WelcomeFontName=新細明體
WelcomeFontSize=12
TitleFontName=Arial
TitleFontSize=28
CopyrightFontName=新細明體
CopyrightFontSize=9

[Messages]

; *** 應用程式標題
SetupAppTitle=安裝
SetupWindowTitle=安裝 - %1
UninstallAppTitle=移除
UninstallAppFullTitle=%1 移除

; *** Misc. common
InformationTitle=訊息
ConfirmTitle=確認
ErrorTitle=錯誤

; *** 安裝錯誤訊息
SetupLdrStartupMessage=現在將安裝 %1。您想要繼續嗎？
LdrCannotCreateTemp=不能建立臨時檔案。安裝中斷。
LdrCannotExecTemp=不能執行臨時目錄中的檔案。安裝中斷。

; *** 啟動錯誤訊息
LastErrorMessage=%1.%n%n錯誤 %2: %3
SetupFileMissing=安裝目錄中的檔案 %1 遺失。請修正這個問題或獲取一個新的程式副本。
SetupFileCorrupt=安裝檔案被破壞。請獲取一個新的程式副本。
SetupFileCorruptOrWrongVer=安裝檔案被破壞，或是與這個安裝程式的版本不相容。請修正這個問題或獲取新的程式副本。
InvalidParameter=無效的命令列參數: %n%n%1
SetupAlreadyRunning=安裝程式正在執行。
WindowsVersionNotSupported=這個程式不支援該版本的計算機執行。
WindowsServicePackRequired=這個程式要求%1服務包%1或更高。
NotOnThisPlatform=這個程式將不能執行於 %1。
OnlyOnThisPlatform=這個程式必須執行於 %1。
OnlyOnTheseArchitectures=這個程式只能在為下列處理器結構設計的 Windows 版本中進行安裝:%n%n%1
MissingWOW64APIs=你正在執行的 Windows 版不包含執行 64 位安裝程式所需的功能。要修正這個問題，請安裝 Service Pack %1。
WinVersionTooLowError=這個程式需要 %1 版本 %2 或更高。
WinVersionTooHighError=這個程式不能安裝於 %1 版本 %2 或更高。
AdminPrivilegesRequired=在安裝這個程式時您必須以管理員身份登入。
PowerUserPrivilegesRequired=在安裝這個程式時您必須以管理員身份或有權限的使用者組身份登入。
SetupAppRunningError=安裝程式發現 %1 目前正在執行。%n%n請先關閉所有執行的視窗，然後點擊「確定」繼續，或按「取消」結束。
UninstallAppRunningError=移除程式發現 %1 目前正在執行。%n%n請先關閉所有執行的視窗，然後點擊「確定」繼續，或按「取消」結束。

; *** 其它錯誤
ErrorCreatingDir=安裝程式不能建立目錄「%1」。
ErrorTooManyFilesInDir=不能在目錄「%1」中建立檔案，因為裡面的檔案太多

; *** 安裝程式公共訊息
ExitSetupTitle=結束安裝程式
ExitSetupMessage=安裝程式未完成安裝。如果您現在結束，您的程式將不能安裝。%n%n您可以以後再執行安裝程式完成安裝。%n%n結束安裝程式嗎？
AboutSetupMenuItem=關於安裝程式(&A)...
AboutSetupTitle=關於安裝程式
AboutSetupMessage=%1 版本 %2%n%3%n%n%1 首頁:%n%4
AboutSetupNote=
TranslatorNote=

; *** 按鈕
ButtonBack=< 上一步(&B)
ButtonNext=下一步(&N) >
ButtonInstall=安裝(&I)
ButtonOK=確定
ButtonCancel=取消
ButtonYes=是(&Y)
ButtonYesToAll=全是(&A)
ButtonNo=否(&N)
ButtonNoToAll=全否(&O)
ButtonFinish=完成(&F)
ButtonBrowse=瀏覽(&B)...
ButtonWizardBrowse=瀏覽(&R)...
ButtonNewFolder=新增檔案夾(&M)

; *** 「選取語言」對話方塊訊息
SelectLanguageTitle=選取安裝語言
SelectLanguageLabel=選取安裝時要使用的語言:

; *** 公共嚮導文字
ClickNext=點擊「下一步」繼續，或點擊「取消」結束安裝程式。
BeveledLabel=
BrowseDialogTitle=瀏覽檔案夾
BrowseDialogLabel=在下列清單中選取一個檔案夾，然後點擊「確定」。
NewFolderName=新增檔案夾

; *** 「歡迎」嚮導頁
WelcomeLabel1=歡迎使用 [name] 安裝嚮導
WelcomeLabel2=現在將安裝 [name/ver] 到您的電腦中。%n%n推薦您在繼續安裝前關閉所有其它應用程式。

; *** 「密碼」嚮導頁
WizardPassword=密碼
PasswordLabel1=這個安裝程式有密碼保護。
PasswordLabel3=請輸入密碼，然後點擊「下一步」繼續。密碼區分大小寫。
PasswordEditLabel=密碼(&P):
IncorrectPassword=您輸入的密碼不正確，請重試。

; *** 「許可協議」嚮導頁
WizardLicense=許可協議
LicenseLabel=繼續安裝前請閱讀下列重要訊息。
LicenseLabel3=請仔細閱讀下列許可協議。您在繼續安裝前必須同意這些協議條款。
LicenseAccepted=我同意此協議(&A)
LicenseNotAccepted=我不同意此協議(&D)

; *** 「訊息」嚮導頁
WizardInfoBefore=訊息
InfoBeforeLabel=請在繼續安裝前閱讀下列重要訊息。
InfoBeforeClickLabel=如果您想繼續安裝，點擊「下一步」。
WizardInfoAfter=訊息
InfoAfterLabel=請在繼續安裝前閱讀下列重要訊息。
InfoAfterClickLabel=如果您想繼續安裝，點擊「下一步」。

; *** 「使用者訊息」嚮導頁
WizardUserInfo=使用者訊息
UserInfoDesc=請輸入您的訊息。
UserInfoName=使用者名(&U):
UserInfoOrg=組織(&O):
UserInfoSerial=序號(&S):
UserInfoNameRequired=您必須輸入名字。

; *** 「選取目標目錄」嚮導面
WizardSelectDir=選取目標位置
SelectDirDesc=您想將 [name] 安裝在什麼地方？
SelectDirLabel3=安裝程式將安裝 [name] 到下列檔案夾中。
SelectDirBrowseLabel=點擊「下一步」繼續。如果您想選取其它檔案夾，點擊「瀏覽」。
DiskSpaceMBLabel=至少需要有 [mb] MB 的可用磁碟空間。
CannotInstallToNetworkDrive=安裝程式無法安裝到一個網路磁碟機。
CannotInstallToUNCPath=安裝程式無法安裝到一個UNC路徑。
InvalidPath=您必須輸入一個帶磁碟機磁碟區標籤的完整路徑，例如:%n%nC:\APP%n%n或下列形式的 UNC 路徑:%n%n\\server\share
InvalidDrive=您選擇的磁碟機或 UNC 共用不存在或不能存取。請選選取其它位置。
DiskSpaceWarningTitle=沒有足夠的磁碟空間
DiskSpaceWarning=安裝程式至少需要 %1 KB 的可用空間才能安裝，但選擇磁碟機只有 %2 KB 的可用空間。%n%n您一定要繼續嗎？
DirNameTooLong=檔案夾名或路徑太長。
InvalidDirName=檔案夾名是無效的。
BadDirName32=檔案夾名不能包含下列任何字元:%n%n%1
DirExistsTitle=檔案夾存在
DirExists=檔案夾:%n%n%1%n%n已經存在。您一定要安裝到這個檔案夾中嗎？
DirDoesntExistTitle=檔案夾不存在
DirDoesntExist=檔案夾:%n%n%1%n%n不存在。您想要建立此目錄嗎？

; *** 「選取組件」嚮導頁
WizardSelectComponents=選取組件
SelectComponentsDesc=您想安裝哪些程式的組件？
SelectComponentsLabel2=選取您想要安裝的組件；清除您不想安裝的組件。然後點擊「下一步」繼續。
FullInstallation=完全安裝
; if possible don't translate 'Compact' as 'Minimal' (I mean 'Minimal' in your language)
CompactInstallation=簡潔安裝
CustomInstallation=自訂安裝
NoUninstallWarningTitle=組件存在
NoUninstallWarning=安裝程式偵測到下列組件已在您的電腦中安裝。:%n%n%1%n%n取消選擇這些組件將不能移除它們。%n%n您一定要繼續嗎？
ComponentSize1=%1 KB
ComponentSize2=%1 MB
ComponentsDiskSpaceMBLabel=目前選取的組件至少需要 [mb] MB 的磁碟空間。

; *** 「選取附加工作」嚮導頁
WizardSelectTasks=選取附加工作
SelectTasksDesc=您想要安裝程式執行哪些附加工作？
SelectTasksLabel2=選取您想要安裝程式在安裝 [name] 時執行的附加工作，然後點擊「下一步」。

; *** 「選取開始功能表檔案夾」嚮導頁
WizardSelectProgramGroup=選取開始功能表檔案夾
SelectStartMenuFolderDesc=您想在哪裡放置程式的捷徑？
SelectStartMenuFolderLabel3=安裝程式現在將在下列開始功能表檔案夾中建立程式的捷徑。
SelectStartMenuFolderBrowseLabel=點擊「下一步」繼續。如果您想選取其它檔案夾，點擊「瀏覽」。
MustEnterGroupName=您必須輸入一個檔案夾名。
GroupNameTooLong=檔案夾名或路徑太長。
InvalidGroupName=檔案夾名是無效的。
BadGroupName=檔案夾名不能包含下列任何字元:%n%n%1
NoProgramGroupCheck2=不建立開始功能表檔案夾(&D)

; *** 「準備安裝」嚮導頁
WizardReady=準備安裝
ReadyLabel1=安裝程式現在準備開始安裝 [name] 到您的電腦中。
ReadyLabel2a=點擊「安裝」繼續此安裝程式。如果您想要回顧或改變設定，請點擊「上一步」。
ReadyLabel2b=點擊「安裝」繼續此安裝程式?
ReadyMemoUserInfo=使用者訊息:
ReadyMemoDir=目標位置:
ReadyMemoType=安裝類型:
ReadyMemoComponents=選擇組件:
ReadyMemoGroup=開始功能表檔案夾:
ReadyMemoTasks=附加工作:

; *** 「正在準備安裝」嚮導頁
WizardPreparing=正在準備安裝
PreparingDesc=安裝程式正在準備安裝 [name] 到您的電腦中。
PreviousInstallNotCompleted=先前程式的安裝/移除未完成。您需要重新啟動您的電腦才能完成安裝。%n%n在重新啟動電腦後，再執行安裝完成 [name] 的安裝。
CannotContinue=安裝程式不能繼續。請點擊「取消」結束。
ApplicationsFound=下列應用程式正在使用的檔案需要更新設定。它是建議您允許安裝程式自動關閉這些應用程式。
ApplicationsFound2=下列應用程式正在使用的檔案需要更新設定。它是建議您允許安裝程式自動關閉這些應用程式。安裝完成後，安裝程式將嘗試重新啟動應用程式。
CloseApplications=自動關閉該應用程式(&A)
DontCloseApplications=不要關閉該應用程式(D)
ErrorCloseApplications=安裝程式無法自動關閉所有應用程式。在繼續之前，我們建議您關閉所有使用需要更新的安裝程式檔案。

; *** 「正在安裝」嚮導頁
WizardInstalling=正在安裝
InstallingLabel=安裝程式正在安裝 [name] 到您的電腦中，請等待。

; *** 「安裝完成」嚮導頁
FinishedHeadingLabel=[name] 安裝嚮導完成
FinishedLabelNoIcons=安裝程式已在您的電腦中安裝了 [name]。
FinishedLabel=安裝程式已在您的電腦中安裝了 [name]。此應用程式可以通過選取安裝的捷徑執行。
ClickFinish=點擊「完成」結束安裝程式。
FinishedRestartLabel=要完成 [name] 的安裝，安裝程式必須重新啟動您的電腦。您想現在重新啟動嗎？
FinishedRestartMessage=要完成 [name] 的安裝，安裝程式必須重新啟動您的電腦。%n%n您想現在重新啟動嗎？
ShowReadmeCheck=是，您想查閱自述檔案
YesRadio=是，立即重新啟動電腦(&Y)
NoRadio=否，稍後重新啟動電腦(&N)
; 用於象「執行 MyProg.exe」
RunEntryExec=執行 %1
; 用於象「查閱 Readme.txt」
RunEntryShellExec=查閱 %1

; *** 「安裝程式需要下一張磁碟」提示
ChangeDiskTitle=安裝程式需要下一張磁碟
SelectDiskLabel2=請插入磁碟 %1 並點擊「確定」。%n%n如果這個磁碟中的檔案不能在不同於下列顯示的檔案夾中找到，輸入正確的路徑或點擊「瀏覽」。
PathLabel=路徑(&P):
FileNotInDir2=檔案「%1」不能在「%2」定位。請插入正確的磁碟或選取其它檔案夾。
SelectDirectoryLabel=請指定下一張磁碟的位置。

; *** 安裝狀態訊息
SetupAborted=安裝程式未完成安裝。%n%n請修正這個問題並重新執行安裝程式。
EntryAbortRetryIgnore=點擊「重試」進行重試，點擊「忽略」繼續，或點擊「中斷」取消安裝。

; *** 安裝狀態訊息
StatusClosingApplications=正在關閉應用程式...
StatusCreateDirs=正在建立目錄...
StatusExtractFiles=正在解壓縮檔案...
StatusCreateIcons=正在建立捷徑...
StatusCreateIniEntries=正在建立 INI 項目...
StatusCreateRegistryEntries=正在建立註冊表項目...
StatusRegisterFiles=正在註冊檔案...
StatusSavingUninstall=正在儲存移除訊息...
StatusRunProgram=正在完成安裝...
StatusRestartingApplications=正在重啟應用程式...
StatusRollback=正在還原變更...

; *** 其它錯誤
ErrorInternal2=內部錯誤: %1
ErrorFunctionFailedNoCode=%1 失敗
ErrorFunctionFailed=%1 失敗；代碼 %2
ErrorFunctionFailedWithMessage=%1 失敗；代碼 %2.%n%3
ErrorExecutingProgram=不能執行檔案:%n%1

; *** 註冊表錯誤
ErrorRegOpenKey=錯誤開啟註冊表鍵:%n%1\%2
ErrorRegCreateKey=錯誤建立註冊表鍵:%n%1\%2
ErrorRegWriteKey=錯誤寫入註冊表鍵:%n%1\%2

; *** INI 錯誤
ErrorIniEntry=在檔案「%1」建立 INI 項目錯誤。

; *** 檔案複製錯誤
FileAbortRetryIgnore=點擊「重試」進行重試，點擊「忽略」跳過這個檔案 (不推薦)，或點擊「中斷」取消安裝。
FileAbortRetryIgnore2=點擊「重試」進行重試，點擊「忽略」繼續處理 (不推薦)，或點擊「中斷」取消安裝。
SourceIsCorrupted=源檔案被破壞
SourceDoesntExist=源檔案「%1」不存在
ExistingFileReadOnly=現有的檔案標記為唯讀。%n%n點擊「重試」刪除唯讀屬性後再試，點擊「忽略」跳過這個檔案，或點擊「取消」結束安裝。
ErrorReadingExistingDest=嘗試讀了現有的檔案時發生一個錯誤:
FileExists=檔案已經存在。%n%n您想要安裝程式覆寫它嗎？
ExistingFileNewer=現有的檔案新與安裝程式要安裝的檔案。推薦您保留現有檔案。%n%n您想要保留現有的檔案嗎？
ErrorChangingAttr=嘗試改變下列現有的檔案的屬性時發生一個錯誤:
ErrorCreatingTemp=嘗試在目標目錄建立檔案時發生一個錯誤:
ErrorReadingSource=嘗試讀取下列源檔案時發生一個錯誤:
ErrorCopying=嘗試複製下列檔案時發生一個錯誤:
ErrorReplacingExistingFile=嘗試替換現有的檔案時發生錯誤:
ErrorRestartReplace=重啟電腦後替換檔案失敗:
ErrorRenamingTemp=嘗試重新命名以下目標目錄中的一個檔案時發生錯誤:
ErrorRegisterServer=不能註冊 DLL/OCX: %1
ErrorRegSvr32Failed=RegSvr32 失敗；結束代碼 %1
ErrorRegisterTypeLib=不能註冊類型庫: %1

; *** 安裝後錯誤
ErrorOpeningReadme=當嘗試開啟自述檔案時發生一個錯誤。
ErrorRestartingComputer=安裝程式不能重新啟動電腦，請手動重啟。

; *** 移除訊息
UninstallNotFound=檔案「%1」不存在。不能移除。
UninstallOpenError=檔案「%1」不能開啟。不能移除
UninstallUnsupportedVer=移除日誌檔案「%1」有未被這個版本的移除器承認的格式。不能移除
UninstallUnknownEntry=在移除日誌中遇到一個未知的項目 (%1)
ConfirmUninstall=您確認想要完全刪除 %1 及它的所有組件嗎？
UninstallOnlyOnWin64=這個安裝程式只能在 64 位 Windows 中進行移除。
OnlyAdminCanUninstall=這個安裝的程式只能是有管理員權限的使用者才能移除。
UninstallStatusLabel=正在從您的電腦中刪除 %1，請等待。
UninstalledAll=%1 已順利地從您的電腦中刪除。
UninstalledMost=%1 移除完成。%n%n有一些內容不能被刪除。您可以手工刪除它們。
UninstalledAndNeedsRestart=要完成 %1 的移除，您的電腦必須重新啟動。%n%n您現在想重新啟動電腦嗎？
UninstallDataCorrupted=「%1」檔案被破壞，不能移除

; *** 移除狀態訊息
ConfirmDeleteSharedFileTitle=刪除共用檔案嗎？
ConfirmDeleteSharedFile2=系統中包含的下列共用檔案已經不被其它程式使用。您想要移除程式刪除這些共用檔案嗎？%n%n如果這些檔案被刪除，但還有程式正在使用這些檔案，這些程式可能不能正確執行。如果您不能確定，選取「否」。把這些檔案保留在系統中以免引起問題。
SharedFileNameLabel=檔案名:
SharedFileLocationLabel=位置:
WizardUninstalling=移除狀態
StatusUninstalling=正在移除 %1...

; *** Shutdown block reasons
ShutdownBlockReasonInstallingApp=正在安裝 %1.
ShutdownBlockReasonUninstallingApp=正在移除 %1.

; The custom messages below aren't used by Setup itself, but if you make
; use of them in your scripts, you'll want to translate them.

[CustomMessages]

NameAndVersion=%1 版本 %2
AdditionalIcons=附加捷徑:
CreateDesktopIcon=建立桌面捷徑(&D)
CreateQuickLaunchIcon=建立快速執行列捷徑(&Q)
ProgramOnTheWeb=%1 網站
UninstallProgram=移除 %1
LaunchProgram=執行 %1
AssocFileExtension=將 %2 檔案副檔名與 %1 建立關聯(&A)
AssocingFileExtension=正在將 %2 檔案副檔名與 %1 建立關聯...
AutoStartProgramGroupDescription=啟動組:
AutoStartProgram=自動啟動 %1
AddonHostProgramNotFound=%1無法找到您所選取的檔案夾。%n%n你想繼續嗎？

