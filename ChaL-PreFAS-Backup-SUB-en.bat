@echo off
:: ---------------------------------------------------------------
:: Sub-Script (Pre-execution Configuration Registration)
:: 
:: ~ VSS (Volume Shadow Copy Service) Support ~
:: PreFAS - Precious Files Archive Script English Version Ver.1.0.0
:: Copyright by Chall-Link
:: Please read before use: "README-ChaL-PreFAS-Backup-Guide-en.txt"
:: ---------------------------------------------------------------
::
:: After modifying each variable in this script, run ChaL-PreFAS-Backup-MAIN-en.bat with administrator privileges.

:: "Archive" is used interchangeably with "compression" or "compressed file".

:: All output archive extensions will be in xxx.7z.001 format, but these are also normal 7-Zip files.

:: Editing files in the source folder during backup may increase the possibility of errors,
:: but using the included ChaL-VSSDetector allows error-free file editing during archive creation.
:: For details, please check "README-ChaL-VSSDetector_Guide-en.txt".

:: ***************************************************************************
::       Pre-execution Edit Items
:: ***************************************************************************
:: ---------------------------------------------------------------
:: Required Confirmation/Edit Items - Variable Group A 
:: ---------------------------------------------------------------

:: (A-1) 7-Zip Installation
:: If not installed, please install from
:: https://www.7-zip.org/
:: It is recommended not to change the installation destination from the default value.

:: ---------------------------------------------------------------

:: (A-2) 7-Zip Variable Setting
:: If the 7-Zip installation folder is not in the two lines starting with "set" below,
:: for example, if it's C:\My_Programs\7-Zip\, change the first set line from
:: "PATH=%PATH%;C:\Program Files\7-Zip" to
:: "PATH=%PATH%;C:\My_Programs\7-Zip\"

:: Edit here
  set "PATH=%PATH%;C:\Program Files\7-Zip"
  set "PATH=%PATH%;C:\Program Files (x86)\7-Zip"
::
:: See end of script for how to check 7-Zip installation folder
:: ---------------------------------------------------------------

:: (A-3) Output Archive File Name (alphanumeric)
:: Edit the "ChaL-PreFAS_Sample_Fi..." part to your preferred name.

:: Edit here
  set A_NAME="ChaL-PreFAS-Backup_Sample_File"
::
:: ---------------------------------------------------------------

:: (A-4) Source Folder to Archive (alphanumeric)
:: Edit the "SAMPLE-SOURCE-Folder-PreFAS-Backup" part below
::
:: Edit here
  set SOURCE_FOLDER="SAMPLE-SOURCE-Folder-PreFAS-Backup"
::
:: Note: Please specify with full path in principle (example: "D:\FOL-1\FOL-2").
::
:: ---------------------------------------------------------------
:: (A-5) Archive File Output Folder (alphanumeric)
:: Edit the "PreFAS-Backup-OUTPUT-Folder-SAMPLE" part below
::
:: Edit here
  set OUTPUT_FOLDER="PreFAS-Backup-OUTPUT-Folder-SAMPLE"
::
:: Note: It is known that specifying ".\" (current folder) or "..\" (parent folder)
:: causes errors.
:: Since it would be problematic if errors occur after hours of archiving,
:: please specify with full path in principle (example: "D:\FOL-1\FOL-2").
:: If retrying is easy, you may try relative paths like "." ".." instead of ".\" "..\"
:: 
:: ---------------------------------------------------------------
:: (A-6) Exclude Files and Folders 
:: Files and folders matching the settings will not be backed up.
:: You can continue to the next line by inserting ^ at the end of the setting line.
:: Sample:
:: "Exclude all tmp extension files, exclude folder folder_1"
:: set EXCLUDE= -xr!"*.tmp" -xr!"folder_1"
::
:: Edit here
set EXCLUDE=
:: 
:: Format example (set EXCLUDE=-xr!"*.tmp" -xr!"*.temp"). Edit the line above this.
:: If the setting line becomes long, you can wrap to the next line by adding ^ at the end.

:: ---------------------------------------------------------------
:: Modify as Needed - Variable Group B 
:: ---------------------------------------------------------------
:: (B-1) Archive split size. (Default value: 24337262k)

:: Edit here if necessary
  set VOLUME_SIZE=24337262k

:: Above size allows 4 files to be saved on 100GB Blu-ray Disc, M-Disc with 370MB remaining.
:: ---------------------------------------------------------------
:: Advanced Settings - No need to change normally - Variable Group C
:: ---------------------------------------------------------------
:: (C-1) Maximum thread count (Default value: "-mmt=6")
::
:: During Compression

:: Edit here only if there are problems
  set THREAD_COUNT="-mmt=6"

:: During Verification

:: Edit here only if there are problems
  set VERIFY_THREAD_COUNT="-mmt=6"
::
:: ---------------------------------------------------------------
:: (C-2) Compression Level (Default value: "-mx=7")

:: Edit according to the situation.
  set COMPRESSION_LEVEL="-mx=7"
::
:: Note:
:: Increasing the compression level also increases PC load.



:: ***************************************************************************
::       Script (Do not modify carelessly as it may stop working)
:: ***************************************************************************
::
setlocal
chcp 65001 > nul
pushd %~dp0
color 3F

:: ---------------------------------------------------------------
:: 7-Zip and folder existence check
where 7z.exe >nul 2>&1 && goto CHECK_FOLDERS
color C0
echo.
echo ----------------------------------------------------------
echo   7-Zip not found.
echo.
echo   Please recheck the Required Variable Group A item
echo   "(A-1) 7-Zip Program Preparation" in ChaL-PreFAS-Backup-SUB-en.bat.
echo.
echo   Possible causes:
echo     - 7-Zip is not installed
echo     - 7-Zip installation path is not correctly set in ChaL-PreFAS-Backup-SUB-en.bat
echo ----------------------------------------------------------
echo.
pause
exit 1

:CHECK_FOLDERS
if exist "%SOURCE_FOLDER%" goto CHECK_OUTPUT
color C0
echo.
echo ----------------------------------------------------------
echo   Source folder (%SOURCE_FOLDER%) not found.
echo.
echo   Please recheck the Required Variable Group A item
echo   "(A-4) Source folder to archive (alphanumeric)" in ChaL-PreFAS-Backup-SUB-en.bat.
echo.
echo   Possible causes:
echo     - Source folder is not set
echo     - Source folder name contains non-alphanumeric characters
echo ----------------------------------------------------------
echo.
pause
exit 1

:CHECK_OUTPUT
if exist "%OUTPUT_FOLDER%" goto CONTINUE
color C0
echo.
echo ----------------------------------------------------------
echo   Output folder (%OUTPUT_FOLDER%) not found.
echo.
echo   Please recheck the Required Variable Group A item
echo   "(A-5) 7zip archive output folder (alphanumeric)" in ChaL-PreFAS-Backup-SUB-en.bat.
echo.
echo   Possible causes:
echo     - Archive output folder is not set
echo     - Archive output folder name contains non-alphanumeric characters
echo.
echo   Note: "Archive" means "compressed file".
echo ----------------------------------------------------------
echo.
pause
exit 1

:CONTINUE


:: ---------------------------------------------------------------

:: Get current date and time using PowerShell with English format
for /f "tokens=*" %%a in ('powershell -Command "Get-Date -Format 'yy-MMdd-HHmmss'"') do set DATE_TIME=%%a

:: Output file and log file (with date)
set OUTPUT_FILE=%OUTPUT_FOLDER%\%A_NAME%_%DATE_TIME%.7z
set LOG_FILE=%OUTPUT_FOLDER%\Results_PreFAS_%DATE_TIME%.log
set COMPRESS_LOG_FILE=%OUTPUT_FOLDER%\Results_PreFAS_ERROR_%DATE_TIME%.log

echo.
echo OUTPUT_FILE=%OUTPUT_FILE% >> "%LOG_FILE%"
echo OUTPUT_FILE=%OUTPUT_FILE%
echo.

echo.
echo Password input notes:
echo.
echo Available characters: Half-width alphanumeric and symbols
echo.
echo Since this is intended for long-term storage, after the archive is completed,
echo please open the archive with 7-Zip File Manager, enter the appropriate password,
echo and confirm that you can view the contents and that the password is correct.
echo Note: "Archive" means "compressed file"
echo.
echo Reference: Strong setting = 20-30 digit random combination
echo.
echo Note:
echo Ctrl+V cannot be used!
echo.
echo  Proper paste method 1: Right-click on console screen and select Paste
echo  Proper paste method 2: Right-click on window title bar, Edit, Paste
echo.

:: Symbols in passwords are automatically processed appropriately by this script.

:: Password input (hidden with PowerShell)
set "pscmd=powershell.exe -Command "$inputPass = read-host 'Enter password:' -AsSecureString; $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($inputPass); [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "tokens=*" %%a in ('%pscmd%') do set PASSWORD1=%%a
if not defined PASSWORD1 (
    echo PowerShell is not available. Please check your environment.
    pause
    exit 1
)

set "pscmd=powershell.exe -Command "$inputPass = read-host 'Re-enter password:' -AsSecureString; $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($inputPass); [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "tokens=*" %%a in ('%pscmd%') do set PASSWORD2=%%a
if not defined PASSWORD2 (
    echo PowerShell is not available. Please check your environment.
    pause
    exit 1
)

:: Password confirmation
if "%PASSWORD1%"=="%PASSWORD2%" (
    echo Passwords match.
) else (
    echo Passwords do not match. Exiting...
    pause
    exit 1
)

cls

echo.
echo.
echo    +++ PreFAS - Precious Files Archive Script +++
echo.
echo    7-Zip is compressing folder...
echo.

echo Explanation: If it fails, this will happen...
echo (1) Background screen is not light blue   (2) "Everything is Ok" message is not displayed
echo If either occurs, processing has failed
echo Check the contents of the log file "Results_PreFAS_ERROR_xx-xxxx-xxxx.log"
echo in the 7zip output folder.
echo If processing succeeds, this file will be empty (file size = 0).
echo.
echo Explanation: If it succeeds, this will happen...
echo  (1) Background screen is light blue   (2) "Everything is Ok" message is displayed
echo.
echo Important: If successful, please open the created .7z.001 file with 7-Zip File Manager,
echo enter the password, and confirm that the password you remember is valid.
echo Operational mistakes may prevent opening.
echo.
echo Please wait until the message "Press any key to continue . . ."
echo appears and processing stops...
echo.

:: Record start time in log file
for /f "tokens=*" %%a in ('powershell -Command "Get-Date -Format 'yyyy/MM/dd HH:mm:ss'"') do echo 7-Zip process started at %%a >> "%LOG_FILE%"

:: Execute 7-Zip (display progress and errors on screen, record command in log)
echo Running 7-Zip archive creation... >> "%LOG_FILE%"
echo Command: 7z.exe a -v%VOLUME_SIZE% -p[HIDDEN] -mhe=on -mx=7 -m0=lzma2 -snl %EXCLUDE% -ssw -bsp1 -y -bb1 "%OUTPUT_FILE%" "%SOURCE_FOLDER%" >> "%LOG_FILE%"

7z.exe a ^
    -v%VOLUME_SIZE% ^
    "-p%PASSWORD1%" ^
    -mhe=on ^
    %THREAD_COUNT% ^
    %COMPRESSION_LEVEL% ^
    -ms=on ^
    -m0=lzma2 ^
    -snl ^
    %EXCLUDE% ^
    -ssw ^
    -bsp1 ^
    -bso0 ^
    -y ^
    -bb1 ^
    -ssc ^
    "%OUTPUT_FILE%" ^
    "%SOURCE_FOLDER%" 2>> "%COMPRESS_LOG_FILE%"

:: Extract error messages from screen (real-time display completed, so record in log)
echo Screen output completed. Check screen for errors/warnings. >> "%LOG_FILE%"

:: Check error log size and display message
for %%F in ("%COMPRESS_LOG_FILE%") do set SIZE=%%~zF
if not defined SIZE set SIZE=0
if %SIZE% GTR 0 (
    color 60
    echo.
    echo ---------------------------------------------
    echo  Error/warning messages were recorded in
    echo  %COMPRESS_LOG_FILE%
    echo  during this execution.
    echo  The messages are as follows:
    echo ---------------------------------------------
    echo Contents:
    type "%COMPRESS_LOG_FILE%"
    echo.
)

:: Execute 7-Zip verification (archive verification, add .001)
if exist "%OUTPUT_FILE%.001" (
    for /f "tokens=*" %%a in ('powershell -Command "Get-Date -Format 'yyyy/MM/dd HH:mm:ss'"') do echo Verifying archive at %%a >> "%LOG_FILE%"
    echo Running 7-Zip verification... >> "%LOG_FILE%"
    echo Command: 7z.exe t -p[HIDDEN] -y "%OUTPUT_FILE%.001" >> "%LOG_FILE%"
    7z.exe t ^
      %VERIFY_THREAD_COUNT% ^
      "-p%PASSWORD1%" ^
      -y ^
      "%OUTPUT_FILE%.001" ^
      > "%LOG_FILE%.temp" 2>&1

    :: Display error messages on screen in real time
    findstr /i "^ERROR: ^WARNING:" "%LOG_FILE%.temp" && echo Error/Warning messages displayed on screen. >> "%LOG_FILE%"
    :: Integrate into log
    type "%LOG_FILE%.temp" >> "%LOG_FILE%"
    :: Delay addition to avoid timing conflicts
    timeout /t 1 > nul
    del "%LOG_FILE%.temp" > nul 2>&1

    :: Display verification results (last 8 lines of log to screen with PowerShell)
    echo.
    echo --- Verification Result ---
    powershell -Command "Get-Content -Path '%LOG_FILE%' -Tail 8"
    :: Decorative display of Everything is Ok
    powershell -Command "if (Select-String -Path '%LOG_FILE%' -Pattern 'Everything is Ok' -Quiet) { Write-Host ''; Write-Host '=============================='; Write-Host '   Everything is Ok'; Write-Host '=============================='; Write-Host '' }"
    echo.
) else (
    echo No split archive found. Verification skipped. >> "%LOG_FILE%"
    echo No split archive found. Verification skipped.
)

:: Record end time in log file
for /f "tokens=*" %%a in ('powershell -Command "Get-Date -Format 'yyyy/MM/dd HH:mm:ss'"') do echo 7-Zip process ended at %%a >> "%LOG_FILE%"

:: Clear environment variables
set PASSWORD1=
set PASSWORD2=
set DATE_TIME=
set A_NAME=
set SOURCE_FOLDER=
set OUTPUT_FOLDER=
set VOLUME_SIZE=
set THREAD_COUNT=
set COMPRESSION_LEVEL=
set EXCLUDE=
set OUTPUT_FILE=
set LOG_FILE=
set COMPRESS_LOG_FILE=

:: Pause regardless of success/failure
pause

popd

exit 0

:: ================================================================
:: How to find 7-Zip installation folder
:: 
:: Search for "7-Zip" in Windows "Start Menu"
:: Right-click on "7-Zip File Manager" or "7-Zip" and select "Open file location"
:: Right-click on the displayed 7-Zip File Manager shortcut again
:: Select "Properties" and check path in "Target"
:: ================================================================