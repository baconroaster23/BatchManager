echo off

if /I not "%Logging%"=="True" exit /b

set DATESTAMP=%date%
set TIMESTAMP=%time%

echo [%DATESTAMP% %TIMESTAMP%] [%~1] %~2>>"%LOGS%\%date:~-4%-%date:~4,2%-%date:~7,2%.log"

exit /b