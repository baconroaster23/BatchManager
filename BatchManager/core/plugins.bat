@echo off

:menu
set "OUTPUT=C:\Users\%USERNAME%\BatchManager\BatchManager\plugins"
set "ZIP=%TEMP%\batchpkgsini.zip"
curl -L -o "%ZIP%" "https://github.com/baconroaster23/batchpkgsini/archive/refs/heads/main.zip"   

powershell -NoProfile -Command ^
"Expand-Archive -Force '%ZIP%' '%TEMP%\BatchManager_Update'"
xcopy "%TEMP%\BatchManager_Update\batchpkgsini-main\plugins\*" "%OUTPUT%\" /E /I /Y

del %ZIP%
rmdir /S /Q "%TEMP%\BatchManager_Update"
echo Plugins Donwload Succesfully , Everything Set UP
pause

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
