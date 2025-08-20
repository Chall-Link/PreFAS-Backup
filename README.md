# PreFAS Backup Ver.1.0.1


![prefas-backup-hero-banner](./docs/images/prefas-backup-hero-banner.png)


### 🔐 Precious Files Archive Script
### 🔐 貴重ファイル暗号化アーカイブスクリプト

**🌍 English-Japanese** (英語 - 日本語) **README**

- If you would like to view the Japanese version, please jump to ▶ <a href="#Japanese-Version">here</a>.  
This README is structured with the English version followed by the Japanese version. 

- **日本語版をご覧になる場合は ▶<a href="#Japanese-Version">こちら</a>からから該当部分にジャンプしてください。**  
  本READMEは英語版の文章に続けて日本語版のREADMEの文章を組み合わせた構成になっています。

---

## English Version

### Table of Contents

- [Overview: Revolutionary Features](#overview-revolutionary-features)
- [Please Read First](#please-read-first)
- [File Structure](#file-structure)
- [Ideas for Preventing Loss of Important Files from Disasters](#ideas-for-preventing-loss-of-important-files-from-disasters)
- [PreFAS Backup Features / Advantages Over Other Software](#prefas-backup-features--advantages-over-other-software)
- [System Requirements](#system-requirements)
- [Please Read Before Use](#please-read-before-use)
- [PreFAS Backup Usage Scenarios](#prefas-backup-usage-scenarios-for-large-capacity-drive-and-folder-encrypted-backup)
- [How to Use](#how-to-use)
- [Error Handling](#error-handling)
- [Copyright and Disclaimer](#copyright-and-disclaimer)

=================================================  

# Chall-Link "PreFAS Backup" - Precious Files Archive Script 
## English Version Ver.1.0.1 
## VSS-Compatible Precious Files Encrypted Archive Script

`A tool developed with the concept of protecting valuable files from disasters by converting large-capacity drives and folders into portable archives with 7-Zip AES-256 encryption for storage on cloud services or M-Disc (100-year durable optical discs)`

**Copyright:** Chall-Link  
**Development:** Developed in Japan  
**License:** MIT License  
**Type:** Free Software (Open Source)  

=================================================  
💡 This document uses "archive," "backup," and "compression" with similar meanings  
💡 "Snapshot" is also referred to as "shadow copy"  

&emsp; 

---
## Overview: Revolutionary Features

### Overview
This script enables the safe long-term storage of TB (terabyte) scale drives and folders by compressing them with 7-Zip using powerful AES256 encryption into compressed files.
Additionally, using the sister software Chall-Link "VSSDetector," backups utilizing Windows VSS restore points (snapshots) become possible, allowing continued work in the original folder during backup processing.

### Issues This Script Solves
Precious files such as memory photos, program files, blueprints, artwork, and ideas stored only on home or office PCs face the risk of instant loss from unexpected disasters (fires, floods, hardware failures, theft, etc.).
With growing awareness of disaster preparedness, storing important files in only one location is completely defenseless from a long-term safe storage perspective.

&emsp; 

---
## Please Read First

When running this script for the first time, Windows security features may display warning messages. This is a standard confirmation that Windows performs for new files downloaded from the internet, and it does not mean the script has been determined to be dangerous. Please be assured that such warnings may appear during initial execution of any safe file.

**About Script Safety**
This program is an open-source script in text format, and anyone can verify its contents.
It has been confirmed safe by ESET security software and internet virus detection services (using 61 virus detection engines) as of July 30, 2025.

After reviewing the warning content and confirming the script's safety, please follow the steps below to execute:

**Execution Steps After Warning Confirmation**

**Case 1**: When "Windows protected your PC" is displayed

1. Click "More info" in the warning screen.
2. Then click the "Run anyway" button.

*Once you execute using these steps, this warning screen will not appear again.

**Case 2**: When "Publisher could not be verified. Do you want to run this software?" is displayed

1. Uncheck "Always ask before opening this file" (W).
2. Click the "Run" button.

*If the Run button does not respond immediately, please wait a moment and click again.

&emsp; 

---
## File Structure
PreFAS-Backup/  
├── ChaL-PreFAS-Backup-MAIN-en.bat&nbsp;&nbsp;# English version - Main script  
├── ChaL-PreFAS-Backup-MAIN.bat&nbsp;&nbsp;# Japanese version - Main script  
├── ChaL-PreFAS-Backup-SUB-en.bat&nbsp;&nbsp;# English version - Sub script  
├── ChaL-PreFAS-Backup-SUB.bat&nbsp;&nbsp;# Japanese version - Sub script  
├── README.md&nbsp;&nbsp;# English-Japanese Integrated Documentation  
├── docs/  
│&nbsp;&nbsp;&nbsp;&nbsp;├── pdf/  
│&nbsp;&nbsp;&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;└── README.pdf&nbsp;&nbsp;# Japanese version - Documentation PDF  
│&nbsp;&nbsp;&nbsp;&nbsp;└── images/  
│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└── prefas-backup-hero-banner.png  
├── PreFAS-Backup-OUTPUT-Folder-SAMPLE/&nbsp;&nbsp;# Sample output folder (default setting)  
└── SAMPLE-SOURCE-Folder-PreFAS-Backup/&nbsp;&nbsp;# Sample source folder (approx. 2MB) (default setting)  

&nbsp;

> ### 🚀 Try it now!
>
> To test the script immediately with default settings, run `ChaL-PreFAS-Backup-MAIN-en.bat` as administrator and enter the password.
> This will create archive files from `SAMPLE-SOURCE-Folder-PreFAS-Backup` to `PreFAS-Backup-OUTPUT-Folder-SAMPLE`. Please use this for operation testing and other purposes.

> Files with `.md` extension are Markdown files. They are automatically displayed in a readable format on GitHub.  
> If they are difficult to read locally, please use the PDF files in `docs/pdf/`.

&emsp; 

---
## Ideas for Preventing Loss of Important Files from Disasters

### Developed File Long-term Safety Protection Concept

- **Target**: Large-capacity TB (terabyte) scale drives and folders containing important files  
- **Method**: Archiving with PreFAS Backup under the following conditions  
  - 25GB splitting
  - AES-256 encryption
  - **Operations** (PreFAS Backup Core Concept)  
    - **Proposal 1**: Remote physical storage on optical discs (M-Disc: 100-year durability (recommended) / Standard DVD/BD: within 20 years)
    - **Proposal 2**: Online storage on cloud storage services

 ### Effects of This Concept
- **Significant reduction in file loss risk**: Remote distributed storage can significantly reduce file loss risk from disasters
- **Information leak security**: AES-256 encrypted archives with 20-30 digit random alphanumeric symbol password combinations are virtually impossible to decrypt with current technology. File content leak risk is extremely low unless passwords are compromised.

`This is the core concept of Chall-Link "PreFAS Backup" and the solution PreFAS Backup provides.`  

### Chall-Link "PreFAS Backup"
Chall-Link "PreFAS Backup" is a 7-Zip enhanced script designed to execute this concept optimally.
PreFAS stands for "**Pre**cious **F**iles **A**rchive **S**cript"  
meaning "Precious Files Archive Script."

&emsp; 

---
## PreFAS Backup Features / Advantages Over Other Software
### Features
- Independent archive files: Created files can be freely copied and moved in Explorer as normal files  
- Large-scale capacity support: Fully automated backup of TB (terabyte) scale folders/drives  
- VSS support: When used with sister software Chall-Link "VSSDetector," Windows restore point snapshots can be used as backup sources, enabling continued work in original folders during backup.
- Comfortable PC work environment during processing: By controlling 7-Zip CPU load, comfortable editing work in source folders is achieved even during backup  
- Information leak security: Strong data protection with AES-256 encryption 
- Optimized for optical disc storage: Efficient default split size settings designed for 25GB, 50GB, 100GB optical disc storage (split size set to allow saving main file + bundled files (approx. 300MB) on 25GB optical discs (changeable)) 
- Customizability: Settings written directly in scripts enable repeatable custom backups. Comment memos can also be written in scripts  
- Professional-grade reliability: Error handling system comparable to commercial software
- Advanced archive control: Utilizes detailed control parameters not available in 7-Zip GUI  

### Advantages Over Common Commercial Backup Software

- **High restoration possibility after long-term storage**
    **Commercial software issue**: Risk of version upgrades making past backups unreadable after 5+ years  
    **PreFAS Backup advantage**: Standard 7-Zip format increases restoration possibility even after 10+ years

- **Program stability**  
    **Commercial software issue**: Complex structure may cause unstable operation such as very heavy performance depending on PC environment  
    **PreFAS Backup advantage**: Simple design enables stable operation regardless of PC environment  

- **Freedom of file operations like copy/move**
    **Commercial software issue**: Backup files can only be handled under software management; moving/copying in Explorer may void operation guarantee  
    **PreFAS Backup advantage**: Free copying, moving, cloud storage, and optical disc storage possible as normal files in Explorer

&nbsp;

---
## System Requirements
### System Requirements
- **Download Link**: Please download "Source code (zip)" from https://github.com/Chall-Link/PreFAS-Backup/releases/latest. Please note that downloading via GitHub Raw will result in LF line endings and the script will not work properly.  
- **Character Encoding & Line Endings**: This script is a Japanese-compatible Windows script that requires Shift-JIS encoding and CRLF line endings to function properly.  
- **Required Software**: 7-Zip (LGPL License) required (available from [https://www.7-zip.org/](https://www.7-zip.org/))  
- **Windows 10 Pro 64bit**: (Tested), theoretically compatible with Windows 7 SP1+ (untested, use at own risk)  
- **Requirements**: PowerShell 2.0+ (included with Windows), administrator privileges  
- **For using VSS snapshots created by restore points as archive sources**: 
  - PreFAS Backup sister software Chall-Link "VSSDetector"  
    Details: [https://github.com/Chall-Link/VSSDetector#readme](https://github.com/Chall-Link/VSSDetector#readme)  
    Download Page: [https://github.com/Chall-Link/VSSDetector/releases/latest](https://github.com/Chall-Link/VSSDetector/releases/latest)  
- While entire drives can be archived, this script is a data archiving tool, so archiving and restoring system drives (C:) will not function as an OS.

&emsp; 

---
## Please Read Before Use

- PreFAS-Main-en.bat requires administrator privileges to ensure all target files are backed up without omission.
- This script is designed for long-term execution and is controlled to avoid continuous high CPU load, but if you notice PC fans running at higher speeds than usual or other abnormal conditions during use, please consider stopping use immediately.
- Please use only **half-width alphanumeric characters** for compressed file names, target folders, output folders, etc.

&emsp; 

---
## PreFAS Backup Usage Scenarios for Large-capacity Drive and Folder Encrypted Backup
- **Creators**: Work files, completed work files, etc.
- **Developers**: Work-in-progress program files, completed program files, etc.
- **Photographers**: Photo image files, video footage files, etc.
- **Business users**: Contract files, business files, etc.

&emsp; 

---
## How to Use
### Overview
Open PreFAS-Sub-en.bat and set variables for archive source paths, output folder paths, etc., then run PreFAS-Main-en.bat with administrator privileges to automatically execute PreFAS-Sub-en.bat. Running Sub from Main controls script processing priority on Windows to prevent CPU overload by 7-Zip.
### For Normal Backup
1. Open PreFAS-Sub-en.bat and check/edit the [Required] Variable Group A variables. Edit instructions are explained within PreFAS-Sub-en.bat.
   **[Required] Variable Group A**:
   - (A-1) 7-Zip installation path setting
   - (A-2) Archive file name
   - (A-3) Source folder to archive
   - (A-4) 7zip archive output folder
   - (A-5) Exclude files and folders
2. Modify the following variable groups as needed.
   - [Check and modify as needed] Variable Group B
   - [Modify according to situation] Variable Group C
3. Right-click PreFAS-Main-en.bat and run the script from "Run as administrator."
4. Enter the password to set for the compressed file twice.
   (Recommended: 20-30 digit random alphanumeric symbols - virtually unbreakable with current technology)
5. Please wait until compression is complete. The command window background is set to light blue to avoid accidentally closing the working window.

&emsp; 

### Advanced Execution Option: Using VSS Functionality with VSSDetector (Work continuation possible during backup)

> For details, please check Chall-Link "VSSDetector" README-en.md and advanced-backup-guide-en.md.
1. Run "ChaL-VSSDetector.bat" in the ChaL-VSSDetector folder with administrator privileges
2. Select the desired snapshot from the displayed snapshot list. Results are saved in "ChaL-RESULT-VSSDetector.txt"
3. Set the displayed VSS path (example: `\\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\*`) as the "Source folder to archive" in PreFAS-Sub-en.bat
4. Execute steps (3) and beyond from the "Normal Backup" procedure above
**👉 This enables continued work on original files/folders during backup processing!**

&emsp; 

---
## Error Handling

- If errors occur such as background color changing from light blue to yellow or "Everything is Ok" not being displayed, check the error log "Results_PreFAS_ERROR_*.log" in the output folder.
- If 7-Zip is not installed, obtain and install 7-Zip from [https://www.7-zip.org/](https://www.7-zip.org/) and review the [Required] Variable Group A (A-1) content in PreFAS-Sub-en.bat.
- If there are folder setting issues, review the [Required] Variable Group A (A-3)(A-4) settings in PreFAS-Sub-en.bat.

&emsp; 

---
## Copyright and Disclaimer

This software is free software (MIT License). Copyright belongs to Chall-Link. This tool uses 7-Zip (LGPL License). For 7-Zip details, please refer to [https://www.7-zip.org/](https://www.7-zip.org/).

The author assumes no responsibility for any damage or issues arising from the use of this script. When preserving the core logic of the script, redistribution via communication or personal handover is free, but please cite "Chall-Link" as the source. Malicious use or modification is prohibited.

Please submit feedback and comments to the GitHub repository [Issues](https://github.com/Chall-Link/PreFAS-Backup/issues).
Code reviews and improvement suggestions are also welcome.  
However, we do not provide individual support or responses.  

&emsp; 

---
## Tags
disaster-recovery, data-protection, backup, long-term-storage, encryption, large-scale, M-Disc, cloud, VSS

&emsp; 

&nbsp;
&nbsp;

---

<h2 id="Japanese-Version">Japanese Version</h2>

### 日本語バージョン・目次

- [概要：画期的な特徴](#概要画期的な特徴)
- [【最初にご確認ください】](#最初にご確認ください)
- [ファイル構成](#ファイル構成)
- [大切なファイルが災害などで紛失しないようにするアイデア](#大切なファイルが災害などで紛失しないようにするアイデア)
- [PreFAS Backupの特徴／他ソフトに対する優位性](#prefas-backupの特徴他ソフトに対する優位性)
- [動作環境](#動作環境)
- [使用前に必ずお読み下さい](#使用前に必ずお読み下さい)
- [PreFAS Backupによる大容量ドライブ、大容量フォルダ暗号化バックアップの活用シーン](#prefas-backupによる大容量ドライブ大容量フォルダ暗号化バックアップの活用シーン)
- [使い方](#使い方)
- [エラー発生時の対処](#エラー発生時の対処)
- [著作権・免責事項](#著作権免責事項)

=================================================

# Chall-Link「PreFAS Backup」『プリファス バックアップ』 - Precious Files Archive Script

## 日本語版 Ver.1.0.1 
## VSS対応・貴重ファイル暗号化アーカイブスクリプト

`災害から貴重なファイルを守るため、大容量ドライブや大容量フォルダを7-ZipのAES-256暗号化で可搬性のあるアーカイブに変換し、クラウドやM-Disc（100年耐久光ディスク）に保存することをコンセプトに開発されたツールです`

**【著作権者】** Chall-Link（シャルリンク）  
**【開発地】** Developed in Japan  
**【ライセンス】** MIT License  
**【種別】** フリーソフトウェア（オープンソース）  

=================================================  
💡 本ドキュメントでは「アーカイブ」「バックアップ」「圧縮」をほぼ同じ意味として混在使用しています  
💡 「スナップショット」は「シャドーコピー」とも呼ばれます  

&emsp; 

---
## 概要：画期的な特徴

### 概要
TB（テラバイト）規模のドライブやフォルダでも、7-ZipによりAES256で強力に暗号化して圧縮ファイルにし、長期的に安全に保存する事を可能にするスクリプトです。
また、姉妹ソフト Chall-Link「VSSDetector」により、WindowsのVSS 復元ポイント＝スナップショットを活用したバックアップが可能になり、それによりバックアップ処理中でも元フォルダで作業を継続できます。

### 本スクリプトが解決する課題
想い出の写真、プログラムファイル、設計図、芸術作品、アイデアなど、家庭や事務所のPCだけに保存している貴重なファイルは、不意の災害（地震、津波、火災、落雷、盗難など）によって一瞬で失われるリスクがあります。
防災意識が高まる昨今、大切なファイルを一カ所にだけ保存する事は、長期安全保管の観点からは全く無防備と言わざるを得ません。

&emsp; 

---
## 【最初にご確認ください】

このスクリプトを初めて実行する際に、Windowsのセキュリティ機能が警告を表示する場合があります。これは、インターネットからダウンロードされた新しいファイルに対してWindowsが標準的に行う確認であり、スクリプトが危険なものと判断されたわけではありません。どんなに安全なファイルでも、初回実行時にはこのような警告が表示されることがありますのでご安心ください。

**＜本スクリプトの安全性について＞**
本プログラムはテキスト形式のオープンソーススクリプトであり、誰でも内容を確認できます。
セキュリティソフトESETおよびインターネット上のウイルス検知サービス（61種類のウイルス検知エンジンを利用）にて、無害であることが確認済みです（2025年7月30日確認）。

警告内容とスクリプトの安全性をご確認いただいた上で、以下の手順で実行してください。

**＜警告確認後の実行手順＞**

**ケース１**：『WindowsによってPCが保護されました』と表示された場合

1.  警告画面内の「詳細情報」をクリックしてください。
2.  続けて「実行」ボタンをクリックしてください。
※ 一度この手順で実行すると、以降この警告画面は表示されなくなります。

**ケース２**：『発行元を確認できませんでした。このソフトウェアを実行しますか？』と表示された場合

1.  「このファイルを開く前に常に確認する(W)」のチェックを外してください。
2.  「実行」ボタンをクリックしてください。
    ※ 実行ボタンをクリックしても一時的に反応がない場合があります。その際は少し待ってから再度クリックしてください。

&emsp; 

---
## ファイル構成
PreFAS-Backup/  
├── ChaL-PreFAS-Backup-MAIN.bat&emsp;# 日本語版・メインスクリプト  
├── ChaL-PreFAS-Backup-MAIN-en.bat&emsp;# 英語版・メインスクリプト  
├── ChaL-PreFAS-Backup-SUB.bat&emsp;# 日本語版・サブスクリプト  
├── ChaL-PreFAS-Backup-SUB-en.bat&emsp;# 英語版・サブスクリプト  
├── README.md&emsp;# 日本語版・説明書  
├── docs/  
│&emsp;&emsp;├── pdf/  
│&emsp;&emsp;│&emsp;&emsp;└── README.pdf&emsp;# 英語・日本語二カ国語説明書 PDF  
│&emsp;&emsp;└── images/  
│&emsp;&emsp;&emsp;&emsp;└── prefas-backup-hero-banner.png  
├── PreFAS-Backup-OUTPUT-Folder-SAMPLE/&emsp;# サンプル出力フォルダ（デフォルト設定）  
└── SAMPLE-SOURCE-Folder-PreFAS-Backup/&emsp;# サンプルソースフォルダ（約2MB）（デフォルト設定）  

&nbsp;


> ### 🚀 すぐに試せます！
> デフォルト設定でスクリプトをすぐ試せるように、`ChaL-PreFAS-Backup-MAIN.bat`を管理者権限で実行し、パスワード入力すると、
> `SAMPLE-SOURCE-Folder-PreFAS-Backup`を、`PreFAS-Backup-OUTPUT-Folder-SAMPLE` にアーカイブファイルを作成できるようになています。動作チェックなどにご利用にご活用ください。


> 拡張子 `.md` はマークダウンファイルです。GitHub上では自動的に見やすく表示されます。  
> ローカルで読みにくい場合は、`docs/pdf/` の PDF ファイルをご利用ください。

&emsp; 

---
## 大切なファイルが災害などで紛失しないようにするアイデア

### 考案したファイル長期安全保護アイデア

- **対象**: 大切なファイルが含まれるTB（テラバイト）規模の大容量ドライブや大容量フォルダ  
- **手段**: PreFAS Backupによる次の条件でのアーカイブ化  
  - 25GB分割
  - AES-256暗号化
  - **運用** (PreFAS Backup コアコンセプト)  
    - **提案1**: 光ディスクでの遠隔地物理保管（M-Disc: 100年耐久性（推奨）/ 一般的なDVD・BD: 20年以内）
    - **提案2**: クラウドストレージでのオンライン保存

 ### このアイデアの効果
- **ファイル紛失リスクの大幅低減**: 遠隔地への分散保存により災害などによるファイル紛失リスクを大幅に減らす事が可能
- **情報漏洩セキュリティ**: 20～30桁のランダムな英数記号パスワードの組み合わせによるAES-256暗号化アーカイブは現代の技術ではほぼ解読不可能。パスワードを漏洩しない限りファイル内容の漏洩リスクは限りなく低い。

`これが、Chall-Link「PreFAS Backup」のコアコンセプトであり、PreFAS Backupが提供するソリューションです。`  

### Chall-Link「PreFAS Backup」／ シャルリンク「プリファス バックアップ」
Chall-Link「PreFAS Backup」は、このアイデアを最適な形で実行するための7-Zip機能拡張スクリプトです。
PreFASは、「**Pre** cious **F**iles **A**rchive **S**cript」  
すなわち「貴重ファイルのアーカイブスクリプト」から命名されています。

&emsp; 

---
## PreFAS Backupの特徴／他ソフトに対する優位性
### 特徴
- 独立したアーカイブファイル：作成されたファイルは通常ファイルとしてエクスプローラーで自由にコピーや移動が可能  
- 大規模容量対応：TB（テラバイト）規模のフォルダ/ドライブでも全自動でバックアップ  
- VSS対応：姉妹ソフトChall-Link「VSSDetector」と併用すれば、Windows復元ポイントのスナップショットをバックアップソースとする事で、バックアップ中に元フォルダでの作業を継続可能に。
- 処理中の快適なPC作業環境：7-ZipのCPU負荷を制御することで、バックアップ中でもソースフォルダでの編集作業を快適に実行する事を実現  
- 情報漏洩セキュリティ：AES-256暗号化でデータを強力に保護 
- 光ディスク保存に最適化：25GB、50GB、100GBの光ディスクへの保存を想定した効率的なデフォルト分割サイズ設定 (25GBの光ディスクに、本ファイル＋同梱ファイル（約300MB）を保存できるよう分割サイズを設定（変更可）） 
- カスタマイズ性：スクリプトに設定を直接記述し、繰り返し利用可能なカスタムバックアップを実現。スクリプト内にコメントメモを記入する事も可能  
- プロ品質の信頼性：市販ソフト並みのエラーハンドリングシステム
- 高度なアーカイブ制御：7-ZipのGUIでは利用できない詳細な制御パラメータを活用可能  

### 一般的な市販バックアップソフトに対する優位性

- **長期保存後の復元可能性の高さ**
    **市販ソフトの問題**: 例えば5年後にバージョンアップを繰返し、過去のバックアップが開けなくなるリスクがあります  
    **PreFAS Backupの利点**: 標準的な7-Zip形式なので10年後であっても復元できる可能性が高くなります

- **プログラムの安定性**  
    **市販ソフトの問題**: 複雑な構造なのでPC環境によって非常に動作が重いなどの動作が不安定になるリスクがあります  
    **PreFAS Backupの利点**: シンプル設計なので、PC環境によらず快適に安定動作する可能性が高くなります  

- **コピー・移動などのファイル操作の自由度**
    **市販ソフトの問題**: ソフト管理下でしかバックアップファイルを扱えず、エクスプローラーで移動・コピーすると動作保証外の物もあります  
    **PreFAS Backupの利点**: 普通のファイルとして、エクスプローラーで自由にコピー・移動、クラウド、光ディスクへの保存が可能です

&nbsp;

---
## 動作環境
### 動作環境
- **ダウンロードリンク**:  https://github.com/Chall-Link/PreFAS-Backup/releases/latest 掲載の「Source code (zip)」をダウンロードしてください。GitHubのRawダウンロードでダウンロードすると改行コードがLFになり動作しませんのでご注意ください。  
- **文字コード・改行コード**: 本スクリプトは日本語対応のWindowsスクリプトで、Shift-JISエンコーディングとCRLF改行コードでなければ正常に動作しません。  
- **必須ソフト**: 7-Zip（LGPLライセンス）が必要（[https://www.7-zip.org/](https://www.7-zip.org/) から入手）  
- **Windows10 Pro 64bit**: （動作確認済み）、理論上はWindows7 SP1以上で動作可能（未確認のため自己責任でテスト推奨）  
- **必要条件**: PowerShell 2.0以上（Windows標準搭載）、管理者権限  
- **復元ポイントの作成などで作成されるVSSスナップショットをアーカイブソースにする場合** 
  -  PreFAS Backup 姉妹ソフト Chall-Link「VSSDetector」  
    ＜詳細情報＞ [https://github.com/Chall-Link/VSSDetector#readme](https://github.com/Chall-Link/VSSDetector#readme)  
    ＜ダウンロードページ＞ [https://github.com/Chall-Link/VSSDetector/releases/latest](https://github.com/Chall-Link/VSSDetector/releases/latest)  

- ドライブ丸ごとアーカイブ可能ですが、本スクリプトはデータのアーカイブツールのため、システムドライブ（C:）をアーカイブして復元してもOSとしては機能しません。

&emsp; 

---
## 使用前に必ずお読み下さい

- 全ての対象ファイルを残さずバックアップできるように PreFAS-Main.batの実行は管理者権限を必要としています。
- 本スクリプトは長時間の実行を想定しておりCPUに高負荷がかかり続けないよう制御していますが、それでも使用中にPCファンが通常より高速回転し続ける音がするなど、異常と思われる状況を確認しましたら必ず使用の中止を検討して下さい。
- 圧縮ファイル名、対象フォルダ、出力フォルダなど、**全て英数半角のみ使用してください。**

&emsp; 

---
## PreFAS Backupによる大容量ドライブ、大容量フォルダ暗号化バックアップの活用シーン
- **クリエイター**: 作品の作業ファイル、完成作品ファイルなど
- **開発者**: 作業中のプログラムファイル、完成プログラムファイルなど
- **フォトグラファー**: 写真画像ファイル・動画映像ファイルなど
- **事業者**: 契約書ファイル、業務ファイルなど

&emsp; 

---
## 使い方
### 概略
PreFAS-Sub.bat を開き、変数にアーカイブソースのパス、出力先フォルダのパスなどを設定し、
PreFAS-Main.batを管理者権限で実行すると、自動的にPreFAS-Sub.batが実行されます。MainからSubを実行する事で、7-ZipによりCPUが過負荷にならないようWindows上でのスクリプトの処理優先度を制御しています。
### 通常のバックアップの場合
1. PreFAS-Sub.batを開いて、【設定必須】変数グループＡの変数を確認・編集して下さい。編集方法の説明は、PreFAS-Sub.bat内に解説があります。
   **【設定必須】変数グループＡ**:
   - (A-1) 7-Zipインストールパスの設定
   - (A-2) アーカイブファイル名
   - (A-3) アーカイブする対象ソースフォルダ
   - (A-4) 7zipアーカイブ出力フォルダ
   - (A-5) 除外ファイル、除外フォルダ
2. 必要に応じて下記変数グループを修正します。
   - 【確認と必要に応じて修正】変数グループＢ
   - 【状況に応じて修正】変数グループＣ
3. PreFAS-Main.batを右クリックして、「管理者として実行」からスクリプトを実行します。
4. 圧縮ファイルに設定するパスワードを2回入力します。
   （推奨：20～30桁のランダムな英数記号 - 現代技術ではまず破られません）
5. 圧縮が終了するまでお待ちください。作業中のコマンドウィンドウを間違って閉じないよう、ウィンドウ背景を水色にしています。

&emsp; 

### 高度な実行オプション：VSSDetectorを使ってVSS機能を使用する場合（バックアップ中も作業継続可能）

> 詳細は、Chall-Link「VSSDetector」のREADME.md 、advanced-backup-guide.mdをご確認ください。
1. ChaL-VSSDetectorフォルダ内の「ChaL-VSSDetector.bat」を管理者権限で実行
2. 表示されるスナップショット一覧から、使用したいものを選択。結果は「ChaL-RESULT-VSSDetector.txt」に保存されます
3. 表示されたVSSパス（例: `\\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\*`）をPreFAS-Sub.batの「アーカイブする対象ソースフォルダ」に設定
4. 上記「通常のバックアップ」の手順(3)以降を実行
**👉 これで、バックアップ処理中でも元のファイル・フォルダで作業を続けることができます！**

&emsp; 

---
## エラー発生時の対処

- 背景色が水色から黄色に変わったり「Everything is Ok」が表示されないなど、エラーが発生した場合、出力フォルダ内のエラーログ「Results_PreFAS_ERROR_*.log」を確認してください。
- 7-Zipが未インストールの場合は、[https://www.7-zip.org/](https://www.7-zip.org/)から7-Zipを入手しインストールし、PreFAS-Sub.batの【設定必須】変数グループＡの(A-1)の内容を見直してください。
- フォルダ設定に問題があった場合は、PreFAS-Sub.batの【設定必須】変数グループＡの(A-3)(A-4)の設定を見直して下さい。

&emsp; 

---
## 著作権・免責事項

本ソフトウェアはフリーソフトウェア（MITライセンス）です。著作権はChall-Linkに帰属します。本ツールは7-Zip（LGPLライセンス）を使用します。7-Zipの詳細については[https://www.7-zip.org/](https://www.7-zip.org/)をご参照ください。

本スクリプトの使用による損害や障害について、著作者は一切の責任を負いません。スクリプトのコアロジックを保持する場合、通信や個人的な手渡しによる転載・配布は自由ですが、出典として「Chall-Link」を明記してください。悪意ある使用や改変は禁止です。

ご意見・ご感想はGitHubリポジトリの [Issues](https://github.com/Chall-Link/PreFAS-Backup/issues) にてお願いします。
コードレビューや改善提案も歓迎いたします。  
ただし個別サポートや返信は行っておりません。  

&emsp; 

---
## タグ
災害対策, データ保護,  バックアップ, 長期保存, 暗号化, 大容量, M-Disc, クラウド, VSS

&emsp; 


以上
