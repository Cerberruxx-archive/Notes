@echo off
cls
setlocal enabledelayedexpansion
rem Set variables
set "dowf=%userprofile%\Game downloads\for clone hero"
set "extracted_f=%userprofile%\downloads"
set "songf=%userprofile%\documents\Clone Hero\Songs"

rem If file for newly extracted files does NOT exist, create dirctory
if not exist "%extracted_f%" mkdir "%extracted_f%"

echo Checking for recent ZIPs...

rem Move recent ZIPs to extracted_f
rem Syntax: forfile /p <path> /m <mask> /d <date_filter> /c <command>
rem Finds path to search (/p), looks for the file mask (*/m .zip), applies date filter
rem to files newer than 10 days (/d -10)
rem and runs a command (/c) to run on each file
rem Placeholder: @path is a special /c variable that is a placeholder for the full path
forfiles /p "%dowf%" /m *.zip /d -10 /c "cmd /c move @path\"%extracted_f%"\"

rem NOTE: always use the full path name (@path) for the 'move' command

rem Search in directory dowf
rem Find files matching the '*.zip' extension
rem Filter files modified within last 10 days
echo Extracting ZIPs... 
for %%i in ("%extracted_f%\*.zip") do (
	echo Extracting %%nxi...
	tar -xf "%%i" -C "%extracted_f%
)
rem NOTE: %%nxi is a modifier used on batch loop variables.
rem %%i is the raw loop var (%songf%);
rem n is filename without extension; x is the extension;
rem so %%nxi extracts: [filename_only].[extension_only]

rem Move extracted files in new directory "extracted_f" to "songf" existing directory

echo Moving files...
move "%extracted_f%\*" "%songf%"

echo Cleanup...
del "%extracted_f%\*.zip"

echo Finished :)
pause

rem PREVIOUS ISSUES:
rem line 16. tar does not use -c to specificy
rem an output directory; it creates an archive
rem instead (basically a ZIP file)

rem line 17. 
rem quotes break early between 'cmd' and '@file'
rem @file is only the filename, not full path
rem /d+10 means files OLDER than 10 days, not newer.
rem unnecessarily repeats itself inside of the ZIP loop
rem Moves ZIPs instead of the extracted files.

rem line 24.
rem Command tries to move the directory itself, not the
rem contents.

