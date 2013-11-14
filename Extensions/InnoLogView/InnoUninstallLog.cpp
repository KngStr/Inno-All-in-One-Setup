#define WIN32_LEAN_AND_MEAN

#include <windows.h>
#include <stdio.h>


//using namespace std;

#include "zlib.h"
#include "InnoUninstallLog.h"

DWORD CrcTable[256];
BOOLEAN InitCrcTable = FALSE;

C_InnoUninstallLogEntry::C_InnoUninstallLogEntry(INNO_UNINSTALL_ENTRY* fe)
{

	memset(&LogEntry,0,sizeof(LogEntry));
	
	Data = NULL;

	if(!fe) return;

	LogEntry = fe->FileRecord;

	// Kette der Einträge erzeugen. Das kompilierte Uninstaller-Script bekommt eine
	// Sonderbehandlung, es scheint nicht den Konventionen der verketteten Blöcke zu 
	// folgen, sondern einen soliden Block zu bilden!
	if(fe->FileRecord.UninstallRecordType==utCompiledCode)
		Data = new INNO_MULTIDATA_ELEM((BYTE*)&fe->Data[0],fe->FileRecord.DataSize,0);
	else
		Data = new INNO_MULTIDATA_ELEM((BYTE*)&fe->Data[0],0);
	
};




//*****************************************************************************
// Read a uninstall file from disk into the intern buffer. 
//*****************************************************************************
DWORD C_InnoUninstallLog::Read(TCHAR* filename,DWORD flag)
{

	EventPrintf("InnoUninstallLog:Read File %s Flag %x",filename,flag);


	if(flag&INNOUNINSTLOG_INITFL_USESHORTPATH)
		UseShortPath = TRUE;
	else
		UseShortPath = FALSE;

	INNO_CRCHEADER CrcHeader;
	
	HANDLE hFile = CreateFile(filename,GENERIC_READ,0,NULL,OPEN_EXISTING,0,NULL);

	if(hFile==INVALID_HANDLE_VALUE) return 1;

	Cleanup();

	// File in den Speicher einlesen
	DWORD FileSize = 0;
	FileSize = GetFileSize(hFile,NULL);
	if((FileSize==INVALID_FILE_SIZE)||(FileSize<(sizeof(INNO_LOGHEADER)+sizeof(INNO_CRCHEADER))))
	{
		CloseHandle(hFile);
		return 2;
	};
	
	DataBlock = new BYTE[FileSize];
	if(!DataBlock)
	{
		CloseHandle(hFile);
		return 3;
	};
	
	
	DWORD nRead = 0;
	if(!ReadFile(hFile,DataBlock,sizeof(INNO_LOGHEADER),&nRead,NULL))
	{
		CloseHandle(hFile);
		return 4;
	};

	// Der Logheader ist drin!
	LogHeader = (INNO_LOGHEADER*) DataBlock;

//	DWORD CurrentFileOffset = 0 + sizeof(INNO_LOGHEADER);
	DWORD CurrentBlockOffset = 0 + sizeof(INNO_LOGHEADER);

	FirstEntry = (INNO_UNINSTALL_ENTRY*) (DataBlock + CurrentBlockOffset);

	BOOLEAN Error = FALSE;

	while(nRead!=0)
	{
		nRead = 0;
		// CRC Header einlesen

		Error = TRUE;

		memset(&CrcHeader,0,sizeof(CrcHeader));
		if(!ReadFile(hFile,&CrcHeader,sizeof(INNO_CRCHEADER),&nRead,NULL))
			break;

		if(nRead<sizeof(INNO_CRCHEADER))
		{
			// Wenn keine Daten gelesen wurden, ist es kein Fehler!
			if(nRead==0) Error=FALSE;
			break;
		}

		// Check: Block-Size o.k.?
		if(CrcHeader.Size!=(~CrcHeader.NegSize))
			break;

		// Einlesen des Blockes
		if(!ReadFile(hFile,DataBlock+CurrentBlockOffset,CrcHeader.Size,&nRead,NULL))
			break;
		
		if(nRead!=CrcHeader.Size)
			break;

		// CRC des Blocks überprüfen
		DWORD dwCrc = crc32(0,DataBlock+CurrentBlockOffset,CrcHeader.Size);
//		DWORD dwCrc = GetCRC32(DataBlock+CurrentBlockOffset,CrcHeader.Size);
		if(dwCrc!=CrcHeader.CRC)
			break;

		Error = FALSE;

		CurrentBlockOffset += CrcHeader.Size;
		
	};


	CloseHandle(hFile);

	if(Error) 
		return 5;



	return 0;
};



//*****************************************************************************
// Writes the logfile to a textfile. This file has got the following 
// structure: 
//
/*
...
[utDeleteDirOrFiles]
Name=D:\Blindo20\Setup\Default
ExtraData=utDeleteDirOrFiles_IsDir 

[utDeleteDirOrFiles]
Name=D:\Blindo20\Setup\User
ExtraData=utDeleteDirOrFiles_IsDir 
...
*/
// It looks a bit like a INI file, but it is not compatible with it,
// because it has got many sections with the same name!!!
//*****************************************************************************
DWORD C_InnoUninstallLog::CreateTextLog(char* FileName)
{
	
	if(LogHeader==NULL)
		return 1;

	char Buffer[MAX_PATH+1];
	memset(Buffer,0,sizeof(Buffer));


	HANDLE hFile = CreateFile(FileName,GENERIC_WRITE,0,NULL,CREATE_ALWAYS,0,NULL);
	if(hFile==INVALID_HANDLE_VALUE)
		return 1;

	DWORD nWritten = 0;

	strncpy(Buffer,"; ********************************************************************************\r\n",MAX_PATH);
	WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
	SYSTEMTIME st;
	GetSystemTime(&st);
	_snprintf(Buffer,MAX_PATH,";  InnoSetup Uninstall Log Textform\r\n");
	WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
	strncpy(Buffer,"; ********************************************************************************\r\n",MAX_PATH);
	WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
	strncpy(Buffer,"\r\n",MAX_PATH);
	WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);

	// Header schreiben
	_snprintf(Buffer,MAX_PATH,"[LOGHEADER]\r\n");
	WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
	
	_snprintf(Buffer,MAX_PATH,"UninstallLogId=%s\r\n",LogHeader->UninstallLogId);
	WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);

	_snprintf(Buffer,MAX_PATH,"AppId=%s\r\n",LogHeader->AppId);
	WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);

	_snprintf(Buffer,MAX_PATH,"AppName=%s\r\n",LogHeader->AppName);
	WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);

	_snprintf(Buffer,MAX_PATH,"Version=%u\r\n",LogHeader->Version);
	WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);

	_snprintf(Buffer,MAX_PATH,"NumRecords=%u\r\n",LogHeader->NumRecords);
	WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);

	_snprintf(Buffer,MAX_PATH,"EndOffset=%u\r\n",LogHeader->EndOffset);
	WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);

	_snprintf(Buffer,MAX_PATH,"Flags=0x0%x\r\n",LogHeader->Flags);
	WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);

	_snprintf(Buffer,MAX_PATH,"CRC=%u\r\n",LogHeader->CRC);
	WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);

	strncpy(Buffer,"\r\n",MAX_PATH);
	WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);

	INNO_UNINSTALL_ENTRY* lpEntry = GetFirstRecord();
	C_InnoUninstallLogEntry* lpEn = NULL;

	while(lpEntry)
	{

		C_InnoUninstallLogEntry* lpEn = new C_InnoUninstallLogEntry(lpEntry);
		if(lpEn)
		{

			WriteLogEntryToFile(hFile,lpEn);						
/*
			_snprintf(Buffer,MAX_PATH,"Entry type %x adress %x Datasize %x ExtraData %x\r\n",lpEn->LogEntry.UninstallRecordType,lpEntry,lpEntry->FileRecord.DataSize,lpEn->LogEntry.ExtraData);
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
			INNO_MULTIDATA_ELEM* mdElem = lpEn->Data;
			DWORD ParamNumber = 0;
			while(mdElem!=NULL)
			{
				_snprintf(Buffer,MAX_PATH,"P %u:%s\r\n",ParamNumber,mdElem->Data);
				WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);

				ParamNumber++;
				mdElem = mdElem->GetNext();
			};
*/

			delete lpEn;
			lpEn = NULL;


		};

		lpEntry = GetNextRecord(lpEntry);
	};


	

	CloseHandle(hFile);

	return 0;
};

//*****************************************************************************
//*****************************************************************************
DWORD C_InnoUninstallLog::WriteLogEntryToFile(HANDLE hFile,C_InnoUninstallLogEntry* lpEn)
{
	char Buffer[MAX_PATH+1];
	memset(Buffer,0,sizeof(Buffer));

	DWORD nWritten = 0;
	INNO_MULTIDATA_ELEM* Data = NULL;

	if(!lpEn) return 1;

	switch(lpEn->LogEntry.UninstallRecordType)
	{
	case utStartInstall:
		_snprintf(Buffer,MAX_PATH,"[utStartInstall]\r\n");
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		Data = lpEn->Data->GetEntry(0);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"ComputerName=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"ComputerName=%s\r\n",Data->GetStringA());

			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};
		Data = lpEn->Data->GetEntry(1);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"UserName=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"UserName=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};

		Data = lpEn->Data->GetEntry(2);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"AppDir=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"AppDir=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};

		Data = lpEn->Data->GetEntry(3);
		if((Data)&&(Data->DataLen==sizeof(SYSTEMTIME)))
		{
			SYSTEMTIME* st = (SYSTEMTIME*) Data->Data;
			_snprintf(Buffer,MAX_PATH,"Time=Y%u-MO%u-DW%u-D%u-H%u-M%u-S%u-MS%u\r\n",st->wYear,st->wMonth,st->wDayOfWeek,st->wDay,st->wHour,st->wMinute,st->wSecond,st->wMilliseconds);
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};
		
		break;

	case utEndInstall:
		_snprintf(Buffer,MAX_PATH,"[utEndInstall]\r\n");
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		Data = lpEn->Data->GetEntry(0);
		if((Data)&&(Data->DataLen==sizeof(SYSTEMTIME)))
		{
			SYSTEMTIME* st = (SYSTEMTIME*) Data->Data;
			_snprintf(Buffer,MAX_PATH,"Time=Y%u-MO%u-DW%u-D%u-H%u-M%u-S%u-MS%u\r\n",st->wYear,st->wMonth,st->wDayOfWeek,st->wDay,st->wHour,st->wMinute,st->wSecond,st->wMilliseconds);
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};
		break;

	case utCompiledCode:
		_snprintf(Buffer,MAX_PATH,"[utCompiledCode]\r\n");
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		Data = lpEn->Data->GetEntry(0);
		_snprintf(Buffer,MAX_PATH,"Code Size %u StorageType %x\r\n",Data->DataLen,Data->DataType);
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		break;

	case utRun:
		_snprintf(Buffer,MAX_PATH,"[utRun]\r\n");
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);

		Data = lpEn->Data->GetEntry(0);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"Name=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"Name=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};

		Data = lpEn->Data->GetEntry(1);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"Parameters=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"Parameters=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};

		Data = lpEn->Data->GetEntry(2);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"WorkingDir=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"WorkingDir=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};

		Data = lpEn->Data->GetEntry(3);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"RunOnceId=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"RunOnceId=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};

		if(lpEn->LogEntry.ExtraData!=0)
		{
			Buffer[0] = '\0';
			strncat(Buffer,"ExtraData=",MAX_PATH);
			if(lpEn->LogEntry.ExtraData&utRun_NoWait)
				strncat(Buffer,"utRun_NoWait ",MAX_PATH);
			if(lpEn->LogEntry.ExtraData&utRun_WaitUntilIdle)
				strncat(Buffer,"utRun_WaitUntilIdle ",MAX_PATH);
			if(lpEn->LogEntry.ExtraData&utRun_ShellExec)
				strncat(Buffer,"utRun_ShellExec ",MAX_PATH);
			if(lpEn->LogEntry.ExtraData&utRun_RunMinimized)
				strncat(Buffer,"utRun_RunMinimized ",MAX_PATH);
			if(lpEn->LogEntry.ExtraData&utRun_RunMaximized)
				strncat(Buffer,"utRun_RunMaximized ",MAX_PATH);

			strncat(Buffer,"\r\n",MAX_PATH);
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};

		break;

	case utDeleteDirOrFiles:
		_snprintf(Buffer,MAX_PATH,"[utDeleteDirOrFiles]\r\n");
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);

		Data = lpEn->Data->GetEntry(0);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"Name=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"Name=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};

		if(lpEn->LogEntry.ExtraData!=0)
		{
			Buffer[0] = '\0';
			strncat(Buffer,"ExtraData=",MAX_PATH);
			if(lpEn->LogEntry.ExtraData&utDeleteDirOrFiles_Extra)
				strncat(Buffer,"utDeleteDirOrFiles_Extra ",MAX_PATH);
			if(lpEn->LogEntry.ExtraData&utDeleteDirOrFiles_IsDir)
				strncat(Buffer,"utDeleteDirOrFiles_IsDir ",MAX_PATH);
			if(lpEn->LogEntry.ExtraData&utDeleteDirOrFiles_DeleteFiles)
				strncat(Buffer,"utDeleteDirOrFiles_DeleteFiles ",MAX_PATH);
			if(lpEn->LogEntry.ExtraData&utDeleteDirOrFiles_DeleteSubdirsAlso)
				strncat(Buffer,"utDeleteDirOrFiles_DeleteSubdirsAlso ",MAX_PATH);
			if(lpEn->LogEntry.ExtraData&utDeleteDirOrFiles_CallChangeNotify)
				strncat(Buffer,"utDeleteDirOrFiles_CallChangeNotify ",MAX_PATH);
			strncat(Buffer,"\r\n",MAX_PATH);
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};
		
		break;

	case utDeleteFile:
		_snprintf(Buffer,MAX_PATH,"[utDeleteFile]\r\n");
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		Data = lpEn->Data->GetEntry(0);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"DestFile=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"DestFile=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};
		Data = lpEn->Data->GetEntry(1);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"TempFile=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"TempFile=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};
		Data = lpEn->Data->GetEntry(2);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"InstallFontName=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"InstallFontName=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};
		Data = lpEn->Data->GetEntry(3);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"ShortFontFilename=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"ShortFontFilename=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};


		if(lpEn->LogEntry.ExtraData!=0)
		{
			Buffer[0] = '\0';
			strncat(Buffer,"ExtraData=",MAX_PATH);
			if(lpEn->LogEntry.ExtraData&utDeleteFile_ExistedBeforeInstall)
				strncat(Buffer,"utDeleteFile_ExistedBeforeInstall ",MAX_PATH);
			if(lpEn->LogEntry.ExtraData&utDeleteFile_Extra)
				strncat(Buffer,"utDeleteFile_Extra ",MAX_PATH);
			if(lpEn->LogEntry.ExtraData&utDeleteFile_IsFont)
				strncat(Buffer,"utDeleteFile_IsFont ",MAX_PATH);
			if(lpEn->LogEntry.ExtraData&utDeleteFile_SharedFile)
				strncat(Buffer,"utDeleteFile_SharedFile ",MAX_PATH);
			if(lpEn->LogEntry.ExtraData&utDeleteFile_RegisteredServer)
				strncat(Buffer,"utDeleteFile_RegisteredServer ",MAX_PATH);
			if(lpEn->LogEntry.ExtraData&utDeleteFile_CallChangeNotify)
				strncat(Buffer,"utDeleteFile_CallChangeNotify ",MAX_PATH);
			if(lpEn->LogEntry.ExtraData&utDeleteFile_RegisteredTypeLib)
				strncat(Buffer,"utDeleteFile_RegisteredTypeLib ",MAX_PATH);
			strncat(Buffer,"\r\n",MAX_PATH);
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};
		
		break;

	case utDeleteGroupOrItem:
		_snprintf(Buffer,MAX_PATH,"[utDeleteGroupOrItem]\r\n");
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);

		Data = lpEn->Data->GetEntry(0);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"WizardGroupValue=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"WizardGroupValue=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};
		Data = lpEn->Data->GetEntry(1);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"Name=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"Name=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};
		break;

	case utIniDeleteEntry:
		_snprintf(Buffer,MAX_PATH,"[utIniDeleteEntry]\r\n");
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		Data = lpEn->Data->GetEntry(0);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"IniFileName=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"IniFileName=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};
		Data = lpEn->Data->GetEntry(1);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"IniSection=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"IniSection=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};
		Data = lpEn->Data->GetEntry(2);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"IniEntry=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"IniEntry=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};
		break;

	case utIniDeleteSection:
		_snprintf(Buffer,MAX_PATH,"[utIniDeleteSection]\r\n");
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		Data = lpEn->Data->GetEntry(0);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"IniFileName=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"IniFileName=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};
		Data = lpEn->Data->GetEntry(1);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"IniSection=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"IniSection=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};

		if(lpEn->LogEntry.ExtraData!=0)
		{
			Buffer[0] = '\0';
			strncat(Buffer,"ExtraData=",MAX_PATH);
			if(lpEn->LogEntry.ExtraData&utIniDeleteSection_OnlyIfEmpty)
				strncat(Buffer,"utIniDeleteSection_OnlyIfEmpty ",MAX_PATH);
			strncat(Buffer,"\r\n",MAX_PATH);
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};
		break;

	case utRegDeleteEntireKey:
		_snprintf(Buffer,MAX_PATH,"[utRegDeleteEntireKey]\r\n");
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		Data = lpEn->Data->GetEntry(0);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"Key=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"Key=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};
		_snprintf(Buffer,MAX_PATH,"RootKey=%#08x\r\n",lpEn->LogEntry.ExtraData);
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		break;

	case utRegClearValue:
		_snprintf(Buffer,MAX_PATH,"[utRegClearValue]\r\n");
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);

		Data = lpEn->Data->GetEntry(0);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"Key=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"Key=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};
		Data = lpEn->Data->GetEntry(1);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"Value=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"Value=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};

		_snprintf(Buffer,MAX_PATH,"RootKey=%#08x\r\n",lpEn->LogEntry.ExtraData);
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		break;

	case utRegDeleteKeyIfEmpty:
		_snprintf(Buffer,MAX_PATH,"[utRegDeleteKeyIfEmpty]\r\n");
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		Data = lpEn->Data->GetEntry(0);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"Key=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"Key=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};
		_snprintf(Buffer,MAX_PATH,"RootKey=%#08x\r\n",lpEn->LogEntry.ExtraData);
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		break;

	case utRegDeleteValue:
		_snprintf(Buffer,MAX_PATH,"[utRegDeleteValue]\r\n");
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		Data = lpEn->Data->GetEntry(0);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"Key=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"Key=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};
		Data = lpEn->Data->GetEntry(1);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"Value=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"Value=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};

		_snprintf(Buffer,MAX_PATH,"RootKey=%#08x\r\n",lpEn->LogEntry.ExtraData);
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		break;

	case utDecrementSharedCount:
		_snprintf(Buffer,MAX_PATH,"[utDecrementSharedCount]\r\n");
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		Data = lpEn->Data->GetEntry(0);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"DestFile=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"DestFile=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};
		break;

	case utRefreshFileAssoc:
		_snprintf(Buffer,MAX_PATH,"[utRefreshFileAssoc]\r\n");
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		break;

	case utMutexCheck:
		_snprintf(Buffer,MAX_PATH,"[utMutexCheck]\r\n");
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		Data = lpEn->Data->GetEntry(0);
		if(Data&&(Data->DataLen!=0))
		{
			if(Data->DataType==DATA_TYPE_UC)
				_snprintf(Buffer,MAX_PATH,"AppMutex=%S\r\n",Data->GetStringW());
			else
				_snprintf(Buffer,MAX_PATH,"AppMutex=%s\r\n",Data->GetStringA());
			WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		};
		break;


	default:
		_snprintf(Buffer,MAX_PATH,"[UNKNOWN]\r\n");
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);

		_snprintf(Buffer,MAX_PATH,"UninstallRecordType=%#08x\r\n",lpEn->LogEntry.UninstallRecordType);
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		_snprintf(Buffer,MAX_PATH,"ExtraData=%#08x\r\n",lpEn->LogEntry.ExtraData);
		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		break;


	};

	// Parameter als rohes Format anzeigen
	_snprintf(Buffer,MAX_PATH,"Raw Parameters:\r\n");
	WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
	DWORD pn = 0;
	Data = lpEn->Data->GetEntry(0);
	while(Data!=NULL)
	{
		pn++;
		if(Data->DataType==DATA_TYPE_UC)
			_snprintf(Buffer,MAX_PATH,"(%u)%S\r\n",pn,Data->GetStringW());
		else
			_snprintf(Buffer,MAX_PATH,"(%u)%s\r\n",pn,Data->GetStringA());

		WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);
		Data = Data->GetNext();
	}

	_snprintf(Buffer,MAX_PATH,"\r\n");
	WriteFile(hFile,Buffer,strlen(Buffer),&nWritten,NULL);


	return 0;
};



INNO_UNINSTALL_ENTRY* C_InnoUninstallLog::GetNextRecord(INNO_UNINSTALL_ENTRY* last)
{
	if(!last) return NULL;

	// Check auf letzten Record in der Datei
	if(last->FileRecord.UninstallRecordType==utEndInstall)
		return NULL;

	BYTE* lpByte = (BYTE*)last;
	lpByte += sizeof(INNO_UNINSTALL_ENTRY);
	lpByte += last->FileRecord.DataSize;

	return (INNO_UNINSTALL_ENTRY*) lpByte;

};


//*****************************************************************************
// Searching for records based on the record tye and a pattern.
// To perform a search, call first FindFirstRecord. Based on the return value,
// call FindNextRecord until the function returns FALSE. 
//
// This functions set the internal pointer to the found record. To read information
// you must call the functions FindGetString or FindGetExtradatam, that worked on 
// the internal pointer. 
//
// rectype can be a value of the ut... byt values from the UninstallRecordType
// field from the INNO_UNINSTALLRECORD struct. 
// To iterate through all records, set rectype to 0;
//
// The search pattern can be the entire string or a part of it at the beginning.
// Wildcard is the asterix (*), and it can only apear at the end of a string. 
// For example, to find all entrys where the string starts with "C:\Windows", 
// the pattern is "C:\Windows*". The pattern "C:\Windows\*.ini" is not valid!
//
// Because each record can contain more than one string, there is a index (pattern_index)
// to identify the string for the pattern. For the types utDeleteFile or 
// utDeleteDirOrFiles the index of the filename is 0. 
//*****************************************************************************
BOOLEAN C_InnoUninstallLog::FindFirstRecord(BYTE rectype,char* pattern,BYTE pattern_index)
{
	EventPrintf("FindFirstRecord type %#02x StrIndex %#02x pattern %s",rectype,pattern_index,pattern);

	
	FindEntry = GetFirstRecord();



	return FindScanRecordsUntilMatch(rectype,pattern,pattern_index);

};


BOOLEAN C_InnoUninstallLog::FindNextRecord(BYTE rectype,char* pattern,BYTE pattern_index)
{

	EventPrintf("FindNextRecord type %#02x StrIndex %#02x pattern %s",rectype,pattern_index,pattern);

	
	// Auf den nächsten Eintrag stellen.
	FindEntry = GetNextRecord(FindEntry);


	// Weiterscannen, bis match gegeben oder Ende
	return FindScanRecordsUntilMatch(rectype,pattern,pattern_index);

};

BOOLEAN C_InnoUninstallLog::ComparePattern(char* pattern,char* path,DWORD len)
{
	EventPrintf("InnoUninstallLog::ComparePattern pattern <%s> path <%s> len %u",pattern,path,len);
	if(UseShortPath)
	{
		char Buffer[_MAX_PATH];
		memset(Buffer,0,sizeof(Buffer));
		GetShortPathName(path,Buffer,_MAX_PATH);
		EventPrintf("Translate compare path into %s",Buffer);
		if(_strnicmp(pattern,Buffer,len)==0)
			return TRUE;

	}
	else
	{
		if(_strnicmp(pattern,path,len)==0)
			return TRUE;

	};

	return FALSE;
};


BOOLEAN C_InnoUninstallLog::FindScanRecordsUntilMatch(BYTE rectype,char* pattern,BYTE pattern_index)
{

	EventPrintf("FindScanRecordsUntilMatch Type %x Pattern %s pat_index %u",rectype,pattern,pattern_index);

	while(FindEntry!=NULL)
	{
		if((rectype==0)||(rectype==FindEntry->FileRecord.UninstallRecordType))
		{
			
			EventPrintf("Found Entry Type %x",FindEntry->FileRecord.UninstallRecordType);

			// Vergleichsmuster gesetzt?
			if(pattern)
			{
				C_InnoUninstallLogEntry* lpEn = new C_InnoUninstallLogEntry(FindEntry);
				if(lpEn)
				{
					// Holen der Daten mit dem passenden Index
					INNO_MULTIDATA_ELEM* Data = lpEn->Data->GetEntry(pattern_index);
					if(Data)
					{
						// Schließt pattern mit einem Stern ab?
						DWORD patlen = strlen(pattern);
						if(pattern[patlen-1]=='*')
						{
							if(ComparePattern(pattern,(char*)Data->Data,patlen-1))
								return TRUE;
							// Abschließender Stern: wildcard
//							if(_strnicmp(pattern,(char*)Data->Data,patlen-1)==0)
//								return TRUE;
						}
						else
						{
							// Komplett-Vergleich des Strings
							if(ComparePattern(pattern,(char*)Data->Data,strlen(pattern)))
								return TRUE;
//							if(strcmpi(pattern,(char*)Data->Data)==0)
//								return TRUE;
						};
					};
					delete lpEn;
				};
			}
			else
				return TRUE;
		};
		
		FindEntry = GetNextRecord(FindEntry);
	};
	
	return FALSE;



	return 0;
};


long C_InnoUninstallLog::Fgs_PrintString(INNO_MULTIDATA_ELEM* Data,char* lpStr,LONG cc)
{
	long dwRes = 0;
	if(Data->DataType==DATA_TYPE_UC)
		dwRes = _snprintf(lpStr,cc,"%S",Data->GetStringW());
	else
	{
		strncpy(lpStr,Data->GetStringA(),cc);
		dwRes = strlen(lpStr);
	}
	return dwRes;
}


long C_InnoUninstallLog::Fgs_PrintTime(INNO_MULTIDATA_ELEM* Data,char* lpStr,LONG cc)
{
	if((Data)&&(Data->DataLen==sizeof(SYSTEMTIME))&&(lpStr))
	{
		SYSTEMTIME* st = (SYSTEMTIME*) Data->Data;
		return _snprintf(lpStr,cc,"Time Y%u-MO%u-DW%u-D%u-H%u-M%u-S%u-MS%u",st->wYear,st->wMonth,st->wDayOfWeek,st->wDay,st->wHour,st->wMinute,st->wSecond,st->wMilliseconds);
	};
	return 0;
}


//*****************************************************************************
// The FindGet... functions get information about the record that is referenced
// by the internal pointer of the object. To set that internal pointer use the 
// FindFirstRecord and the FindNextRecord functions.
//*****************************************************************************
LONG C_InnoUninstallLog::FindGetString(long StringIndex,char* lpStr,LONG cc)
{
	
	C_InnoUninstallLogEntry* lpEn = new C_InnoUninstallLogEntry(FindEntry);
	if(!lpEn) 
		return 0;

		// Holen der Daten mit dem passenden Index
	INNO_MULTIDATA_ELEM* Data = lpEn->Data->GetEntry(StringIndex);
	if(Data)
	{
		DWORD dwRes = 0;

		// Je nach Record-Type müssen die Daten unterschiedlich aufbereitet werden.
		switch(lpEn->LogEntry.UninstallRecordType)
		{

		case utMutexCheck:
			// Nur Strings!
			dwRes = Fgs_PrintString(Data,lpStr,cc);
			break;


		case utRefreshFileAssoc:
			// Nur Strings!
			dwRes = Fgs_PrintString(Data,lpStr,cc);
			break;


		case utDecrementSharedCount:
			// Nur Strings!
			dwRes = Fgs_PrintString(Data,lpStr,cc);
			break;


		case utRegDeleteEntireKey:
		case utRegClearValue:
		case utRegDeleteKeyIfEmpty:
		case utRegDeleteValue:
			// Nur Strings!
			dwRes = Fgs_PrintString(Data,lpStr,cc);
			break;

		case utIniDeleteEntry:
		case utIniDeleteSection:
			// Nur Strings!
			dwRes = Fgs_PrintString(Data,lpStr,cc);
			break;

		case utDeleteFile:
			// Nur Strings!
			dwRes = Fgs_PrintString(Data,lpStr,cc);
			break;
		case utDeleteDirOrFiles:
			// Nur Strings!
			dwRes = Fgs_PrintString(Data,lpStr,cc);
			break;

		case utRun:
			// Nur Strings!
			dwRes = Fgs_PrintString(Data,lpStr,cc);
			break;

		case utEndInstall:
			switch(StringIndex)
			{
			case 0:
				// Zeit
				dwRes = Fgs_PrintTime(Data,lpStr,cc);
				break;
			default:
				dwRes = Fgs_PrintString(Data,lpStr,cc);
			}
			break;

		case utStartInstall:
			{
				switch(StringIndex)
				{
				case 0:
					// ComputerName
					dwRes = Fgs_PrintString(Data,lpStr,cc);
					break;
				case 1:
					// Username
					dwRes = Fgs_PrintString(Data,lpStr,cc);
					break;
				case 2:
					// App-Dir
					dwRes = Fgs_PrintString(Data,lpStr,cc);
					break;
				case 3:
					// Time
					dwRes = Fgs_PrintTime(Data,lpStr,cc);
					break;
				default:
					dwRes = Fgs_PrintString(Data,lpStr,cc);
				}
			}
			break;

		default:
			{
				dwRes = Fgs_PrintString(Data,lpStr,cc);
			}
		}

		//if(Data->DataType==DATA_TYPE_UC)
		//	dwRes = _snprintf(lpStr,cc,"%S",Data->GetStringW());
		//else
		//{
		//	strncpy(lpStr,Data->GetStringA(),cc);
		//	dwRes = strlen(lpStr);
		//}
		return dwRes;
	}

	return 0;
	

//	static char Buffer[MAX_PATH+1];
//	memset(Buffer,0,sizeof(Buffer));

//	if(FindEntry==NULL)
//		return L"";
//
//
//	C_InnoUninstallLogEntry* lpEn = new C_InnoUninstallLogEntry(FindEntry);
//	if(!lpEn) 
//		return L"";
//
//		// Holen der Daten mit dem passenden Index
//	INNO_MULTIDATA_ELEM* Data = lpEn->Data->GetEntry(StringIndex);
//	if(Data)
//	{
//		return Data->GetString();
////		strncat(Buffer,(char*)Data->Data,MAX_PATH);
//	};
//
//	delete lpEn;

//	return L"";
	
};


DWORD C_InnoUninstallLog::FindGetEntryType(void)
{
	if(FindEntry==NULL) 
		return 0;

	return FindEntry->FileRecord.UninstallRecordType;

}

DWORD C_InnoUninstallLog::FindGetParamCount(void)
{
	if(FindEntry==NULL) 
		return 0;

	DWORD dwRes = 0;

	C_InnoUninstallLogEntry* lpEn = new C_InnoUninstallLogEntry(FindEntry);
	dwRes = lpEn->Data->GetCount();
	delete lpEn;
	return dwRes;

}


DWORD C_InnoUninstallLog::FindGetExtradata(void)
{
	if(FindEntry==NULL) 
		return 0;

	return FindEntry->FileRecord.ExtraData;

};


//*****************************************************************************
// performs uninstall on a set of records. The records supportet are until now: 
// utDeleteDirOrFiles, utDeleteFile. 
//
// This function works only on files that are not locked.
//*****************************************************************************
DWORD C_InnoUninstallLog::DoUninstall(BYTE rectype,char* pattern,BYTE pattern_index)
{

	EventPrintf("DoUninstall type %#02x StrIndex %#02x pattern %s",rectype,pattern_index,pattern);


//	if(rectype==utDeleteFile)
//	{
//		BOOLEAN FindErg = FindFirstRecord(rectype,pattern,pattern_index);
//		while(FindErg)
//		{
//			// Stringparameter 0 ist der Dateinamen
//			wchar_t* fname = FindGetString(0);
//			if(wcslen(fname))
//			{
//				EventPrintf("Delete File %s",fname);
//				DeleteFileW(fname);				
//			};
//
//			FindErg = FindNextRecord(rectype,pattern,pattern_index);
//		};
//	}
//	else if(rectype==utDeleteDirOrFiles)
//	{
//		DELDIR_MAP DirsToDelete;
//		wchar_t Buffer[MAX_PATH+1];
//		memset(Buffer,0,sizeof(Buffer));
//
//		BOOLEAN FindErg = FindFirstRecord(rectype,pattern,pattern_index);
//		while(FindErg)
//		{
//			// Stringparameter 0 ist der Dateinamen
//			wchar_t* fname = FindGetString(0);
//			DWORD ExtraData = FindGetExtradata();
//			if(wcslen(fname))
//			{
//				// Directory oder nicht?
//				if(ExtraData&utDeleteDirOrFiles_IsDir)
//				{
//					// Es ist ein Verzeichnis. Analysieren und aufheben bis später!
//
//					// Vollen Pfadnamen ermitteln, um die Verzeichnistiefe analysieren
//					// zu können. 
//					wchar_t* chFname = NULL;
//					GetFullPathNameW(fname,MAX_PATH,Buffer,&chFname);
//					DWORD BsCount = 0;
//					for(wchar_t* cTmp = Buffer;cTmp[0]!=L'\0';cTmp++)
//					{
//						if(cTmp[0]==L'\\')
//							BsCount++;
//					};
//					
//					// In der Map speichern
//					wchar_t* chTmp = new wchar_t[wcslen(Buffer)+1];
//					wcscpy(chTmp,Buffer);
//					DirsToDelete.insert(DELDIR_MAP::value_type(BsCount,chTmp));
//
//				}
//				else
//				{
//					// Standard Datei: kann gelöscht werden!
//
//					EventPrintf("Delete File %s",fname);
//					DeleteFileW(fname);				
//				};
//			};
//
//			FindErg = FindNextRecord(rectype,pattern,pattern_index);
//		};
//		
//		// Löschen der Verzeichnisse
//		while(!DirsToDelete.empty())
//		{
//			wchar_t* chTmp = DirsToDelete.begin()->second;
//			if(chTmp)
//			{
//
//				EventPrintf("Delete Directory %s",chTmp);
//
//				RemoveDirectoryW(chTmp);
//				delete chTmp;
//			};
//			DirsToDelete.erase(DirsToDelete.begin());
//		};
////		for(DELDIR_MAP::iterator i = DirsToDelete.begin();
//
//
//	};


	return 0;
}

