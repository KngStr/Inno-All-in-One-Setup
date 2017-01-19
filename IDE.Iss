//Author      : KngStr
//Link        : http://www.kngstr.com/
//Description :
//Modified    : 2013-11-14 11:40:59
//Tested Inno :

[Components]
Name: IDE; Description: {cm:Inno} ½Å±¾±à¼­Æ÷; Types: full compact custom
Name: IDE\Compile; Description: Inno Setup Compiler; Flags: exclusive disablenouninstallwarning; Types: custom compact full
Name: IDE\Restools; Description: Restools ±à¼­Æ÷ÔöÇ¿°æ ({#IDE_Restools}); Flags: exclusive disablenouninstallwarning; Types: custom compact full
Name: IDE\SkyGz; Description: SkyGz ±à¼­Æ÷ÔöÇ¿°æ  ({#IDE_SkyGz}); Flags: exclusive disablenouninstallwarning;

;¸÷ÖÖ±àÒëÆ÷
;#include "InnoIDE.iss"
#include "ISStudio\ISStudio.iss"
;#include "ISTool.iss"

[Components]
Name: ISCC; Description: ÃüÁîÐÐ±àÒëÆ÷; Flags: disablenouninstallwarning; Types: custom compact full
Name: ISCC\ISCC; Description: Inno Setup Command-Line Compiler; Flags: exclusive disablenouninstallwarning; Types: custom compact full
Name: ISCC\KngStr; Description: KngStr Command-Line Compiler ({#IDE_KngStr_ISCC}); Flags: exclusive disablenouninstallwarning;

[Registry]
Root: HKCU; SubKey: Software\Jordan Russell; Flags: uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup; Flags: uninsdeletekeyifempty
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: ShowStartupForm; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: UseWizard; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: Autosave; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: MakeBackups; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: FullPathInTitleBar; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: UndoAfterSave; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: PauseOnDebuggerExceptions; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: RunAsDifferentUser; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: AutoComplete; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: UseSynHigh; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: UnderlineErrors; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorCursorPastEOL; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: TabWidth; ValueData: 2; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: UseTabCharacter; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: WordWrap; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: AutoIndent; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: IndentationGuides; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorFontName; ValueData: Courier New; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorFontSize; ValueData: 10; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: EditorFontCharset; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: ShowToolbar; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: ShowStatusBar; ValueData: 1; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: LowPriorityDuringCompile; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
Root: HKCU; SubKey: Software\Jordan Russell\Inno Setup\Options; ValueType: string; ValueName: Zoom; ValueData: 0; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: not IDE\Restools and EasySets\EditorSet
