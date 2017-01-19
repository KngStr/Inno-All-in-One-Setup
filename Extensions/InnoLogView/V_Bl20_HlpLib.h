#ifndef ____INC___BL20__V_BL20_HLPLIB_H___INC____
#define ____INC___BL20__V_BL20_HLPLIB_H___INC____

#include <tchar.h>

//*****************************************************************************
// Headerdatei enthält Prototypen von "normalen" (niocht-Objektorientierten) 
// Funktionen, welche modulübergreifend Verwendung finden können 
//*****************************************************************************


//*****************************************************************************
// Findet eine Wort in einem Puffer. Verhält sich wie memchr, nur erfolgt 
// die Suche nicht auf Byteebene, sondern auf Wortebene. 
// Start	= Startadresse der Suche 
// w		= Wort, nach dem gesucht wird
// n		= Anzahl von Worten, die durchsucht werden (nicht size!)
// Return	= Zeiger auf gefundenes Wort oder NULL, wenn kein Erfolg
//*****************************************************************************
void* MemChrW(void* Start, int w, int n);



//*****************************************************************************
// String-Autopointer zum automatischen Verwalten von lokalen Puffern, die im
// Freispeicher angelegt werden. Der neu erzeugte Puffer wird initialisiert.
// Nach dem Verlassen des Gültigkeitsbereiches wird der Puffer automatisch 
// durch den Destruktor freigegeben. 
//*****************************************************************************
class STRING_AP
{
public:
	char* s;
	
	STRING_AP(DWORD size){s=NULL;s=new char[size+1];s[0]='\0';s[size]='\0';};
	~STRING_AP(){if(s) delete s; s = NULL;};
};


class WSTRING_AP
{
public:
	WCHAR* s;
	
	WSTRING_AP(DWORD size){s=NULL;s=new WCHAR[size+1];s[0]=L'\0';s[size]=L'\0';};
	~WSTRING_AP(){if(s) delete s; s = NULL;};
};


void FreeAndSetPointerString(TCHAR** target,TCHAR* val);


#endif // ____INC___BL20__V_BL20_HLPLIB_H___INC____
