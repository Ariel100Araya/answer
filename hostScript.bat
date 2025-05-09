@echo off
setlocal enabledelayedexpansion

:: Set file path
set "filePath=C:\Path\To\Your\File.txt"

:: Get timestamp
for /f "tokens=1-3 delims=/ " %%a in ("%date%") do set "mydate=%%c-%%a-%%b"
for /f "tokens=1-2 delims=:" %%a in ("%time%") do set "mytime=%%a:%%b"
set "timestamp=%mydate% %mytime%"

:: Get hostname
set "hostname=%COMPUTERNAME%"

:: Get IP address
for /f "tokens=14 delims= " %%i in ('ipconfig ^| findstr /i "IPv4"') do set "ip=%%i"

:: Display information
echo === System Info Report ===
echo Timestamp    : %timestamp%
echo Host Name    : %hostname%
echo IP Address   : %ip%
echo.

:: Display file content
if exist "%filePath%" (
    echo --- File Content ---
    type "%filePath%"
) else (
    echo File not found: %filePath%
)

endlocal
pause