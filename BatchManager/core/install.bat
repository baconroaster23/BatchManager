@echo off
cls

set "REPO=https://raw.githubusercontent.com/baconroaster23/batchpkgsini/main"

echo ============================
echo      Install Package
echo ============================
echo.

echo Updating package list...
powershell -NoProfile -Command "try { Invoke-WebRequest -UseBasicParsing '%REPO%/packages.txt' -OutFile '%DB%\packages.txt' } catch { exit 1 }"

if errorlevel 1 (
    echo.
    echo Failed to download package list.
    echo.
    pause
    exit /b
)

set /p package=Package ID: 

if "%package%"=="" exit /b

findstr /i /x "%package%" "%DB%\packages.txt" >nul

if errorlevel 1 (
    echo.
    echo Package not found.
    echo.
    pause
    exit /b
)

if not exist "%PKGINFO%" mkdir "%PKGINFO%"

echo.
echo Downloading package information...

powershell -NoProfile -Command "try { Invoke-WebRequest -UseBasicParsing '%REPO%/packageinfo/%package%.ini' -OutFile '%PKGINFO%\%package%.ini' } catch { exit 1 }"

if errorlevel 1 (
    echo.
    echo Failed to download package information.
    echo.
    pause
    exit /b
)

set "Name="
set "ID="
set "Author="
set "Description="
set "Homepage="
set "DownloadPage="

for /f "usebackq tokens=1,* delims==" %%A in ("%PKGINFO%\%package%.ini") do (
    set "%%A=%%B"
)

cls
echo ============================
echo      Package Information
echo ============================
echo.
echo Name        : %Name%
echo ID          : %ID%
echo Author      : %Author%
echo Description : %Description%
echo Homepage    : %Homepage%
echo Download    : %DownloadPage%
echo.

choice /c YN /m "Download it?"

if errorlevel 2 exit /b

start "" "%DownloadPage%"

findstr /i /x "%package%" "%DB%\installed.txt" >nul

if errorlevel 1 (
    echo %package%>>"%DB%\installed.txt"
)

if /I "%Logging%"=="True" call "%CORE%\logger.bat" INSTALL "%package%"

echo.
echo The official download page has been opened in your browser.
echo After installing the application, it will remain listed as installed.
echo.
pause