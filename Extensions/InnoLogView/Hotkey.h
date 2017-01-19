#ifndef ____INC____FAISEXT___HOTKEY_H___INC____
#define ____INC____FAISEXT___HOTKEY_H___INC____


#include <Shobjidl.h>
#include <shlguid.h>

// Ersatz für die Gunktion SHGetFolderPath, die es unter 98
// (entgegen der M$ Doku) nicht gibt.
HRESULT My_SHGetFolderPath(
    HWND hwndOwner,
    int nFolder,
    HANDLE hToken,
    DWORD dwFlags,
    LPTSTR pszPath);


typedef enum
{
	// Bei PROPERTY_ALL wird ein durch Nullzeichen separiertes String-Array
	// angelegt, mit einem Doppel-Nullzeichen abgeschlossen. Reihenfolge: 
	// Hotkey, Shortcutname, Shortcutpath(Dateiname mit Pfad), Targetpath,
	// Hotkey Zahlenwert
	PROPERTY_ALL			= 1,
	// Hotkey in lesbarer Form (Beispiel: CTRL_ALT_B).
	PROPERTY_HOTKEY			= 2,
	// Name der Link-Datei (Beispiel: Blindo20.lnk)
	PROPERTY_SHORTCUTNAME	= 3,
	// kompletter Pfad der Link-Datei incl. Dateinamen
	PROPERTY_SHORTCUTPATH	= 4,
	// Kompletter Pfad der Datei, auf welche der Link verweist.
	PROPERTY_TARGETPATH		= 5,
	// Zahlenwert des Hotkeys, ausgegeben in einem String
	PROPERTY_HOTKEY_VALUE	= 6,


}PROPERTY_SELECT_ENUM;


typedef struct
{
	BOOL	bIsDeadKey;		// Flag: Key can be assigned but will not work.
	BOOL	bIsDupe;		// Flag: Key is a duplicate.
	BOOL	bSelected;		// Flag: Key is selected
	WORD	wHotKey;		// WORD value representing the hot key.
	int		iFolder;		// Index into the m_strFolders[] array.
							// 0 = Personal Desktop
							// 1 = Personal Start Menu
							// 2 = Common Desktop
							// 3 = Comman Start Menu
	string strFileName;		// Name of the shortcut file.
	string strPath;			// Fully-qualified path to the shortcut file.
	string strKeyName;		// Human-readable name of the shortcut key.
	string strTargetPath;	// full qualified path of the shortcut target
} HOTKEY_RECORD, *LPHOTKEY_RECORD;



typedef vector<HOTKEY_RECORD*> HOTKEY_VECTOR;


const DWORD	HKL_FOLDERFLAG_USEFLAGS		=	0x01;
const DWORD	HKL_FOLDERFLAG_DESKTOP		=	0x02;
const DWORD	HKL_FOLDERFLAG_STARTMENU	=	0x04;


//const DWORD MAX_SCANCODE_ENTRY = 0x

class C_HotkeyList
{

protected:
	int				m_intFolderIndex;	// Index into m_strFolders array.

	HOTKEY_VECTOR	HotkeyList;

private:


	BOOL			m_bSkipped;

	
	BOOL			m_Initialized;

	BOOL			m_CollectAllShortcuts;
	
	char*			PropertyBuffer;


	void InitPrivateData(void){m_intFolderIndex = 0;m_bSkipped = FALSE;
								m_Initialized = FALSE; PropertyBuffer = NULL;
								m_CollectAllShortcuts = FALSE;
								};


	BOOLEAN ArgumentMatch(char* strElem,char* strArg,DWORD op);

public:

	C_HotkeyList(){InitPrivateData();};
	~C_HotkeyList(){ClearList(); if(PropertyBuffer) delete PropertyBuffer;
					InitPrivateData();};

	BOOL ScanFolder(char* pszPath, BOOL bRecurse);
	BOOL AddKey(char* pszPath, char* pszFileName);
	BOOL UpdateHotkey(LPHOTKEY_RECORD pRecord);

	char* GetItemProperty(DWORD ListIndex,DWORD PropertyId);

	DWORD	BuildList(BOOL bShortcutList,DWORD FolderFlag);
	DWORD	DestroyList(void);

	DWORD	Select(char* commandline,LONG index);
	DWORD	ModifyHotkey(WORD hotkey,LONG index);
	
	int		GetHotkey(LPCTSTR pszPath, WORD *pwHotkey /*= NULL*/, TCHAR* TargetPath, DWORD TargetPathLen);
	BOOL	DecodeHotkey(LPHOTKEY_RECORD pRecord);

	DWORD	GetSelCount(void);

	DWORD	GetListCount(void){return HotkeyList.size();};

	DWORD	DeleteShortcut(LONG index);


	BOOL	IsItemSelected(LONG index)
	{
		// Index korrekt?
		if((index>0)&&(index<HotkeyList.size()))
		{
			HOTKEY_RECORD* pRec = HotkeyList[index];
			if((pRec!=NULL)&&(pRec->bSelected==TRUE))
				return TRUE;
			else return FALSE;
		};
		
		return FALSE;
	};


	void	ClearList(void)
	{
		while(HotkeyList.size()!=0)
		{
			HOTKEY_RECORD* pRec = HotkeyList.back();
			HotkeyList.pop_back();
			if (pRec) delete pRec;
		};
	};
};

#endif // ____INC____FAISEXT___HOTKEY_H___INC____

