[Code]
//*****************************************************************************
//
//  File: setupFileList.iss
//
//  Description: This file contains support code to return a list of filenames
//               specified in the [Files] section of the script file.
//
//  Global Routines:
//      GetSetupFileList
//
//  Internal Only Routines:
//      CreateSetupFileList
//
//  Notes:
//
//  History:
//      02/23/2006 MichaelJW  Changed CreateSetupFileList to use in-line code.
//
//*****************************************************************************

type
    // Define a record to hold the informatiom about the files listed in the
    // [Files] section of the script file.
    TSetupFileInfo = record
        Name    : String;    // Name of file.
        DestDir : String;    // The destination path of file.
        Version : String;    // The version of the file.
    end;

    // Define a list of files.
    TSetupFileList = Array of TSetupFileInfo;

var
    // Define static variables.
    s_setupFileList : TSetupFileList;

// Function prototypes.
procedure CreateSetupFileList(); forward;
function  GetSetupFileList() : TSetupFileList; forward;

//*****************************************************************************
//
//  Routine: CreateSetupFileList
//
//  Description: Creates the list of setup files specified in the [Files]
//               section of the script.
//
//  Calling Sequence:
//      CreateSetupFileList();
//
//  Parameters:
//
//  Routines Called:
//      GetFileVersion
//
//  Global Variables Referenced:
//      gm_fileListCount
//      gm_fileListName
//      gm_fileListDest
//      gm_fileListVersion
//      s_setupFileList
//
//  Notes:
//
//  Return Values:
//
//*****************************************************************************

procedure CreateSetupFileList();
begin
    // Initialize the setup file list array.
    SetArrayLength(s_setupFileList, {#gm_fileListCount});

    // Produce in-line code to create s_setupFileList.
    #define private entry
    #define private setupFileListEntry

    #for {entry = 0; entry < gm_fileListCount; entry++} \
        /* Generate s_setupFileList[entry] */           \
        setupFileListEntry = "s_setupFileList[" + Str(entry) + "]", \
        /* Produce in-line code to assign each record field of s_setupFileList[entry] */   \
        InLine(setupFileListEntry + ".Name    := '" + gm_fileListName[entry]    + "';"),   \
        InLine(setupFileListEntry + ".DestDir := '" + gm_fileListDest[entry]    + "';"),   \
        InLine(setupFileListEntry + ".Version := '" + gm_fileListVersion[entry] + "';")
end;

//*****************************************************************************
//
//  Routine: GetSetupFileList
//
//  Description: Get the list of setup files, that have versions.
//
//  Calling Sequence:
//      list := GetSetupFileList();
//
//  Parameters:
//
//  Routines Called:
//      CreateSetupFileList
//
//  Global Variables Referenced:
//      s_setupFileList
//
//  Notes:
//
//  Return Values:
//      TSetupFileList - The list of versioned setup files.
//
//*****************************************************************************

function GetSetupFileList() : TSetupFileList;
begin
    // Check to see if the setup file list has been created.
    if (GetArrayLength(s_setupFileList) = 0)
    then begin
        // Setup file list has not been created yet so go and create it first.
        CreateSetupFileList();
    end;

    Result := s_setupFileList;
end;
[/Code]
