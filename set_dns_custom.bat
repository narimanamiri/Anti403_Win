@echo off
set "interface=%~1"
set /p customDNS1=Enter primary DNS address: 
set /p customDNS2=Enter secondary DNS address (optional): 
netsh interface ip set dns name="%interface%" source=static address=%customDNS1%
if not "%customDNS2%"=="" (
    netsh interface ip add dns name="%interface%" address=%customDNS2% index=2
)
echo Custom DNS set to %customDNS1% %customDNS2%
