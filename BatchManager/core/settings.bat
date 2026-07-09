@echo off

:menu
cls

echo.
echo        __ Settings __
echo.
echo.
echo Current Settings
echo.
echo Theme       : %Theme%
echo Color       : %Color%
echo Logging     : %Logging%
echo Animations  : %Animations%
echo Auto Update : %AutoUpdate%
echo.
echo ----------------------------
echo.
echo 1. Toggle Logging
echo 2. Toggle Animations
echo 3. Toggle Auto Update
echo 4. Change Console Color
echo 5. Restore Defaults
echo.
echo 0. Back
echo.

set /p choice=Select:

if "%choice%"=="1" (
    if /I "%Logging%"=="True" (
        set Logging=False
    ) else (
        set Logging=True
    )
)

if "%choice%"=="2" (
    if /I "%Animations%"=="True" (
        set Animations=False
    ) else (
        set Animations=True
    )
)

if "%choice%"=="3" (
    if /I "%AutoUpdate%"=="True" (
        set AutoUpdate=False
    ) else (
        set AutoUpdate=True
    )
)

if "%choice%"=="4" (
    echo.
    set /p Color=New Color:
    color %Color%
)

if "%choice%"=="5" (
    set Theme=Default
    set Color=0A
    set Logging=True
    set Animations=True
    set AutoUpdate=False
    color %Color%
)

if "%choice%"=="0" exit /b

(
echo Theme=%Theme%
echo Color=%Color%
echo Logging=%Logging%
echo Animations=%Animations%
echo AutoUpdate=%AutoUpdate%
)>config.ini

goto menu