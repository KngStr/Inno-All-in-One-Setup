@Echo off

:start
cls
title 编译版本选择
Echo      1、使用 Ansi标准版本
Echo      2、使用 Unicode标准版本

set /p InnoVer=输入以上编号：

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
