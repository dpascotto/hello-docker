echo off

call _set-my-variables.bat

rem pause

echo %path%
echo Questo e' il valore di PIPPO: %PIPPO%, giusto una verifica prima di continuare (maven: clean + install)

pause

call mvn clean install
echo Il prossimo step e' il run, solo se non ci sono stati errori nel build

pause

mvn exec:java -Dexec.mainClass=HelloDocker

echo Ciao, alla prossima
pause