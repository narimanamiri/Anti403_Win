@echo off
set "interface=%~1"
netsh interface ip set dns name="%interface%" source=static address=178.22.122.100
netsh interface ip add dns name="%interface%" address=185.51.200.2 index=2
echo DNS set to ShekanDNS
