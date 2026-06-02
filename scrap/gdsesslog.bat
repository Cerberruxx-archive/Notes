@echo off
setlocal
set="logf=%USERPROFILE%\downloads\gdsesslog.txt"

if not exist %logf% mkdir %logf%


rem Searching for the process with process PID
for /f "tokens=2 delims==" %%A in ('tasklist where "name='steam.exe'" get processid /value 2^>nul') do (
    set "SteamPID=%%A"
)

rem Checks if app is open
if not defined SteamPID (
    echo [!] Steam is not currently running.
    pause
    exit /b
)

rem Find child processes matching that string
set "found=0"
for /f "tokens=1,2 delims=," %%G in ('tasklist where "parentprocessid=%SteamPID%" get caption^,processid /format:csv 2^>nul ^| findstr /i "GeometryDash.exe"') do (
    echo Found Game Process: %%G | PID: %%H
    set "steamgame=%%G"
    set "found=1"
)

if "%found%"=="0" ( 
call :LOG > %logf%

) else (
    echo [X] No processes matching "GeometryDash.exe" were found running under Steam.
)


:LOG
"Game opened:	" date /t

for /f "tokens=*" %%A in ('powershell -command "[math]::Round(((Get-Date) - [System.Diagnostics.Process]::GetProcessById(%steamgame%).StartTime).TotalMinutes, 0)" 2^>nul') do (
    set "RunMinutes=%%A"
)

Time spent: %RunMinutes%

endlocal
pause
