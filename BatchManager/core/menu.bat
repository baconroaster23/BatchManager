@echo off
:menu
cls
echo             -- BatchManager -- By BaconRoaster
echo.
echo [1] Install Package
echo [2] Remove Package
echo [3] Search Packages
echo [4] Installed Packages
echo [5] Launch Package
echo [6] Update Packages
echo [7] Plugins
echo [8] Settings
echo [9] About
echo.
echo [0] Exit
echo.

set /p choice=Select an option: 

if "%choice%"=="1" call "%CORE%\install.bat"
if "%choice%"=="2" call "%CORE%\uninstall.bat"
if "%choice%"=="3" call "%CORE%\search.bat"
if "%choice%"=="4" (
    cls
    echo Installed Packages
    echo ------------------
    if exist "%DB%\installed.txt" (
        type "%DB%\installed.txt"
    ) else (
        echo No packages installed.
    )
    echo.
    pause
)
if "%choice%"=="5" call "%CORE%\launch.bat"
if "%choice%"=="6" call "%CORE%\update.bat"
if "%choice%"=="7" call "%CORE%\plugins.bat"
if "%choice%"=="8" call "%CORE%\settings.bat"
if "%choice%"=="9" (
    cls
    echo BatchManager v1.0
    echo.
    echo A lightweight package manager written in Batch By BaconRoaster23.
    echo.
    pause
)

if "%choice%"=="0" exit

goto menu