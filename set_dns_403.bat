@echo off
set "interface=%~1"
netsh interface ip set dns name="%interface%" source=static address=10.202.10.202
netsh interface ip add dns name="%interface%" address=10.202.10.102 index=2
echo DNS set to 403
