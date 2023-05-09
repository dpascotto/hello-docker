@echo off

echo ----------------------------
echo -- Uso Dockerfile-caso-01 --
echo ----------------------------
del c:\my-source\docker\hello-docker-bck\Dockerfile
copy c:\my-source\docker\hello-docker\hello-docker\hello-docker\Dockerfile-caso-01 c:\my-source\docker\hello-docker\hello-docker\hello-docker\Dockerfile

echo ----------------------------------
echo -- Eseguo il maven clean locale --
echo ----------------------------------
cd ..
start c:/my-source/docker/hello-docker/hello-docker/hello-docker/mvnw clean
cd my-docker-commands

echo ----------------------------
echo -- Eseguo il Docker build --
echo ----------------------------
docker build --tag hello-docker c:/my-source/docker/hello-docker\hello-docker\hello-docker

echo --------------------
echo Eseguo il Docker run
echo --------------------
call _now();
cd c:\my-source\docker\hello-docker\hello-docker\hello-docker
docker run --name hello-docker-caso-01_%now% hello-docker


cd c:\my-source\docker\hello-docker\hello-docker\hello-docker\my-docker-commands
pause
