@Echo Off

docker build -t nicholasdille/spigotmc-build .

docker run -d --name build -w c:\build nicholasdille/spigotmc-build powershell -command .\RunBuildTools.ps1
docker wait build
docker logs --tail=5 build

for /f "usebackq tokens=4" %%i in (`docker logs --tail=1 build`) do docker cp build:c:\build\%%i .
