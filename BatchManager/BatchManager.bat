@echo off
title BatchManager
setlocal EnableDelayedExpansion
setlocal

cd /d "%~dp0"
echo Plugins downloaded 
set ROOT=%cd%
set CORE=%ROOT%\core
set DB=%ROOT%\database
set PKGINFO=%DB%\packageinfo
set LOGS=%ROOT%\logs
set CACHE=%ROOT%\cache
set DOWNLOADS=%ROOT%\downloads
set THEMES=%ROOT%\themes
set PLUGINS=%ROOT%\plugins
set PACKAGES=%ROOT%\packages

if not exist "%CORE%" mkdir "%CORE%"
if not exist "%DB%" mkdir "%DB%"
if not exist "%PKGINFO%" mkdir "%PKGINFO%"
if not exist "%LOGS%" mkdir "%LOGS%"
if not exist "%CACHE%" mkdir "%CACHE%"
if not exist "%DOWNLOADS%" mkdir "%DOWNLOADS%"
if not exist "%THEMES%" mkdir "%THEMES%"
if not exist "%PLUGINS%" mkdir "%PLUGINS%"
if not exist "%PACKAGES%" mkdir "%PACKAGES%"

if not exist "%DB%\packages.txt" curl -L -s "https://raw.githubusercontent.com/baconroaster23/batchpkgsini/main/packages.txt" -o "%DB%\packages.txt"
if not exist "%DB%\installed.txt" type nul > "%DB%\installed.txt"

if not exist "config.ini" (
(
echo Theme=Default
echo Color=0A
echo Logging=True
echo Animations=True
echo AutoUpdate=False
)>config.ini
)
set "OUTPUT=C:\Users\%USERNAME%\BatchManager\BatchManager\plugins"
set "ZIP=%TEMP%\batchpkgsini.zip"
curl -L -o "%ZIP%" "https://github.com/baconroaster23/batchpkgsini/archive/refs/heads/main.zip"   

powershell -NoProfile -Command ^
"Expand-Archive -Force '%ZIP%' '%TEMP%\batchpkgsini_extract'"
xcopy "%TEMP%\batchpkgsini_extract\batchpkgsini-main\plugins\*" "%OUTPUT%\" /E /I /Y

del %ZIP%
rmdir /S /Q "%TEMP%\batchpkgsini_extract"
echo Plugins Donwload Succesfully , Everything Set UP
pause 
cls


for /f "tokens=1,2 delims==" %%A in (config.ini) do set %%A=%%B

color %Color%
mode con: cols=90 lines=30

if /I "%Logging%"=="True" call "%CORE%\logger.bat" START "BatchManager started."

call "%CORE%\menu.bat"

exit
