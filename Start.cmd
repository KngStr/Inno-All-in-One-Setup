@Echo off

:start
cls
title Compile version selection
Echo  1. the use of Ansi standard version
Echo  2. the use of Unicode standard version

set /p InnoVer=Enter Your Choice(1/2)：

if "%~1" == "" (
  Set "SetupFile=%~dp0\Setup.iss"
) else (
  Set "SetupFile=%~1"
)

if %InnoVer% == 1 (
  start "" "%~dp0\IsPack\isfiles\Compil32.exe" "%SetupFile%"
) else (
  if %InnoVer% == 2 (
    start "" "%~dp0\IsPack\isfiles-unicode\Compil32.exe" "%SetupFile%"
  )
)
