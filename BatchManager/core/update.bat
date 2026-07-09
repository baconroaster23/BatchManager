@echo off
cls


echo     -- Update Packages --

echo.

if not exist "%DB%\installed.txt" (
    echo No installed packages.
    echo.
    pause
    exit /b
)

set count=0

for /f %%A in (%DB%\installed.txt) do (
    echo Checking %%A...
    timeout /t 1 >nul
    echo %%A is up to date.
    set /a count+=1
)

if "%count%"=="0" (
    echo No installed packages.
)

if /I "%Logging%"=="True" call "%CORE%\logger.bat" UPDATE "Checked %count% package(s)"

echo.
echo Finished.
echo.
pause