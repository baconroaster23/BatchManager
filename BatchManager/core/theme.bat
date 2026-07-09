@echo off

:menu
cls

echo.
echo        __  Themes __
echo.
echo.
echo 1. Green
echo 2. Blue
echo 3. Red
echo 4. White
echo 5. Default
echo.
echo 0. Back
echo.

set /p theme=Select:

if "%theme%"=="1" (
    set Theme=Green
    set Color=0A
)

if "%theme%"=="2" (
    set Theme=Blue
    set Color=09
)

if "%theme%"=="3" (
    set Theme=Red
    set Color=0C
)

if "%theme%"=="4" (
    set Theme=White
    set Color=0F
)

if "%theme%"=="5" (
    set Theme=Default
    set Color=07
)

if "%theme%"=="0" exit /b

color %Color%

(
echo Theme=%Theme%
echo Color=%Color%
echo Logging=%Logging%
echo Animations=%Animations%
echo AutoUpdate=%AutoUpdate%
)>config.ini

if /I "%Logging%"=="True" call "%CORE%\logger.bat" THEME "%Theme%"

echo.
echo Theme changed successfully.
echo.

pause