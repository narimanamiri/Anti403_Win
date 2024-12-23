@echo off
set "interface=%~1"
netsh interface ip set dns name="%interface%" source=static address=78.157.42.100
netsh interface ip add dns name="%interface%" address=78.157.42.101 index=2
echo DNS set to Electro DNS
