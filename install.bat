@echo off
setlocal enabledelayedexpansion

set "ASCII=echo ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢟⣛⣛⣛⣛⡻⠿⣿⣿⣿"

for /f "tokens=2*" %%A in ('reg query "HKCU\Software\Microsoft\Command Processor" /v AutoRun 2^>nul') do set "CURRENT=%%B"

echo !CURRENT! | findstr /C:"%ASCII%" >nul
if errorlevel 1 (
    if defined CURRENT (
        reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun /t REG_SZ /d "!CURRENT! & %ASCII%" /f
    ) else (
        reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun /t REG_SZ /d "%ASCII%" /f
    )
)

endlocal
