@echo off
setlocal enabledelayedexpansion
cd C:\Users\Nariman\Desktop\DNS
:: Step 1: List all network interfaces
echo List of network interfaces:
set count=0
for /f "tokens=* delims=" %%i in ('wmic nic get NetConnectionID ^| findstr /v "NetConnectionID" ^| findstr /r /v "^$"') do (
    if not "%%i"=="" (
        set /a count+=1
        set "interface!count!=%%i"
        echo !count!: %%i
    )
)

:: Ask the user to select the internet interface
set /p selectedInterface=Please enter the number of the interface you want to use for internet: 

:: Validate user input
if "!interface%selectedInterface%!"=="" (
    echo Invalid selection!
    exit /b
)

:: Store selected interface name and trim trailing spaces
set selectedInterfaceName=!interface%selectedInterface%!
for /f "tokens=* delims= " %%a in ("!selectedInterfaceName!") do set selectedInterfaceName=%%a
for /l %%a in (1,1,31) do if "!selectedInterfaceName:~-1!"==" " set selectedInterfaceName=!selectedInterfaceName:~0,-1!
echo You have selected interface: "!selectedInterfaceName!"

:: Ask the user what DNS they want to set
echo.
echo Select DNS to set:
echo 0: Obtain automatically (DHCP)
echo 1: Google DNS (8.8.8.8, 8.8.4.4)
echo 2: 403
echo 3: Begzar
echo 4: Electro 
echo 5: Radar
echo 6: Shekan
:: Add more preset DNS options here
echo 10: Custom DNS
echo.

set /p selectedDNS=Please enter the number of the DNS setting you want to use: 

:: Validate DNS selection and call the respective script
if "%selectedDNS%"=="0" (
    echo Calling set_dns_dhcp.bat with parameter "!selectedInterfaceName!"
    call set_dns_dhcp.bat "!selectedInterfaceName!"
) else if "%selectedDNS%"=="1" (
    echo Calling set_dns_google.bat with parameter "!selectedInterfaceName!"
    call set_dns_google.bat "!selectedInterfaceName!"
) else if "%selectedDNS%"=="2" (
    echo Calling set_dns_403.bat with parameter "!selectedInterfaceName!"
    call set_dns_403.bat "!selectedInterfaceName!"
) else if "%selectedDNS%"=="3" (
    echo Calling set_dns_begzar.bat with parameter "!selectedInterfaceName!"
    call set_dns_begzar.bat "!selectedInterfaceName!"
) else if "%selectedDNS%"=="4" (
    echo Calling set_dns_electro.batt with parameter "!selectedInterfaceName!"
    call set_dns_electro.bat "!selectedInterfaceName!"
) else if "%selectedDNS%"=="5" (
    echo Calling set_dns_radar.bat with parameter "!selectedInterfaceName!"
    call set_dns_radar.bat "!selectedInterfaceName!"
) else if "%selectedDNS%"=="6" (
    echo Calling set_dns_shekan.bat with parameter "!selectedInterfaceName!"
    call set_dns_shekan.bat "!selectedInterfaceName!"
) else if "%selectedDNS%"=="10" (
    echo Calling set_dns_custom.bat with parameter "!selectedInterfaceName!"
    call set_dns_custom.bat "!selectedInterfaceName!"
) else (
    echo Invalid DNS selection!
    exit /b
)

pause
