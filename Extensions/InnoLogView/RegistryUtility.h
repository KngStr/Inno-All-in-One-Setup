#ifndef ____INC___SETUP___REGISTRYUTILITY_H___INC____
#define ____INC___SETUP___REGISTRYUTILITY_H___INC____

DWORD CopyRegistryKeyA(char* source,char* dest);
DWORD _CopyRegistryKey(HKEY hkSource, HKEY hkDest);
HKEY SplitRegistryPath(char* str,char** path);
DWORD RegDeleteKeyRecursiv(HKEY hKey,char* DelkeyName);

typedef enum
{
	RGN_ERR_NONE= 0,
	RGN_ERR_INVALID_PATH,
	RGN_ERR_OPEN_NODE,
	RGN_ERR_QUERY_INFO,
	RGN_ERR_NOT_OPEN,
	RGN_ERR_INVALID_POINTER,
	RGN_ERR_READ_VALUE,
	RGN_ERR_LAST
}REGNODE_ERROR;


class C_RegistryValue
{
private:
	char*	Buffer;
	DWORD	DataSize;
	DWORD	DataType;
	DWORD	SysError;

	void InitPrivateData(void)
	{
		Buffer = NULL;
		DataSize = 0;
		DataType = REG_NONE;
		SysError = ERROR_SUCCESS;
	};

public:
	C_RegistryValue(){InitPrivateData();};
	~C_RegistryValue()
	{
		if(Buffer) delete Buffer;
		InitPrivateData();
	};

	DWORD Read(HKEY hKey,TCHAR* ValueName);
	void* GetData(DWORD* lpSize,DWORD* lpType)
	{
		if(lpSize) *lpSize = DataSize;
		if(lpType) *lpType = DataType;
		return Buffer;
	};

};

class C_RegistryNode
{
private:
	HKEY	hNode;
	TCHAR*	Buffer;
	DWORD	dwBufSize;
	DWORD	SysError;

	// Diverse Informationen, die beim Öffnen ermittelt und gecachet werden
	DWORD	NumSubKeys;
	DWORD	MaxSubkeyLen;
	DWORD	NumValues;
	DWORD	MaxValuenameLen;

	


	void InitPrivateData(void)
	{
		hNode = NULL; NumSubKeys = 0; MaxSubkeyLen = 0;
		SysError = ERROR_SUCCESS; NumValues = 0; MaxValuenameLen = 0;
		Buffer = NULL; dwBufSize = 0;
	};

public:
	C_RegistryNode(){InitPrivateData();};
	~C_RegistryNode(){Free();InitPrivateData();};
	
	DWORD Init(TCHAR* RegPath);
	DWORD Init(HKEY hKey);
	DWORD Free(void);

	TCHAR* GetSubkeyName(DWORD idx);
	TCHAR* GetValueName(DWORD idx);

	DWORD GetError(void){return SysError;};

	// Zugriffsfunktionen, die gecachte Infos einfach weitergeben
	DWORD GetNumSubKeys(void){return NumSubKeys;};
	DWORD GetNumValues(void){return NumValues;};
	DWORD GetMaxSubkeyNameLen(void){return MaxSubkeyLen;};
	DWORD GetMaxValueNameLen(void){return MaxValuenameLen;};
	
	LONG OpenSubKey(DWORD idx,REGSAM samDesired,PHKEY phkResult);

	C_RegistryNode* CreateSubNode(DWORD idx,REGSAM samDesired);

	C_RegistryValue* CreateValue(DWORD idx);
	C_RegistryValue* CreateValue(TCHAR* ValName);


};


#endif // ____INC___SETUP___REGISTRYUTILITY_H___INC____
