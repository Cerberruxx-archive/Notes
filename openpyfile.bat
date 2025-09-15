cls
@echo off
setlocal
set %CD%
set "FILE_N=test_curses.py"
echo // Searching for "%FILE_N%"...
echo .

for /r "%CD%" %%f in ("%FILE_%N") do
	(if exist "%FILE_N%"(
		echo .
		echo // Search Complete.
		echo .
		pause
		cmd start %FILE_N%))
	(if not exist "%FILE_N%" (
		echo .
		echo File not found. Exiting script...
		pause
		exit))
		