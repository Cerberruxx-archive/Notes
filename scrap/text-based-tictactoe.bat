@echo off
rem game start
echo || Play Rock-Paper-Scissors ||
echo Yes
echo No
set /p startOptions="type your choice here: "
rem processes user input
if %choice&=="Yes" goto PlayGame
if %choice%=="No" goto ExitGame

:PlayGame
echo Your turn.
echo Choose: 
echo Rock
echo Paper
echo Scissors


:ExitGame
echo Exiting game...
pause
exit

if %errorlevel%==2 goto exit
