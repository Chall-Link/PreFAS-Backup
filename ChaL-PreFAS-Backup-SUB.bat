@echo off
:: －－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
:: ［［［　サブ・スクリプト（実行前・設定値登録）］］］
::
:: ～ VSS (Volume Shadow Copy Service) 対応～
::　　PreFAS - Precious Files Archive Script 日本語版 Ver.1.0.0
::	Copyright by Chall-Link（シャルリンク）
::	使用前に必ずお読み下さい： "README.md"
:: －－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
:: 
:: ※ 本スクリプトの、各変数を修正した後、ChaL-PreFAS-Backup-MAIN.bat を管理者権限で実行して下さい。

:: ※「アーカイブ」≒「圧縮」or「圧縮ファイル」として表記しています。

:: ※ 出力アーカイブ拡張子は全て xxx.7z.001 形式になりますが、これらも正常な 7-Zipファイルです。

:: ※ バックアップ中にソースフォルダのファイルを編集するとエラーが発生する可能性が高まりますが、
:: 同梱されているChaL-VSSDetectorを使えば処理中でもエラー無くファイルを編集できるモードでアーカイブ可能です。
:: 詳細は "README-ChaL-VSSDetector_Guide.txt" をご確認ください。

:: ***************************************************************************
::       実行前　編集項目
:: ***************************************************************************
:: －－－－－－－－－－－－－－－－－－－－－－－－－－－－
:: 【必ず確認・編集項目】 変数グループＡ 
:: －－－－－－－－－－－－－－－－－－－－－－－－－－－－

:: (A-1)　7-Zipのインストール
:: インストールされていない場合は、
:: https://www.7-zip.org/　からインストールしてください。
:: インストール先はデフォルト値から変更しない事を推奨します。

:: －－－－－－－－－－－－－－－－－－－－－－－－－－－－

:: (A-2)　7-Zip の変数設定
:: 7-Zip インストールフォルダが下記２つの set で始まる行に無い場合、
:: 例えば C:\My_Programs\7-Zip\ の場合は、set の一行目の、
:: "PATH=%PATH%;C:\Program Files\7-Zip"を、
:: "PATH=%PATH%;C:\My_Programs\7-Zip\" に書き換えて下さい。

:: ▼▼ ここを編集　▼▼
  set "PATH=%PATH%;C:\Program Files\7-Zip"
  set "PATH=%PATH%;C:\Program Files (x86)\7-Zip"
::
:: ※7-Zipインストールフォルダの確認方法はスクリプト末参照
:: －－－－－－－－－－－－－－－－－－－－－－－－－－－－

:: (A-3) 出力アーカイブファイル名 (半角英数)
:: 『ChaL-PreFAS_Sample_Fi…』部分をお好きな名前に編集下さい。

:: ▼▼ ここを編集　▼▼
  set A_NAME="ChaL-PreFAS-Backup_Sample_File"
::
:: －－－－－－－－－－－－－－－－－－－－－－－－－－－－

:: (A-4) アーカイブするソースフォルダ (半角英数)
:: 下記の『ChaL-PreFAS_Sample_SOURCE_Fo…』部分を編集下さい
::
:: ▼▼ ここを編集　▼▼
  set SOURCE_FOLDER="SAMPLE-SOURCE-Folder-PreFAS-Backup"
::
:: 【注意】原則フルパス（例："D:\FOL-1\FOL-2"）で指定ください。
::
:: －－－－－－－－－－－－－－－－－－－－－－－－－－－－
:: (A-5) アーカイブファイル出力フォルダ (半角英数)
:: 下記の 『ChaL-PreFAS_Sample_OUTPUT_Fo…』部分を編集下さい
::
:: ▼▼ ここを編集　▼▼
  set OUTPUT_FOLDER="PreFAS-Backup-OUTPUT-Folder-SAMPLE"
::
:: 【注意】 ".\"（カレントフォルダ） "..\" （親フォルダ） の指定では
:: エラーが出る事がわかっています。
:: 何時間もアーカイブに時間がかかり最後にエラーが出ると困りますので、
:: 原則フルパス（例："D:\FOL-1\FOL-2"）で指定ください。
:: やり直しが容易な場合は、".\" "..\" の代わりに、"." ".."など
:: 相対パスを試していただいても構いません。
:: 
:: －－－－－－－－－－－－－－－－－－－－－－－－－－－－
:: (A-6) 除外ファイル、除外フォルダ 
:: 設定に合致するファイル、フォルダはバックアップされません。
:: 設定値行の末尾に ^ を挿入すれば次の改行に続ける事ができます。
:: 【サンプル】
:: 『拡張子 tmp ファイルを全て除外、フォルダ folder_1 を除外』
:: set EXCLUDE= -xr!"*.tmp" -xr!"folder_1"
::
:: ▼▼ ここを編集　▼▼
set EXCLUDE=
:: 
:: 書式見本（set EXCLUDE=-xr!"*.tmp" -xr!"*.temp"）。編集するのはこの上の行です。
:: 設定の一行が長くなったら、行末に ^ をつければ次の行に折り返せます。

:: －－－－－－－－－－－－－－－－－－－－－－－－－－－－
:: 【必要に応じて修正】 変数グループＢ 
:: －－－－－－－－－－－－－－－－－－－－－－－－－－－－
:: (B-1) アーカイブ分割サイズ。（デフォルト値：24337262k）

:: ▼▼ ここを必要に応じて編集　▼▼
  set VOLUME_SIZE=24337262k

:: ※ 上記は100GB Blu-ray Disc、M-Disc に４ファイル保存でき、370MB余るサイズ。
:: －－－－－－－－－－－－－－－－－－－－－－－－－－－－
:: 【高度な設定・基本的に変更不要】　変数グループＣ
:: －－－－－－－－－－－－－－－－－－－－－－－－－－－－
:: (C-1) 最大スレッド数（デフォルト値："-mmt=6"）
::
:: ＜＜ 圧縮時 ＞＞

:: ▼▼ 問題がある場合のみここを編集　▼▼
  set THREAD_COUNT="-mmt=6"

:: ＜＜ ベリファイ時 ＞＞

:: ▼▼ 問題がある場合のみここを編集　▼▼
  set VERIFY_THREAD_COUNT="-mmt=6"
::
:: －－－－－－－－－－－－－－－－－－－－－－－－－－－－
:: (C-2) 圧縮レベル（デフォルト値："-mx=7"）

:: 状況に応じて、編集してください。
:: ▼▼▼
  set COMPRESSION_LEVEL="-mx=7"
::
:: ＜注意＞
:: 圧縮レベルを上げると、PCの負荷も上がります。



:: ***************************************************************************
::       スクリプト（動かなくなる可能性あるので不用意に変更しないで下さい）
:: ***************************************************************************
::
setlocal
chcp 932 > nul
pushd %~dp0
color 3F

:: －－－－－－－－－－－－－－－－－－－－－－－－－－－－
:: 7-Zipとフォルダ存在チェック
where 7z.exe >nul 2>&1 && goto CHECK_FOLDERS
color C0
echo.
echo ----------------------------------------------------------
echo 　　＋＋ 7-Zipが見つかりません。＋＋
echo 　　＋＋ 7-Zip not found. ＋＋
echo.
echo 　　ChaL-PreFAS-Backup-SUB.bat 内の【設定必須】 変数グループＡ の、
echo 　　『(A-1) 7-Zipプログラム利用準備』の項目を再確認して下さい。
echo.
echo 　　原因として
echo 　　　● 7-Zipがインストールされていない
echo 　　　● 7-Zip のインストールパスが、ChaL-PreFAS-Backup-SUB.bat内に正しく設定されていない
echo 　　などが考えられます。
echo ----------------------------------------------------------
echo.
pause
exit 1

:CHECK_FOLDERS
if exist "%SOURCE_FOLDER%" goto CHECK_OUTPUT
color C0
echo.
echo ----------------------------------------------------------
echo 　　＋＋ ソースフォルダ（%SOURCE_FOLDER%）が見つかりません。＋＋
echo 　　＋＋ Source folder (%SOURCE_FOLDER%) not found. ＋＋
echo.
echo 　　ChaL-PreFAS-Backup-SUB.bat 内の【設定必須】 変数グループＡ の、
echo 　　『(A-3) アーカイブする対象ソースフォルダ (半角英数)』の項目を再確認して下さい。
echo.
echo 　　原因として
echo 　　　● ソースフォルダを設定していない
echo 　　　● ソースフォルダ名が、半角英数のみになっていない
echo 　　などが考えられます。
echo ----------------------------------------------------------
echo.
pause
exit 1

:CHECK_OUTPUT
if exist "%OUTPUT_FOLDER%" goto CONTINUE
color C0
echo.
echo ----------------------------------------------------------
echo 　　＋＋ 出力フォルダ（%OUTPUT_FOLDER%）が見つかりません。＋＋
echo 　　＋＋ Output folder (%OUTPUT_FOLDER%) not found. ＋＋
echo.
echo 　　ChaL-PreFAS-Backup-SUB.bat 内の【設定必須】 変数グループＡ の、
echo 　　『 (A-4) 7zip アーカイブ出力フォルダ (半角英数)』の項目を再確認して下さい。
echo.
echo 　　原因として
echo 　　　● アーカイブ出力フォルダを設定していない
echo 　　　● アーカイブ出力フォルダ名が、半角英数のみになっていない
echo 　　などが考えられます。
echo.
echo 　　※注意「アーカイブ」≒「圧縮ファイル」の意味です。
echo ----------------------------------------------------------
echo.
pause
exit 1

:CONTINUE


:: －－－－－－－－－－－－－－－－－－－－－－－－－－－－

:: 現在の日付と時刻を取得 (yy-mmdd-hhmm 形式)
set DATE_TIME=%date:~2,2%-%date:~5,2%%date:~8,2%-%time:~0,2%%time:~3,2%%time:~6,2%
set DATE_TIME=%DATE_TIME: =0%

:: 出力ファイルとログファイル（日付付加）
set OUTPUT_FILE=%OUTPUT_FOLDER%\%A_NAME%_%DATE_TIME%.7z
set LOG_FILE=%OUTPUT_FOLDER%\Results_PreFAS_%DATE_TIME%.log
set COMPRESS_LOG_FILE=%OUTPUT_FOLDER%\Results_PreFAS_ERROR_%DATE_TIME%.log

echo.
echo OUTPUT_FILE=%OUTPUT_FILE% >> "%LOG_FILE%"
echo OUTPUT_FILE=%OUTPUT_FILE%
echo.

echo.
echo パスワード入力時の注意:
echo.
echo ● 使用可能な文字: 半角英数字 (ａ－ｚ, Ａ－Ｚ, ０－９) と
echo 半角記号 (～！＠＃＄％＾＆＊（）－＿＝＋［｛］｝＼｜；：’ ”／？．＞，＜ など、スペース含む)
echo.
echo ● 長期保管を目的としていますのでアーカイブが完成しましたら、7-Zip標準のGUIツール
echo 7-Zip File Managerでアーカイブを開き、適切なパスワードを入力し、内容を閲覧できるか
echo パスワードの確認をお願いします。
echo ※注意「アーカイブ」≒「圧縮ファイル」
echo.
echo ● 参考: 強力な設定＝20～30桁のランダムな組み合わせ
echo.
echo ▼▼▼ 注意 ▼▼▼　
echo ＜＜  Ctrl+v は使用できません！ ＞＞
echo.
echo  適切なペースト１: コンソール画面上で右クリック → 貼り付け
echo  適切なペースト２: ウィンドウタイトルバー右クリック → 編集 → 貼り付け
echo.

:: 記号を含むパスワードは本スクリプトで自動的に適切に処理されます。

:: パスワード入力 (PowerShellで非表示)
set "pscmd=powershell.exe -Command "$inputPass = read-host 'パスワードを入力:' -AsSecureString; $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($inputPass); [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "tokens=*" %%a in ('%pscmd%') do set PASSWORD1=%%a
if not defined PASSWORD1 (
    echo PowerShellを使用できません。環境を確認してください。
    pause
    exit 1
)

set "pscmd=powershell.exe -Command "$inputPass = read-host 'パスワードを再入力:' -AsSecureString; $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($inputPass); [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "tokens=*" %%a in ('%pscmd%') do set PASSWORD2=%%a
if not defined PASSWORD2 (
    echo PowerShellを使用できません。環境を確認してください。
    pause
    exit 1
)

:: パスワード確認
if "%PASSWORD1%"=="%PASSWORD2%" (
    echo パスワードが一致しました。
) else (
    echo パスワードが一致しません。終了します...
    pause
    exit 1
)

cls

echo.
echo.
echo    +++ PreFAS - Precious Files Archive Script +++
echo.
echo    7-Zip がフォルダーを圧縮中です…
echo.

echo 【説明】もし失敗した場合はこうなります…
echo (1) 背景画面が水色で無い   (2) Everything is Okメッセージが表示されない
echo いずれかの場合、処理は失敗しています
echo 7zip 出力フォルダ内の "Results_PreFAS_ERROR_xx-xxxx-xxxx.log"
echo というログ・ファイルの内容を確認してください。
echo 処理成功の場合このファイルは空ファイル(ファイルサイズ＝０）になります。
echo.
echo 【説明】成功した場合はこうなります…
echo  (1) 背景画面が水色   (2) Everything is Okメッセージが表示
echo.
echo 【重要】 成功したら作成された、拡張子 7z.001 ファイルを 必ず一度、7-Zip File Managerで
echo　パスワードを入力して開き、認識しているパスワードが有効か確認して下さい。
echo　操作ミスがあると開けない事があります。
echo.
echo + + + + + + + + + + + + + + + + + + + + + + + + + 
echo 『続行するには何かキーを押してください . . .』
echo  のメッセージが出て処理が停止するまでお待ちください ...
echo + + + + + + + + + + + + + + + + + + + + + + + + + 
echo.

:: ログファイルに開始時刻を記録
echo 7-Zip process started at %date% %time% >> "%LOG_FILE%"

:: 7-Zip実行（進捗とエラーを画面表示、ログにコマンド記録）
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

:: エラーメッセージを画面から抽出（リアルタイム表示済みのためログに記録）
echo Screen output completed. Check screen for errors/warnings. >> "%LOG_FILE%"

:: エラーログのサイズチェックとメッセージ表示
for %%F in ("%COMPRESS_LOG_FILE%") do set SIZE=%%~zF
if not defined SIZE set SIZE=0
if %SIZE% GTR 0 (
    color 60
    echo.
    echo ---------------------------------------------
    echo  今回の実行で
    echo  %COMPRESS_LOG_FILE%
    echo  内にエラー・警告メッセージが記録されました。
    echo  メッセージは下記の通りです
    echo ---------------------------------------------
    echo 内容
    type "%COMPRESS_LOG_FILE%"
    echo.
)

:: 7-Zipベリファイ実行（アーカイブ検証、.001を付加）
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

    :: エラーメッセージをリアルタイムで画面表示
    findstr /i "^ERROR: ^WARNING:" "%LOG_FILE%.temp" && echo Error/Warning messages displayed on screen. >> "%LOG_FILE%"
    :: ログに統合
    type "%LOG_FILE%.temp" >> "%LOG_FILE%"
    :: 遅延追加でタイミング競合回避
    timeout /t 1 > nul
    del "%LOG_FILE%.temp" > nul 2>&1

    :: ベリファイ結果表示（ログ末尾8行をPowerShellで画面に）
    echo.
    echo --- Verification Result ---
    powershell -Command "Get-Content -Path '%LOG_FILE%' -Tail 8 -Encoding UTF8"
    :: Everything is Ok 装飾表示
    powershell -Command "if (Select-String -Path '%LOG_FILE%' -Pattern 'Everything is Ok' -Quiet) { Write-Host ''; Write-Host '=============================='; Write-Host '   Everything is Ok'; Write-Host '=============================='; Write-Host '' }"
    echo.
) else (
    echo No split archive found. Verification skipped. >> "%LOG_FILE%"
    echo No split archive found. Verification skipped.
)

:: ログファイルに終了時刻を記録
echo 7-Zip process ended at %date% %time% >> "%LOG_FILE%"

:: 環境変数クリア
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

:: 成功/失敗に関わらず一時停止
pause

popd

exit 0

:: ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
:: ● 7-Zip インストールフォルダの見つけ方
:: 
:: Windows の「スタートメニュー」で「7-Zip」と検索
:: 「7-Zip File Manager」や「7-Zip」の上で右クリック →「ファイルの場所を開く」
:: 表示された 7-Zip File Managerなどのショートカットをさらに右クリック
:: →「プロパティ」→「リンク先」でパス確認
:: ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝