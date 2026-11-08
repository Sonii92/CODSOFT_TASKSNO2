@echo off
echo ===================================================
echo   Starting JobSphere Full Stack Server...
echo ===================================================
cd /d "%~dp0server"
node server.js
pause
