#define WIN32_LEAN_AND_MEAN

#include <windows.h>
#include <vector>


using namespace std;

#include "SoftwareuninstallEntry.h"
#include "RegistryUtility.h"

const char REGISTRY_UNINSTALLINFO_PATH[] = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall";

const char REGISTRY_BL3X_MOVED_UNINSTALLINFO_PATH[] = "SOFTWARE\\FRANK AUDIODATA\\Blindows\\V300\\UninsBack";


BOOLEAN ArgumentMatch(char* strElem,char* strArg,DWORD op);


// Folgende Schlüssel können in der Kommandozeile verwandt werden. 


// Gibt den Namen (oder einen Teil davon) des Uninstallers vor. 
// Der Uninstaller-Name ist gleichbedeutend mit dem Namen des Registry-Schlüssels
// unter REGISTRY_UNINSTALL_PATH
// Wird in der Kommandozeile übergeben. 
const char UNINSTALL_NAME[]		= "/uninstaller_name";
// Selektierte Menge der Selektion hinzufügen
const char ADD_ENTRYS[]			=	"/add";
// Selektierte Menge aus der Selektion entfernen
const char REMOVE_ENTRYS[]		=	"/remove";
// Selektion durch selektierte Menge ersetzen
const char REPLACE_ENTRYS[]		=	"/replace";
// Anhand der Argumente eine Untermenge aus der selektierten Menge bilden
const char SUBSELECT_ENTRYS[]	=	"/subselect";


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
	ARGUMENT_TYPE_INVALID = 0,
	ARGUMENT_TYPE_NAME,
	ARGUMENT_TYPE_VALUES,
	ARGUMENT_TYPE_LAST
}ARGUMENT_TYPE;

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

	BOOLEAN Match(char* str)
	{
		return ArgumentMatch(str,Name,Operator);
	};

	char*					Name;
	COMMANDLINE_OPERATOR	Operator;
};


class ARGUMENT_STRUCT
{
public:
	COMMANDLINE_OPERATOR	Operator;
	char*					Key;
	char*					Value;
	ARGUMENT_STRUCT*		Next;
	~ARGUMENT_STRUCT(){if(Key) delete Key; Key=NULL;if(Value) delete Value; Value=NULL;if(Next) delete Next; Next = NULL;};
	ARGUMENT_STRUCT(char* argstr)
	{
		Key=NULL;
		Value=NULL;
		Operator=OPERATOR_INVALID;
		Next = NULL;

		if(!argstr) return;

		char* start = argstr; 

		// Nix drin: NULL zurückgeben
		if((!start)||(start[0]=='\0'))
			return;

		// Scan bis zum ersten Non-Space
		while((start[0]==' ')&&(start[0]!='\0'))
			start++;

		// Nix mehr im String?
		if(start[0]=='\0')
			return;

		// Delimiter festlegen
		char Delimiter = ' ';
		if(start[0]=='"')
		{
			Delimiter = '"';
			start++;
		};

		// Finde nächsten Delimiter, Operator oder space
		DWORD sLen = 0;
		if(Delimiter=='"')
		{
			while((start[sLen]!=Delimiter)&&(start[sLen]!='\0'))
				sLen++;
		}
		else
		{
			while((start[sLen]!='\0')&&(start[sLen]!='=')&&(start[sLen]!='<')&&(start[sLen]!='>'))
				sLen++;
		}
		
		if(sLen)
		{
			sKey(start,sLen);
			start += sLen;
		}
		else return;

		// Erster Nicht-Delimiter gesucht!
		while((start[0]!='\0')&&((start[0]==Delimiter)||(start[0]==' ')))
			start++;

		// Operator gesucht!
		if(start[0]=='=')
			Operator=OPERATOR_EQUAL;
		else if(start[0]=='>')
			Operator=OPERATOR_GREATER;
		else if(start[0]=='<')
			Operator=OPERATOR_LESS;
		else
		{
			Operator = OPERATOR_INVALID;
			if(start[0]!='\0')
				start++;
			// Noch was im String drin?
			if(strlen(start))
				Next = new ARGUMENT_STRUCT(start);
			return;
		};

		// Operator überspringen
		start++;


		// Value gesucht.
		// Scan bis zum ersten Non-Space
		while((start[0]==' ')&&(start[0]!='\0'))
			start++;

		// Nix mehr im String?
		if(start[0]=='\0')
			return;

		// Delimiter festlegen
		Delimiter = ' ';
		if(start[0]=='"')
		{
			Delimiter = '"';
			start++;
		};

		// Finde nächsten Delimiter
		sLen = 0;
		while((start[sLen]!=Delimiter)&&(start[sLen]!='\0'))
			sLen++;
		
		if(sLen)
		{
			sValue(start,sLen);
			start += sLen;
		}
		else sValue(NULL,0);

		// Den letzten gefundenen Delimiter überspringen
		if(start[0]!='\0')
			start++;
		// Noch was im String?
		if(strlen(start))
			Next = new ARGUMENT_STRUCT(start);
		
	};


	void sValue(char* value,DWORD len)
	{
		if(!value)
		{
			if(Value) delete Value;
			Value = NULL;
			return;
		};
		if(Value) delete Value;
		Value = NULL;
		Value = new char[len+1];
		memset(Value,0,len+1);
		strncpy(Value,value,len);
	};
	void sKey(char* key,DWORD len)
	{
		if(!key)
		{
			if(Key) delete Key;
			Key = NULL;
			return;
		};
		

		if(Key) delete Key;
		Key = NULL;
		Key = new char[len+1];
		memset(Key,0,len+1);
		strncpy(Key,key,len);
	};

	//*************************************************************************
	//*************************************************************************
	BOOLEAN Match(HKEY hKey)
	{
		// Schauen, ob hier alle Daten zum Vergleich da sind.
		if((Key!=NULL)&&(Value!=NULL)&&(Operator!=OPERATOR_INVALID)&&(hKey!=NULL))
		{
			// Vergleich durchführen
			DWORD MaxValLen = 0;
			long lErg = 0;
			// Maximale Länge für Values ermitteln
			lErg = RegQueryInfoKey(hKey,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,&MaxValLen,NULL,NULL);
			if(lErg!=ERROR_SUCCESS)
				return FALSE;
			MaxValLen++;

			// Value lesen
			STRING_AP ValBuf(MaxValLen);
			DWORD dwType = 0;
			RegQueryValueEx(hKey,Key,NULL,&dwType,(UCHAR*)ValBuf.s,&MaxValLen);
			
			// Vergleichen des gelesenen Wertes
			if(ArgumentMatch(ValBuf.s,Value,Operator))
			{
				// Hier passt es schon mal. Gibt es auch noch andere, welche passen
				// müssen?
				if(Next)
					return Next->Match(hKey);
				else return TRUE;

			}
			else return FALSE;
		}
		else
		{
			// Hier kann kein Vergleich angestellt werden. Vielleicht taugt das 
			// nächste Element zum Vergleuich?
			if(Next)
				return Next->Match(hKey);
			else return TRUE;
			
		};

		return FALSE;
	};

};

typedef vector<ARGUMENT_STRUCT*> COMMANDLINE_ARG_SET;



class COMMANDLINE_ARGUMENTS
{
public:
	COMMANDLINE_ACTION			Action;
	COMMANDLINE_STRING_ARG*		UninstallName;
	ARGUMENT_STRUCT*			Arguments;


	COMMANDLINE_ARGUMENTS(char* cl,char* args)
	{
		Arguments = NULL;

		Action = ACTION_INVALID;
		UninstallName = NULL;

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

		// Look for commandline switches
		char* Arg = NULL;
		Arg = strstr(TempCommandLine,UNINSTALL_NAME);
		if(Arg)
		{
			UninstallName = ParseArgument(Arg+strlen(UNINSTALL_NAME));
		};


		// Look for Arguments
		if(args)
		{

			// Find all arguments
			Arguments = new ARGUMENT_STRUCT(args);
		
		};


	};
	~COMMANDLINE_ARGUMENTS()
	{
		Action = ACTION_INVALID;
		if(UninstallName) delete UninstallName;
		UninstallName = NULL;

		if(Arguments) delete Arguments;
		Arguments = NULL;

	};


	BOOLEAN Match(char* name, HKEY hKey)
	{
		if((name!=NULL)&&(UninstallName!=NULL)&&(!UninstallName->Match(name)))
			return FALSE;

		// Abfragen der Argumente, ob sie passen
		if(Arguments)
			return Arguments->Match(hKey);
		else
			return TRUE;
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





//*****************************************************************************
//*****************************************************************************
DWORD C_SoftwareUninstallList::BuildList(void)
{
	HKEY hKey = NULL;

	DWORD nSubKeys = 0;
	DWORD MaxSubkeyLen = 0;
	DWORD MaxClassLen = 0;
	DWORD nValues = 0;
	DWORD MaxValuenameLen = 0;
	DWORD MaxValueLen = 0;
	
	// Uninstall Registry key öffnen
	long lErg = RegOpenKeyEx(HKEY_LOCAL_MACHINE,REGISTRY_UNINSTALLINFO_PATH,0,KEY_READ,&hKey);
	if(lErg!=ERROR_SUCCESS)
		return lErg;

	// Info über den Key besorgen

	lErg = RegQueryInfoKey(hKey,
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
		return lErg;

	MaxSubkeyLen++;
	MaxClassLen++;
	MaxValuenameLen++;
	MaxValueLen++;


	// Durch die Unterschlüssel iterieren und alle Unterschlüssel in die Liste einlesen
	STRING_AP	SubkeyName(MaxSubkeyLen);

	for(DWORD i=0;i<nSubKeys;i++)
	{
		DWORD dwKeynameLen = MaxSubkeyLen;
		FILETIME ft;
		// Namen des Keys ermitteln
		lErg = RegEnumKeyEx(hKey,i,SubkeyName.s,&dwKeynameLen,NULL,NULL,NULL,&ft);
		if(lErg!=ERROR_SUCCESS)
			continue;

		// Listen-Eintrag erzeugen
		C_UninstallListEntry* le = NULL;
		le = new C_UninstallListEntry(SubkeyName.s);
		UninstallList.push_back(le);

	};
	
	RegCloseKey(hKey);

	ListBuild = TRUE;
	return 0;
};

//*****************************************************************************
//*****************************************************************************
DWORD C_SoftwareUninstallList::DestroyList(void)
{
	C_UninstallListEntry* le = NULL;

	// Leermachen des Vectors
	while(UninstallList.size()!=0)
	{
		le = UninstallList.back();
		UninstallList.pop_back();
		if(le) delete le;
		le = NULL;
	};

	ListBuild = FALSE;

	return 0;
};

//*****************************************************************************
//*****************************************************************************
DWORD	C_SoftwareUninstallList::SelectByIndex(long index,BOOLEAN sel)
{
	// Index in Ordnung?
	if((index>=0)&&(index<UninstallList.size()))
	{
		C_UninstallListEntry* le = UninstallList[index];
		if(le)
		{
			le->Select(sel);
		};
		return GetSelCount();
	}
	else return GetSelCount();

	return GetSelCount();
};


//*****************************************************************************
//*****************************************************************************
DWORD	C_SoftwareUninstallList::Select(char* commandline,char* args)
{

	STRING_AP	EntryName(MAX_PATH);

	HKEY hKey = NULL;
	HKEY hSubKey = NULL;

	// Uninstall Registry key öffnen
	long lErg = RegOpenKeyEx(HKEY_LOCAL_MACHINE,REGISTRY_UNINSTALLINFO_PATH,0,KEY_READ,&hKey);
	if(lErg!=ERROR_SUCCESS)
		return GetSelCount();

		
	COMMANDLINE_ARGUMENTS* lpArguments = new COMMANDLINE_ARGUMENTS(commandline,args);

	BOOLEAN*	pOldSelection = NULL;

	// Subselect. Merken der alten Selektion zum Abgleich und Löschen der
	// selektierten Einträge aus der Liste.
	if(lpArguments->Action==ACTION_SUBSELECT)
	{
		// Merken der alten Selektion
		DWORD dwArraySize = UninstallList.size()+1;
		pOldSelection = new BOOLEAN[dwArraySize];
		memset(pOldSelection,0,dwArraySize);

		DWORD nEntry = UninstallList.size();
		for(DWORD i=0;i<nEntry;i++)
		{
			if(UninstallList[i]==NULL)
				continue;
		
			pOldSelection[i] = UninstallList[i]->IsSelected();
			
		};
	};

	// Beim Replace vorher alle Selektionen löschen.
	if(lpArguments->Action==ACTION_REPLACE)
	{
		DWORD nEntry = UninstallList.size();
		for(DWORD i=0;i<nEntry;i++)
		{
			C_UninstallListEntry* le = UninstallList[i];
			if(le==NULL)
				continue;

			le->Select(FALSE);
		};
	};

	DWORD nEntry = UninstallList.size();
	for(DWORD i=0;i<nEntry;i++)
	{
		C_UninstallListEntry* le = UninstallList[i];
		if(le==NULL)
			continue;
		
		// Registry Schlüssel öffnen
		char* chName = le->GetEntryName();
		if(!chName) 
			continue;

		long lErg = RegOpenKeyEx(hKey,chName,0,KEY_READ,&hSubKey);
		if(lErg!=ERROR_SUCCESS)
			continue;

		// Subselect: schaue nach, ob Element überhaupt selektiert ist
		if((lpArguments->Action==ACTION_SUBSELECT)&&(le->IsSelected()==FALSE))
			continue;

		// Stimmen die Argumente?
		if(!lpArguments->Match(chName,hSubKey))
		{
			RegCloseKey(hSubKey);
			hSubKey = NULL;
			continue;
		};

		RegCloseKey(hSubKey);
		hSubKey = NULL;

		// Match ist festgestellt. Nun schauen, was wir machen sollen.
		switch(lpArguments->Action)
		{
		case ACTION_SUBSELECT:
			if((pOldSelection)&&(pOldSelection[i]==TRUE))
				le->Select(TRUE);
			break;

		case ACTION_REPLACE:
		case ACTION_ADD:
			le->Select(TRUE);
			break;

		case ACTION_REMOVE:
			le->Select(FALSE);
			break;
		};

	
	};


	if(hKey)
		RegCloseKey(hKey);

	if(pOldSelection)
		delete pOldSelection;

	return GetSelCount();
};
 

//*****************************************************************************
//*****************************************************************************
DWORD	C_SoftwareUninstallList::GetSelCount(void)
{
	DWORD RetVal = 0;

	DWORD nEntry = UninstallList.size();
	for(DWORD i=0;i<nEntry;i++)
	{
		C_UninstallListEntry* le = UninstallList[i];
		if((le)&&(le->IsSelected()))
			RetVal++;
	};

	return RetVal;
};


//*****************************************************************************
// Restore the entrys found in RegSrcPath to the uninstaller entrys.
// To update the data, the list is build up again if it was read. 
//*****************************************************************************
DWORD	C_SoftwareUninstallList::RestoreEntrys(char* RegSrcPath,BOOLEAN DeleteSrc)
{
	HKEY hkSrc			= NULL;
	HKEY hkSrcRoot		= NULL;
	HKEY hkSrcSubkey	= NULL;
	char* lpSrcPath		= NULL;

	HKEY hkDest			= NULL;
	HKEY hkDestSubkey	= NULL;

	// Bereite den String auf
	hkSrcRoot = SplitRegistryPath(RegSrcPath,&lpSrcPath);

	long lErg = ERROR_SUCCESS;

	// Uninstall Registry key öffnen
	lErg = RegOpenKeyEx(HKEY_LOCAL_MACHINE,REGISTRY_UNINSTALLINFO_PATH,0,KEY_WRITE,&hkDest);
	if(lErg!=ERROR_SUCCESS)
	{
		return 1;
	};

	// Source Key öffnen
	lErg = RegOpenKeyEx(HKEY_LOCAL_MACHINE,lpSrcPath,0,KEY_READ,&hkSrc);
	if(lErg!=ERROR_SUCCESS)
	{
		RegCloseKey(hkDest);
		return 2;
	};

	// Infos über den Key ermitteln (Anzahl Subkeys, Subkey maximale Länge
	DWORD dwNumSubkeys = 0;
	DWORD dwMaxSubkeyLen = 0;
	lErg = RegQueryInfoKey(hkSrc,NULL,NULL,NULL,&dwNumSubkeys,&dwMaxSubkeyLen,NULL,NULL,NULL,NULL,NULL,NULL);
	
	dwMaxSubkeyLen++;

	STRING_AP SubkeyName(dwMaxSubkeyLen);

	// Durch die Subkeys iterieren und diese kopieren, falls nicht vorhanden
	for(DWORD i=0;i<dwNumSubkeys;i++)
	{
		DWORD dwBufLen = dwMaxSubkeyLen;
		FILETIME ft;
		lErg = RegEnumKeyEx(hkSrc,i,SubkeyName.s,&dwBufLen,NULL,NULL,NULL,&ft);
		if(lErg!=ERROR_SUCCESS)
			continue;

		// Öffnen des Ziel-Keys
		DWORD dwDisposition = 0;
		lErg = RegCreateKeyEx(hkDest,SubkeyName.s,0,NULL,0,KEY_WRITE,NULL,&hkDestSubkey,&dwDisposition);
		if(lErg!=ERROR_SUCCESS)
			continue;

		// Wurde alter Subkey gefunden? Wenn ja, darf er nicht überschrieben werden!
		if(dwDisposition==REG_OPENED_EXISTING_KEY)
		{
			RegCloseKey(hkDestSubkey);
			hkDestSubkey = NULL;
			if(DeleteSrc)
			{
				RegDeleteKeyRecursiv(hkSrc,SubkeyName.s);
			};
			continue;
		};

		// Öffnen des Source-Keys und Kopieren
		lErg = RegOpenKeyEx(hkSrc,SubkeyName.s,0,KEY_READ,&hkSrcSubkey);
		if(lErg!=ERROR_SUCCESS)
		{
			RegCloseKey(hkDestSubkey);
			hkDestSubkey = NULL;
			continue;
		};

		// Kopieren des Keys und seiner Kinder
		_CopyRegistryKey(hkSrcSubkey,hkDestSubkey);

		RegCloseKey(hkSrcSubkey);
		hkSrcSubkey = NULL;
		RegCloseKey(hkDestSubkey);
		hkDestSubkey = NULL;

		if(DeleteSrc)
		{
			RegDeleteKeyRecursiv(hkSrc,SubkeyName.s);
		};


	};

	


	return 0;
};




//*****************************************************************************
//*****************************************************************************
DWORD	C_SoftwareUninstallList::DeleteEntrys(long index)
{
	DWORD RemoveCount = 0;
	HKEY hKey = NULL;

	long lErg = ERROR_SUCCESS;

	// Öffnen des Uninstall-Keys
	// Uninstall Registry key öffnen
	lErg = RegOpenKeyEx(HKEY_LOCAL_MACHINE,REGISTRY_UNINSTALLINFO_PATH,0,KEY_READ,&hKey);
	if(lErg!=ERROR_SUCCESS)
	{
		return RemoveCount;
	};


	
	// Durchgehen der Liste und löschen der selektierten Einträge
	if(index==-1)
	{

		UNINSTALL_VECTOR::iterator it;

		for(it=UninstallList.begin();it!=UninstallList.end();it++)
		{
			C_UninstallListEntry* le = *it;

			if(le==NULL)
				continue;
			
			if(!le->IsSelected())
				continue;

			if(le->GetEntryName()==NULL)
				continue;

			RemoveCount++;

			// Löschen des Schlüssels
			RegDeleteKeyRecursiv(hKey,le->GetEntryName());

			// Eintrag aus Liste löschen
			delete le;
			it = UninstallList.erase(it);


		}

	}
	else if((index>=0)&&(index<UninstallList.size()))
	{
		// bestimmter Eintrag ist ausgewählt
		C_UninstallListEntry* le = UninstallList[index];
		if((le)&&(le->IsSelected()&&(le->GetEntryName())))
		{

			// Löschen des Schlüssels
			RegDeleteKeyRecursiv(hKey,le->GetEntryName());

			// Eintrag aus Listes löschen
			delete le;
			UNINSTALL_VECTOR::iterator it;
			it = UninstallList.begin();
			it += index;
			UninstallList.erase(it);

		};

	};



	return RemoveCount;
};


//*****************************************************************************
// Move the selected (if EntryNr==-1) or one entry with the index EntryNr
// to RegDestPath. 
//*****************************************************************************
DWORD	C_SoftwareUninstallList::MoveEntrys(char* RegDestPath,long EntryNr)
{
	HKEY hkDest = NULL;
	HKEY hkDestRoot = NULL;
	char* lpDestPath = NULL;

	HKEY hKey = NULL;
	HKEY hSubKey = NULL;


	// Bereite den String auf
	hkDestRoot = SplitRegistryPath(RegDestPath,&lpDestPath);

	// Öffnen des Destination-Keys
	long lErg = RegCreateKeyEx(hkDestRoot,lpDestPath,0,NULL,0,KEY_WRITE,NULL,&hkDest,NULL);
	if(lErg!=ERROR_SUCCESS)
		return 1;


	// Öffnen des Uninstall-Keys
	// Uninstall Registry key öffnen
	lErg = RegOpenKeyEx(HKEY_LOCAL_MACHINE,REGISTRY_UNINSTALLINFO_PATH,0,KEY_READ,&hKey);
	if(lErg!=ERROR_SUCCESS)
	{
		RegCloseKey(hkDest);
		return 2;
	};

	// Durchgehen der Liste und kopieren der selektierten Einträge
	if(EntryNr==-1)
	{
		// Liste durchgehen
		DWORD nEntry = UninstallList.size();
		for(DWORD i=0;i<nEntry;i++)
		{
			C_UninstallListEntry* le = UninstallList[i];
			if(le==NULL)
				continue;
			
			if(!le->IsSelected())
				continue;

			if(le->GetEntryName()==NULL)
				continue;

			// Registry Schlüssel öffnen
			char* chName = le->GetEntryName();
			if(!chName) 
				continue;

			long lErg = RegOpenKeyEx(hKey,chName,0,KEY_READ,&hSubKey);
			if(lErg!=ERROR_SUCCESS)
				continue;

			HKEY hkDestSubkey = NULL;
			lErg = RegCreateKeyEx(hkDest,chName,0,NULL,0,KEY_WRITE,NULL,&hkDestSubkey,NULL);
			if(lErg!=ERROR_SUCCESS)
				continue;


			// Kopieren des Schlüssels mit allen Unterschlüsseln und Werten
			_CopyRegistryKey(hSubKey,hkDestSubkey);
			RegCloseKey(hkDestSubkey);
			hkDestSubkey = NULL;

			RegCloseKey(hSubKey);
			hSubKey = NULL;
			

			// Löschen des alten Schlüssels
			RegDeleteKeyRecursiv(hKey,chName);

		};


	}
	else if((EntryNr>=0)&&(EntryNr<UninstallList.size()))
	{
		// bestimmter Eintrag ist ausgewählt
		C_UninstallListEntry* le = UninstallList[EntryNr];
		if((le)&&(le->IsSelected()&&(le->GetEntryName())))
		{
			char* chName = le->GetEntryName();

			long lErg = RegOpenKeyEx(hKey,chName,0,KEY_READ,&hSubKey);
			if(lErg!=ERROR_SUCCESS)
			{
				RegCloseKey(hkDest);
				RegCloseKey(hKey);
				return 3;
			};

			HKEY hkDestSubkey = NULL;
			lErg = RegCreateKeyEx(hkDest,chName,0,NULL,0,KEY_WRITE,NULL,&hkDestSubkey,NULL);
			if(lErg!=ERROR_SUCCESS)
			{
				RegCloseKey(hkDest);
				RegCloseKey(hKey);
				RegCloseKey(hSubKey);
				return 4;
			};

			// Kopieren des Schlüssels mit allen Unterschlüsseln und Werten
			_CopyRegistryKey(hSubKey,hkDest);

			RegCloseKey(hSubKey);
			hSubKey = NULL;
			

			// Löschen des alten Schlüssels
			RegDeleteKeyRecursiv(hKey,chName);

		};

	};

	RegCloseKey(hkDest);
	RegCloseKey(hKey);

	return 0;
};

//*****************************************************************************
//*****************************************************************************
char* C_SoftwareUninstallList::GetItemProperty(char* PropertyName,long index)
{
	HKEY hKey = NULL;

	char* Buffer = NULL;

	if(PropertyBuffer) delete PropertyBuffer;
	PropertyBuffer = NULL;

	// Index in Ordnung?
	if((index>=0)&&(index<UninstallList.size()))
	{
		C_UninstallListEntry* le = UninstallList[index];
		if(le)
		{
			

			// Uninstall Registry key öffnen
			long lErg = RegOpenKeyEx(HKEY_LOCAL_MACHINE,REGISTRY_UNINSTALLINFO_PATH,0,KEY_READ,&hKey);
			if(lErg!=ERROR_SUCCESS)
				return NULL;

			HKEY hSubKey = NULL;
			lErg = RegOpenKeyEx(hKey,le->GetEntryName(),0,KEY_READ,&hSubKey);
			if(lErg!=ERROR_SUCCESS)
			{
				RegCloseKey(hKey);
				return NULL;
			};

			// Maximale Valuelänge rauskriegen
			DWORD ValLen = 0;
			lErg = RegQueryInfoKey(hSubKey,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,&ValLen,NULL,NULL);
			ValLen++;

			Buffer = new char[ValLen];
			memset(Buffer,0,ValLen);
			
			// Value lesen
			DWORD dwRegType = 0;
//			DWORD dwDataLen = 0;
			lErg = RegQueryValueEx(hSubKey,PropertyName,NULL,&dwRegType,(UCHAR*)Buffer,&ValLen);
			if((lErg!=ERROR_SUCCESS)||(ValLen==0))
			{
				RegCloseKey(hKey);
				RegCloseKey(hSubKey);
				if(Buffer) delete Buffer;
				return NULL;
			};

			RegCloseKey(hKey);
			RegCloseKey(hSubKey);

			PropertyBuffer = new char[ValLen+1];
			memset(PropertyBuffer,0,ValLen+1);

			memcpy(PropertyBuffer,Buffer,ValLen);
			
			if(Buffer) delete Buffer;
			Buffer = NULL;

		};

		return PropertyBuffer;
	}
	else return NULL;


};

//*****************************************************************************
//*****************************************************************************
char* C_SoftwareUninstallList::GetItemName(long index)
{
	if(PropertyBuffer) delete PropertyBuffer;
	PropertyBuffer = NULL;

	// Index in Ordnung?
	if((index>=0)&&(index<UninstallList.size()))
	{
		C_UninstallListEntry* le = UninstallList[index];
		if(le)
		{
			DWORD sLen = strlen(le->GetEntryName())+1;
			PropertyBuffer = new char[sLen];
			memset(PropertyBuffer,0,sLen*sizeof(char));
			strcpy(PropertyBuffer,le->GetEntryName());
		};
		return PropertyBuffer;
	}
	else return NULL;

};


//*****************************************************************************
//*****************************************************************************
BOOLEAN C_SoftwareUninstallList::IsItemSelected(long index)
{
	// Index in Ordnung?
	if((index>=0)&&(index<UninstallList.size()))
	{
		C_UninstallListEntry* le = UninstallList[index];
		if(le)
		{
			return le->IsSelected();
		};
	};

	return FALSE;
	
};

//*****************************************************************************
//*****************************************************************************
BOOLEAN ArgumentMatch(char* strElem,char* strArg,DWORD op)
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
