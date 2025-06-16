@echo off
:: �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
:: �m�m�m�@�T�u�E�X�N���v�g�i���s�O�E�ݒ�l�o�^�j�n�n�n
::
:: �` VSS (Volume Shadow Copy Service) �Ή��`
::�@�@PreFAS - Precious Files Archive Script ���{��� Ver.1.0.0
::	Copyright by Chall-Link�i�V���������N�j
::	�g�p�O�ɕK�����ǂ݉������F "README.md"
:: �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
:: 
:: �� �{�X�N���v�g�́A�e�ϐ����C��������AChaL-PreFAS-Backup-MAIN.bat ���Ǘ��Ҍ����Ŏ��s���ĉ������B

:: ���u�A�[�J�C�u�v���u���k�vor�u���k�t�@�C���v�Ƃ��ĕ\�L���Ă��܂��B

:: �� �o�̓A�[�J�C�u�g���q�͑S�� xxx.7z.001 �`���ɂȂ�܂����A����������� 7-Zip�t�@�C���ł��B

:: �� �o�b�N�A�b�v���Ƀ\�[�X�t�H���_�̃t�@�C����ҏW����ƃG���[����������\�������܂�܂����A
:: ��������Ă���ChaL-VSSDetector���g���Ώ������ł��G���[�����t�@�C����ҏW�ł��郂�[�h�ŃA�[�J�C�u�\�ł��B
:: �ڍׂ� "README-ChaL-VSSDetector_Guide.txt" �����m�F���������B

:: ***************************************************************************
::       ���s�O�@�ҏW����
:: ***************************************************************************
:: �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
:: �y�K���m�F�E�ҏW���ځz �ϐ��O���[�v�` 
:: �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|

:: (A-1)�@7-Zip�̃C���X�g�[��
:: �C���X�g�[������Ă��Ȃ��ꍇ�́A
:: https://www.7-zip.org/�@����C���X�g�[�����Ă��������B
:: �C���X�g�[����̓f�t�H���g�l����ύX���Ȃ����𐄏����܂��B

:: �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|

:: (A-2)�@7-Zip �̕ϐ��ݒ�
:: 7-Zip �C���X�g�[���t�H���_�����L�Q�� set �Ŏn�܂�s�ɖ����ꍇ�A
:: �Ⴆ�� C:\My_Programs\7-Zip\ �̏ꍇ�́Aset �̈�s�ڂ́A
:: "PATH=%PATH%;C:\Program Files\7-Zip"���A
:: "PATH=%PATH%;C:\My_Programs\7-Zip\" �ɏ��������ĉ������B

:: ���� ������ҏW�@����
  set "PATH=%PATH%;C:\Program Files\7-Zip"
  set "PATH=%PATH%;C:\Program Files (x86)\7-Zip"
::
:: ��7-Zip�C���X�g�[���t�H���_�̊m�F���@�̓X�N���v�g���Q��
:: �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|

:: (A-3) �o�̓A�[�J�C�u�t�@�C���� (���p�p��)
:: �wChaL-PreFAS_Sample_Fi�c�x���������D���Ȗ��O�ɕҏW�������B

:: ���� ������ҏW�@����
  set A_NAME="ChaL-PreFAS-Backup_Sample_File"
::
:: �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|

:: (A-4) �A�[�J�C�u����\�[�X�t�H���_ (���p�p��)
:: ���L�́wChaL-PreFAS_Sample_SOURCE_Fo�c�x������ҏW������
::
:: ���� ������ҏW�@����
  set SOURCE_FOLDER="SAMPLE-SOURCE-Folder-PreFAS-Backup"
::
:: �y���Ӂz�����t���p�X�i��F"D:\FOL-1\FOL-2"�j�Ŏw�肭�������B
::
:: �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
:: (A-5) �A�[�J�C�u�t�@�C���o�̓t�H���_ (���p�p��)
:: ���L�� �wChaL-PreFAS_Sample_OUTPUT_Fo�c�x������ҏW������
::
:: ���� ������ҏW�@����
  set OUTPUT_FOLDER="PreFAS-Backup-OUTPUT-Folder-SAMPLE"
::
:: �y���Ӂz ".\"�i�J�����g�t�H���_�j "..\" �i�e�t�H���_�j �̎w��ł�
:: �G���[���o�鎖���킩���Ă��܂��B
:: �����Ԃ��A�[�J�C�u�Ɏ��Ԃ�������Ō�ɃG���[���o��ƍ���܂��̂ŁA
:: �����t���p�X�i��F"D:\FOL-1\FOL-2"�j�Ŏw�肭�������B
:: ��蒼�����e�Ղȏꍇ�́A".\" "..\" �̑���ɁA"." ".."�Ȃ�
:: ���΃p�X�������Ă��������Ă��\���܂���B
:: 
:: �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
:: (A-6) ���O�t�@�C���A���O�t�H���_ 
:: �ݒ�ɍ��v����t�@�C���A�t�H���_�̓o�b�N�A�b�v����܂���B
:: �ݒ�l�s�̖����� ^ ��}������Ύ��̉��s�ɑ����鎖���ł��܂��B
:: �y�T���v���z
:: �w�g���q tmp �t�@�C����S�ď��O�A�t�H���_ folder_1 �����O�x
:: set EXCLUDE= -xr!"*.tmp" -xr!"folder_1"
::
:: ���� ������ҏW�@����
set EXCLUDE=
:: 
:: �������{�iset EXCLUDE=-xr!"*.tmp" -xr!"*.temp"�j�B�ҏW����̂͂��̏�̍s�ł��B
:: �ݒ�̈�s�������Ȃ�����A�s���� ^ ������Ύ��̍s�ɐ܂�Ԃ��܂��B

:: �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
:: �y�K�v�ɉ����ďC���z �ϐ��O���[�v�a 
:: �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
:: (B-1) �A�[�J�C�u�����T�C�Y�B�i�f�t�H���g�l�F24337262k�j

:: ���� ������K�v�ɉ����ĕҏW�@����
  set VOLUME_SIZE=24337262k

:: �� ��L��100GB Blu-ray Disc�AM-Disc �ɂS�t�@�C���ۑ��ł��A370MB�]��T�C�Y�B
:: �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
:: �y���x�Ȑݒ�E��{�I�ɕύX�s�v�z�@�ϐ��O���[�v�b
:: �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
:: (C-1) �ő�X���b�h���i�f�t�H���g�l�F"-mmt=6"�j
::
:: ���� ���k�� ����

:: ���� ��肪����ꍇ�݂̂�����ҏW�@����
  set THREAD_COUNT="-mmt=6"

:: ���� �x���t�@�C�� ����

:: ���� ��肪����ꍇ�݂̂�����ҏW�@����
  set VERIFY_THREAD_COUNT="-mmt=6"
::
:: �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
:: (C-2) ���k���x���i�f�t�H���g�l�F"-mx=7"�j

:: �󋵂ɉ����āA�ҏW���Ă��������B
:: ������
  set COMPRESSION_LEVEL="-mx=7"
::
:: �����Ӂ�
:: ���k���x�����グ��ƁAPC�̕��ׂ��オ��܂��B



:: ***************************************************************************
::       �X�N���v�g�i�����Ȃ��Ȃ�\������̂ŕs�p�ӂɕύX���Ȃ��ŉ������j
:: ***************************************************************************
::
setlocal
chcp 932 > nul
pushd %~dp0
color 3F

:: �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
:: 7-Zip�ƃt�H���_���݃`�F�b�N
where 7z.exe >nul 2>&1 && goto CHECK_FOLDERS
color C0
echo.
echo ----------------------------------------------------------
echo �@�@�{�{ 7-Zip��������܂���B�{�{
echo �@�@�{�{ 7-Zip not found. �{�{
echo.
echo �@�@ChaL-PreFAS-Backup-SUB.bat ���́y�ݒ�K�{�z �ϐ��O���[�v�` �́A
echo �@�@�w(A-1) 7-Zip�v���O�������p�����x�̍��ڂ��Ċm�F���ĉ������B
echo.
echo �@�@�����Ƃ���
echo �@�@�@�� 7-Zip���C���X�g�[������Ă��Ȃ�
echo �@�@�@�� 7-Zip �̃C���X�g�[���p�X���AChaL-PreFAS-Backup-SUB.bat���ɐ������ݒ肳��Ă��Ȃ�
echo �@�@�Ȃǂ��l�����܂��B
echo ----------------------------------------------------------
echo.
pause
exit 1

:CHECK_FOLDERS
if exist "%SOURCE_FOLDER%" goto CHECK_OUTPUT
color C0
echo.
echo ----------------------------------------------------------
echo �@�@�{�{ �\�[�X�t�H���_�i%SOURCE_FOLDER%�j��������܂���B�{�{
echo �@�@�{�{ Source folder (%SOURCE_FOLDER%) not found. �{�{
echo.
echo �@�@ChaL-PreFAS-Backup-SUB.bat ���́y�ݒ�K�{�z �ϐ��O���[�v�` �́A
echo �@�@�w(A-3) �A�[�J�C�u����Ώۃ\�[�X�t�H���_ (���p�p��)�x�̍��ڂ��Ċm�F���ĉ������B
echo.
echo �@�@�����Ƃ���
echo �@�@�@�� �\�[�X�t�H���_��ݒ肵�Ă��Ȃ�
echo �@�@�@�� �\�[�X�t�H���_�����A���p�p���݂̂ɂȂ��Ă��Ȃ�
echo �@�@�Ȃǂ��l�����܂��B
echo ----------------------------------------------------------
echo.
pause
exit 1

:CHECK_OUTPUT
if exist "%OUTPUT_FOLDER%" goto CONTINUE
color C0
echo.
echo ----------------------------------------------------------
echo �@�@�{�{ �o�̓t�H���_�i%OUTPUT_FOLDER%�j��������܂���B�{�{
echo �@�@�{�{ Output folder (%OUTPUT_FOLDER%) not found. �{�{
echo.
echo �@�@ChaL-PreFAS-Backup-SUB.bat ���́y�ݒ�K�{�z �ϐ��O���[�v�` �́A
echo �@�@�w (A-4) 7zip �A�[�J�C�u�o�̓t�H���_ (���p�p��)�x�̍��ڂ��Ċm�F���ĉ������B
echo.
echo �@�@�����Ƃ���
echo �@�@�@�� �A�[�J�C�u�o�̓t�H���_��ݒ肵�Ă��Ȃ�
echo �@�@�@�� �A�[�J�C�u�o�̓t�H���_�����A���p�p���݂̂ɂȂ��Ă��Ȃ�
echo �@�@�Ȃǂ��l�����܂��B
echo.
echo �@�@�����Ӂu�A�[�J�C�u�v���u���k�t�@�C���v�̈Ӗ��ł��B
echo ----------------------------------------------------------
echo.
pause
exit 1

:CONTINUE


:: �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|

:: ���݂̓��t�Ǝ������擾 (yy-mmdd-hhmm �`��)
set DATE_TIME=%date:~2,2%-%date:~5,2%%date:~8,2%-%time:~0,2%%time:~3,2%%time:~6,2%
set DATE_TIME=%DATE_TIME: =0%

:: �o�̓t�@�C���ƃ��O�t�@�C���i���t�t���j
set OUTPUT_FILE=%OUTPUT_FOLDER%\%A_NAME%_%DATE_TIME%.7z
set LOG_FILE=%OUTPUT_FOLDER%\Results_PreFAS_%DATE_TIME%.log
set COMPRESS_LOG_FILE=%OUTPUT_FOLDER%\Results_PreFAS_ERROR_%DATE_TIME%.log

echo.
echo OUTPUT_FILE=%OUTPUT_FILE% >> "%LOG_FILE%"
echo OUTPUT_FILE=%OUTPUT_FILE%
echo.

echo.
echo �p�X���[�h���͎��̒���:
echo.
echo �� �g�p�\�ȕ���: ���p�p���� (���|��, �`�|�y, �O�|�X) ��
echo ���p�L�� (�`�I���������O�����i�j�|�Q���{�m�o�n�p�_�b�G�F�f �h�^�H�D���C�� �ȂǁA�X�y�[�X�܂�)
echo.
echo �� �����ۊǂ�ړI�Ƃ��Ă��܂��̂ŃA�[�J�C�u���������܂�����A7-Zip�W����GUI�c�[��
echo 7-Zip File Manager�ŃA�[�J�C�u���J���A�K�؂ȃp�X���[�h����͂��A���e���{���ł��邩
echo �p�X���[�h�̊m�F�����肢���܂��B
echo �����Ӂu�A�[�J�C�u�v���u���k�t�@�C���v
echo.
echo �� �Q�l: ���͂Ȑݒ聁20�`30���̃����_���ȑg�ݍ��킹
echo.
echo ������ ���� �������@
echo ����  Ctrl+v �͎g�p�ł��܂���I ����
echo.
echo  �K�؂ȃy�[�X�g�P: �R���\�[����ʏ�ŉE�N���b�N �� �\��t��
echo  �K�؂ȃy�[�X�g�Q: �E�B���h�E�^�C�g���o�[�E�N���b�N �� �ҏW �� �\��t��
echo.

:: �L�����܂ރp�X���[�h�͖{�X�N���v�g�Ŏ����I�ɓK�؂ɏ�������܂��B

:: �p�X���[�h���� (PowerShell�Ŕ�\��)
set "pscmd=powershell.exe -Command "$inputPass = read-host '�p�X���[�h�����:' -AsSecureString; $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($inputPass); [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "tokens=*" %%a in ('%pscmd%') do set PASSWORD1=%%a
if not defined PASSWORD1 (
    echo PowerShell���g�p�ł��܂���B�����m�F���Ă��������B
    pause
    exit 1
)

set "pscmd=powershell.exe -Command "$inputPass = read-host '�p�X���[�h���ē���:' -AsSecureString; $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($inputPass); [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "tokens=*" %%a in ('%pscmd%') do set PASSWORD2=%%a
if not defined PASSWORD2 (
    echo PowerShell���g�p�ł��܂���B�����m�F���Ă��������B
    pause
    exit 1
)

:: �p�X���[�h�m�F
if "%PASSWORD1%"=="%PASSWORD2%" (
    echo �p�X���[�h����v���܂����B
) else (
    echo �p�X���[�h����v���܂���B�I�����܂�...
    pause
    exit 1
)

cls

echo.
echo.
echo    +++ PreFAS - Precious Files Archive Script +++
echo.
echo    7-Zip ���t�H���_�[�����k���ł��c
echo.

echo �y�����z�������s�����ꍇ�͂����Ȃ�܂��c
echo (1) �w�i��ʂ����F�Ŗ���   (2) Everything is Ok���b�Z�[�W���\������Ȃ�
echo �����ꂩ�̏ꍇ�A�����͎��s���Ă��܂�
echo 7zip �o�̓t�H���_���� "Results_PreFAS_ERROR_xx-xxxx-xxxx.log"
echo �Ƃ������O�E�t�@�C���̓��e���m�F���Ă��������B
echo ���������̏ꍇ���̃t�@�C���͋�t�@�C��(�t�@�C���T�C�Y���O�j�ɂȂ�܂��B
echo.
echo �y�����z���������ꍇ�͂����Ȃ�܂��c
echo  (1) �w�i��ʂ����F   (2) Everything is Ok���b�Z�[�W���\��
echo.
echo �y�d�v�z ����������쐬���ꂽ�A�g���q 7z.001 �t�@�C���� �K����x�A7-Zip File Manager��
echo�@�p�X���[�h����͂��ĊJ���A�F�����Ă���p�X���[�h���L�����m�F���ĉ������B
echo�@����~�X������ƊJ���Ȃ���������܂��B
echo.
echo + + + + + + + + + + + + + + + + + + + + + + + + + 
echo �w���s����ɂ͉����L�[�������Ă������� . . .�x
echo  �̃��b�Z�[�W���o�ď�������~����܂ł��҂��������� ...
echo + + + + + + + + + + + + + + + + + + + + + + + + + 
echo.

:: ���O�t�@�C���ɊJ�n�������L�^
echo 7-Zip process started at %date% %time% >> "%LOG_FILE%"

:: 7-Zip���s�i�i���ƃG���[����ʕ\���A���O�ɃR�}���h�L�^�j
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

:: �G���[���b�Z�[�W����ʂ��璊�o�i���A���^�C���\���ς݂̂��߃��O�ɋL�^�j
echo Screen output completed. Check screen for errors/warnings. >> "%LOG_FILE%"

:: �G���[���O�̃T�C�Y�`�F�b�N�ƃ��b�Z�[�W�\��
for %%F in ("%COMPRESS_LOG_FILE%") do set SIZE=%%~zF
if not defined SIZE set SIZE=0
if %SIZE% GTR 0 (
    color 60
    echo.
    echo ---------------------------------------------
    echo  ����̎��s��
    echo  %COMPRESS_LOG_FILE%
    echo  ���ɃG���[�E�x�����b�Z�[�W���L�^����܂����B
    echo  ���b�Z�[�W�͉��L�̒ʂ�ł�
    echo ---------------------------------------------
    echo ���e
    type "%COMPRESS_LOG_FILE%"
    echo.
)

:: 7-Zip�x���t�@�C���s�i�A�[�J�C�u���؁A.001��t���j
if exist "%OUTPUT_FILE%.001" (
    echo Verifying archive at %date% %time% >> "%LOG_FILE%"
    echo Running 7-Zip verification... >> "%LOG_FILE%"
    echo Command: 7z.exe t -p[HIDDEN] -y "%OUTPUT_FILE%.001" >> "%LOG_FILE%"
    7z.exe t ^
      %VERIFY_THREAD_COUNT% ^
      "-p%PASSWORD1%" ^
      -y ^
      "%OUTPUT_FILE%.001" ^
      > "%LOG_FILE%.temp" 2>&1

    :: �G���[���b�Z�[�W�����A���^�C���ŉ�ʕ\��
    findstr /i "^ERROR: ^WARNING:" "%LOG_FILE%.temp" && echo Error/Warning messages displayed on screen. >> "%LOG_FILE%"
    :: ���O�ɓ���
    type "%LOG_FILE%.temp" >> "%LOG_FILE%"
    :: �x���ǉ��Ń^�C�~���O�������
    timeout /t 1 > nul
    del "%LOG_FILE%.temp" > nul 2>&1

    :: �x���t�@�C���ʕ\���i���O����8�s��PowerShell�ŉ�ʂɁj
    echo.
    echo --- Verification Result ---
    powershell -Command "Get-Content -Path '%LOG_FILE%' -Tail 8 -Encoding UTF8"
    :: Everything is Ok �����\��
    powershell -Command "if (Select-String -Path '%LOG_FILE%' -Pattern 'Everything is Ok' -Quiet) { Write-Host ''; Write-Host '=============================='; Write-Host '   Everything is Ok'; Write-Host '=============================='; Write-Host '' }"
    echo.
) else (
    echo No split archive found. Verification skipped. >> "%LOG_FILE%"
    echo No split archive found. Verification skipped.
)

:: ���O�t�@�C���ɏI���������L�^
echo 7-Zip process ended at %date% %time% >> "%LOG_FILE%"

:: ���ϐ��N���A
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

:: ����/���s�Ɋւ�炸�ꎞ��~
pause

popd

exit 0

:: ��������������������������������������������������������������������������������
:: �� 7-Zip �C���X�g�[���t�H���_�̌�����
:: 
:: Windows �́u�X�^�[�g���j���[�v�Łu7-Zip�v�ƌ���
:: �u7-Zip File Manager�v��u7-Zip�v�̏�ŉE�N���b�N ���u�t�@�C���̏ꏊ���J���v
:: �\�����ꂽ 7-Zip File Manager�Ȃǂ̃V���[�g�J�b�g������ɉE�N���b�N
:: ���u�v���p�e�B�v���u�����N��v�Ńp�X�m�F
:: ��������������������������������������������������������������������������������