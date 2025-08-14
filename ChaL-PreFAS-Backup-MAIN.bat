@echo off
:: －－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
:: ＜＜＜＜ メイン・スクリプト ＞＞＞＞
:: 
:: ～ VSS (Volume Shadow Copy Service) 対応～
::　　PreFAS - Precious Files Archive Script 日本語版 Ver.1.0.1
::	Copyright by Chall-Link（シャルリンク）
::	使用前に必ずお読み下さい： "README.md"
:: －－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
:: 
:: ▼▼▼
:: サブ・スクリプト ChaL-PreFAS-Backup-SUB.bat の変数を説明に従って修正後、
:: 本スクリプトを管理者権限で実行して下さい。
::
::
:: ***************************************************************************
::     スクリプト（動かなくなる可能性あるので不用意に変更しないで下さい）
:: ***************************************************************************

setlocal
chcp 932 > nul
pushd %~dp0
color 3F

:: 管理者権限チェック
net session >nul 2>&1 || (
    color C0
    echo.
    echo ----------------------
    echo 管理者権限が必要です。
    echo 右クリックから「管理者として実行」で起動してください。
    echo Please run this program as administrator.
    echo ----------------------
    echo.
    pause
    exit 1
)
color 3F

:: －－－－－－－－－－－－－－－－－－－－－－－－－－－－
::
:: サブスクリプト存在チェック
::
if exist "ChaL-PreFAS-Backup-SUB.bat" goto FILE_EXISTS
color C0
echo.
echo ----------------------
echo サブスクリプト（ChaL-PreFAS-Backup-SUB.bat）が見つかりません。
echo 同じフォルダに配置してください。
echo Sub-script (ChaL-PreFAS-Backup-SUB.bat) not found.
echo Please place it in the same folder.
echo ----------------------
echo.
pause
exit 1

::ファイルが存在する場合ここから処理を継続
:FILE_EXISTS

:: プロセスの優先度 /LOW を指定してサブ・スクリプトを実行する
::
▼▼▼
start /LOW "" ".\ChaL-PreFAS-Backup-SUB.bat"

:: ＜説明・注意＞
:: このコマンドは、サブスクリプト（ChaL-PreFAS-Backup-SUB.bat）を
:: CPUの優先度「低（/LOW）」で実行します。
::
:: 優先度を指定しない場合、以下のような問題が発生する可能性があります：
:: ● 他のソフトのパフォーマンスが著しく低下する
:: ● CPUの負荷と発熱が過度に高まる
::
:: 特に本スクリプトは、4TB以上※のフォルダもアーカイブ化可能で
:: 対象フォルダサイズによっては、処理が1日を越える長時間に及ぶ
:: 場合も想定されます。
:: そのため、PCへの負担を軽減する目的で /LOW を指定しています。
::（※ 7-Zip公式サイト https://www.7-zip.org/7z.html より）

:: －－－－－－－－－－－－－－－－－－－－－－－－－－－－

:: デフォルト色に戻す
color

popd