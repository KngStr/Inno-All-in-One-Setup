		Readme file for Chief's UNZIP
		-----------------------------


History (chronological)
-----------------------
v1.00:  May 7th 1998:   * first release

v1.00a: May 9th 1998:   * minor amendments

v1.01:  May 12th 1998:  * added support for no recursion

v1.02:  May 15th 1998:  * added support for Free Pascal (Peter Vreman)

v1.03:  June 19th 1998: * callback procedural types now declared as STDCALL
                          in all Win32 platforms
			* new source file added (MATCH.PAS)

v1.04:  June 20th 1998: * fixed time stamping problems
			* renamed the Windows DLLs to unzipw16.dll and unzipw32.dll
			* added new DLL for DOS DPMI (unzipp16.dll)
			* amendments to UNZIP.INC
			* added support for OS/2 (Virtual Pascal)

v1.05:  June 23rd 1998: * fixed to support Virtual Pascal OS/2 DLLs
                        * minor enhancements to MATCH.PAS  

v1.10:  March 3rd 1999:  * added support for GNU Pascal (Prof. A Olowofoyeku and
			   Dr Peter Gerwinski)
			 * amendments to various TYPE definitions
                         * MATCH.PAS merged with UNZIP.PAS
			 * broken FPC stuff fixed
			 * new CRC routines (in Pascal)
			 * changed conditional: "Bits32" to "OS_BIGMEM" 
			   and "USE_STDCALL" in various places
			 * changes in sources to avoid moving of file memory images
                         * unzipdll.pas renamed to chiefzip.pas
			 * new Delphi 3 sample applications added
			 
v1.20:  June 1999	 * fixed to compile for Delphi 4
			 * fixed to compile for latest snapshots of Free Pascal

V2.00: Sept. 1999:  	 * fixed to avoid aborting on the first error in the zip file

V2.10: Dec. 1999:  	 * can now process *some* self-extracting archives

V2.20: April 2000:  	 * change to parameter list of IsZip
			 * fixed a number of bugs

V2.30: Sept. 2000:	 * tidied up some data structures
   			 * endian stuff added: the library is now endian-neutral
   			 * "View" method in chfunzip.pas renamed to "List"
   			 * TMT Pascal support added

V2.40: Oct. 2001:	 * fixed to compile for Delphi 6

V2.60: Dec. 2003:	 * fixed to compile for Delphi 7, and new GPC releases
			 * now supports Kylix (3.0)
			 * now supports Linux under Virtual Pascal
			 * fixed some bugs

-------------------
This package is the Pascal version of Info-Zip's UNZIP.
The sources were translated from C to Pascal by Christian Ghisler.

The Pascal sources were subsequently amended to be repackaged as
Chief's UNZIP by Prof. Abimbola Olowofoyeku (The African Chief).

This package allows you to UNZIP deflated, imploded, shrunk and stored
ZIP archives.

If you unzip the package with PKUNZIP(tm) use the "-D" switch to
recreate the subdirectory structure.

The source code is compatible with;
        * Turbo Pascal v7.x     (DOS)
        * Borland Pascal v7.x   (Dos, DPMI, and Windows)
        * Delphi v1.x
        * Delphi v2.x
        * Delphi v3.x
        * Delphi v4.x
        * Delphi v6.x
        * Delphi v7.x
        * Virtual Pascal v2.x   (Win32, OS/2)
	* GNU Pascal (GPC) v2.1x+ (Dos, Win32, OS/2, Linux, Solaris, Ultrix, Irix, etc.)
	* FreePascal (FPC) v1.x (Win32) 
	* TMT Pascal v3.50 (Win32, Dos32)

Files in the package:
---------------------
1. The main UNZIP sources:
   1. UNZIP.INC       - conditional definitions for the various compilers
   2. ZIPTYPES.PAS    - data structures used in the UNZIP sources
   3. UNZIP.PAS       - the main UNIT for the UNZIP functions
   4. CHIEFZIP.PAS    - the UNZIP functions exported to a DLL
   5. ZIPINTER.PAS    - interface IMPORT UNIT for the DLL
   6. ChfUnzip.pas    - simple Delphi component/Pascal Object for UNZIP

2. Precompiled DLLs: (optional - only needed if you don't have a supported compiler)
   1. dll\unzipw16.dll   - chiefzip.pas compiled for Win16 (rename to chiefzip.dll)
   2. dll\unzipw32.dll   - chiefzip.pas compiled for Win32 (rename to chiefzip.dll)
   3. dll\unzipp16.dll   - chiefzip.pas compiled for DOS Protected Mode (rename to chiefzip.dll)
   4. dll\unzipos2.dll   - chiefzip.pas compiled for 32-bit OS/2 (rename to chiefzip.dll)

3. Sample programs:
   1. test1.pas         - test program using high level unzip functions
   2. test2.pas         - high level functions + simple Pascal object
   3. test3.pas         - high level functions + Delphi component
   4. test4.pas         - test program using low level unzip functions
   5. test0.pas		- sample Win32 GPC program for testing this unit in DLL format
   5A. dll2lib.bat	- sample batch file to create a GNU import library from chiefzip.dll
   6. unzip32.pas	- sample unzip program
   7. gui\project1.dpr - sample 32-bit Delphi GUI program, using unzip component
   8. gui\project2.dpr - sample 32-bit Delphi GUI program, using direct function calls

4. Documentation:
   1. README.TXT      - this file



LICENCE
-------
This package is released as **FREEWARE**.
You got it FREE - so please do NOT charge others for it.
If you use it in commercial or shareware programs, please
give credit to INFO-ZIP, Christian Ghisler, and Prof. Abimbola
Olowofoyeku.

The package can be redistributed freely, by ftp archives,
web sites, bulletin boards, computer magazine cover disks
and CD-ROMS, shareware and public domain CD-ROMs and archives,
etc., ON THE CONDITION THAT ALL THE FILES IN THIS PACKAGE ARE
INCLUDED IN THE DISTRIBUTION, INCLUDING THIS DOCUMENTATION, AND
ON THE CONDITION THAT ANY AMENDMENT TO ANY OF THE FILES IS CLEARLY
MARKED AS SUCH, WITH THE NAME AND DETAILS OF THE PERSON MAKING THE
AMENDMENT CLEARLY SPECIFIED.


DISCLAIMER
----------
THIS IS FREE SOFTWARE - so you get what you pay for. Thus,
this package is supplied WITHOUT ANY WARRANTIES WHATSOEVER.
You use the package or any of the files therein ENTIRELY AT
YOUR OWN RISK. If these terms are not acceptable to you, then
PLEASE DELETE THIS PACKAGE AND ALL THAT IS THEREIN FROM YOUR
DISKS AT ONCE, AND PLEASE DO NOT EVER TRY TO USE ANYTHING THEREIN.


**********************
* EXPORTED FUNCTIONS *
**********************

{****** HIGH LEVEL FUNCTIONS: BY THE AFRICAN CHIEF ********************}
Function FileUnzip (SourceZipFile, TargetDirectory, FileSpecs:pChar;
 Report:UnzipReportProc;Question:UnzipQuestionProc):integer;
{
high level unzip
usage:
SourceZipFile: source zip file;
TargetDirectory: target directory
FileSpecs: "*.*", etc.
Report:    Report callback or Nil;
Question:  Question callback (for confirmation of whether to replace existing
           files) or Nil;
Returns:   the number of files that were extracted, or an error code
           (see ZIPTYPES.PAS for the list of errorcodes)

e.g.,
   Count := FileUnzip ('test.zip', 'c:\temp', '*.*', MyReportProc, Nil);

}

Function FileUnzipEx (SourceZipFile, TargetDirectory, FileSpecs:pChar):integer;
{
high level unzip with no callback parameters;
passes ZipReport & ZipQuestion internally, so you
can use SetZipReportProc and SetZipQuestionProc before calling this;
Returns: the same values as FileUnzip (above)

e.g.,
   Count := FileUnzipEx ('test.zip', 'c:\temp', '*.*');
}

Function ViewZip (SourceZipFile, FileSpecs:pChar; Report:UnzipReportProc):integer;
{
view contents of zip file
usage:
SourceZipFile: source zip file;
FileSpecs: "*.*", etc.
Report: callback procedure to process the reported contents of ZIP file;
Returns: the number of files in archive

e.g.,
  ViewZip ('test.zip', '*.*', MyReportProc);
}

Function  SetUnZipReportProc (aProc:UnzipReportProc):Pointer;
{
sets the internal unzip report procedure to aproc
Returns: pointer to the original report procedure
(return value should normally be ignored)

e.g.,
   SetUnZipReportProc (MyReportProc);
}

Function  SetUnZipQuestionProc (aProc:UnzipQuestionProc):Pointer;
{
sets the internal unzip question procedure to aproc
Returns: pointer to the original "question" procedure
(return value should normally be ignored)

e.g.,
SetUnZipQuestionProc (QueryFileExistProc);
}

Function UnzipSize (SourceZipFile:pChar;Var Compressed:Longint):longint;
{ uncompressed and compressed zip size
 usage:
 SourceZipFile  = the zip file
 Compressed     = the compressed size of the files in the archive
 Returns:         the uncompressed size of the ZIP archive

e.g.,
  Var
  Size,CSize:longint;
  begin
     Size := UnzipSize ('test.zip', CSize);
  end;
}

Procedure ChfUnzip_Init;
{
initialise or reinitialise the global variables
 *** use with care!! ***
}

FUNCTION SetNoRecurseDirs (DontRecurse:Boolean):Boolean;
{
Set or unset the internal recursion flag;
Returns: the original value (return value ignored)
Usage:
  DontRecurse = TRUE = no recursion; false = full recursion

e.g.,
   SetNoRecurseDirs (True);
}

{**********************************************************************}
{************ LOW LEVEL FUNCTIONS: BY CHRISTIAN GHISLER ***************}
{**********************************************************************}
function GetSupportedMethods:longint;
{Checks which pack methods are supported by the dll}
{bit 8=1 -> Format 8 supported, etc.}

function UnzipFile (in_name:pchar;out_name:pchar;offset:longint;hFileAction:word;cm_index:integer):integer;
{usage:
 in_name:      name of zip file with full path
 out_name:     desired name for out file
 offset:       header position of desired file in zipfile
 hFileAction:  handle to dialog box showing advance of decompression (optional)
 cm_index:     notification code sent in a wm_command message to the dialog
               to update percent-bar
 Return value: one of the above unzip_xxx codes

 Example for handling the cm_index message in a progress dialog:

 unzipfile(......,cm_showpercent);

 ...

 procedure TFileActionDialog.wmcommand(var msg:tmessage);
 var ppercent:^word;
 begin
   TDialog.WMCommand(msg);
   if msg.wparam=cm_showpercent then begin
     ppercent:=pointer(lparam);
     if ppercent<>nil then begin
       if (ppercent^>=0) and (ppercent^<=100) then
         SetProgressBar(ppercent^);
       if UserPressedAbort then
         ppercent^:=$ffff
       else
         ppercent^:=0;
       end;
     end;
   end;
 end;
}

function  GetFirstInZip (zipfilename:pchar;var zprec:tZipRec):integer;
{
 Get first entry from ZIP file
 e.g.,
   rc := GetFirstInZip ('test.zip', myZipRec);
}

function  GetNextInZip (var Zprec:tZiprec):integer;
{
  Get next entry from ZIP file

 e.g.,
   rc := GetNextInZip(myZipRec);
}

FUNCTION  IsZip ( filename : pchar; pStartOffSet : pLongint ) : boolean;
{
  VERY simple test for zip file
  parameters:
    [1] zip file name
    [2] pointer to longint to hold the offset to the PK signature
        (this will normally zero, except for SFX files); pass NIL
        if you don't need the offset

  e.g.,
   ItsaZipFile := IsZip ('test.zip', @Offset);
   ItsaZipFile := IsZip ('test2.zip', Nil);
}


procedure CloseZipFile (var Zprec:tZiprec);  {Only free buffer, file only open in Getfirstinzip}
{
  free ZIP buffers

  e.g.,
  CloseZipFile (myZipRec);
}



-----------------
Prof. Abimbola A Olowofoyeku (The African Chief)
17 December 2003
http://www.bigfoot.com/~african_chief/
