#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include <prsht.h>
#include <queue>
#include <setupapi.h>

// !!!DEBUG
#include <shlobj.h>

#pragma warning(disable: 4786)
#pragma warning(disable: 4503)

#include "InnoUninstallLog.h"
#include "V_Bl20_Hlplib.h"
#include "hotkey.h"
#include "SoftwareUninstallEntry.h"
#include "RegistryUtility.h"

const char* INSTALL_WINDOW_CLASS = "TMainForm";

const DWORD DIRECTORY_IGNORE_MASK = FILE_ATTRIBUTE_HIDDEN|FILE_ATTRIBUTE_SYSTEM|FILE_ATTRIBUTE_TEMPORARY;


typedef struct
{
	char Source[_MAX_PATH+1];
	char Dest[MAX_PATH+1];
}FILENAME_PAIR;


#ifdef __cplusplus
extern "C"{
#endif
WM_MOUSEMOVE
long WINAPI	 FindFileRecursive(long lStart,long param2);
long WINAPI  FaOutputDebugString(long string,long param2);
long WINAPI  RecursiveCopyIntoSubdir(long lDir,long lSubdir);
long WINAPI  InnoUninstallLog_Read(long fname, long param2);
long WINAPI  InnoUninstallLog_CreateTextLog(long fname, long param2);
long WINAPI  InnoUninstallLog_FindFirstRecord(long pattern, long param2kp);
long WINAPI  InnoUninstallLog_FindNextRecord(long pattern, long param2kp);
long WINAPI  InnoUninstallLog_FindGetExtraData(long param1, long param2);
long WINAPI  InnoUninstallLog_PerformUninstall(long pattern, long param2kp);
long WINAPI  InnoUninstallLog_Cleanup(long param1, long param2);
long WINAPI	 InnoUninstallLog_GetLogHeader(char* lpLogId,long nLogId,char* lpAppId,long nAppId,char* lpAppName,long nAppName,long* lpVersion,long* lpNumRecords,unsigned long* lpEndOffset,long* lpFlags,long* lpCRC);  
long WINAPI	 InnoUninstallLog_FindGetExtraDataFlags(char* lpData,long nData);

long WINAPI  CopyRegistryKey(long source,long dest);
long WINAPI	 Shortcut_BuildList(long param1,long param2);
long WINAPI  Shortcut_DestroyList(long param1,long param2);
long WINAPI  Shortcut_GetListCount(long param1,long param2);
long WINAPI  Shortcut_GetProperty(long nShortcut,long PropertyId);
long WINAPI  Shortcut_IsDefined(long ShortcutString,long param2);
long WINAPI  Shortcut_Select(long CommandLine,long ShortcutIndex);
long WINAPI  Shortcut_GetSelCount(long param1,long param2);
long WINAPI  Shortcut_ModifyItem(long shortcut,long index);
long WINAPI  Shortcut_IsItemSelected(long index,long param2);
long WINAPI  Shortcut_Delete(long index,long param2);

long WINAPI  UninstallList_Build(long param1, long param2);
long WINAPI  UninstallList_Destroy(long param1, long param2);
long WINAPI	 UninstallList_SelectByIndex(long index,long sel);
long WINAPI	 UninstallList_Select(long commanline_str,long arg_str);
long WINAPI	 UninstallList_GetSelCount(long param1, long param2);
long WINAPI	 UninstallList_GetCount(long param1, long param2);
long WINAPI	 UninstallList_RestoreEntrys(long RegBackupPath_str, long DelBackupPath);
long WINAPI	 UninstallList_MoveEntrys(long RegBackupPath_str, long EntryIndex);
long WINAPI	 UninstallList_GetItemProperty(long PropertyName_str, long EntryIndex);
long WINAPI	 UninstallList_GetItemName(long param1, long EntryIndex);
long WINAPI	 UninstallList_IsItemSelected(long param1, long EntryIndex);
long WINAPI	 UninstallList_DeleteEntrys(long param1, long EntryIndex);

long WINAPI	 CopyTree(long sourcedir, long destdir);

long WINAPI	CheckUserCredentials(long username,long password);

// Nach dem Öffnen einer Registry-Node kann man Infos besorgen, durch 
// Subkeys und Werte browsen etc. Die Open-Funktion liefert 0 bei Erfolg.
long WINAPI	RegNode_Open(long RegPath,long param2);
long WINAPI	RegNode_Close(long param1, long param2);

// Ermitteln der Anzahl von Subkeys
long WINAPI	RegNode_GetSubkeyCount(long param1, long param2);
// Welche Stringlänge muß man für einen Subkey vorsehen
long WINAPI RegNode_GetMaxSubkeyLen(long param1, long param2);
// Stringlänge Valuenamen ermitteln
long WINAPI	RegNode_GetMaxValueNameLen(long param1, long param2);
// Anzahl vorhandener Values abfragen
long WINAPI	RegNode_GetValueCount(long param1, long param2);

// Ermittelt den Namen eines Unterschlüssels. Liefert einen Zeiger auf 
// einen String zurück. Dieser ist garantiert bis zum nächsten Aufruf
// einer RegNode_xxx funktion gültig.
long WINAPI	RegNode_GetSubkeyName(long index, long param2);

long WINAPI	RegNode_GetValueName(long index, long param2);

// Bei Fehler: letzten Systemfehler bei Reg-Zugriff ermitteln
long WINAPI	RegNode_GetLastError(long param1, long param2);

#ifdef __cplusplus
}
#endif


DWORD CopyDirectory(TCHAR* sourcepath, TCHAR* destpath, TCHAR* supresspath);
DWORD FFRSearchLogicalDrive(char* searchname,char* Drivename,char* ErgBuf,DWORD BufSize);
DWORD FFRSearchFileRecurseSubdirs(char* searchname,char* path, char* ErgBuf,DWORD BufSize);





// Globale Variablen des Module
HINSTANCE		MyInst;

char			InstallDir[MAX_PATH+1];
HWND			hwndInstall = NULL;			// Benötigt, um die Wizards zu verankern



C_InnoUninstallLog UninstallLog;

C_HotkeyList HotkeyList;

C_SoftwareUninstallList SoftwareUninstallList;

C_RegistryNode*	RegNode = NULL;


//*********************************************************************************
// Die DLL-Main-Funktion
//
// Hier wird vor allem die Instanz der DLL besórgt!
//*********************************************************************************
BOOL WINAPI DllMain(HINSTANCE hInst,ULONG ulReaCll,LPVOID lpResV)
{
switch(ulReaCll)
	{
	case DLL_PROCESS_ATTACH:
		MyInst = (HINSTANCE)hInst;
//		StringParser.InitializeStandardConstants(hInst);
		break;
	case DLL_THREAD_ATTACH:
		break;
	case DLL_THREAD_DETACH:
		break;
	case DLL_PROCESS_DETACH:
		break;
	}
return(TRUE);
}




//*****************************************************************************
// Reads a uninstall log file into the UninstallLog data object.  
//
// Param 1 contains the filename of the logfile, param2 contains Flag(s)
//*****************************************************************************
//long WINAPI  InnoUninstallLog_Read(long fname, long param2)
long WINAPI  InnoUninstallLog_Read(char* fname, long flag)
{
	char* string = (char*) fname;
	DWORD dwRetVal = 0;

	dwRetVal =  UninstallLog.Read(string,flag);

	return dwRetVal;
};


long WINAPI	 InnoUninstallLog_FindGetExtraDataFlags(char* lpData,long nData)
{

	char Buffer[1000];
	Buffer[0] = '\0';

	DWORD dwEd = UninstallLog.FindGetExtradata();
	DWORD dwEt = UninstallLog.FindGetEntryType();
	switch(dwEt)
	{
	case utRun:
		if(dwEd&utRun_NoWait)
			strcat(Buffer,"NoWait ");

		if(dwEd&utRun_WaitUntilIdle)
			strcat(Buffer,"WaitUntilIdle ");
		if(dwEd&utRun_ShellExec)
			strcat(Buffer,"ShellExec ");
		if(dwEd&utRun_RunMinimized)
			strcat(Buffer,"RunMinimized ");
		if(dwEd&utRun_RunMaximized)
			strcat(Buffer,"RunMaximized ");
		if(dwEd&utRun_SkipIfDoesntExist)
			strcat(Buffer,"SkipIfDoesntExist ");
		if(dwEd&utRun_RunHidden)
			strcat(Buffer,"RunHidden ");
		if(dwEd&utRun_ShellExecRespectWaitFlags)
			strcat(Buffer,"ShellExecRespectWaitFlags ");
		if(dwEd&utRun_DisableFsRedir)
			strcat(Buffer,"DisableFsRedir ");
		break;

	case utDeleteFile:
		if(dwEd&utDeleteFile_ExistedBeforeInstall)
			strcat(Buffer,"ExistedBeforeInstall ");
		if(dwEd&utDeleteFile_Extra)
			strcat(Buffer,"Extra ");
		if(dwEd&utDeleteFile_IsFont)
			strcat(Buffer,"IsFont ");
		if(dwEd&utDeleteFile_SharedFile)
			strcat(Buffer,"SharedFile ");
		if(dwEd&utDeleteFile_RegisteredServer)
			strcat(Buffer,"RegisteredServer ");
		if(dwEd&utDeleteFile_CallChangeNotify)
			strcat(Buffer,"CallChangeNotify ");
		if(dwEd&utDeleteFile_RegisteredTypeLib)
			strcat(Buffer,"RegisteredTypeLib ");
		if(dwEd&utDeleteFile_RestartDelete)
			strcat(Buffer,"RestartDelete ");
		if(dwEd&utDeleteFile_RemoveReadOnly)
			strcat(Buffer,"RemoveReadOnly ");
		if(dwEd&utDeleteFile_NoSharedFilePrompt )
			strcat(Buffer,"NoSharedFilePrompt ");
		if(dwEd&utDeleteFile_SharedFileIn64BitKey)
			strcat(Buffer,"SharedFileIn64BitKey ");
		if(dwEd&utDeleteFile_DisableFsRedir)
			strcat(Buffer,"DisableFsRedir  ");

		break;

	case utDeleteDirOrFiles:

		if(dwEd&utDeleteDirOrFiles_Extra)
			strcat(Buffer,"Extra ");
		if(dwEd&utDeleteDirOrFiles_IsDir)
			strcat(Buffer,"IsDir ");
		if(dwEd&utDeleteDirOrFiles_DeleteFiles)
			strcat(Buffer,"DeleteFiles ");
		if(dwEd&utDeleteDirOrFiles_DeleteSubdirsAlso )
			strcat(Buffer,"DeleteSubdirsAlso ");
		if(dwEd&utDeleteDirOrFiles_CallChangeNotify)
			strcat(Buffer,"CallChangeNotify ");
		if(dwEd&utDeleteDirOrFiles_DisableFsRedir)
			strcat(Buffer,"DisableFsRedir ");
		break;


	case utIniDeleteSection:
		if(dwEd&utIniDeleteSection_OnlyIfEmpty)
			strcat(Buffer,"OnlyIfEmpty ");
		break;

	case utRegDeleteEntireKey:
	case utRegClearValue:
	case utRegDeleteKeyIfEmpty:
	case utRegDeleteValue:
		if(dwEd&utReg_64BitKey)
			strcat(Buffer,"64BitKey ");
		break;

	case utDecrementSharedCount:
		if(dwEd&utDecrementSharedCount_64BitKey)
			strcat(Buffer,"64BitKey ");
		break;
	}

	// Eins verkürzen (Leerzeichen)
	long dwLen = strlen(Buffer);
	if(dwLen==0)
		return 0;
	dwLen--;

	if(nData<dwLen)
		dwLen = nData;

	strncpy(lpData,Buffer,dwLen);

	return dwLen;
}


long WINAPI	 InnoUninstallLog_GetLogHeader(char* lpLogId,long nLogId,char* lpAppId,long nAppId,char* lpAppName,long nAppName,long* lpVersion,long* lpNumRecords,unsigned long* lpEndOffset,long* lpFlags,long* lpCRC)
{
	INNO_LOGHEADER* lh = UninstallLog.GetLogHeader();
	if(lh==NULL)
		return 0;

	if(lpLogId)
		strncpy(lpLogId,lh->UninstallLogId,nLogId);
	if(lpAppId)
		strncpy(lpAppId,lh->AppId,nAppId);
	if(lpAppName)
		strncpy(lpAppName,lh->AppName,nAppName);
	if(lpVersion)
		*lpVersion = lh->Version;
	if(lpNumRecords)
		*lpNumRecords = lh->NumRecords;
	if(lpEndOffset)
		*lpEndOffset = lh->EndOffset;
	if(lpFlags)
		*lpFlags = lh->Flags;
	if(lpCRC)
		*lpCRC = lh->CRC;

	return 1;
}


//*****************************************************************************
// Writes the data in the UninstallLog object into the text file with the 
// name fname
//*****************************************************************************
//long WINAPI  InnoUninstallLog_CreateTextLog(long fname, long param2)
long WINAPI  InnoUninstallLog_CreateTextLog(char* fname)
{
	char* string = (char*) fname;
	return UninstallLog.CreateTextLog(string);
};


//*****************************************************************************
// Find the first record that matches the search pattern and the record type
// that is a part of the combination parameter param2kp and sets the internal
// pointer of the object to that entry. 
//
// The loword of param2kp contains the record type or 0 if all records of every
// record type should be found. The highword of param2kp is the string index 
// of the string that should match with pattern.

// returns TRUE if a matching record is found.

// For additional information look in InnoUninstallLog.cpp/h.
//*****************************************************************************
long WINAPI  InnoUninstallLog_FindFirstRecord(char* pattern, long RecordType, long PatternStringIndex)
{
	char* string = (char*) pattern;

	
//	WORD PatternStringIndex = HIWORD(param2kp);

	return UninstallLog.FindFirstRecord(RecordType,string,PatternStringIndex);
	
};

//*****************************************************************************
// Find the first record that matches the search pattern and the record type
// that is a part of the combination parameter param2kp and sets the internal
// pointer of the object to that entry. 
//
// The loword of param2kp contains the record type or 0 if all records of every
// record type should be found. The highword of param2kp is the string index 
// of the string that should match with pattern.

// returns TRUE if a matching record is found.

// For additional information look in InnoUninstallLog.cpp/h.
//*****************************************************************************
long WINAPI  InnoUninstallLog_FindNextRecord(char* pattern, long RecordType, long PatternStringIndex)
{
	char* string = (char*) pattern;

	//WORD RecordType = LOWORD(param2kp);
	//WORD PatternStringIndex = HIWORD(param2kp);

	return UninstallLog.FindNextRecord(RecordType,string,PatternStringIndex);

};


//*****************************************************************************
// Get a string of the logfile entry that is referenced by the internal pointer
// of the uninstall object. 
//
// In most cases the needed strings are at index 0. If that is not the right one,
// look into the source of InnoSetup for the "uninstallLog.Add" calls for this
// record type. 
//
// The returned string is valid until the next InnoUninstallLog function is 
// called.
//*****************************************************************************
long WINAPI  InnoUninstallLog_FindGetString(long StringIndex,char* lpStr,LONG cc)
{
	
	return UninstallLog.FindGetString(StringIndex,lpStr,cc);
	
	return 0;
};


long WINAPI InnoUninstallLog_FindGetEntryType(void)
{
	return UninstallLog.FindGetEntryType();
}

long WINAPI InnoUninstallLog_FindGetParamCount(void)
{
	return UninstallLog.FindGetParamCount();
}


//*****************************************************************************
// Get the extradata field of the logfile entry that is referenced by the internal pointer
// of the uninstall object. 
//
//*****************************************************************************
long WINAPI  InnoUninstallLog_FindGetExtraData(void)
{

	return UninstallLog.FindGetExtradata();

};



//*****************************************************************************
// Performs a uninstall on all entrys that matches the pattern and the record type
// (look at InnoUninstallLog_Findxxx). 
//
// !!! The implementation do not uninstall all record types. Look at the comments
// in the file InnoUninstallLog.cpp !!! (feel free to implement more)
//*****************************************************************************
long WINAPI  InnoUninstallLog_PerformUninstall(char* pattern, long RecordType, long PatternStringIndex)
{
	char* string = (char*) pattern;

	//WORD RecordType = LOWORD(param2kp);
	//WORD PatternStringIndex = HIWORD(param2kp);


	return UninstallLog.DoUninstall(RecordType,string,PatternStringIndex);

};

//*****************************************************************************
// This fonction frees all data stored in the log object. 
//*****************************************************************************
long WINAPI  InnoUninstallLog_Cleanup(long param1, long param2)
{

	return UninstallLog.Cleanup();

};



//*****************************************************************************
// Build up a list of all uninstall registry entrys
//*****************************************************************************
long WINAPI  UninstallList_Build(long param1, long param2)
{

	return SoftwareUninstallList.BuildList();

};

//*****************************************************************************
// Selects or deselects the entry that is refered by index
//*****************************************************************************
long WINAPI	 UninstallList_SelectByIndex(long index,long sel)
{
	return SoftwareUninstallList.SelectByIndex(index,sel);
};


//*****************************************************************************
// Set the selection of the list. In commandline are the switches what operation
// to perfom (add, replace, remove or subselect) and the switch uninstall_name 
// that can defines a selection from the uninstaller keyname in the registry.
// argstr contains values from that keys. A entry is selected if all args 
// are matching. Example: 
//
// commandline="/replace" 
// argstr = "DisplayName=SprachManager UninstallString>D:\Programme"
//
//*****************************************************************************
long WINAPI	 UninstallList_Select(long commandline_str,long arg_str)
{
	return SoftwareUninstallList.Select((char*)commandline_str,(char*)arg_str);
};

//*****************************************************************************
// Get the count of selected items in the list
//*****************************************************************************
long WINAPI	 UninstallList_GetSelCount(long param1, long param2)
{
	return SoftwareUninstallList.GetSelCount();
};

//*****************************************************************************
// Get the count of selected items in the list
//*****************************************************************************
long WINAPI	 UninstallList_GetCount(long param1, long param2)
{
	return SoftwareUninstallList.GetListCount();
};

//*****************************************************************************
// Restores all the uninstall entry that are subkeys under RegBackupPath.
//*****************************************************************************
long WINAPI	 UninstallList_RestoreEntrys(long RegBackupPath_str, long DelBackupPath)
{
	return SoftwareUninstallList.RestoreEntrys((char*)RegBackupPath_str,DelBackupPath);
};


//*****************************************************************************
// Destroys the list of uninstall registry entrys
//*****************************************************************************
long WINAPI  UninstallList_Destroy(long param1, long param2)
{

	return SoftwareUninstallList.DestroyList();

};

//*****************************************************************************
// Deletes one entry that is referred by EntryIndex or the whole selection 
// (if EntryIndex=-1) from the registry or the list.
//*****************************************************************************
long WINAPI	 UninstallList_DeleteEntrys(long param1, long EntryIndex)
{

	return SoftwareUninstallList.DeleteEntrys(EntryIndex);


};


//*****************************************************************************
// Move one entry that is referred by EntryIndex or the whole selection 
// (if EntryIndex=-1) to a backup location that is given in RegBackuppath.
//*****************************************************************************
long WINAPI	 UninstallList_MoveEntrys(long RegBackupPath_str, long EntryIndex)
{
	return SoftwareUninstallList.MoveEntrys((char*)RegBackupPath_str,EntryIndex);
};


//*****************************************************************************
// Get one property of the item with the list index EntryIndex.
// A Property is a value under the uninstaller reg key. 
// The returned string is valid as long as one of the get-functions is called
// again or the list is destroyed.
//*****************************************************************************
long WINAPI	 UninstallList_GetItemProperty(long PropertyName_str, long EntryIndex)
{
	return (long) SoftwareUninstallList.GetItemProperty((char*)PropertyName_str,EntryIndex);
};

//*****************************************************************************
// Get the name of the item with the list index EntryIndex.
// The name is the name of the subkey under the uninstll reg key.
// The returned string is valid as long as one of the get-functions is called
// again or the list is destroyed.
//*****************************************************************************
long WINAPI	 UninstallList_GetItemName(long param1, long EntryIndex)
{
	return (long) SoftwareUninstallList.GetItemName(EntryIndex);
};

//*****************************************************************************
// Returns TRUE if the item refered by EntryIndex is selected, and FALSE
// otherwise
//*****************************************************************************
long WINAPI	 UninstallList_IsItemSelected(long param1, long EntryIndex)
{
	return SoftwareUninstallList.IsItemSelected(EntryIndex);
};



//*****************************************************************************
// Nach dem Öffnen einer Registry-Node kann man Infos besorgen, durch 
// Subkeys und Werte browsen etc. Die Open-Funktion liefert 0 bei Erfolg.
//*****************************************************************************
long WINAPI	RegNode_Open(long RegPath,long param2)
{
	if(RegNode)
	{
		RegNode_Close(0,0);
	};
	
	RegNode = new C_RegistryNode;
	if(RegNode)
		return RegNode->Init((TCHAR*)RegPath);

	return 0;
};

//*****************************************************************************
//*****************************************************************************
long WINAPI	RegNode_Close(long param1, long param2)
{
	if(RegNode)
	{
		RegNode->Free();
		delete RegNode;
		RegNode = NULL;
	};
	return 0;
};

//*****************************************************************************
// Ermitteln der Anzahl von Subkeys
//*****************************************************************************
long WINAPI	RegNode_GetSubkeyCount(long param1, long param2)
{
	if(!RegNode)
		return 0;

	return RegNode->GetNumSubKeys();

	return 0;
};

//*****************************************************************************
// Welche Stringlänge muß man für einen Subkey vorsehen
//*****************************************************************************
long WINAPI RegNode_GetMaxSubkeyLen(long param1, long param2)
{
	if(!RegNode)
		return 0;

	return RegNode->GetMaxSubkeyNameLen();


	return 0;
};

//*****************************************************************************
// Stringlänge Valuenamen ermitteln
//*****************************************************************************
long WINAPI	RegNode_GetMaxValueNameLen(long param1, long param2)
{
	if(!RegNode)
		return 0;

	return RegNode->GetMaxValueNameLen();

	return 0;
};

//*****************************************************************************
// Anzahl vorhandener Values abfragen
//*****************************************************************************
long WINAPI	RegNode_GetValueCount(long param1, long param2)
{
	if(!RegNode)
		return 0;

	return RegNode->GetNumValues();

	return 0;
};

//*****************************************************************************
// Ermittelt den Namen eines Unterschlüssels. Liefert einen Zeiger auf 
// einen String zurück. Dieser ist garantiert bis zum nächsten Aufruf
// einer RegNode_xxx funktion gültig.
//*****************************************************************************
long WINAPI	RegNode_GetSubkeyName(long index, long param2)
{
	if(!RegNode)
		return 0;

	return (long) RegNode->GetSubkeyName(index);

	return 0;
};

//*****************************************************************************
//*****************************************************************************
long WINAPI	RegNode_GetValueName(long index, long param2)
{
	if(!RegNode)
		return 0;

	return (long) RegNode->GetValueName(index);

	return 0;
};

//*****************************************************************************
// Bei Fehler: letzten Systemfehler bei Reg-Zugriff ermitteln
//*****************************************************************************
long WINAPI	RegNode_GetLastError(long param1, long param2)
{
	if(!RegNode)
		return ERROR_NOACCESS;

	return RegNode->GetError();

	return 0;
};


//*****************************************************************************
// Builds the internaly list of shortcuts. The shortcuts being searched inside
// the start menu and the desktop, common and user.
// 
// If param1 <> 0 then the list contains all shortcuts inclusive that without 
// assigned hotkeys.  
//
// Param2 contains some bit flags for directorys to scan: 
//
// if bit 1 is set, the flags are used to determine which folders gets scanned
// If bit 2 (0x02) is set, the desktop folders are scanned for shortcuts.
// If bit 3 (0x04) is set, the start menu folders are scanned for shortcuts.
//
//*****************************************************************************
long WINAPI Shortcut_BuildList(long param1,long param2)
{

	return HotkeyList.BuildList(param1,param2);
};

//*****************************************************************************
// Destroy the shortcut list created by BuildList. 
//*****************************************************************************
long WINAPI Shortcut_DestroyList(long param1,long param2)
{
	return HotkeyList.DestroyList();
};


//*****************************************************************************
// Deletes one shortcut file (index!=-1) or the whole selection. The file is 
// been destroyed, and the representing item in the list is removed. 
//*****************************************************************************
long WINAPI  Shortcut_Delete(long index,long param2)
{
	return HotkeyList.DeleteShortcut(index);
};


//*****************************************************************************
// Retrieve the number of controlled list entrys in the hotkey list
//*****************************************************************************
long WINAPI Shortcut_GetListCount(long param1,long param2)
{
	return HotkeyList.GetListCount();
};


//*****************************************************************************
// Retrieves a string (char*, casted to long) that describes a specific property
// of a the list item with the index nShortcut. The property ID describes which
// property is returned. 
//
// The returned string is valid until the next call to this function or until
// the DLL is unloaded or until the function DestroyList is called. 
//
// Valid Property ID's (from Hotkey.h):
//
// PROPERTY_HOTKEY			Hotkey in human readable form (CTRL-ALT-B)
// PROPERTY_HOTKEY_VALUE	Hotkey in hexadecimal form (0x123)
// PROPERTY_SHORTCUTNAME	Name of the shortcut file ("Blindo20.lnk")
// PROPERTY_SHORTCUTPATH	Fully qualified path to the shortcut file
// PROPERTY_TARGETPATH		fully qualified path to the shortcuts target
// PROPERTY_ALL				All propertys as a array of string (strings
//							separated by NULL chars, trailing two NULL chars)
//							Order: Hotkey, Shortcut naem, Shortcut path,
//							targetpath, hotkey value
//*****************************************************************************
long WINAPI Shortcut_GetProperty(long nShortcut,long PropertyId)
{

	return (long) HotkeyList.GetItemProperty(nShortcut,PropertyId);
};




/*****************************************************************************
 Selects one or more shortcuts from the list. 
 - If ShortcutIndex is <> -1, the list entry refered by ShortcutIndex is selected. 
 - If ShortcutIndex is -1 and Commandline is NULL (0), all selections are cleared. 
 - If ShortcutIndex is -1 and Commandline is a pointer to a string, the string 
   get parsed for rules to select some shortcuts. 

Rules for the commandline: 

"/add"			the items matching the arguments are added to the selection
"/remove"		the matching items are removed from the selection
"/replace"		the entire selection is replaced by the matching items
"/subselect"	the items in the current selection matching the arguments keep
				selected, the other selections get cleared.

If no commandline arguments are specified, all list items matches. Every argument contains
a argument name, a operator and a string to compare. 

 Valid commandline operators are: 

"="		Identically ("ABC" is identically to "ABC" or "aBc", but not to "ABCDEF")
">"		Greater ("C:\Windows\System32" is greater than "C:\Windows")
"<"		less ("Test" is less than "Tester")

Valid commandline arguments are:

/shortcutname		The name of the shortcut file without extension and path
/shortcutpath		Drive and path to the shortcut file
/targetpath			Drive and path to the shortcut target
/targetname			The name of the target refered by the shortcut
/targetext			The extension of the target
/hotkey				The hotkey in decimal or hexadecimal form ("0x623" or "1724"
					for example). Valid is only the operator "=". 
					Example: "/hotkey=0x623"

Example: to select all targets to "C:\my documents" and subdirs with the extension "doc",
the following commandline is needed: 

"/replace /targetpath>"C:\my documents" /targetext=doc"

If there are spaces inside of arguments, it is needet to wrap the argument
like above (").

Return Value: The number of selected items. 
*****************************************************************************/
long WINAPI Shortcut_Select(long CommandLine,long ShortcutIndex)
{
	
	return HotkeyList.Select((char*)CommandLine,ShortcutIndex);

//	return 0;
};



//*****************************************************************************
// returns the count of selected hotkeys in the hotkey list
//*****************************************************************************
long WINAPI Shortcut_GetSelCount(long param1,long param2)
{
	
	return HotkeyList.GetSelCount();
//	return 0;
};

//*****************************************************************************
// Modifies or deletes the hotkey that is adressed by index. Deletes the selected
// hotkeys, if index is -1 and hotkey is 0. Does nothing if index is -1 and 
// hotkey <> 0, because it is not recommended to assign the same hotkey to more than
// one item.
//
// The hotkey is a WORD that is the value used by the OS to store the hotkeys 
// inside of the links. If you do not know the right value, assign a hotkey and
// query its property with PROPERTY_HOTKEY_VALUE.
//
// There is no translation of the human readable form of the hotkey back to the 
// numeric value. This has the reason that the strings that represents the keys
// differs from one language to another. 
//*****************************************************************************
long WINAPI Shortcut_ModifyItem(long hotkey,long index)
{
	return HotkeyList.ModifyHotkey(hotkey,index);

//	return 0;
};


//*****************************************************************************
//*****************************************************************************
long WINAPI Shortcut_IsItemSelected(long index,long param2)
{
	return HotkeyList.IsItemSelected(index);
};

//*****************************************************************************
// Benutzt das Logon-API, um Usernamen und Password (unter NT Betriebssystemen)
// zu überprüfen. Liefert ERROR_SUCCESS, wenn die Überprüfung erfolgreich war,
// oder den entsprechenden Fehlercode. 
//
//*****************************************************************************
long WINAPI	CheckUserCredentials(long lusername,long lpassword)
{
	HANDLE hToken = INVALID_HANDLE_VALUE;

	TCHAR* UserName = (TCHAR*)lusername;
	TCHAR* PassWord = (TCHAR*)lpassword;

	BOOLEAN bRes = LogonUser(UserName,NULL,PassWord,LOGON32_LOGON_INTERACTIVE,LOGON32_PROVIDER_DEFAULT,&hToken);

	if(bRes == FALSE)
	{
		DWORD dwErr = GetLastError();
		return GetLastError();
	}
	else
	{
		CloseHandle(hToken);
		return ERROR_SUCCESS;
	};

	return 0;
};


//*****************************************************************************
//*****************************************************************************
long WINAPI  FaOutputDebugString(long string,long param2)
{
	char* ch = (char*)string;
	OutputDebugString(ch);
	return 0;
};

//*****************************************************************************
// Sucht nach einer Datei rekursiv in einem Verzeichnis oder allen verfügbaren
// lokalen Festplatten
//
// Looks for a file that matches lSearch (string pointer castet to long) in all
// local harddrives or under the directory that is given by lStart.
//*****************************************************************************
long WINAPI FindFileRecursive(long lSearch,long lStart)
{

	if(lSearch==0) return 0;

	static char RetStr[_MAX_PATH+1];
	memset(RetStr,0,sizeof(RetStr));

	char SearchString[_MAX_PATH+1];
	strncpy(SearchString,(char*)lSearch,_MAX_PATH);

	char Drive[_MAX_DRIVE+1];
	char Dir[_MAX_DIR+1];

	DWORD Erg = 0;

	// Wenn es kein Startverzeichnis gibt, werden alle lokalen Platten 
	// durchgegangen
	if(lStart==0)
	{
		DWORD DirFlag = GetLogicalDrives();
		
		if(DirFlag&0x04)
			Erg = FFRSearchLogicalDrive(SearchString,"C:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x08))
			Erg = FFRSearchLogicalDrive(SearchString,"D:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x010))
			Erg = FFRSearchLogicalDrive(SearchString,"E:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x020))
			Erg = FFRSearchLogicalDrive(SearchString,"F:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x040))
			Erg = FFRSearchLogicalDrive(SearchString,"G:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x080))
			Erg = FFRSearchLogicalDrive(SearchString,"H:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x0100))
			Erg = FFRSearchLogicalDrive(SearchString,"I:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x0200))
			Erg = FFRSearchLogicalDrive(SearchString,"J:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x0400))
			Erg = FFRSearchLogicalDrive(SearchString,"K:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x0800))
			Erg = FFRSearchLogicalDrive(SearchString,"L:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x01000))
			Erg = FFRSearchLogicalDrive(SearchString,"M:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x02000))
			Erg = FFRSearchLogicalDrive(SearchString,"N:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x04000))
			Erg = FFRSearchLogicalDrive(SearchString,"O:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x08000))
			Erg = FFRSearchLogicalDrive(SearchString,"P:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x010000))
			Erg = FFRSearchLogicalDrive(SearchString,"Q:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x020000))
			Erg = FFRSearchLogicalDrive(SearchString,"R:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x040000))
			Erg = FFRSearchLogicalDrive(SearchString,"S:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x080000))
			Erg = FFRSearchLogicalDrive(SearchString,"T:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x0100000))
			Erg = FFRSearchLogicalDrive(SearchString,"U:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x0200000))
			Erg = FFRSearchLogicalDrive(SearchString,"V:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x0400000))
			Erg = FFRSearchLogicalDrive(SearchString,"W:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x0800000))
			Erg = FFRSearchLogicalDrive(SearchString,"X:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x01000000))
			Erg = FFRSearchLogicalDrive(SearchString,"Y:\\",RetStr,_MAX_PATH);
		if((Erg==0)&&(DirFlag&0x02000000))
			Erg = FFRSearchLogicalDrive(SearchString,"Z:\\",RetStr,_MAX_PATH);
		
	}
	else
	{
		Erg = FFRSearchFileRecurseSubdirs(SearchString,(char*)lStart,RetStr,_MAX_PATH);
	};

	if(Erg==0) return 0;
	else
	{
		// Die Rückgabe ist nur das Verzeichnis!
		_splitpath(RetStr,Drive,Dir,NULL,NULL);
		_makepath(RetStr,Drive,Dir,NULL,NULL);
	};
	
	return (long) RetStr;
};


//*****************************************************************************
//*****************************************************************************
DWORD FFRSearchLogicalDrive(char* searchname,char* Drivename,char* ErgBuf,DWORD BufSize)
{
	if((!Drivename)||(!ErgBuf)||(!searchname)) return 0;
	
	// Nur Festplatten durchsuchen
	if(GetDriveType(Drivename)!=DRIVE_FIXED)
		return 0;
	
	return FFRSearchFileRecurseSubdirs(searchname,Drivename,ErgBuf,BufSize);	

};

//*****************************************************************************
//*****************************************************************************
DWORD FFRSearchFileRecurseSubdirs(char* searchname,char* path, char* ErgBuf,DWORD BufSize)
{

	WIN32_FIND_DATA fd;

	// Existiert die Datei in diesem Verzeichnis? Filenamen zusammenstellen!
	char Buffer[MAX_PATH+1];
	memset(Buffer,0,sizeof(Buffer));

	_snprintf(Buffer,_MAX_PATH,"%s%s",path,searchname);
	HANDLE hSearch = FindFirstFile(Buffer,&fd);
	if(hSearch!=INVALID_HANDLE_VALUE)
	{
		// Datei wurde gefunden: Aufgabe ist erledigt!
		strncpy(ErgBuf,Buffer,BufSize);
		FindClose(hSearch);
		return 1;
	};
	
	
	// Datei wurde nicht gefunden. Durchgehen der Unterverzeichnisse!
	_snprintf(Buffer,_MAX_PATH,"%s%s",path,"*.*");
	hSearch = FindFirstFile(Buffer,&fd);
	if(hSearch==INVALID_HANDLE_VALUE) return 0;

	BOOLEAN bFileFound = TRUE;
	while(bFileFound)
	{
		// Ist es ein Verzeichnis, und hat es keine "verbotenen" Eigenschaften?
		if((fd.dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY)
			&&((fd.dwFileAttributes&DIRECTORY_IGNORE_MASK)==0)
			&&(strcmp(fd.cFileName,".")!=0)
			&&(strcmp(fd.cFileName,"..")!=0)
			)
		{
			char NextSearchBuffer[_MAX_PATH+1];
			memset(NextSearchBuffer,0,sizeof(NextSearchBuffer));
			_snprintf(NextSearchBuffer,_MAX_PATH,"%s%s\\",path,fd.cFileName);
			DWORD Erg = FFRSearchFileRecurseSubdirs(searchname,NextSearchBuffer,ErgBuf,BufSize);
			if(Erg!=0)
			{
				FindClose(hSearch);
				return Erg;
			};
		};


		// Nächste Datei anschauen
		bFileFound = FindNextFile(hSearch,&fd);
	};
	FindClose(hSearch);



	return 0;
};


//*****************************************************************************
// You can use this function to create backups in the way that you copy all 
// files recursive into a folder under the installation folder. So the whole tree
// of the previous installation in lDir can be copied into lSubdir.
//*****************************************************************************
long WINAPI	RecursiveCopyIntoSubdir(long lDir,long lSubdir)
{
	TCHAR DirToCopy[MAX_PATH+1];
	TCHAR SubDir[MAX_PATH+1];
	TCHAR SupressSubDir[MAX_PATH+1];

	// Verzeichnis ist notwendig!
	if(lDir==0) return 1;

	memset(DirToCopy,0,sizeof(DirToCopy));
	memset(SubDir,0,sizeof(SubDir));
	memset(SupressSubDir,0,sizeof(SupressSubDir));

	_tcsncpy(DirToCopy,(TCHAR*)lDir,MAX_PATH);
	if(DirToCopy[_tcslen(DirToCopy)-1] != '\\')
		_tcsncat(DirToCopy,"\\",MAX_PATH);

	// Übertragen in Unterverzeichnis
	SubDir[0] = '\0';
	_tcsncat(SubDir,DirToCopy,MAX_PATH);
	if(lSubdir==0)
		_tcsncat(SubDir,"bak",MAX_PATH);
	else 
		_tcsncat(SubDir,(TCHAR*)lSubdir,MAX_PATH);

	if(SubDir[_tcslen(SubDir)-1] != '\\')
		_tcsncat(SubDir,"\\",MAX_PATH);

	// Erzeugen des Unterverzeichnisses
	CreateDirectory(SubDir,NULL);

	// Übertragen in Supress-Verzeichnis
	_tcscpy(SupressSubDir,SubDir);

	return CopyDirectory(DirToCopy,SubDir,SupressSubDir);
	
	return 0;
	
};




DWORD CopyDirectory(TCHAR* sourcepath, TCHAR* destpath, TCHAR* supresspath)
{
	WIN32_FIND_DATA		FindData;
	TCHAR				SearchName[MAX_PATH+1];
	HANDLE				SearchHandle = INVALID_HANDLE_VALUE;


	typedef queue<FILENAME_PAIR*> FILENAME_QUEUE;

	FILENAME_QUEUE		CopyfileQueue;

	memset(&FindData,0,sizeof(FindData));
	memset(SearchName,0,sizeof(SearchName));

	// Testen: ist das Verzeichnis identisch oder "länger" als supresspath?
	// Wenn ja kann an dieser Stelle aufgegeben werden.
	if((supresspath)&&(_tcsnicmp(sourcepath,supresspath,_tcslen(supresspath))==0))
		return 0;

	_tcsncat(SearchName,sourcepath,MAX_PATH);
	_tcsncat(SearchName,"*.*",MAX_PATH);

	SearchHandle = FindFirstFile(SearchName,&FindData);
	// Nicht erfolgreich?
	if(SearchHandle==INVALID_HANDLE_VALUE) return 0;
	BOOLEAN bFileFound = TRUE;
	while(bFileFound)
	{
		// Stelle fest: Ist es eine Datei oder ein Verzeichnis?
		if(FindData.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)
		{
			// Ausfiltern von "." und ".." Verzeichnissen
			if(!((_tcsicmp(FindData.cFileName,".")==0)||(_tcsicmp(FindData.cFileName,"..")==0)))
			{	
				// Es ist ein Verzeichnis. Dieses muß rekursiv bearbeitet werden. 
				TCHAR SubdirSourceName[MAX_PATH+1];
				TCHAR SubdirDestName[MAX_PATH+1];
				_snprintf(SubdirSourceName,MAX_PATH,"%s%s\\",sourcepath,FindData.cFileName);
				_snprintf(SubdirDestName,MAX_PATH,"%s%s\\",destpath,FindData.cFileName);
				// Erzeugen des Unterverzeichnisses
				CreateDirectory(SubdirDestName,NULL);
				CopyDirectory(SubdirSourceName,SubdirDestName,supresspath);
			};
		}
		else
		{
			// Kopieren der Datei
//			TCHAR SourceFileName[MAX_PATH+1];
//			TCHAR DestFileName[MAX_PATH+1];
//			_snprintf(SourceFileName,MAX_PATH,"%s%s",sourcepath,FindData.cFileName);
//			_snprintf(DestFileName,MAX_PATH,"%s%s",destpath,FindData.cFileName);
			FILENAME_PAIR* fp = new FILENAME_PAIR;
			_snprintf(fp->Source,MAX_PATH,"%s%s",sourcepath,FindData.cFileName);
			_snprintf(fp->Dest,MAX_PATH,"%s%s",destpath,FindData.cFileName);
			CopyfileQueue.push(fp);
//			DWORD dwErg = CopyFile(SourceFileName,DestFileName,FALSE);
//			if(dwErg==0)
//				DWORD dwError = GetLastError();
		};
		
		// Nächste Datei suchen
		bFileFound = FindNextFile(SearchHandle,&FindData);
	};




	// Aufräumen
	if(SearchHandle!=INVALID_HANDLE_VALUE) FindClose(SearchHandle);

	while(!CopyfileQueue.empty())
	{
		FILENAME_PAIR* fp = CopyfileQueue.front();
		CopyfileQueue.pop();
		if(fp) 
		{
			DWORD dwErg = CopyFile(fp->Source,fp->Dest,FALSE);
			if(dwErg==0)
				DWORD dwError = GetLastError();
			delete fp;
		};
	};


	return 0;
};


