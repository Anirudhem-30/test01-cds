@echo off
echo Starting Docker Desktop...
start "" "C:\ProgramData\Microsoft\Windows\Start Menu\Docker Desktop.lnk"

echo Waiting for Docker to start...

:waitloop
docker info >nul 2>&1
IF ERRORLEVEL 1 (
    timeout /t 5 >nul
    goto waitloop
)

echo Docker is running. Starting CDS Docker services...
cd C:\cdstest
docker-compose up -d
