@echo off

echo ----------------------------
echo -- Uso Dockerfile-caso-02 --
echo ----------------------------
del c:\my-source\docker\hello-docker\Dockerfile
copy c:\my-source\docker\hello-docker\Dockerfile-caso-02 c:\my-source\docker\hello-docker\Dockerfile

echo --------------------------------------------
echo -- Eseguo il maven clean + install locale --
echo --------------------------------------------
cd ..
start c:/my-source/docker/hello-docker/mvnw clean install
cd my-docker-commands

echo Attendi che si completi il build, poi premi un tasto
pause

echo ----------------------------
echo -- Eseguo il Docker build --
echo ----------------------------
docker build --tag hello-docker c:/my-source/docker/hello-docker

echo --------------------
echo Eseguo il Docker run
echo --------------------
call _now();
cd c:\my-source\docker\hello-docker
docker run --name hello-docker-caso-02_%now% hello-docker


cd c:\my-source\docker\hello-docker\my-docker-commands
pause
