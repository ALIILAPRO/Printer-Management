@echo off
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ================================================
    echo =            Please run as Administrator        =
    echo ================================================
    echo Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

:menu
cls
echo ================================================
echo =             Printer Management               =
ECHO =                                              =
echo =                by ALIILAPRO                  =
echo ================================================
echo 1. Add Registry Key (RpcAuthnLevelPrivacyEnabled)
echo 2. Restart Print Spooler
echo 3. Exit
echo =====================================
set /p choice="Enter your choice (1, 2, or 3): "

if %choice%==1 goto add_registry
if %choice%==2 goto restart_spooler
if %choice%==3 goto exit
echo Invalid choice, please try again.
pause
goto menu

:add_registry
echo Adding registry key...
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print" /v RpcAuthnLevelPrivacyEnabled /t REG_DWORD /d 0 /f
if %errorlevel%==0 (
    echo Registry key added successfully.
) else (
    echo Error adding registry key.
)
pause
goto menu

:restart_spooler
echo Restarting Print Spooler...
sc stop Spooler
if %errorlevel%==0 (
    echo Print Spooler stopped successfully.
    sc start Spooler
    if %errorlevel%==0 (
        echo Print Spooler started successfully.
    ) else (
        echo Error starting Print Spooler.
    )
) else (
    echo Error stopping Print Spooler.
)
pause
goto menu

:exit
echo Exiting program...
pause
