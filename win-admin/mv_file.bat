:@echo off
:cls

:set "dow=c:\users\korin\downloads"
:set "docs=c:\users\korin\documents"
:set "pic"=C:\Users\korin\OneDrive\Pictures"
:set "mus=C:\Users\korin\OneDrive\Music"
:set "vid=c:\users\korin\onedrive\videos"

:cd %dow%
:findstr /f /a:green /i /m /s "*.png"
:if not exist "*.png* cd %docs% 

rem ISSUES INCLUDED:
rem  Syntax error with line 6 (variable called '"pic"' with quotes instead of just 'pic'
rem  Findstr is only designed to search for text INSIDE files and LIST them. Findstr cannot move files.
rem   Syntax error with line 12 (missing a quote for '.png*'. Inefficient to use if exist/if not exist with wildcards as it's more prone to errors.
rem  In line 12, the 'cd' command only moves the focus to the Documents folder and stops without repeating the search logic.
rem  Script is incomplete.

rem Below is an improved version (modified using Gemini AI):


cls
@echo off

rem   setlocal enabledelayedexpansion changes how variables are processed in the script; 
rem   enables variables to be processed at execution time (when actually called) instead of parse time (when the script itself runs).
setlocal enabledelayedexpansion

rem Define your target directories
rem  NOTE: it's vital to wrap path names such as "onedrive/music" 
rem  in quotes in case of spaces or special chars, which can break the script.
set "dirs=%userprofile%\downloads %userprofile%\documents %userprofile%\onedrive\pictures %userprofile%\onedrive\music %userprofile%\%userprofile%\onedrive\videos"

rem Define the destination folder
set "dest=c:\users\korin\desktop\ExampleFolder"

rem Create alternative destination folder if not exist
rem NOTE: MKDIR is for creating a new directory; MV relocates existing files; CD only changes the directory.
if not exist %dest% mkdir "%dest%"

rem Loop through each directory
for %%D in (%dirs%) do (
	echo checking for %%D 
	rem Check if any [file type] files exist in the directory
	if exist "%%D\*.png" (
		echo found [number] PNGs in %%D, moving to [destination]...
		mv "%%D\*.png" "%dest%\"
		) else (
			echo No files found in %%D, skipping...
			)
		)
echo Process complete.
pause


	
	

