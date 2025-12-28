
rem game start
echo --Play Rock-Paper-Scissors--
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
set /p usrChoice="Choose:  "
if %usrChoice%=="rock" || "paper" || "scissors" goto UserChoice
echo "Please select between the given choices."

:UserChoice
echo %username% selected %usrChoice%
goto botChoice

:botChoice
echo COM's turn.
echo Choose: 
echo Rock
echo Paper
echo Scissors
rem array
set list[0]="Rock"
set list[1]="Paper"
set list[2]="Scissors"
set /a listSize=4
set /a randomNum=(!RANDOM! * %listSize%/32768)
call echo "COM chose  %%list[!randomNum!]%%."
pause
rem goto UserChoice2


:ExitGame
echo Exiting game...
pause
exit


