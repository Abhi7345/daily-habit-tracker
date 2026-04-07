@echo off
setlocal

cd /d "%~dp0"

start "HabitFlow Server" cmd /k "py -3 server.py"

timeout /t 2 /nobreak >nul

set "APP_URL=http://127.0.0.1:8000"
set "CHROME_EXE=%ProgramFiles%\Google\Chrome\Application\chrome.exe"

if exist "%CHROME_EXE%" (
    start "" "%CHROME_EXE%" "%APP_URL%"
    goto :eof
)

set "CHROME_EXE=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"

if exist "%CHROME_EXE%" (
    start "" "%CHROME_EXE%" "%APP_URL%"
    goto :eof
)

start "" "%APP_URL%"
