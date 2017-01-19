;*****************************************************************************
;
;  File: autoProcessScript.iss
;
;  Description: This file contains the Inno Setup preprocessor code to read
;               out of a Inno Setup script the list of files listed in the
;               [Files] section of a script file.
;
;  Global Routines:
;      InLine
;
;  Internal Only Routines:
;      AllocateFileList
;      Abort
;      DirExist
;      ErrorMessage
;      GetTempDir
;      OutputMessage
;      GetFilenameIndex
;      IsEmpty
;      Trim
;      TrimLeft
;      TrimRight
;      GetTagValue
;      ProcessFilesSection
;      AutoProcessScriptMain
;
;  Notes:
;      This script is processed by the Inno Setup Preprocessor.  It is intended
;      to be included into a Inno Setup script.
;
;  History:
;      02/23/2006 MichaelJW  Removed code that builds a string list of the files
;                            in _AutoProcessScriptMain_.  Removed gm_fileList
;                            and GetSetupFileList macro.  Added InLine and
;                            AllocateFileList macros.
;
;*****************************************************************************

; Define the Carriage Return/Line Feed character.
#pragma parseroption -p-
#define public CRLF ""
#pragma parseroption -p+

; Define static variables.
#define protected s_ErrorCount  0

; Define global macro variables.
#define public gm_fileListCount -1

#dim public gm_fileListName[1]
#dim public gm_fileListDest[1]
#dim public gm_fileListVersion[1]
#dim public gm_fileListPartNumber[1]

;*****************************************************************************
;
;  Routine: InLine
;
;  Description: Produce inline code.
;
;  Calling Sequence:
;      #expr InLine(line)
;
;  Parameters:
;      line - The line of text to in-line as code.
;
;  Routines Called:
;
;  Global Variables Referenced:
;
;  Notes:
;
;  Return Values:
;
;*****************************************************************************

#define public InLine(str line) \
    pil_line = line, \
    _InLine_

; Define the parameter variables.
#define public pil_line

#sub _InLine_
    #emit pil_line
#endsub

;*****************************************************************************
;
;                     I N T E R N A L   R O U T I N E S
;
;*****************************************************************************

;*****************************************************************************
;
;  Routine: AllocateFileList
;
;  Description: Allocate storage to hold the file list entries.
;
;  Calling Sequence:
;      #expr AllocateFileList()
;
;  Parameters:
;
;  Routines Called:
;
;  Global Variables Referenced:
;
;  Notes:
;      The file list storage is allocated based on the number of etries listed
;      in the [Files] section.
;
;  Return Values:
;
;*****************************************************************************

#define AllocateFileList() \
    _AllocateFileList_

#sub _AllocateFileList_
    ; Define local variables.
    #define public numEntries

    ; Count up the number of entries listed in the [Files] section.
    #expr numEntries = EntryCount("Files")

    #if (numEntries > 0)
        ; Keep track of how many entries are stored in the file list.
        #expr gm_fileListCount = 0

        ; Allocate storage used to hold info about the install files.
        #dim public gm_fileListName[numEntries]
        #dim public gm_fileListDest[numEntries]
        #dim public gm_fileListVersion[numEntries]
        #dim public gm_fileListPartNumber[numEntries]
    #endif
#endsub

;*****************************************************************************
;
;  Routine: Abort
;
;  Description: Abort the compiler.
;
;  Calling Sequence:
;      #expr Abort(message)
;
;  Parameters:
;      message - Parameter variable containing the error message to show.
;
;  Routines Called:
;
;  Global Variables Referenced:
;
;  Notes:
;      This routine causes the compiler to abort.
;
;  Return Values:
;
;*****************************************************************************

#define protected Abort(str message = "") \
    pa_message = message, \
    _Abort_

; Define the parameter variables.
#define protected pa_message

#sub _Abort_
    ; Force the compiler to stop.
    #pragma message CRLF
    #pragma error pa_message + "  Aborting Compile!"
#endsub

;*****************************************************************************
;
;  Routine: DirExist
;
;  Description: Determine if a directory exists.
;
;  Calling Sequence:
;      #expr exist = DirExist(dirname)
;
;  Parameters:
;      dirname - Parameter variable containing the name of the directory.
;
;  Routines Called:
;
;  Global Variables Referenced:
;
;  Notes:
;
;  Return Values:
;      True if the specified directory name exists.
;
;*****************************************************************************

#define protected DirExist(str dirname) \
    ((dirname != "") && (FindFirst(dirname, faDirectory) != 0))

;*****************************************************************************
;
;  Routine: ErrorMessage
;
;  Description: Shows an error message.
;
;  Calling Sequence:
;      #expr ErrorMessage(message)
;
;  Parameters:
;      message - Parameter variable containing the error message to show.
;
;  Routines Called:
;
;  Global Variables Referenced:
;
;  Notes:
;
;  Return Values:
;
;*****************************************************************************

#define protected ErrorMessage(str message) \
    OutputMessage("******* ERROR: " + message), \
    s_errorCount++

;*****************************************************************************
;
;  Routine: GetTempDir
;
;  Description: Returns the temporary directory name.
;
;  Calling Sequence:
;      #expr tmpDir = GetTempDir()
;
;  Parameters:
;
;  Routines Called:
;      DirExist
;
;  Global Variables Referenced:
;
;  Notes:
;      Gets the temporary file path as follows:
;          1. The path specified by the TMP environment variable.
;          2. The path specified by the TEMP environment variable, if TMP is
;             not defined or if TMP specifies a directory that does not exist.
;          3. The current directory, if both TMP and TEMP are not defined or
;             specify nonexistent directories.
;
;  Return Values:
;      String - The fully qualified path of the temporary directory including
;               a trailing backslash.
;
;*****************************************************************************

#define protected GetTempDir() \
    _GetTempDir_, \
    r_GetTempDir \

; Define the return variable.
#define protected r_GetTempDir

#sub _GetTempDir_
    ; Define local variables.
    #define private entry
    #define private tmpDirFound
    #dim    private envPaths[3]

    ; Build the list of environment point to the temp directory.
    #expr envPaths[0] = "TMP"
    #expr envPaths[1] = "TEMP"
    #expr tmpDirFound = False

    ; Attempt to get the temp directory from the user environment.
    #for {entry = 0; (! tmpDirFound) && (envPaths[entry] != ""); entry++} \
        r_GetTempDir = GetEnv(envPaths[entry]), \
        tmpDirFound  = DirExist(r_GetTempDir)

    #if (! tmpDirFound)
        ; The temp directory is not defined in the user environment so use the
        ; current directory instead.
        #expr r_GetTempDir = "."
    #endif

    ; Make sure the temp directory has a trailing backslash.
    #expr r_GetTempDir = AddBackSlash(r_GetTempDir)
#endsub

;*****************************************************************************
;
;  Routine: OutputMessage
;
;  Description: Outputs a message to the screen.
;
;  Calling Sequence:
;      #expr OutputMessage(message)
;
;  Parameters:
;      message - Parameter variable containing the message to output to the
;                screen.
;
;  Routines Called:
;
;  Global Variables Referenced:
;
;  Notes:
;
;  Return Values:
;
;*****************************************************************************

#define protected OutputMessage(str message) \
    pom_message = message, \
    _OutputMessage_

; Define the parameter variables.
#define protected pom_message

#sub _OutputMessage_
    #pragma message pom_message
#endsub

;*****************************************************************************
;
;  Routine: GetFilenameIndex
;
;  Description: Returns the index location in the file list based on the
;               filename.
;
;  Calling Sequence:
;      #expr index = GetFilenameIndex(filename)
;
;  Parameters:
;      filename - Parameter variable containing the filename to find.
;
;  Routines Called:
;
;  Global Variables Referenced:
;      gm_fileListCount
;      gm_fileListName
;
;  Notes:
;
;  Return Values:
;      Integer - The index in the file list.
;
;*****************************************************************************

#define protected GetFilenameIndex(str filename) \
    pgfi_filename = filename, \
    _GetFilenameIndex_, \
    r_GetFilenameIndex

; Define the return variable.
#define protected r_GetFilenameIndex

; Define the parameter variables.
#define protected pgfi_filename

#sub _GetFilenameIndex_
    ; Define the local variables
    #define private entry
    #define private found

    ; Search the file list for the passed in filename.
    #expr found = False

    #for {entry = 0; (! found) && (entry < gm_fileListCount); entry++} \
        found = (LowerCase(pgfi_filename) == LowerCase(gm_fileListName[entry]))

    ; If the filename was not found in the file list, store filename in the file list.
    #if (! found)
        ; Keep track of how many entries are stored in the file list.
        #expr gm_fileListCount++

        ; Point to where to store the filename.  Store the filename in the file list.
        #expr entry                      = gm_fileListCount
        #expr gm_fileListName[entry - 1] = pgfi_filename
    #endif

    ; Return the index of where the filename resides in the file list.
    #expr r_GetFilenameIndex = entry - 1
#endsub

;*****************************************************************************
;
;  Routine: IsEmpty
;
;  Description: Determines if a line of text is empty.
;
;  Calling Sequence:
;      #expr value = IsEmpty(line)
;
;  Parameters:
;      line - The line of text to check.
;
;  Routines Called:
;
;  Global Variables Referenced:
;
;  Notes:
;
;  Return Values:
;     Boolean - True if the line starts with a comment (;) or is blank, False
;               otherwise.
;
;*****************************************************************************

#define protected IsEmpty(str line) \
    Local[0] = Copy(line, 1, 1), \
    ((Local[0] == '') || (Local[0] == ';'))

;*****************************************************************************
;
;  Routine: Trim
;
;  Description: Strips off all spaces from the left and right side of a string.
;
;  Calling Sequence:
;      #expr trimResult = Trim(value)
;
;  Parameters:
;      value - The string to trim.
;
;  Routines Called:
;      trimLeft
;      trimRight
;
;  Global Variables Referenced:
;
;  Notes:
;
;  Return Values:
;     String - The resulting trimmed string.
;
;*****************************************************************************

#define protected Trim(str value) \
    Local[0] = TrimLeft(value), \
    TrimRight(Local[0])

;*****************************************************************************
;
;  Routine: TrimLeft
;
;  Description: Strips off all spaces from the left side a string.
;
;  Calling Sequence:
;      #expr trimResult = TrimLeft(value)
;
;  Parameters:
;      value - The string to trim.
;
;  Routines Called:
;
;  Global Variables Referenced:
;
;  Notes:
;
;  Return Values:
;     String - The resulting trimmed string.
;
;*****************************************************************************

#define protected TrimLeft(str value) \
    ptl_trimStr = value, \
    _TrimLeft_, \
    r_TrimLeft

; Define the return variable.
#define protected r_TrimLeft

; Define the parameter variables.
#define protected ptl_trimStr

#sub _TrimLeft_
    ; Define the local variables.
    #define private startAt
    #define private copyLen

    ; Get the length of the string to trim.
    #expr copyLen = Len(ptl_trimStr)

    ; Skip all spaces off the left side of the string.
    #for {startAt = 1; \
          (startAt <= copyLen) && (Copy(ptl_trimStr, startAt, 1) == " "); \
          1} \
        startAt++, \
        copyLen--

    ; Actually get rid of any spaces at left side of the string.
    #expr r_TrimLeft = Copy(ptl_trimStr, startAt, copyLen)
#endsub

;*****************************************************************************
;
;  Routine: TrimRight
;
;  Description: Strips off all spaces off the right side of a string.
;
;  Calling Sequence:
;      #expr trimResult = TrimRight(value)
;
;  Parameters:
;      value - The string to trim.
;
;  Routines Called:
;
;  Global Variables Referenced:
;
;  Notes:
;
;  Return Values:
;     String - The resulting trimmed string.
;
;*****************************************************************************

#define protected TrimRight(str value) \
    ptr_trimStr = value, \
    _TrimRight_, \
    r_TrimRight

; Define the return variable.
#define protected r_TrimRight

; Define the parameter variables.
#define protected ptr_trimStr

#sub _TrimRight_
    ; Define the local variables.
    #define private copyLen

    ; Get the length of the string to trim.
    #expr copyLen = Len(ptr_trimStr)

    ; Skip all spaces at the right side of the string.
    #for {1; (copyLen >= 1) && (Copy(ptr_trimStr, copyLen, 1) == " "); 1} \
        copyLen--

    ; Actually get rid of any spaces on the right side of the string.
    #expr r_TrimRight = Copy(ptr_trimStr, 1, copyLen)
#endsub

;*****************************************************************************
;
;  Routine: GetTagValue
;
;  Description: Returns the value associated with a tag string from a line of
;               text.
;
;  Calling Sequence:
;      #expr value = GetTagValue(tagStr, line)
;
;  Parameters:
;      tagStr - Parameter variable containing the tag value to find.
;      line   - Parameter variable containing the line of text.
;
;  Routines Called:
;      Trim
;
;  Global Variables Referenced:
;
;  Notes:
;
;  Return Values:
;      String - The value associated with the found tag string.  An empty ("")
;               is returned if the tag string could not be found.
;
;*****************************************************************************

#define protected GetTagValue(str tag, str line) \
    pgtv_tagStr  = tag, \
    pgtv_lineStr = line, \
    _GetTagValue_, \
    r_GetTagValue

; Define the return variable.
#define protected r_GetTagValue

; Define the parameter variables.
#define protected pgtv_tagStr
#define protected pgtv_lineStr

#sub _GetTagValue_
    ; Define the local variables.
    #define private tagEnd
    #define private copyLen
    #define private lineStr
    #define private tagStart

    ; Just in case the tag could not be found.
    #expr r_GetTagValue = ""

    ; Find where the next tag value is specified.
    #expr tagStart = Pos(LowerCase(pgtv_tagStr), LowerCase(pgtv_lineStr))

    ; Only care about non-blank lines.
    #if (tagStart > 0)
        ; Shift the line so that the tag value can be processed.
        #expr copyLen = Len(pgtv_lineStr) - tagStart + 1
        #expr lineStr = Copy(pgtv_lineStr, tagStart, copyLen)

        ; Figure out where the tag value starts and ends.
        #expr tagStart = Len(pgtv_tagStr) + 1
        #expr tagEnd   = Pos(";", lineStr)

        #if (tagEnd == 0)
            ; The end of the tag value is not marked so the length is from where
            ; the tag value actually starts until the end of the line.
            #expr tagEnd = Len(lineStr) + 1
        #endif

        ; Copy off the the tag value.
        #expr copyLen       = tagEnd - tagStart
        #expr r_GetTagValue = Copy(lineStr, tagStart, copyLen)

        ; Trim spaces off of the tag value.
        #expr r_GetTagValue = Trim(r_GetTagValue)
    #endif
#endsub

;*****************************************************************************
;
;  Routine: ProcessFilesSection
;
;  Description: Retrieves the filename, destination and version of the entries
;               in the [Files] section of a script file.
;
;  Calling Sequence:
;      #expr ProcessFilesSection(line)
;
;  Parameters:
;      line - Parameter variable containing the line from the script file.
;
;  Routines Called:
;      GetTagValue
;      GetFilenameIndex
;
;  Global Variables Referenced:
;      gm_fileListDest
;      gm_fileListVersion
;
;  Notes:
;
;  Return Values:
;
;*****************************************************************************

#define protected ProcessFilesSection(str line) \
    ppfs_lineStr = line, \
    _ProcessFilesSection_

; Define the parameter variables.
#define protected ppfs_lineStr

; Define the static variables.
#define protected spfs_inFilesSection False

#sub _ProcessFilesSection_
    ; Define the local variables.
    #define private entry
    #define private sourceDest
    #define private sourceFile
    #define private sourceVersion

    ; Found a new section?
    #if ((Pos("[", ppfs_lineStr) > 0) && (Pos("]", ppfs_lineStr) > 0))
        ; Found the [Files] section?
        #expr spfs_inFilesSection = (Pos("files", LowerCase(ppfs_lineStr)) > 0)

    #elif (spfs_inFilesSection)
        ; Get the next source file name.
        #expr sourceFile = GetTagValue("Source:", ppfs_lineStr)

        ; Get the destination for the source file.
        #expr sourceDest = GetTagValue("DestDir:", ppfs_lineStr)

        ; Skip the entries which don't have a specified destination.
        #if (sourceDest != "")
            ; Retrieve from the install file its encoded version if available.
            ; Some files don't have encoded versions.
            #expr sourceVersion = GetFileVersion(sourceFile)

            ; Only want the basename portion of the filename.
            #expr sourceFile = ExtractFileName(sourceFile)

            ; Get the index for the source file entry in he file list.
            #expr entry = GetFilenameIndex(sourceFile)

            ; Store off the source file destinaton in the file list.
            #expr gm_fileListDest[entry] = sourceDest

            ; Store off the source file encoded version in the file list.
            #expr gm_fileListVersion[entry] = sourceVersion
        #endif
    #endif
#endsub

;*****************************************************************************
;
;  Routine: AutoProcessScriptMain
;
;  Description: Reads and processes lines from a script file.
;
;  Calling Sequence:
;      #expr AutoProcessScriptMain()
;
;  Parameters:
;
;  Routines Called:
;      GetTempDir
;      TrimLeft
;      ProcessFilesSection
;      ErrorMessage
;      OutputMessage
;
;  Global Variables Referenced:
;      gm_fileListName
;      gm_fileListDest
;      gm_fileListVersion
;
;  Notes:
;
;  Return Values:
;
;*****************************************************************************

#define protected AutoProcessScriptMain() \
    _AutoProcessScriptMain_

#sub _AutoProcessScriptMain_
    ; Define the local variables.
    #define private entry
    #define private nextLine
    #define private scriptFile
    #define private scriptFilename

    ; The script file will be stored to and read from the tmp directory.
    #expr scriptFilename = GetTempDir() + "_script_.iss"

    ; Save off a copy of the script to the temporary file.  This is done
    ; so that macros can be replaced by the preprocessor before the script is
    ; processed.
    #expr SaveToFile(scriptFilename)

    ; Open the script file to be processed.
    #expr scriptFile = FileOpen(scriptFilename)

    #if (! scriptFile)
        ; Should never happen but just in case...
        #expr ErrorMessage("Unable to open " + scriptFilename)

    #else
        ; Allocate storage to hold the file list etries.
        #expr AllocateFileList()

        ; Process all the lines in the [Files] section of the script file.  Only
        ; want to process those lines that are not commented out or blank.
        #for {1; (! FileEof(scriptFile)); 1} \
            nextLine = FileRead(scriptFile), \
            nextLine = TrimLeft(nextLine), \
            (! IsEmpty(nextLine)) \
                ? ProcessFilesSection(nextLine) \
                : True

        ; Done with the file, close and delete it.
        #expr FileClose(scriptFile)
        #expr DeleteFile(scriptFilename)
    #endif

    ; Indicate the found entries from the [Files] section.
    #for {entry = 0; entry < gm_fileListCount; entry++} \
        OutputMessage("Found: " + gm_fileListName[entry] + " (" + gm_fileListVersion[entry] + ")")
#endsub

;*****************************************************************************
;
;                      M A I N   C A L L I N G   P O I N T
;
;*****************************************************************************

#expr OutputMessage("######## Begin Reading List of Setup Files ########")
#expr OutputMessage("")

; Auto call the main entry point.
#expr AutoProcessScriptMain()

#expr OutputMessage("")
#expr OutputMessage("######## End Reading List of Setup Files ########")

#if (s_errorCount > 0)
    #expr OutputMessage("")

    ; Abort the compiler.
    #expr Abort(Str(s_errorCount) + " error(s) found.")
#endif

