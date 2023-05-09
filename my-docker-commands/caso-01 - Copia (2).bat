@echo off

set NOME_APPLICAZIONE=
set IDENTIFIER=

echo ----------------------------
echo -- Uso Dockerfile-caso-01 --
echo ----------------------------
del c:\my-source\docker\hello-docker-bck\Dockerfile
copy c:\my-source\docker\hello-docker-bck\Dockerfile-caso-01 c:\my-source\docker\hello-docker-bck\Dockerfile

echo ----------------------------------
echo -- Eseguo il maven clean locale --
echo ----------------------------------
cd ..
start c:/my-source/docker/hello-docker-bck/mvnw clean
cd my-docker-commands

pause

echo ----------------------------
echo -- Eseguo il Docker build --
echo ----------------------------
docker build --tag hello-docker-vecchio c:/my-source/docker/hello-docker-bck

echo --------------------
echo Eseguo il Docker run
echo --------------------
call _now();
cd c:\my-source\docker\hello-docker-bck
docker run --name hello-docker-vecchio-caso-01_%now% hello-docker-vecchio


cd c:\my-source\docker\hello-docker-bck\my-docker-commands
pause
