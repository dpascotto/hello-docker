@echo off

set CARTELLA_ROOT=c:\my-source\docker\hello-docker
set PATH_ROOT_SORGENTE_LINUX=c:/my-source/docker/hello-docker
set ROOT_NOME_CONTAINER=hello-docker-vecchio

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
docker run --name %ROOT_NOME_CONTAINER%-caso-01_%now% %ROOT_NOME_CONTAINER%


cd %CARTELLA_ROOT%\my-docker-commands
pause
