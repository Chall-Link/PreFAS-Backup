@echo off
:: ---------------------------------------------------------------
:: Main Script
:: 
:: ~ VSS (Volume Shadow Copy Service) Support ~
:: PreFAS - Precious Files Archive Script English Version Ver.1.0.0
:: Copyright by Chall-Link
:: Please read before use: "README-en.md"
:: ---------------------------------------------------------------
::
:: After modifying the variables in the sub-script ChaL-PreFAS-Backup-SUB-en.bat 
:: according to the instructions, run this script with administrator privileges.
::
::
:: ***************************************************************************
::     Script (Do not modify carelessly as it may stop working)
:: ***************************************************************************
setlocal
chcp 65001 > nul
pushd %~dp0
color 3F
:: Administrator privilege check
net session >nul 2>&1 || (
    color C0
    echo.
    echo ----------------------
    echo Administrator privileges required.
    echo Please right-click and select "Run as administrator" to start.
    echo ----------------------
    echo.
    pause
    exit 1
)
color 3F
:: ---------------------------------------------------------------
::
:: Sub-script existence check
::
if exist "ChaL-PreFAS-Backup-SUB-en.bat" goto FILE_EXISTS
color C0
echo.
echo ----------------------
echo Sub-script (ChaL-PreFAS-Backup-SUB-en.bat) not found.
echo Please place it in the same folder.
echo ----------------------
echo.
pause
exit 1
::Continue processing from here if file exists
:FILE_EXISTS
:: Execute sub-script with /LOW process priority
start /LOW "" ".\ChaL-PreFAS-Backup-SUB-en.bat"
::
:: This command executes the sub-script (ChaL-PreFAS-Backup-SUB-en.bat)
:: with CPU priority set to "Low (/LOW)".
::
:: Without specifying priority, the following problems may occur:
:: - Performance of other software may significantly decrease
:: - CPU load and heat generation may become excessively high
::
:: This script can archive folders of 4TB or largerÅ¶, and depending on
:: the target folder size, processing may take more than a day.
:: Therefore, /LOW is specified to reduce the burden on the PC.
:: (From 7-Zip official site https://www.7-zip.org/7z.html)
:: ---------------------------------------------------------------
:: Return to default color
color
popd