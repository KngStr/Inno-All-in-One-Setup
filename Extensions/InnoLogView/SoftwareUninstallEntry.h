#ifndef ____INC___SETUP___FAISEXT__SOFTWAREUNINSTALLENTRY_H___INC____
#define ____INC___SETUP___FAISEXT__SOFTWAREUNINSTALLENTRY_H___INC____

#include "V_Bl20_Hlplib.h"


class C_UninstallListEntry
{
private:
	BOOL	m_bSelected;	// Flag: Entry is selected
	char*	m_EntryName;
	
	void InitMembers(void)
	{
		m_bSelected = FALSE;
		m_EntryName = NULL;
	};
public:
	C_UninstallListEntry(){InitMembers();};
	C_UninstallListEntry(char* name){InitMembers();m_EntryName=new char[strlen(name)+1];
									strcpy(m_EntryName,name);};

	~C_UninstallListEntry(){if(m_EntryName) delete m_EntryName; InitMembers();};

	BOOLEAN IsSelected(void){return m_bSelected;};
	char* GetEntryName(void){return m_EntryName;};

	void Select(BOOLEAN val){m_bSelected = val;};

//	void SetMovedFlag(BOOL fl){m_Moved = fl;};
//	BOOLEAN IsMoved(void){return m_Moved;};

};

typedef vector<C_UninstallListEntry*> UNINSTALL_VECTOR;


class C_SoftwareUninstallList
{
private:
	UNINSTALL_VECTOR	UninstallList;
	char*				PropertyBuffer;
	BOOLEAN				ListBuild;

public:
	C_SoftwareUninstallList(){PropertyBuffer = NULL; ListBuild=FALSE;};
	~C_SoftwareUninstallList(){if(PropertyBuffer) delete PropertyBuffer; PropertyBuffer=NULL;};

	DWORD	BuildList(void);
	DWORD	DestroyList(void);
	DWORD	Select(char* commandline,char* args);
	DWORD	SelectByIndex(long index,BOOLEAN sel);

	DWORD	DeleteEntrys(long index);

	DWORD	MoveEntrys(char* RegDestPath,long entry);
	DWORD	RestoreEntrys(char* RegSrcPath,BOOLEAN DeleteSrc);

	char*	GetItemProperty(char* PropertyName,long index);
	char*	GetItemName(long index);
	BOOLEAN IsItemSelected(long index);


	DWORD	GetSelCount(void);
	DWORD	GetListCount(void){return UninstallList.size();};

};



#endif // ____INC___SETUP___FAISEXT__SOFTWAREUNINSTALLENTRY_H___INC____
