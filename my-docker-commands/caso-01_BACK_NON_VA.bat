@echo off

set above=C:\my-source\docker\hello-docker\hello-docker\hello-docker
set aboveL=C:/my-source/docker/hello-docker/hello-docker/hello-docker
set here=%above%\my-docker-commands

echo ----------------------------
echo -- Uso Dockerfile-caso-01 --
echo ----------------------------
IF EXIST %above%\Dockerfile (del %above%\Dockerfile)
copy %above%\Dockerfile-caso-01 %above%\Dockerfile

pause

echo ----------------------------------
echo -- Eseguo il maven clean locale --
echo ----------------------------------
cd ..
start %aboveL%/mvnw.cmd clean
cd %here%

echo Attendere che il comando maven sia eseguito
pause

echo -------------------------------------------
echo -- Eseguo il Docker build ('.' = 'here') --
echo -------------------------------------------
cd %above%
rem docker build --tag hello-docker hello-docker
rem docker build hello-docker
docker build --tag hello-docker-img .
docker run --name hello-ciccio_1 hello-docker-img
pause


rem cd %here%
rem docker build --tag hello-docker-img %aboveL%

pause

call %here%\_now();
echo -------------------------------------- --------- -----
echo Eseguo il Docker run, ora: %now%
echo ----------------------------------------------------
rem cd %above%
docker run --name hello-docker-cnt-caso-01_%now% ../hello-docker-img

cd %here%
pause
