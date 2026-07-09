@echo off
cls

echo.
echo      _ Search Packages _
echo.
echo.

set /p search=Search: 

if "%search%"=="" exit /b

echo.
echo Results:
echo.

set found=0

for /f %%A in (%DB%\packages.txt) do (
    echo %%A | find /i "%search%" >nul
    if not errorlevel 1 (
        echo %%A
        set found=1
    )
)

if "%found%"=="0" (
    echo No packages found.
)

echo.
pause