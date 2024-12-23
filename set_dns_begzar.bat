@echo off
set "interface=%~1"
netsh interface ip set dns name="%interface%" source=static address=185.55.226.26
netsh interface ip add dns name="%interface%" address=185.55.225.25 index=2
echo DNS set to Begzar
