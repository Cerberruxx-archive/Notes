rem [Unfinished. View gdsesslog.bat to see updated version. Used Gemini code for reference.]
@echo off

setlocal

set="logf=%USERPROFILE%\downloads\gdsesslog.txt"

if not exist %logf% mkdir %logf%

rem Search and record process
tasklist | findstr "steam.exe" >nul 2>&1

if %errorlevel%==0 (
	call :LOG > %logf%
) else (
	echo No process found.
	endlocal
	exit /b
)

:LOG
