@echo off
cls

echo .
echo      __ Launch Package __
echo .
echo.

set /p package=Package Name:

if "%package%"=="" exit /b

findstr /i /x "%package%" "%DB%\installed.txt" >nul

if errorlevel 1 (
    echo.
    echo Package is not installed.
    echo.
    pause
    exit /b
)

if not exist "%PKGINFO%\%package%.ini" (
    echo.
    echo Package information not found.
    echo.
    pause
    exit /b
)

for /f "tokens=1,* delims==" %%A in ("%PKGINFO%\%package%.ini") do (
    set %%A=%%B
)

if "%Executable%"=="" (
    echo.
    echo No executable defined.
    echo.
    pause
    exit /b
)

if not exist "%Executable%" (
    echo.
    echo Executable not found.
    echo.
    pause
    exit /b
)

echo.
echo Launching %Name%...
echo.

start "" "%Executable%"

if /I "%Logging%"=="True" call "%CORE%\logger.bat" LAUNCH "%package%"