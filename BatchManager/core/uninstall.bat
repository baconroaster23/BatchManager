@echo off
cls


echo     -- Remove Package --

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

choice /c YN /m "Remove this package?"

if errorlevel 2 exit /b

findstr /v /i /x "%package%" "%DB%\installed.txt" >"%DB%\installed.tmp"

move /y "%DB%\installed.tmp" "%DB%\installed.txt" >nul

if /I "%Logging%"=="True" call "%CORE%\logger.bat" REMOVE "%package%"

echo.
echo Package removed successfully.
echo.

pause