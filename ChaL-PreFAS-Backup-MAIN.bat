@echo off
:: �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
:: �������� ���C���E�X�N���v�g ��������
:: 
:: �` VSS (Volume Shadow Copy Service) �Ή��`
::�@�@PreFAS - Precious Files Archive Script ���{��� Ver.1.0.1
::	Copyright by Chall-Link�i�V���������N�j
::	�g�p�O�ɕK�����ǂ݉������F "README.md"
:: �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
:: 
:: ������
:: �T�u�E�X�N���v�g ChaL-PreFAS-Backup-SUB.bat �̕ϐ�������ɏ]���ďC����A
:: �{�X�N���v�g���Ǘ��Ҍ����Ŏ��s���ĉ������B
::
::
:: ***************************************************************************
::     �X�N���v�g�i�����Ȃ��Ȃ�\������̂ŕs�p�ӂɕύX���Ȃ��ŉ������j
:: ***************************************************************************

setlocal
chcp 932 > nul
pushd %~dp0
color 3F

:: �Ǘ��Ҍ����`�F�b�N
net session >nul 2>&1 || (
    color C0
    echo.
    echo ----------------------
    echo �Ǘ��Ҍ������K�v�ł��B
    echo �E�N���b�N����u�Ǘ��҂Ƃ��Ď��s�v�ŋN�����Ă��������B
    echo Please run this program as administrator.
    echo ----------------------
    echo.
    pause
    exit 1
)
color 3F

:: �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|
::
:: �T�u�X�N���v�g���݃`�F�b�N
::
if exist "ChaL-PreFAS-Backup-SUB.bat" goto FILE_EXISTS
color C0
echo.
echo ----------------------
echo �T�u�X�N���v�g�iChaL-PreFAS-Backup-SUB.bat�j��������܂���B
echo �����t�H���_�ɔz�u���Ă��������B
echo Sub-script (ChaL-PreFAS-Backup-SUB.bat) not found.
echo Please place it in the same folder.
echo ----------------------
echo.
pause
exit 1

::�t�@�C�������݂���ꍇ�������珈�����p��
:FILE_EXISTS

:: �v���Z�X�̗D��x /LOW ���w�肵�ăT�u�E�X�N���v�g�����s����
::
������
start /LOW "" ".\ChaL-PreFAS-Backup-SUB.bat"

:: �������E���Ӂ�
:: ���̃R�}���h�́A�T�u�X�N���v�g�iChaL-PreFAS-Backup-SUB.bat�j��
:: CPU�̗D��x�u��i/LOW�j�v�Ŏ��s���܂��B
::
:: �D��x���w�肵�Ȃ��ꍇ�A�ȉ��̂悤�Ȗ�肪��������\��������܂��F
:: �� ���̃\�t�g�̃p�t�H�[�}���X���������ቺ����
:: �� CPU�̕��ׂƔ��M���ߓx�ɍ��܂�
::
:: ���ɖ{�X�N���v�g�́A4TB�ȏて�̃t�H���_���A�[�J�C�u���\��
:: �Ώۃt�H���_�T�C�Y�ɂ���ẮA������1�����z���钷���Ԃɋy��
:: �ꍇ���z�肳��܂��B
:: ���̂��߁APC�ւ̕��S���y������ړI�� /LOW ���w�肵�Ă��܂��B
::�i�� 7-Zip�����T�C�g https://www.7-zip.org/7z.html ���j

:: �|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|

:: �f�t�H���g�F�ɖ߂�
color

popd