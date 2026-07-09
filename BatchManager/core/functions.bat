@echo off
goto :eof

:Pause
echo.
pause
exit /b

:Clear
cls
exit /b

:Header
cls
echo _____________________________
echo %~1
echo _____________________________
echo.
exit /b

:Line
echo ----------------------------
exit /b

:Exists
if exist "%~1" (
    exit /b 0
) else (
    exit /b 1
)

:Log
if /I "%Logging%"=="True" (
    call "%CORE%\logger.bat" %*
)
exit /b

:Wait
timeout /t %~1 >nul
exit /b

:Error
echo.
echo Error: %~1
echo.
pause
exit /b

:Success
echo.
echo %~1
echo.
pause
exit /b

:YesNo
choice /c YN /m "%~1"
if errorlevel 2 exit /b 0
exit /b 1

:PressAnyKey
echo.
echo Press any key to continue...
pause >nul
exit /b