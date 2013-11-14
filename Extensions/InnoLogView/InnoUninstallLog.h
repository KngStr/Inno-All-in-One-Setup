#ifndef ____INC___BLINDO20___FAISEXT___INNOUNINSTALLLOG_H___INC____
#define ____INC___BLINDO20___FAISEXT___INNOUNINSTALLLOG_H___INC____

#pragma warning(disable: 4786)
#pragma warning(disable: 4503)


#include <map>

using namespace std;

#ifdef _DEBUG
#include "V_Bl20_Hlplib.h"
#endif


const BYTE utUserDefined			= 0x01;
const BYTE utStartInstall			= 0x010;
const BYTE utEndInstall				= 0x011;
const BYTE utCompiledCode			= 0x020;
const BYTE utRun					= 0x080;
const BYTE utDeleteDirOrFiles		= 0x081;
const BYTE utDeleteFile				= 0x082;
const BYTE utDeleteGroupOrItem		= 0x083;
const BYTE utIniDeleteEntry			= 0x084;
const BYTE utIniDeleteSection		= 0x085;
const BYTE utRegDeleteEntireKey		= 0x086;
const BYTE utRegClearValue			= 0x087;
const BYTE utRegDeleteKeyIfEmpty	= 0x088;
const BYTE utRegDeleteValue			= 0x089;
const BYTE utDecrementSharedCount	= 0x08A;
const BYTE utRefreshFileAssoc		= 0x08B;
const BYTE utMutexCheck				= 0x08C;
const WORD utRunCompleted			= 0xFFF0;

//  { Flags on ExtraData }
const DWORD  utRun_NoWait					= 0x01;
const DWORD  utRun_WaitUntilIdle			= 0x02;
const DWORD  utRun_ShellExec				= 0x04;
const DWORD  utRun_RunMinimized				= 0x08;
const DWORD  utRun_RunMaximized				= 0x10;
const DWORD  utRun_SkipIfDoesntExist		= 0x20;
const DWORD	 utRun_RunHidden				= 0x40;
const DWORD  utRun_ShellExecRespectWaitFlags = 0x80;
const DWORD  utRun_DisableFsRedir			= 0x100;

const DWORD  utDeleteFile_ExistedBeforeInstall = 0x01;
const DWORD  utDeleteFile_Extra				= 0x02;
const DWORD  utDeleteFile_IsFont			= 0x04;
const DWORD  utDeleteFile_SharedFile		= 0x08;
const DWORD  utDeleteFile_RegisteredServer	= 0x10;
const DWORD  utDeleteFile_CallChangeNotify	= 0x20;
const DWORD  utDeleteFile_RegisteredTypeLib = 0x40;
const DWORD	 utDeleteFile_RestartDelete		= 128;
const DWORD	   utDeleteFile_RemoveReadOnly = 256;
const DWORD	   utDeleteFile_NoSharedFilePrompt = 512;
const DWORD	   utDeleteFile_SharedFileIn64BitKey = 1024;
const DWORD	   utDeleteFile_DisableFsRedir = 2048;

const DWORD  utDeleteDirOrFiles_Extra		= 0x01;
const DWORD  utDeleteDirOrFiles_IsDir		= 0x02;
const DWORD  utDeleteDirOrFiles_DeleteFiles = 0x04;
const DWORD  utDeleteDirOrFiles_DeleteSubdirsAlso = 0x08;
const DWORD  utDeleteDirOrFiles_CallChangeNotify = 0x10;
const DWORD  utDeleteDirOrFiles_DisableFsRedir = 32;

const DWORD  utIniDeleteSection_OnlyIfEmpty	= 0x01;

const DWORD  utReg_64BitKey = 0x001000000;

const DWORD  utDecrementSharedCount_64BitKey = 1;


const DWORD		INNOUNINSTLOG_INITFL_USESHORTPATH	=	0x01;

const BYTE	DATA_TYPE_ANSI_OLD = 0;
const BYTE	DATA_TYPE_ANSI_NEW = 0xFD;
const BYTE	DATA_TYPE_UC = 0xFE;


#pragma pack(push, 1)
typedef struct
{
	char	UninstallLogId[64];
	char	AppId[128];
	char	AppName[128];
	LONG	Version;
	LONG	NumRecords;
	ULONG	EndOffset;
	LONG	Flags;
	LONG	Reserved[27];
	LONG	CRC;
}INNO_LOGHEADER;
#pragma pack(pop)

#pragma pack(push, 1)
typedef struct
{
	DWORD	Size;
	DWORD	NegSize;
	DWORD	CRC;
}INNO_CRCHEADER;
#pragma pack(pop)


#pragma pack(push, 1)
typedef struct
{
	WORD	UninstallRecordType;
	DWORD	ExtraData;
	DWORD	DataSize;
}INNO_UNINSTALLFILERECORD;
#pragma pack(pop)


#pragma pack(push, 1)
typedef struct
{
	INNO_UNINSTALLFILERECORD FileRecord;
	char Data[];
}INNO_UNINSTALL_ENTRY;
#pragma pack(pop)


//typedef multimap<DWORD,char*,less <DWORD> > DELDIR_MAP;
typedef multimap<DWORD,wchar_t*,greater <DWORD> > DELDIR_MAP;


class INNO_MULTIDATA_ELEM
{
private:
	INNO_MULTIDATA_ELEM* Next;

public:
	BYTE	DataType;
	BYTE*	Data;
	DWORD	DataLen;
	DWORD	ParamNumber;

	wchar_t* GetStringW(){return (wchar_t*)Data;}
	char* GetStringA(){return (char*)Data;}
//	long GetString(wchar_t* lpBuf,

	INNO_MULTIDATA_ELEM(BYTE* pData,DWORD DataSize,DWORD nParam)
	{
		Data = NULL;
		Next = NULL;
		DataLen = 0;
		ParamNumber = nParam;
		DWORD HeaderSize = 1;

		DataType = pData[0];
		if(DataType==DATA_TYPE_UC)
		{
			// Die Länge ist hier in einem Block von 4 Bytes codiert, und zwar 
			// als Differenz zu 0xFFFF (Komplementärwert?)
			HeaderSize = 5;
		}
		else if(DataType==DATA_TYPE_ANSI_NEW)
		{
			HeaderSize = 3;
		}
		else
		{
			HeaderSize = 1;
			DataType=DATA_TYPE_ANSI_OLD;
		}

		// Fest verdrahten, so dass der komplette Block gesichert wird!
		DataLen = DataSize - HeaderSize;

		// Vorbereitung auf die Behandlung der Daten als nullterminierte 
		// Strings (muß nicht, aber kann)
		Data = new BYTE[DataLen+2];
		memset(Data,0,DataLen+2);

		memcpy(Data,pData+HeaderSize,DataLen);

		pData+= HeaderSize;		// pData zeigt auf erstes Datenbyte
		pData += DataLen;		// pData zeigt auf Längenangabe nächstes Elem.

	}

	INNO_MULTIDATA_ELEM(BYTE* pData,DWORD nParam)
	{
		Data = NULL;
		Next = NULL;
		DataLen = 0;
		ParamNumber = nParam;
		DWORD HeaderSize = 1;

		DataType = pData[0];
		if(DataType==DATA_TYPE_UC)
		{
			// Die Länge ist hier in einem Block von 4 Bytes codiert, und zwar 
			// als Differenz zu 0xFFFF (Komplementärwert?)
			DWORD* lpDw = (DWORD*)&pData[1];
			DataLen = 0x0 - *lpDw;
			HeaderSize = 5;
		}
		else if(DataType==DATA_TYPE_ANSI_NEW)
		{
			WORD* lpw = (WORD*)&pData[1];
			short* lps = (short*)&pData[1];
			DataLen = *lpw;
			HeaderSize = 3;
		}
		else
		{
			// Länge der Daten steht im ersten Byte, auf welches pData zeigt
			DataLen = DataType;
			HeaderSize = 1;
			DataType=DATA_TYPE_ANSI_OLD;
		}

		// Vorbereitung auf die Behandlung der Daten als nullterminierte 
		// Strings (muß nicht, aber kann)
		Data = new BYTE[DataLen+2];
		memset(Data,0,DataLen+2);

		memcpy(Data,pData+HeaderSize,DataLen);

		pData+= HeaderSize;		// pData zeigt auf erstes Datenbyte
		pData += DataLen;		// pData zeigt auf Längenangabe nächstes Elem.
		

		// Ende der Kette erreicht?
		if(pData[0]==0xff)
			return;

		// Noch kein Ende in Sicht. Nächstes Element erzeugen!
		Next = new INNO_MULTIDATA_ELEM(pData,nParam+1);

	};
	
	~INNO_MULTIDATA_ELEM()
	{
		if(Next) delete Next;
		Next = NULL;
		if(Data) delete Data;
		Data = NULL;
		DataLen = 0;
		ParamNumber = 0;
	};
	
	INNO_MULTIDATA_ELEM* GetNext(void){return Next;};

	DWORD GetCount(void)
	{
		if(Next)
			return Next->GetCount()+1;
		else
			return 1;
	}

	// Ein bestimmtes Glied der Kette nach seiner Nummer suchen
	INNO_MULTIDATA_ELEM* GetEntry(DWORD nParam)
	{
		if(nParam==ParamNumber)
			return this;
		else if((nParam>ParamNumber)&&(Next!=NULL))
			return Next->GetEntry(nParam);
		else return NULL;
	};

};

class C_InnoUninstallLogEntry
{
private:
public:
	INNO_MULTIDATA_ELEM* Data;

	INNO_UNINSTALLFILERECORD LogEntry;

	C_InnoUninstallLogEntry(INNO_UNINSTALL_ENTRY* fe);
	~C_InnoUninstallLogEntry(){if(Data) delete Data; Data = NULL;};

};

class C_InnoUninstallLog
{
protected:
	INNO_LOGHEADER*			LogHeader;

	DWORD WriteLogEntryToFile(HANDLE hFile,C_InnoUninstallLogEntry* lpEn);

private:

	BOOLEAN					UseShortPath;

	BYTE*					DataBlock;
	INNO_UNINSTALL_ENTRY*	FirstEntry;
	
	INNO_UNINSTALL_ENTRY*	FindEntry;

	BOOLEAN FindScanRecordsUntilMatch(BYTE rectype,char* pattern,BYTE pattern_index);

	BOOLEAN ComparePattern(char* pattern,char* path,DWORD len);

	long Fgs_PrintString(INNO_MULTIDATA_ELEM* Data,char* lpStr,LONG cc);
	long Fgs_PrintTime(INNO_MULTIDATA_ELEM* Data,char* lpStr,LONG cc);

	void EventPrintf(TCHAR* string,...)
	{

		const DWORD MAX_STRINGSIZE = 300;

		#ifdef _DEBUG

		STRING_AP Buffer(MAX_STRINGSIZE);

		// Ausgabe des Strings in den Puffer
		va_list parameter;
		va_start(parameter, string);
		DWORD len = _vsnprintf(Buffer.s,MAX_STRINGSIZE, string, parameter);
		strncat(Buffer.s,"\r\n",MAX_STRINGSIZE);

		OutputDebugString(Buffer.s);
		#endif

	};


public:
	C_InnoUninstallLog(){DataBlock = NULL; LogHeader = NULL;
						FirstEntry = NULL; FindEntry = NULL;
						UseShortPath = FALSE;};
	~C_InnoUninstallLog(){Cleanup();};


	INNO_LOGHEADER* GetLogHeader(void){return LogHeader;}

	DWORD Read(TCHAR* path,DWORD flag);
	
	
	// Deletes the data of the object
	DWORD Cleanup(void)
	{
		if(DataBlock) delete DataBlock;
		DataBlock = NULL; LogHeader = NULL;
		FirstEntry = NULL; FindEntry = NULL;
		return 0;
	};

	DWORD CreateTextLog(char* FileName);

	INNO_UNINSTALL_ENTRY* GetFirstRecord(void){return FirstEntry;};
	INNO_UNINSTALL_ENTRY* GetNextRecord(INNO_UNINSTALL_ENTRY* last);

	BOOLEAN FindFirstRecord(BYTE rectype,char* pattern,BYTE pattern_index);	
	BOOLEAN FindNextRecord(BYTE rectype,char* pattern,BYTE pattern_index);

	LONG FindGetString(long StringIndex,char* lpStr,LONG cc);
	DWORD FindGetExtradata(void);
	DWORD FindGetEntryType(void);
	DWORD FindGetParamCount(void);

	DWORD DoUninstall(BYTE rectype,char* pattern,BYTE pattern_index);

};



#endif // ____INC___BLINDO20___FAISEXT___INNOUNINSTALLLOG_H___INC____


