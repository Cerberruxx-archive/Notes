cls
@echo off
setlocal
set "FILE_N=test_curses.py"
echo // Searching for "%FILE_N%"...
echo .

for /r "%CD%" %%f in ("%FILE_%N") do (
	echo .
	echo // Search Complete. Redirecting...
	echo .
	pause
	start "%PYTHON%" "%FILE_N%"
	goto :endscript
)

echo .
echo File not found. Exiting script...
pause

:endscript
endlocal
	
rem corrected batch file from previous: openpyfile.bat	