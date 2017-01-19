@echo off
REM Use Delphi7 Brcc32.exe Dcc32.exe
REM 中国 2052 0804	台湾 1028 0404	香港 4100 0C04	新加坡 3076 1004

CALL :BuildRes 2052 CHS
CALL :BuildRes 1028 CHT
CALL :BuildRes 1033 ENG
CALL :BuildRes 1049 Russian

DEL *.RES
GOTO END

:BuildRes
BRCC32 %1.rc
If NOT EXIST %1.RES GOTO :EOF
IF "%1"=="2052" (
	IF EXIST ..\..\isUnp COPY %1.RES ..\..\isUnp
)
DCC32 -D%2 Lang.dpr
MOVE Lang.dll ..\%1.lng
GOTO :EOF

:END