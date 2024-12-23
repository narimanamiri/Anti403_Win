@echo off
set "interface=%~1"
netsh interface ip set dns name="%interface%" source=dhcp
echo DNS set to obtain automatically (DHCP)
