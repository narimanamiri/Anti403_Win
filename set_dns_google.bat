@echo off
set "interface=%~1"
netsh interface ip set dns name="%interface%" source=static address=8.8.8.8
netsh interface ip add dns name="%interface%" address=8.8.4.4 index=2
echo DNS set to Google DNS
