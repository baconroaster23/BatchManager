@echo off

:menu
cls

echo.
echo         -- Plugins --
echo. 
echo.

set count=0

for %%F in ("%PLUGINS%\*.bat") do (
    set /a count+=1
    echo !count!. %%~nF
    set plugin!count!=%%F
)

if "%count%"=="0" (
    echo No plugins installed.
    echo.
    pause
    exit /b
)

echo.
echo 0. Back
echo.

set /p choice=Select:

if "%choice%"=="0" exit /b

call "!plugin%choice%!"

if /I "%Logging%"=="True" call "%CORE%\logger.bat" PLUGIN "Executed plugin %choice%"

pause