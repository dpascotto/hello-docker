@echo off

rem  CARTELLA_ROOT=c:\my-source\docker\hello-docker-bck
rem set PATH_ROOT_SORGENTE_LINUX=c:/my-source/docker/hello-docker-bck
rem set ROOT_NOME_CONTAINER=hello-docker-vecchio
set CARTELLA_ROOT=C:\my-source\docker\hello-docker\hello-docker\hello-docker
set PATH_ROOT_SORGENTE_LINUX=C:/my-source/docker/hello-docker/hello-docker/hello-docker
set ROOT_NOME_CONTAINER=hello-docker-nuovo

echo ----------------------------
echo -- Uso Dockerfile-caso-01 --
echo ----------------------------
del %CARTELLA_ROOT%\Dockerfile
copy %CARTELLA_ROOT%\Dockerfile-caso-01 %CARTELLA_ROOT%\Dockerfile

echo ----------------------------------
echo -- Eseguo il maven clean locale --
echo ----------------------------------
cd ..
start %PATH_ROOT_SORGENTE_LINUX%/mvnw clean
cd my-docker-commands

pause

echo ----------------------------
echo -- Eseguo il Docker build --
echo ----------------------------
docker build --tag %ROOT_NOME_CONTAINER% %PATH_ROOT_SORGENTE_LINUX%

pause

echo --------------------
echo Eseguo il Docker run
echo --------------------
call _now();
cd %CARTELLA_ROOT%
echo CARTELLA_ROOT=%CARTELLA_ROOT%
echo ROOT_NOME_CONTAINER=%ROOT_NOME_CONTAINER%
pause
docker run --name %ROOT_NOME_CONTAINER%-caso-01_%now% %ROOT_NOME_CONTAINER%


cd %CARTELLA_ROOT%\my-docker-commands
pause
