@echo off

set above=C:\my-source\docker\hello-docker\hello-docker\hello-docker
set aboveL=C:/my-source/docker/hello-docker/hello-docker/hello-docker
set here=%above%\my-docker-commands

echo ----------------------------
echo -- Uso Dockerfile-caso-02 --
echo ----------------------------
IF EXIST %above%\Dockerfile (del %above%\Dockerfile)
copy %above%\Dockerfile-caso-02 %above%\Dockerfile

echo --------------------------------------------
echo -- Eseguo il maven clean + install locale --
echo --------------------------------------------
cd ..
start %above%/mvnw.cmd clean install
cd %here%

echo Attendi che si completi il build, poi premi un tasto
pause

rem echo ----------------------------
rem echo -- Eseguo il Docker build --
rem echo ----------------------------
rem cd %above%
rem docker build --tag hello-docker hello-docker

rem pause

echo --------------------
echo Eseguo il Docker run
echo --------------------
call _now();
cd %above%
docker run --name hello-docker-caso-02_%now% hello-docker



cd c:\my-source\docker\hello-docker\my-docker-commands
pause
