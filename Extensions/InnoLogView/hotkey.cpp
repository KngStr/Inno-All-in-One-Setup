#define WIN32_LEAN_AND_MEAN

#include <windows.h>
#include <string>
#include <vector>
#include <shlobj.h>

using namespace std;


#include "hotkey.h"

extern HINSTANCE		MyInst;



//*****************************************************************************
// Konstanten für die Kommandozeile der Select-Anweisung
//*****************************************************************************

// Argumente für Dateinamen, Erweiterungen, Pfade. Diese Argumente werden immer
// in der Form "<argument><operator><string>" erwartet. Gültige Operatoren sind
// "<=>" (größer, gleich, kleiner). Beispiele:
// "/linkname=testlink"		-> testlink oder TESTLINK oder TestLink ist gültig
// "/linkname<kleinerlink"	-> kleiner, kleinerl sind gültig, kleinerlinks ist ungültig
// "/linkname>kleiner"		-> kleinerlink, kleinerl ist gültig, klei ist ungültig

// Der Dateiname der Link-Datei
const char SHORTCUTNAME[]	=	"/shortcutname";
// Der Pfad der Linkdatei
const char SHORTCUTPATH[]	=	"/shortcutpath";
// Der Pfad des Programmes, auf welchen der Link verweist
const char TARGETPATH[]		=	"/targetpath";
// Der Dateiname der Datei, auf welche der Link verweist
const char TARGETNAME[]		=	"/targetname";
// Die Extension der Datei, auf welche der Link verweist
const char TARGETEXT[]		=	"/targetext";

// Der Hotkey. Wird ein Hotkey angegeben, so passt die Selektanweisung nur auf 
// den perfekten Match des Hotkeys (Nur Operator "=" möglich). Der String ist
// so einzugeben, wie er z.B. im Explorer bei der Vergabe von Kurztasten erscheint
// (Beispiel: "CTRL-ALT-B")
const char HOTKEY[]			=	"/hotkey";

// Anweisungen, was die Select-Anweisung bewirken soll. Es wird nur eine 
// Anweisung ausgewertet. Sind in einem Select-Aufruf mehrere Anweisungen
// enthalten, so ist das Ergebnis nicht vorhersehbar.

// Selektierte Menge der Selektion hinzufügen
const char ADD_ENTRYS[]			=	"/add";
// Selektierte Menge aus der Selektion entfernen
const char REMOVE_ENTRYS[]		=	"/remove";
// Selektion durch selektierte Menge ersetzen
const char REPLACE_ENTRYS[]		=	"/replace";
// Anhand der Argumente eine Untermenge aus der selektierten Menge bilden
const char SUBSELECT_ENTRYS[]	=	"/subselect";

const char KEYNAME_ALT[]		=	"ALT";
const char KEYNAME_CONTROL[]	=	"CTRL";
const char KEYNAME_SHIFT[]		=	"SHIFT";



typedef enum
{
	ACTION_INVALID = 0,
	ACTION_ADD,
	ACTION_REMOVE,
	ACTION_REPLACE,
	ACTION_SUBSELECT,
	ACTION_LAST
}COMMANDLINE_ACTION;

typedef enum
{
	OPERATOR_INVALID = 0,
	OPERATOR_EQUAL,
	OPERATOR_LESS,
	OPERATOR_GREATER,
	OPERATOR_LAST
}COMMANDLINE_OPERATOR;

class COMMANDLINE_STRING_ARG
{
public:
	COMMANDLINE_STRING_ARG(char* str,DWORD sLen,COMMANDLINE_OPERATOR op)
	{
		Name = NULL;
		Operator = op;
		Name = new char[sLen+1];
		memset(Name,0,(sLen+1)*sizeof(char));
		strncpy(Name,str,sLen);
	};
	
	~COMMANDLINE_STRING_ARG()
	{
		if(Name) delete Name;
		Name = NULL;
		Operator = OPERATOR_INVALID;
	};

	char*					Name;
	COMMANDLINE_OPERATOR	Operator;
};

class COMMANDLINE_ARGUMENTS
{
public:
	COMMANDLINE_ACTION		Action;
	COMMANDLINE_STRING_ARG*	ShortcutName;
	COMMANDLINE_STRING_ARG*	ShortcutPath;
	COMMANDLINE_STRING_ARG*	TargetPath;
	COMMANDLINE_STRING_ARG*	TargetName;
	COMMANDLINE_STRING_ARG*	TargetExt;
	COMMANDLINE_STRING_ARG*	HotKey;
	
	COMMANDLINE_ARGUMENTS(char* cl)
	{
		Action = ACTION_INVALID;
		ShortcutName = NULL;
		ShortcutPath = NULL;
		TargetPath = NULL;
		TargetName = NULL;
		TargetExt = NULL;
		HotKey = NULL;

		char* TempCommandLine = new char[strlen(cl)+1];
		strcpy(TempCommandLine,cl);

		// Convert to lower
		strlwr(TempCommandLine);

		// parse commandline: first look for the action to perform
		if(strstr(TempCommandLine,ADD_ENTRYS))
			Action = ACTION_ADD;
		else if(strstr(TempCommandLine,REMOVE_ENTRYS))
			Action = ACTION_REMOVE;
		else if(strstr(TempCommandLine,REPLACE_ENTRYS))
			Action = ACTION_REPLACE;
		else if(strstr(TempCommandLine,SUBSELECT_ENTRYS))
			Action = ACTION_SUBSELECT;
		else 
		{
			delete TempCommandLine;
			return;
		};

		// Look for arguments
		char* Arg = NULL;
		Arg = strstr(TempCommandLine,SHORTCUTNAME);
		if(Arg)
		{
			ShortcutName = ParseArgument(Arg+strlen(SHORTCUTNAME));
		};
		Arg = strstr(TempCommandLine,SHORTCUTPATH);
		if(Arg)
		{
			ShortcutPath = ParseArgument(Arg+strlen(SHORTCUTPATH));
		};
		Arg = strstr(TempCommandLine,TARGETPATH);
		if(Arg)
		{
			TargetPath = ParseArgument(Arg+strlen(TARGETPATH));
		};
		Arg = strstr(TempCommandLine,TARGETNAME);
		if(Arg)
		{
			TargetName = ParseArgument(Arg+strlen(TARGETNAME));
		};
		Arg = strstr(TempCommandLine,TARGETEXT);
		if(Arg)
		{
			TargetExt = ParseArgument(Arg+strlen(TARGETEXT));
		};
		Arg = strstr(TempCommandLine,HOTKEY);
		if(Arg)
		{
			HotKey = ParseArgument(Arg+strlen(HOTKEY));
		};


	};
	~COMMANDLINE_ARGUMENTS()
	{
		Action = ACTION_INVALID;
		if(ShortcutName) delete ShortcutName;
		ShortcutName = NULL;
		if(ShortcutPath) delete ShortcutPath;
		ShortcutPath = NULL;
		if(TargetPath) delete TargetPath;
		TargetPath = NULL;
		if(TargetName) delete TargetName;
		TargetName = NULL;
		if(TargetExt) delete TargetExt;
		TargetExt = NULL;
		if(HotKey) delete HotKey;
		HotKey = NULL;

	};

private:
	COMMANDLINE_STRING_ARG* ParseArgument(char* arg)
	{
		COMMANDLINE_OPERATOR op = OPERATOR_INVALID;
		// Als erstes wird ein Operator erwartet.
		if(strlen(arg)==0) return NULL;
		if(arg[0]=='=') 
			op = OPERATOR_EQUAL;
		else if(arg[0]=='<') 
			op = OPERATOR_LESS;
		else if(arg[0]=='>') 
			op = OPERATOR_GREATER;
		else return NULL;

		// Führende Leerzeichen?
		arg++;
		while(arg[0]==' ')
			arg++;

		if(strlen(arg)==0)
			return NULL;

		// Anführungszeichen als Delimiter? (Pfade, Dateinamen mit Leerzeichen)
		char Delimiter = ' ';
		if(arg[0]=='"')
			Delimiter = '"';

		// Scannen bis zum Delimiter
		while(arg[0]==Delimiter)		// Leading Blanks
			arg++;

		DWORD dwLen = 0;
		while((arg[dwLen]!=Delimiter)&&(arg[dwLen]!='\0'))
			dwLen++;

//		// Trailing Blanks oder Delimiter
//		while(((arg[dwLen]==' ')||(arg[dwLen]==Delimiter))&&(dwLen>0))
//			dwLen--;

		if(dwLen==0)
			return NULL;

		return new COMMANDLINE_STRING_ARG(arg,dwLen,op);
		
	};		
};



// Scans specified folder for shortcut files with hotkey assignments,
// adding records to the array as appropriate.
// If bRecurse == TRUE, also recurses through subfolders.
BOOL C_HotkeyList::ScanFolder(char* pszPath, BOOL bRecurse)
{
	DWORD			dwAttrib;
	BOOL			bOK;
	WIN32_FIND_DATA	fd;
	HANDLE			hFind;
	string			strSearchSpec,
					strNextPath,
					strFileName;

	TCHAR			ext[_MAX_EXT+1];
	memset(ext,0,sizeof(ext));

	strSearchSpec = pszPath;
	strSearchSpec += "\\*.*";

	hFind = FindFirstFile(strSearchSpec.c_str(), &fd);
	if (hFind != INVALID_HANDLE_VALUE)
	{
		while (TRUE)
		{
			dwAttrib = fd.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY;
			if (dwAttrib != 0)
			{
				if (strcmp(fd.cFileName, ".") == 0)
					goto NextFile;
				if (strcmp(fd.cFileName, "..") == 0)
					goto NextFile;
				if (!bRecurse)
				{
					goto NextFile;
				}
				strNextPath.assign(pszPath);
				strNextPath += "\\";
				strNextPath += fd.cFileName;
//				strNextPath.Format("%s\\%s", pszPath, fd.cFileName);
				if (!ScanFolder((char*)strNextPath.c_str(), TRUE))
					return FALSE;
			}
			else
			{
				strFileName = fd.cFileName;
//				strFileName.compare(
				_splitpath(fd.cFileName,NULL,NULL,NULL,ext);
//				if (strFileName.Right(4).CompareNoCase(".lnk") == 0)
				if(stricmp(ext,".lnk")==0)
				{
					bOK = TRUE;
				}
//				else if (strFileName.Right(4).CompareNoCase(".pif") == 0)
				else if(stricmp(ext,".pif")==0)
				{
					bOK = TRUE;
				}
//				else if (strFileName.Right(4).CompareNoCase(".url") == 0)
				else if(stricmp(ext,".url")==0)
				{
					bOK = TRUE;
				}
				else
				{
					bOK = FALSE;
				}
				if (bOK)
				{
					if (!AddKey(pszPath, fd.cFileName))
						return FALSE;
				}
			}
NextFile:
			if (!FindNextFile(hFind, &fd))
				break;
		}
		FindClose(hFind);
	}
	return TRUE;
}


// Retrieves Hotkey assignment for specified shortcut file.
// If appropriate, adds new record to the array.
BOOL C_HotkeyList::AddKey(char* pszPath, char* pszFileName)
{
	WORD			wHotkey;
	string			strFullName;
	LPHOTKEY_RECORD	pNewRecord = NULL;
	LPHOTKEY_RECORD	*pNewArray = NULL;
	TCHAR			TargetPath[MAX_PATH+1];
	memset(TargetPath,0,sizeof(TargetPath));

//	strFullName.Format("%s\\%s", pszPath, pszFileName);
	strFullName.assign(pszPath);
	strFullName.append("\\");
	strFullName.append(pszFileName);
	if (GetHotkey(strFullName.c_str(), &wHotkey, TargetPath, MAX_PATH) == 0)
	{
		if ((wHotkey != 0)||(m_CollectAllShortcuts==TRUE))
		{
			pNewRecord = new HOTKEY_RECORD;
			memset(pNewRecord,0,sizeof(HOTKEY_RECORD));
			if (pNewRecord == NULL)
				return FALSE;
			pNewRecord->wHotKey = wHotkey;
			pNewRecord->strFileName = pszFileName;
			pNewRecord->strPath = strFullName;
			pNewRecord->iFolder = m_intFolderIndex;
			pNewRecord->strTargetPath = TargetPath;
			pNewRecord->bSelected = FALSE;
			DecodeHotkey(pNewRecord);
			HotkeyList.push_back(pNewRecord);
/*			pNewArray = (LPHOTKEY_RECORD *) realloc(m_pKeyArray, (m_intRecordCount + 1) * sizeof(LPHOTKEY_RECORD));
			if (pNewArray == NULL)
			{
				delete pNewRecord;
				return FALSE;
			}
			m_pKeyArray = pNewArray;
			m_pKeyArray[m_intRecordCount] = pNewRecord;
			++m_intRecordCount;*/
		}
		return TRUE;
	}
	else
	{
		return FALSE;
	}
}


/////////////////////////////////////////
// Helper functions.

// Retrieves hotkey assignment, if any, for the specified
// shortcut file.
// Returns 0 on success.
int C_HotkeyList::GetHotkey(LPCTSTR pszPath, WORD* pwHotkey, TCHAR* TargetPath, DWORD TargetPathLen)
{
	WORD			wHotkey = 0;
//	WORD			wsz[MAX_PATH];
	wchar_t			wsz[MAX_PATH];
	HRESULT			hResult;
	IShellLink		*psl = NULL;
	IPersistFile	*ppf = NULL;
	string			strTarget;

	TCHAR			ext[_MAX_EXT+1];
	memset(ext,0,sizeof(ext));

//	TCHAR			Buffer[MAX_PATH+1];
//	memset(Buffer,0,sizeof(Buffer));

	strTarget = pszPath;
	_splitpath(pszPath,NULL,NULL,NULL,ext);
//	if (strTarget.Right(4).CompareNoCase(".url") == 0)
	if(stricmp(ext,".url")==0)
	{
		wHotkey = (WORD)  ::GetPrivateProfileInt("InternetShortcut", "Hotkey", 0, pszPath);
	}
	else
	{
		MultiByteToWideChar(CP_ACP, 0, pszPath, -1, wsz, MAX_PATH);
		hResult = CoCreateInstance(CLSID_ShellLink, NULL, CLSCTX_INPROC_SERVER, IID_IShellLink, (void **) &psl);
		if (SUCCEEDED(hResult))
		{

/*			{
				char Buffer[MAX_PATH+1];
				WIN32_FIND_DATA fd;
				int iTmp = 0;
				HRESULT hRes = psl->GetPath(Buffer,MAX_PATH,&fd,SLGP_SHORTPATH|SLGP_UNCPRIORITY|SLGP_SHORTPATH);
				hRes = psl->GetArguments(Buffer,MAX_PATH);
				hRes = psl->GetDescription(Buffer,MAX_PATH);
				hRes = psl->GetIconLocation(Buffer,MAX_PATH,&iTmp);
				LPITEMIDLIST pidl = NULL;
				hRes = psl->GetIDList(&pidl);
				hRes = psl->GetWorkingDirectory(Buffer,MAX_PATH);
				WORD wHotkey = 0;
				hRes = psl->GetHotkey(&wHotkey);
			};
			*/

			// Get pointer to IShellLink's IPersistFile interface.
			hResult = psl->QueryInterface(IID_IPersistFile, (void **) &ppf);
			if (SUCCEEDED(hResult))
			{
				// Does a shortcut with the same name already exist?
				hResult = ppf->Load(wsz, 0);
				if (hResult == S_OK)
				{
//						char Buffer[MAX_PATH+1];
//						WIN32_FIND_DATA fd;
					// Ermitteln des Target-Pfades, wenn gewünscht.
					if((TargetPath)&&(TargetPathLen>0))
					{
						HRESULT hRes = psl->GetPath(TargetPath,TargetPathLen,NULL,SLGP_UNCPRIORITY);
					};


					hResult = psl->GetHotkey(&wHotkey);
					if (hResult != S_OK)
					{
						if(m_CollectAllShortcuts==FALSE)
							m_bSkipped = TRUE;
						wHotkey = 0;
					}
				}
				else
				{
					m_bSkipped = TRUE;
					wHotkey = 0;
				}
				ppf->Release();
			}
			else
			{
				return 3;
			}
			psl->Release();
		}
		else
		{
			return 4;
		}
	}
	if (pwHotkey)
		*pwHotkey = wHotkey;
	return 0;
}

// Gets the text key name of the specified record's hotkey code.
// Returns FALSE if key name could not be decoded.
BOOL C_HotkeyList::DecodeHotkey(LPHOTKEY_RECORD pRecord)
{
	UINT	wScanCode,
			wKeyCode;
	char	szKeyName[32];
	string	strPrefix;

	// Convert from virtual key code to scan code, then shift left by 16 bits.
	wKeyCode = (pRecord->wHotKey & 0x00FF);
	wScanCode = MapVirtualKey(wKeyCode, 0) << 16;
	// Did we get a scan code?
	if (wScanCode != 0)
	{
		// Move the "extended key" bit to the proper position in the scan code
		// and set the "don't care" bit for left/right versions of duplicated keys.
		wScanCode |= (((pRecord->wHotKey & 0x0800) << 13) | 0x02000000);
		// Get text name of the key based on its scan code.
		if (GetKeyNameText(wScanCode, szKeyName, 32) == 0)
			return FALSE;
	}
	// Handle special case for the "/" key on the numeric keypad. For whatever
	// reason, MapVirtualKey() refuses to return a scan code for this key.
	else if (wKeyCode == VK_DIVIDE)
	{
		strcpy(szKeyName, "Num /");
	}
	else if (wKeyCode == VK_PAUSE)
	{
		strcpy(szKeyName, "Pause");
	}
	else
	{
		return FALSE;
	}
	// Determine shift modifiers.
	// Note: The order in which we assign these corresponds to
	// the way the CHotKeyCtrl displays them.
	if (pRecord->wHotKey & 0x0200)	 // Bit 9 = Ctrl.
	{
		strPrefix += KEYNAME_CONTROL;
		strPrefix += " + ";
//		strPrefix += "Ctrl + ";
	};
	if (pRecord->wHotKey & 0x0100)   // Bit 8 = Shift.
	{
		strPrefix += KEYNAME_SHIFT;
		strPrefix += " + ";
//		strPrefix += "Shift + ";
	}
	if (pRecord->wHotKey & 0x0400)   // Bit 10 = Alt key.
	{
		strPrefix += KEYNAME_ALT;
		strPrefix += " + ";
//		strPrefix += "Alt + ";
	};
	// Build the full key name.
	pRecord->strKeyName = strPrefix + szKeyName;
	// Indicate success.
	return TRUE;
}




// Updates the shortut file for the specified record to
// apply a new hotkey settings.
BOOL C_HotkeyList::UpdateHotkey(LPHOTKEY_RECORD pRecord)
{
	string			strKey;
	wchar_t			wsz[MAX_PATH];
	HRESULT			hResult;
	IShellLink		*psl = NULL;
	IPersistFile	*ppf = NULL;
	TCHAR			ext[_MAX_EXT+1];
	memset(ext,0,sizeof(ext));

	// Is it an Internet Shortcut?
	_splitpath(pRecord->strPath.c_str(),NULL,NULL,NULL,ext);
//	if (pRecord->strPath.Right(4).CompareNoCase(".url") == 0)
	if(stricmp(ext,".url")==0)
	{

		// Are we removing the hotkey assignment?
		if (pRecord->wHotKey == 0)
		{
			// Yes .. remove the "Hotkey" setting from the file.
			return WritePrivateProfileString("InternetShortcut", "Hotkey", NULL, pRecord->strPath.c_str());
		}
		else
		{
			// No .. convert hotkey to unsigned ASCII integer.
			static const DWORD ZAHLBUF_SIZE = 30;
			TCHAR ZahlBuf[ZAHLBUF_SIZE+1];
			memset(ZahlBuf,0,sizeof(ZahlBuf));
			_snprintf(ZahlBuf,ZAHLBUF_SIZE,"%u",pRecord->wHotKey);
			strKey.assign(ZahlBuf);
//			strKey.Format("%u", pRecord->wHotKey);
			// Write the value to the file.
			return WritePrivateProfileString("InternetShortcut", "Hotkey", strKey.c_str(), pRecord->strPath.c_str());
		}
	}
	// No, must be a .LNK or .PIF shell link file.
	else
	{
		// Convert path to wide characters for IPersistFile.
		MultiByteToWideChar(CP_ACP, 0, pRecord->strPath.c_str(), -1, wsz, MAX_PATH);
		// Create an instance of an IShellLink object.
		hResult = CoCreateInstance(CLSID_ShellLink, NULL, CLSCTX_INPROC_SERVER, IID_IShellLink, (void **) &psl);
		if (SUCCEEDED(hResult))
		{
			// Get pointer to IShellLink's IPersistFile interface.
			hResult = psl->QueryInterface(IID_IPersistFile, (void **) &ppf);
			if (SUCCEEDED(hResult))
			{
				// Load the object from the file.
				hResult = ppf->Load(wsz, 0);
				if (hResult == S_OK)
				{
					// Apply new hotkey setting.
					hResult = psl->SetHotkey(pRecord->wHotKey);
					if (hResult == S_OK)
					{
						// Rewrite the file.
						hResult = ppf->Save(NULL, FALSE);
						ppf->SaveCompleted(NULL);
					}
					else
					{
						return FALSE;
					}
				}
				else
				{
					return FALSE;
				}
				// Done with IPersistFile interface.
				ppf->Release();
			}
			else
			{
				return FALSE;
			}
			// Done with IShellLink interface.
			psl->Release();
		}
		else
		{
			return FALSE;
		}
	}
	return TRUE;
}


//*****************************************************************************
// Reads the list of shurtcuts from the directorys common desktop, user desktop,
// common startmenu and user startmenu and stores it inside the object. 
//
// Initializes OLE if this is not done before. 
//*****************************************************************************
DWORD	C_HotkeyList::BuildList(BOOL bShortcutList,DWORD FolderFlag)
{

	TCHAR Buffer[MAX_PATH+1];
	memset(Buffer,0,sizeof(Buffer));

	HRESULT hRes = S_OK;

	if(!m_Initialized)
	{
		CoInitialize(NULL);
		m_Initialized = TRUE;
	};

	m_CollectAllShortcuts = bShortcutList;
	
	ClearList();

//	DWORD dwTest = FolderFlag&HKL_FOLDERFLAG_USEFLAGS;

	if(((FolderFlag&HKL_FOLDERFLAG_USEFLAGS)==0)||(FolderFlag&HKL_FOLDERFLAG_DESKTOP))
	{
		hRes = My_SHGetFolderPath(NULL,CSIDL_DESKTOPDIRECTORY,NULL,SHGFP_TYPE_CURRENT,Buffer);
		if(!FAILED(hRes))
		{
			ScanFolder(Buffer,TRUE);
		};

		hRes = My_SHGetFolderPath(NULL,CSIDL_COMMON_DESKTOPDIRECTORY,NULL,SHGFP_TYPE_CURRENT,Buffer);
		if(!FAILED(hRes))
		{
			ScanFolder(Buffer,TRUE);
		};
	};


	if(((FolderFlag&HKL_FOLDERFLAG_USEFLAGS)==0)||(FolderFlag&HKL_FOLDERFLAG_STARTMENU))
	{
		hRes = My_SHGetFolderPath(NULL,CSIDL_STARTMENU,NULL,SHGFP_TYPE_CURRENT,Buffer);
		if(!FAILED(hRes))
		{
			ScanFolder(Buffer,TRUE);
		};

		hRes = My_SHGetFolderPath(NULL,CSIDL_COMMON_STARTMENU,NULL,SHGFP_TYPE_CURRENT,Buffer);
		if(!FAILED(hRes))
		{
			ScanFolder(Buffer,TRUE);
		};
	};

	return 0;

};


//*****************************************************************************
// Destroys the controlled list and finishes OLE
//*****************************************************************************
DWORD	C_HotkeyList::DestroyList(void)
{
	if(m_Initialized)
	{
		m_Initialized = FALSE;
		CoUninitialize();
	};

	ClearList();

	return 0;
};





//*****************************************************************************
// Returns one ore all propertys of a list item in a buffer that is created by
// the object.
//*****************************************************************************
char* C_HotkeyList::GetItemProperty(DWORD ListIndex,DWORD PropertyId)
{
	// Löschen des alten Puffers
	if(PropertyBuffer) delete PropertyBuffer;
	PropertyBuffer = NULL;

	static const DWORD VALBUF_LEN = 20;
	char ValueBuffer[VALBUF_LEN+1];
	memset(ValueBuffer,0,sizeof(ValueBuffer));

	DWORD dwBufSize = 0;

	char* chTmp = NULL;

	// Ist der Index in Ordnung?
	if(ListIndex>=HotkeyList.size())
		return NULL;

	// Element ermitteln
	HOTKEY_RECORD*	record = NULL;
	record = HotkeyList[ListIndex];
	if(!record) return NULL;

	switch(PropertyId)
	{
	case PROPERTY_ALL:
		{		
			const DWORD VALBUF_LEN = 20;
			char ValueBuffer[VALBUF_LEN+1];
			memset(ValueBuffer,0,sizeof(ValueBuffer));

			_snprintf(ValueBuffer,VALBUF_LEN,"%#04x",record->wHotKey);

			dwBufSize = record->strKeyName.size()
						+ record->strFileName.size()
						+ record->strPath.size()
						+ record->strTargetPath.size()
						+ strlen(ValueBuffer)
						+ 6;
			
			PropertyBuffer = new char[dwBufSize];
			memset(PropertyBuffer,0,dwBufSize*sizeof(char));
			
			chTmp = PropertyBuffer;
			chTmp += sprintf(chTmp,"%s",record->strKeyName.c_str());
			chTmp++;
			chTmp += sprintf(chTmp,"%s",record->strFileName.c_str());
			chTmp++;
			chTmp += sprintf(chTmp,"%s",record->strPath.c_str());
			chTmp++;
			chTmp += sprintf(chTmp,"%s",record->strTargetPath.c_str());
			chTmp++;
			chTmp += sprintf(chTmp,"%s",ValueBuffer);
			chTmp++;
		}
		break;

	case PROPERTY_HOTKEY:
		dwBufSize = record->strKeyName.size()+1;
		PropertyBuffer = new char[dwBufSize];
		memset(PropertyBuffer,0,dwBufSize);
		strcpy(PropertyBuffer,record->strKeyName.c_str());
		break;

	case PROPERTY_SHORTCUTNAME:
		dwBufSize = record->strFileName.size()+1;
		PropertyBuffer = new char[dwBufSize];
		memset(PropertyBuffer,0,dwBufSize);
		strcpy(PropertyBuffer,record->strFileName.c_str());
		break;

	case PROPERTY_SHORTCUTPATH:
		dwBufSize = record->strPath.size()+1;
		PropertyBuffer = new char[dwBufSize];
		memset(PropertyBuffer,0,dwBufSize);
		strcpy(PropertyBuffer,record->strPath.c_str());
		break;

	case PROPERTY_TARGETPATH:
		dwBufSize = record->strTargetPath.size()+1;
		PropertyBuffer = new char[dwBufSize];
		memset(PropertyBuffer,0,dwBufSize);
		strcpy(PropertyBuffer,record->strTargetPath.c_str());
		break;

	case PROPERTY_HOTKEY_VALUE:
		{
			static const DWORD VALBUF_LEN = 20;
			char ValueBuffer[VALBUF_LEN+1];
			memset(ValueBuffer,0,sizeof(ValueBuffer));
			_snprintf(ValueBuffer,VALBUF_LEN,"%#04x",record->wHotKey);
			dwBufSize = strlen(ValueBuffer)+1;
			PropertyBuffer = new char[dwBufSize];
			memset(PropertyBuffer,0,dwBufSize);
			strcpy(PropertyBuffer,ValueBuffer);
		};
		break;
	};


	return PropertyBuffer;
};

//*****************************************************************************
// Modifies one or the selected hotkeys.
// If index is -1, all selected hotkeys are adressed.
// if hotkey is 0, the hotkey to all selected entrys is removed.
//
// If index is -1 (all selected entrys) and hotkey is not 0 (change assignment),
// the function is ignored, because it is not recommendet to assign multiple
// hotkeys with the same value.
//
//*****************************************************************************
DWORD C_HotkeyList::ModifyHotkey(WORD hotkey,LONG index)
{

	if((hotkey!=0)&&(index==-1))
		return 1;

	if(index!=-1)
	{
		if((index>0)&&(index<HotkeyList.size()))
		{
			HOTKEY_RECORD* pRec = HotkeyList[index];
			if(hotkey)
			{

				pRec->wHotKey = hotkey;
				pRec->strKeyName.assign("");
				UpdateHotkey(pRec);

			}
			else
			{
				pRec->wHotKey = 0;
				pRec->strKeyName.assign("");
				UpdateHotkey(pRec);
			};

		};
	}
	else
	{

		HOTKEY_VECTOR::iterator i;
		for(i=HotkeyList.begin();i!=HotkeyList.end();i++)
		{
			HOTKEY_RECORD* pRec = *i;
			if((pRec)&&(pRec->bSelected))
			{
				pRec->wHotKey = hotkey;
				pRec->strKeyName.assign("");
				UpdateHotkey(pRec);
			};
		};



	};


	return 0;
};

//*****************************************************************************
// Deletes the selection or a specific shortcut physical from the users harddisk
// and from the list.
//*****************************************************************************
DWORD C_HotkeyList::DeleteShortcut(LONG index)
{
	if(index==-1)
	{
		HOTKEY_VECTOR vTmp;
		
		// Alle selektierten Shortcuts entfernen
		HOTKEY_VECTOR::iterator i;
		for(i=HotkeyList.begin();i!=HotkeyList.end();i++)
		{
		
			HOTKEY_RECORD* pRec = *i;
			if(pRec==NULL)
				continue;

			if(pRec->bSelected)
			{
				DeleteFile(pRec->strPath.c_str());
				delete pRec;
				pRec = NULL;
			}
			else
			{
				vTmp.push_back(*i);
			};

			// Originalzeiger ist nicht mehr gültig
			*i = NULL;
		};

		// Liste leermachen und die nicht gelöschten Objekte wieder einfügen
		HotkeyList.clear();
		HotkeyList.swap(vTmp);
	}
	else
	{
		if((index>0)&&(index<HotkeyList.size()))
		{
			HOTKEY_RECORD* pRec = HotkeyList[index];
			if(pRec)
			{
				DeleteFile(pRec->strPath.c_str());
				delete pRec;
				pRec = NULL;

				HOTKEY_VECTOR::iterator i = HotkeyList.begin();
				i += index;

//				i = &HotkeyList[index];

				HotkeyList.erase(i);

			};
		};

	};
	return 0;
};


//*****************************************************************************
// Selects one ore more items ín the list.
//
// If index is not -1, the item with that index is selected. Other selectet keep
// the selection.
// If index is -1, the commandline is parsed to perform the described operation.
// If index is -1 and commandline is NULL, all selections are cleared.
//*****************************************************************************
DWORD C_HotkeyList::Select(char* commandline,LONG index)
{
	DWORD dwRetVal = 0;

	
	char Buffer[MAX_PATH+1];
	char Fname[_MAX_FNAME+1];
	char Drive[_MAX_DRIVE+1];
	char Dir[_MAX_DIR+1];
	char Ext[_MAX_EXT+1];

	
	if(index!=-1)
	{
		// Index korrekt?
		if((index>0)&&(index<HotkeyList.size()))
		{
			HOTKEY_RECORD* pRec = HotkeyList[index];
			pRec->bSelected = TRUE;
		};
	}
	else if((index==-1)&&(commandline==NULL))
	{
		// Selektion komplett löschen
		HOTKEY_VECTOR::iterator i;
		for(i=HotkeyList.begin();i!=HotkeyList.end();i++)
		{
			HOTKEY_RECORD* pRec = *i;
			if(pRec)
				pRec->bSelected = FALSE;
		};

	}
	else
	{
		COMMANDLINE_ARGUMENTS* lpCa = new COMMANDLINE_ARGUMENTS(commandline);
	
		BOOLEAN*	pOldSelection = NULL;
		
		// Subselect. Merken der alten Selektion zum Abgleich und Löschen der
		// selektierten Einträge aus der Liste.
		if(lpCa->Action==ACTION_SUBSELECT)
		{
			// Merken der alten Selektion
			DWORD dwArraySize = HotkeyList.size()+1;
			pOldSelection = new BOOLEAN[dwArraySize];
			memset(pOldSelection,0,dwArraySize);

			DWORD nEntry = HotkeyList.size();
			for(DWORD i=0;i<nEntry;i++)
			{
				if(HotkeyList[i]==NULL)
					continue;
			
				pOldSelection[i] = HotkeyList[i]->bSelected;
				
			};
			
			Select(NULL,-1);
		};

		// Soll die Selektion ersetzt werden? Dann rekursiv Select mit der 
		// passenden Kommandozeile zum Löschen!
		if(lpCa->Action== ACTION_REPLACE)
			Select(NULL,-1);

		// Filter-Schleife
//		HOTKEY_VECTOR::iterator i;
		DWORD nEntry = HotkeyList.size();
//		for(i=HotkeyList.begin();i!=HotkeyList.end();i++)
		for(DWORD i=0;i<nEntry;i++)
		{
			HOTKEY_RECORD* pRec = HotkeyList[i]; //*i;
			if(!pRec)
				continue;

			// Wenn die Aktion ein Subselect ist, übergehen wir
			// Einträge, die nicht selektiert sind
//			if((lpCa->Action==ACTION_SUBSELECT)&&(pRec->bSelected==FALSE))
//				continue;

			// Prüfen der einzelnen Argumente
			if(lpCa->HotKey!=NULL)
			{
				// Der String enthält hier nur eine Zahl, welche den Hotkey als 
				// WORD repräsentiert. Verglichen wird nur auf gleiuch/ungleich! 
				WORD wCompare = strtoul(lpCa->HotKey->Name,NULL,0);
				if((lpCa->HotKey->Operator==OPERATOR_EQUAL)&&(wCompare!=pRec->wHotKey))
					continue;
//				if(!ArgumentMatch((char*)pRec->strFileName.c_str(),lpCa->ShortcutName->Name,lpCa->ShortcutName->Operator))
//					continue;
			};
//			if(!((lpCa->HotKey!=NULL)&&(ArgumentMatch((char*)pRec->strKeyName.c_str(),lpCa->HotKey->Name,lpCa->HotKey->Operator))))
//				continue;


//			if(!((lpCa->ShortcutName!=NULL)&&(ArgumentMatch((char*)pRec->strFileName.c_str(),lpCa->ShortcutName->Name,lpCa->ShortcutName->Operator))))
//				continue;
			if(lpCa->ShortcutName!=NULL)
			{
				_splitpath(pRec->strPath.c_str(),Drive,Dir,Fname,Ext);
//				if(!ArgumentMatch((char*)pRec->strFileName.c_str(),lpCa->ShortcutName->Name,lpCa->ShortcutName->Operator))
				if(!ArgumentMatch(Fname,lpCa->ShortcutName->Name,lpCa->ShortcutName->Operator))
					continue;
			};

			if(lpCa->ShortcutPath!=NULL)
			{
				// Komponenten zerlegen
				_splitpath(pRec->strPath.c_str(),Drive,Dir,Fname,Ext);
				_makepath(Buffer,Drive,Dir,NULL,NULL);
				// Argument match?
				if(!ArgumentMatch(Buffer,lpCa->ShortcutPath->Name,lpCa->ShortcutPath->Operator))
					continue;
			};


			if(lpCa->TargetExt!=NULL)
			{
				// Komponenten zerlegen
				_splitpath(pRec->strTargetPath.c_str(),Drive,Dir,Fname,Ext);
				// Argument match?
				if(!ArgumentMatch(Ext+1,lpCa->TargetExt->Name,lpCa->TargetExt->Operator))
					continue;
			};

			if(lpCa->TargetName!=NULL)
			{
				// Komponenten zerlegen
				_splitpath(pRec->strTargetPath.c_str(),Drive,Dir,Fname,Ext);
				// Argument match?
				if(!ArgumentMatch(Fname,lpCa->TargetName->Name,lpCa->TargetName->Operator))
					continue;
			};

			if(lpCa->TargetPath!=NULL)
			{
				// Komponenten zerlegen
				_splitpath(pRec->strTargetPath.c_str(),Drive,Dir,Fname,Ext);
				_makepath(Buffer,Drive,Dir,NULL,NULL);
				// Argument match?
				if(!ArgumentMatch(Buffer,lpCa->TargetPath->Name,lpCa->TargetPath->Operator))
					continue;
			};


			// Hier gibt es nur noch "matches". Jetzt kommt es darauf an, welche Aktion
			// durchgeführt werden soll.
			switch(lpCa->Action)
			{
			case ACTION_SUBSELECT:
				if((pOldSelection)&&(pOldSelection[i]==TRUE))
					pRec->bSelected = TRUE;
				break;
				// Hier fallen zwei Werte durch in eine Aktion!!! Das ist so geplant!
			case ACTION_REPLACE:
			case ACTION_ADD:
				pRec->bSelected = TRUE;
				break;

			case ACTION_REMOVE:
				pRec->bSelected = FALSE;
				break;
			};
/*			
			if(!((lpCa->!=NULL)&&(ArgumentMatch((char*)pRec->strKeyName.c_str(),lpCa->HotKey->Name,lpCa->HotKey->Operator))))
				continue;

			if(!((lpCa->HotKey!=NULL)&&(ArgumentMatch((char*)pRec->strKeyName.c_str(),lpCa->HotKey->Name,lpCa->HotKey->Operator))))
				continue;
			if(!((lpCa->HotKey!=NULL)&&(ArgumentMatch((char*)pRec->strKeyName.c_str(),lpCa->HotKey->Name,lpCa->HotKey->Operator))))
				continue;
*/
		};

		

		if(lpCa) delete lpCa;
	};



	return GetSelCount();
};




//*****************************************************************************
//*****************************************************************************
DWORD C_HotkeyList::GetSelCount(void)
{

	DWORD dwSel = 0;

	HOTKEY_VECTOR::iterator i;
	for(i=HotkeyList.begin();i!=HotkeyList.end();i++)
	{
		HOTKEY_RECORD* pRec = *i;
		if((pRec)&&(pRec->bSelected))
			dwSel++;
	};

	return dwSel;
};



//*****************************************************************************
//*****************************************************************************
BOOLEAN C_HotkeyList::ArgumentMatch(char* strElem,char* strArg,DWORD op)
{

	
	if(op==OPERATOR_EQUAL)
	{
		if(stricmp(strElem,strArg)==0)
			return TRUE;
	}
	else if(op==OPERATOR_LESS)
	{
		DWORD dwSrcLen = strlen(strElem);
		// Wenn Source länger ist, kann source nicht
		// kleiner sein
		if(dwSrcLen>=strlen(strArg))
			return FALSE;
		if(strnicmp(strElem,strArg,dwSrcLen)==0)
			return TRUE;
	}
	else if(op==OPERATOR_GREATER)
	{
		DWORD dwArgLen = strlen(strArg);
		// Wenn Argument kürzer als der Sourcestring ist, kann
		// der String nicht größer sein.
		if(dwArgLen>=strlen(strElem))
			return FALSE;

		if(strnicmp(strElem,strArg,dwArgLen)==0)
			return TRUE;
		
	};

	return FALSE;
};


//*****************************************************************************
// Ersatz für die Funktion ShGetFolderPath, die unter 98 nicht unterstützt wird.
// Setzt auf die DLL Fa_ShFld.dll auf, die von uns mitgebracht wird
// (abgeschaut von InnoSetup, die DLL stammt wahrscheinlich von WIN2K)
//*****************************************************************************
HRESULT My_SHGetFolderPath(
    HWND hwndOwner,
    int nFolder,
    HANDLE hToken,
    DWORD dwFlags,
    LPTSTR pszPath)
{

	typedef HRESULT (__stdcall * GETFOLDERPATHPROC)( HWND, int, HANDLE, DWORD, LPTSTR );
	

	HRESULT hRes = S_OK;

	// Laden der DLL
	HINSTANCE hDll = NULL;

	char DllName[_MAX_PATH+1];
	char drive[_MAX_DRIVE+1];
	char dir[_MAX_DIR+1];

	memset(DllName,0,sizeof(DllName));
	memset(drive,0,sizeof(drive));
	memset(dir,0,sizeof(dir));
  
	// Pfad zusammenstellen
	GetModuleFileName(MyInst,DllName, _MAX_PATH );
	_splitpath(DllName,drive,dir,NULL,NULL);
	_makepath(DllName,drive,dir,"Fa_ShFld","dll");
	

//	hDll = LoadLibrary("Fa_ShFld.dll");
	hDll = LoadLibrary(DllName);
	if(hDll==NULL)
	{
		OutputDebugString("!!! Fehler beim Laden von Fa_ShFld.dll\r\n");
		return E_FAIL;
	};
//		return GetLastError();

	// Funktionszeiger holen
	GETFOLDERPATHPROC _proc = NULL;
	_proc = (GETFOLDERPATHPROC)GetProcAddress(hDll,"SHGetFolderPathA");

	if(_proc==NULL)
	{
		OutputDebugString("!!! Export in Fa_ShFld.dll nicht gefunden\r\n");
		return E_FAIL;
	};
	
	hRes = _proc(hwndOwner,nFolder,hToken,dwFlags,pszPath);

	// DLL freigeben
	if(hDll)
		FreeLibrary(hDll);

	return hRes;
};