#define WIN32_LEAN_AND_MEAN

#include <windows.h>

#include "RegistryUtility.h"
#include "V_Bl20_Hlplib.h"


HKEY SplitRegistryPath(char* str,char** path);
DWORD _CopyRegistryKey(HKEY hkSource, HKEY hkDest);


//*****************************************************************************
//*****************************************************************************
DWORD  CopyRegistryKeyA(char* source,char* dest)
{
	
	char* lpSrcPath = NULL;
	HKEY SrcRootKey = NULL;
	char* lpDestPath = NULL;
	HKEY DestRootKey = NULL;

	// Ermitteln der Root-Keys. Da nur Strings übergeben werden, muß eine 
	// Funktion die root keys übermitteln. Erlaubt sind die Rootkeys in
	// langer und kurzer Schreibweise (HKLM oder HKEY_LOCAL_MACHINE)
	SrcRootKey = SplitRegistryPath((char*)source,&lpSrcPath);
	DestRootKey = SplitRegistryPath((char*)dest,&lpDestPath);

	// Start-Keys öffnen
	HKEY hkSource = NULL;
	HKEY hkDest = NULL;

	long lErg = RegOpenKeyEx(SrcRootKey,lpSrcPath,0,KEY_READ,&hkSource);
	if(lErg!=ERROR_SUCCESS)
		return lErg;

	lErg = RegCreateKeyEx(DestRootKey,lpDestPath,0,NULL,0,KEY_WRITE,NULL,&hkDest,NULL);
	if(lErg!=ERROR_SUCCESS)
	{
		RegCloseKey(hkSource);
		return lErg;
	};

	
	lErg = _CopyRegistryKey(hkSource,hkDest);

	

	return 0;
};



//*****************************************************************************
//*****************************************************************************
DWORD _CopyRegistryKey(HKEY hkSource, HKEY hkDest)
{
	// Info über den Key besorgen
	DWORD nSubKeys = 0;
	DWORD MaxSubkeyLen = 0;
	DWORD MaxClassLen = 0;
	DWORD nValues = 0;
	DWORD MaxValuenameLen = 0;
	DWORD MaxValueLen = 0;

	LONG lErg = RegQueryInfoKey(hkSource,
								NULL,			// Class Buffer
								NULL,			// ->Classbuffer Size
								NULL,			// Reserved
								&nSubKeys,		// Anzahl Unterschlüssel
								&MaxSubkeyLen,
								&MaxClassLen,
								&nValues,
								&MaxValuenameLen,
								&MaxValueLen,
								NULL,			// ->Länge des Security Descriptors
								NULL);			// ->FILETIME des letzten Schreibzugriffs

	if(lErg!=ERROR_SUCCESS)
		return 1;

	MaxSubkeyLen++;
	MaxClassLen++;
	MaxValuenameLen++;
	MaxValueLen++;

	// Zuerst durchenumerieren der Subkeys
	STRING_AP	SubkeyName(MaxSubkeyLen);

	for(DWORD i=0;i<nSubKeys;i++)
	{
		DWORD dwKeynameLen = MaxSubkeyLen;
		FILETIME ft;
		// Namen des Keys ermitteln
		lErg = RegEnumKeyEx(hkSource,i,SubkeyName.s,&dwKeynameLen,NULL,NULL,NULL,&ft);
		if(lErg!=ERROR_SUCCESS)
			continue;
		// Source-Subkey öffnen
		HKEY hkNewSource = NULL;
		lErg = RegOpenKeyEx(hkSource,SubkeyName.s,0,KEY_READ,&hkNewSource);
		if(lErg!=ERROR_SUCCESS)
			continue;

		// Destination-Subkey erzeugen
		HKEY hkNewDest = NULL;
		lErg = RegCreateKeyEx(hkDest,SubkeyName.s,NULL,NULL,0,KEY_WRITE,NULL,&hkNewDest,NULL);
		if(lErg!=ERROR_SUCCESS)
		{
			RegCloseKey(hkNewSource);
			hkNewSource = NULL;
			continue;
		};
		
		// Rekursiv weiterbearbeiten
		_CopyRegistryKey(hkNewSource,hkNewDest);

		// Keys zumachen
		RegCloseKey(hkNewSource);
		RegCloseKey(hkNewDest);

	};
	

	// Jetzt durchnumerieren und Schreiben der Values
	STRING_AP ValueName(MaxValuenameLen);
	STRING_AP Value(MaxValueLen);
	for(DWORD i=0;i<nValues;i++)
	{
		DWORD dwVnl = MaxValuenameLen;
		DWORD dwType = 0;
		DWORD dwDs = MaxValueLen;
		
		lErg = RegEnumValue(hkSource,i,ValueName.s,&dwVnl,NULL,&dwType,(BYTE*)Value.s,&dwDs);
		if(lErg!=ERROR_SUCCESS)
			continue;

		lErg = RegSetValueEx(hkDest,(const char*)ValueName.s,0,dwType,(const unsigned char*)Value.s,dwDs);

	};



	return 0;
};

//*****************************************************************************
//*****************************************************************************
HKEY SplitRegistryPath(char* str,char** path)
{
typedef struct
{
	char	Name[20];
	HKEY	hKey;
}RegKeytabElem;


RegKeytabElem RegKeyTable[] = 
{
	{"HKLM",HKEY_LOCAL_MACHINE},
	{"HKCR",HKEY_CLASSES_ROOT},
	{"HKCC",HKEY_CURRENT_CONFIG},
	{"HKCU",HKEY_CURRENT_USER},
	{"HKUS",HKEY_USERS},
	{"HKEY_LOCAL_MACHINE",HKEY_LOCAL_MACHINE},
	{"HKEY_CLASSES_ROOT",HKEY_CLASSES_ROOT},
	{"HKEY_CURRENT_CONFIG",HKEY_CURRENT_CONFIG},
	{"HKEY_CURRENT_USER",HKEY_CURRENT_USER},
	{"HKEY_USERS",HKEY_USERS},
	{"",NULL}
};

	if(path) *path = NULL;

	char* lpStr = str;

	// Jetzt nachschauen, welcher Schlüssel passt
	RegKeytabElem* rkt = (RegKeytabElem*) &RegKeyTable[0];
	for(rkt = &RegKeyTable[0];rkt->hKey!=0;rkt++)
	{
		if(strncmp(lpStr,rkt->Name,strlen(rkt->Name))==0)
			break;
	};

	// Schlüssel gefunden?
	if(rkt->hKey==NULL) 
		return NULL;

	// Der String muß um so viele Zeichen weitergeschoben wwerden wie 
	// der Kürzel für den Schlüssel lang ist
	lpStr += strlen(rkt->Name);

	// Backslash entfernen falls vorhanden
	if((lpStr[0]!='\0')&&(lpStr[0]=='\\'))
		lpStr++;

	// Rückgabe des Zeigers auf den folgenden Pfad
	if(path) 
		*path = lpStr;

	return rkt->hKey;

};


//*****************************************************************************
//*****************************************************************************
DWORD RegDeleteKeyRecursiv(HKEY hKey,char* DelkeyName)
{

	// Info über den Key besorgen
	DWORD nSubKeys = 0;
	DWORD MaxSubkeyLen = 0;
	DWORD MaxClassLen = 0;
	DWORD nValues = 0;
	DWORD MaxValuenameLen = 0;
	DWORD MaxValueLen = 0;


	HKEY hkSubKey = NULL;
	long lErg = RegOpenKeyEx(hKey,DelkeyName,0,KEY_ALL_ACCESS,&hkSubKey);
	if(lErg!=ERROR_SUCCESS)
		return 1;

	
	// Info über den Key besorgen
	lErg = RegQueryInfoKey(hkSubKey,
								NULL,			// Class Buffer
								NULL,			// ->Classbuffer Size
								NULL,			// Reserved
								&nSubKeys,		// Anzahl Unterschlüssel
								&MaxSubkeyLen,
								&MaxClassLen,
								&nValues,
								&MaxValuenameLen,
								&MaxValueLen,
								NULL,			// ->Länge des Security Descriptors
								NULL);			// ->FILETIME des letzten Schreibzugriffs

	if(lErg!=ERROR_SUCCESS)
		return 2;

	MaxSubkeyLen++;
	MaxClassLen++;
	MaxValuenameLen++;
	MaxValueLen++;

	// Durch die Subkeys iterieren 
	// Zuerst durchenumerieren der Subkeys
	STRING_AP	SubkeyName(MaxSubkeyLen);

	for(DWORD i=0;i<nSubKeys;i++)
	{
		DWORD dwKeynameLen = MaxSubkeyLen;
		FILETIME ft;
		// Namen des Keys ermitteln
		lErg = RegEnumKeyEx(hkSubKey,i,SubkeyName.s,&dwKeynameLen,NULL,NULL,NULL,&ft);
		if(lErg!=ERROR_SUCCESS)
			continue;

		// Rekursiv erst diesen Key bearbeiten
		RegDeleteKeyRecursiv(hkSubKey,SubkeyName.s);

	};


	RegCloseKey(hkSubKey);

	// Löschen des Eintrages, welcher jetzt keine Unterkeys mehr enthält
	RegDeleteKey(hKey,DelkeyName);


	return 0;
};


//*****************************************************************************
//*****************************************************************************
DWORD C_RegistryValue::Read(HKEY hKey,TCHAR* ValueName)
{
	if((hKey==NULL)||(ValueName==NULL))
		return RGN_ERR_INVALID_POINTER;


	SysError = RegQueryValueEx(hKey,ValueName,NULL,&DataType,NULL,&DataSize);
	if((SysError==ERROR_SUCCESS)&&(DataSize!=0))
	{
		// Einlesen des Wertes
		Buffer = new char[DataSize+1];
		SysError = RegQueryValueEx(hKey,ValueName,NULL,&DataType,(UCHAR*)Buffer,&DataSize);
		
	}
	else
		return RGN_ERR_READ_VALUE;

	

	return RGN_ERR_NONE;
};



//*****************************************************************************
//*****************************************************************************
DWORD C_RegistryNode::Init(TCHAR* RegPath)
{
	// Den Pfad zerlegen in einen ROOT Key und einen Pfad Teil
	TCHAR*	_tc			= NULL;
	HKEY	hkRoot		= NULL;

	hkRoot = SplitRegistryPath(RegPath,&_tc);
	if(hkRoot==NULL)
		return RGN_ERR_INVALID_PATH;

	// Öffnen des Keys
	DWORD dwRes = RegOpenKeyEx(hkRoot,_tc,0,KEY_READ,&hNode);
	if(dwRes!=ERROR_SUCCESS)
	{
		SysError = dwRes;
		return RGN_ERR_OPEN_NODE;
	};

	return Init(hNode);

/*
	// Ermitteln von Informationen, die gecachet werden
	dwRes = RegQueryInfoKey(hNode,
							NULL,			// lpClass (Klassen-Namen, noch nicht unterstützt)
							NULL,			// Zeiger auf DWORD für Länge Klassen-Namen-Puffer
							NULL,			// reserved
							&NumSubKeys,	// Anzahl Subkeys
							&MaxSubkeyLen,	
							NULL,			// max. subkey class len
							&NumValues,
							&MaxValuenameLen,
							NULL,			// max. Länge der Daten
							NULL,			// Security descriptor
							NULL);			// FILETIME letzter Schreibzugriff


	if(dwRes!=ERROR_SUCCESS)
	{
		RegCloseKey(hNode);
		hNode = NULL;
		SysError = dwRes;
		return RGN_ERR_QUERY_INFO;
	};

	// Den Puffer für Rückgabedaten anlegen. Dieser muß groß genug sein, sowohl 
	// einen Key- als auch einen Value-Namen aufzunehmen.
	dwBufSize = MaxSubkeyLen;
	if(dwBufSize<MaxValuenameLen)
		dwBufSize=MaxValuenameLen;


	Buffer = new TCHAR[dwBufSize+1];
	memset(Buffer,0,(dwBufSize+1)*sizeof(TCHAR));

	return RGN_ERR_NONE;
	*/
};

//*****************************************************************************
// Initialisiert eine Node, und zwar anhand eines geöffneten Key-Handles
//*****************************************************************************
DWORD C_RegistryNode::Init(HKEY hKey)
{


	hNode = hKey;

	// Ermitteln von Informationen, die gecachet werden
	DWORD dwRes = RegQueryInfoKey(hNode,
							NULL,			// lpClass (Klassen-Namen, noch nicht unterstützt)
							NULL,			// Zeiger auf DWORD für Länge Klassen-Namen-Puffer
							NULL,			// reserved
							&NumSubKeys,	// Anzahl Subkeys
							&MaxSubkeyLen,	
							NULL,			// max. subkey class len
							&NumValues,
							&MaxValuenameLen,
							NULL,			// max. Länge der Daten
							NULL,			// Security descriptor
							NULL);			// FILETIME letzter Schreibzugriff


	if(dwRes!=ERROR_SUCCESS)
	{
		RegCloseKey(hNode);
		hNode = NULL;
		SysError = dwRes;
		return RGN_ERR_QUERY_INFO;
	};

	// Den Puffer für Rückgabedaten anlegen. Dieser muß groß genug sein, sowohl 
	// einen Key- als auch einen Value-Namen aufzunehmen.
	dwBufSize = MaxSubkeyLen;
	if(dwBufSize<MaxValuenameLen)
		dwBufSize=MaxValuenameLen;

	// Von wegen dem NULL Zeichen, das da manchmal noch reinmuß
	dwBufSize += 1;

	Buffer = new TCHAR[dwBufSize+1];
	memset(Buffer,0,(dwBufSize+1)*sizeof(TCHAR));

	return RGN_ERR_NONE;
};


//*****************************************************************************
//*****************************************************************************
DWORD C_RegistryNode::Free(void)
{

	if(hNode)
		RegCloseKey(hNode);
	hNode = NULL;

	if(Buffer)
		delete Buffer;
	Buffer = NULL;

	return RGN_ERR_NONE;
};

//*****************************************************************************
//*****************************************************************************
C_RegistryValue* C_RegistryNode::CreateValue(DWORD idx)
{
	TCHAR* ValName = GetValueName(idx);
	return CreateValue(ValName);

};

//*****************************************************************************
//*****************************************************************************
C_RegistryValue* C_RegistryNode::CreateValue(TCHAR* ValName)
{
	C_RegistryValue* RetVal = NULL;
	
	RetVal = new C_RegistryValue;
	if(RetVal->Read(hNode,ValName)!=RGN_ERR_NONE)
	{
		delete RetVal;
		return NULL;
	};

	return RetVal;
};


//*****************************************************************************
//*****************************************************************************
LONG C_RegistryNode::OpenSubKey(DWORD idx,REGSAM samDesired,PHKEY phkResult)
{
	LONG RetVal = ERROR_NOACCESS;

	if(idx<NumSubKeys)
	{
		TCHAR* lpName = GetSubkeyName(idx);
		
		HKEY hkRes;
		RetVal = RegOpenKeyEx(hNode,lpName,0,samDesired,&hkRes);
		if(RetVal!=ERROR_SUCCESS)
			return RetVal;

		if(phkResult)
			*phkResult = hkRes;

	};


	return RetVal;
};

//*****************************************************************************
//*****************************************************************************
C_RegistryNode* C_RegistryNode::CreateSubNode(DWORD idx,REGSAM samDesired)
{
	C_RegistryNode* RetVal = NULL;
	
	HKEY hKey;
	if(OpenSubKey(idx,samDesired,&hKey)==ERROR_SUCCESS)
	{
		RetVal = new C_RegistryNode;
		if(RetVal->Init(hKey)!=RGN_ERR_NONE)
		{
			delete RetVal;
			RetVal = NULL;
		};

	};

	return RetVal;
};



//*****************************************************************************
//*****************************************************************************
TCHAR* C_RegistryNode::GetSubkeyName(DWORD idx)
{
	if(!Buffer)
		return "";

	Buffer[0] = '\0';

	if(idx<NumSubKeys)
	{
		DWORD dwSize = dwBufSize;
		DWORD dwRes = RegEnumKeyEx(hNode,idx,Buffer,&dwSize,NULL,NULL,NULL,NULL);
		if(dwRes!=ERROR_SUCCESS)
			SysError = dwRes;

	};

	return Buffer;
};

//*****************************************************************************
//*****************************************************************************
TCHAR* C_RegistryNode::GetValueName(DWORD idx)
{
	if(!Buffer)
		return "";

	Buffer[0] = '\0';

	if(idx<NumValues)
	{
		DWORD dwSize = dwBufSize;

		DWORD dwRes = RegEnumValue(hNode,idx,Buffer,&dwSize,NULL,NULL,NULL,NULL);
		if(dwRes!=ERROR_SUCCESS)
			SysError = dwRes;
	};

	return Buffer;

};
