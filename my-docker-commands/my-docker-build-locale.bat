@echo off

call _now()

set CARTELLA_ROOT=c:\my-source\docker\hello-docker
set PATH_ROOT_SORGENTE_FORMATO_LINUX=c:/my-source/docker/hello-docker
set ROOT_CONTAINER=hello-docker-image
set NOME_CONTAINER=%ROOT_CONTAINER%-caso-build-locale_%now%

set /p "yn=E' necessario rifare il build Maven? (y/n) "
if "%yn%"=="y" (echo "eseguo maven") else (goto :maven-no)

:maven-si
echo --------------------------------------------------
echo -- Eseguo build locale (Maven: clean + compile) --
echo --------------------------------------------------
cd ..
start c:/my-source/docker/hello-docker/mvnw clean compile
cd my-docker-commands

echo Attendi che si completi il build Maven (shell esterna), poi premi un tasto
pause

:maven-no

echo -----------------------------------------------------------------
echo -- Eseguo il Docker build ---------------------------------------
echo -- sorgente ......... %PATH_ROOT_SORGENTE_FORMATO_LINUX%
echo -- root container ... %ROOT_CONTAINER%
echo -----------------------------------------------------------------
cd ..
docker build --tag %ROOT_CONTAINER% %PATH_ROOT_SORGENTE_FORMATO_LINUX%

pause

echo ------------------------------------------------------------------
echo -- Eseguo il Docker run ------------------------------------------
echo -- (root container) ... %ROOT_CONTAINER%
echo -- nome container ..... %NOME_CONTAINER%
echo ------------------------------------------------------------------
cd %CARTELLA_ROOT%
docker run --name %NOME_CONTAINER% %ROOT_CONTAINER%

cd %CARTELLA_ROOT%\my-docker-commands
pause
