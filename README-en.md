=================================================  

# Chall-Link "PreFAS Backup" - Precious Files Archive Script 
## English Version Ver.1.0.0 
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
## ■File Structure
PreFAS-Backup/  
├── ChaL-PreFAS-Backup-MAIN-en.bat&nbsp;&nbsp;# English version - Main script  
├── ChaL-PreFAS-Backup-MAIN.bat&nbsp;&nbsp;# Japanese version - Main script  
├── ChaL-PreFAS-Backup-SUB-en.bat&nbsp;&nbsp;# English version - Sub script  
├── ChaL-PreFAS-Backup-SUB.bat&nbsp;&nbsp;# Japanese version - Sub script  
├── README-en.md&nbsp;&nbsp;# English version - Documentation  
├── README.md&nbsp;&nbsp;# Japanese version - Documentation  
├── docs/  
│&nbsp;&nbsp;&nbsp;&nbsp;└── pdf/  
│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├── README-en.pdf&nbsp;&nbsp;# English version - Documentation PDF  
│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└── README.pdf&nbsp;&nbsp;# Japanese version - Documentation PDF  
├── PreFAS-Backup-OUTPUT-Folder-SAMPLE/&nbsp;&nbsp;# Sample output folder (default setting)  
└── SAMPLE-SOURCE-Folder-PreFAS-Backup/&nbsp;&nbsp;# Sample source folder (approx. 2MB) (default setting)  

> ### 🚀 Try it now!
> To test the script immediately with default settings, run `ChaL-PreFAS-Backup-MAIN-en.bat` as administrator and enter the password.
> This will create archive files from `SAMPLE-SOURCE-Folder-PreFAS-Backup` to `PreFAS-Backup-OUTPUT-Folder-SAMPLE`. Please use this for operation testing and other purposes.

> Files with `.md` extension are Markdown files. They are automatically displayed in a readable format on GitHub.  
> If they are difficult to read locally, please use the PDF files in `docs/pdf/`.

&emsp; 

---
## ■Overview: Revolutionary Features

### ■Overview
This script enables the safe long-term storage of TB (terabyte) scale drives and folders by compressing them with 7-Zip using powerful AES256 encryption into compressed files.
Additionally, using the sister software Chall-Link "VSSDetector," backups utilizing Windows VSS restore points (snapshots) become possible, allowing continued work in the original folder during backup processing.

### ■Issues This Script Solves
Precious files such as memory photos, program files, blueprints, artwork, and ideas stored only on home or office PCs face the risk of instant loss from unexpected disasters (fires, floods, hardware failures, theft, etc.).
With growing awareness of disaster preparedness, storing important files in only one location is completely defenseless from a long-term safe storage perspective.

&emsp; 

---
## ■Ideas for Preventing Loss of Important Files from Disasters

### ■Developed File Long-term Safety Protection Concept

- **Target**: Large-capacity TB (terabyte) scale drives and folders containing important files  
- **Method**: Archiving with PreFAS Backup under the following conditions  
  - 25GB splitting
  - AES-256 encryption
  - **Operations** (PreFAS Backup Core Concept)  
    - **Proposal 1**: Remote physical storage on optical discs (M-Disc: 100-year durability (recommended) / Standard DVD/BD: within 20 years)
    - **Proposal 2**: Online storage on cloud storage services

 ### ■Effects of This Concept
- **Significant reduction in file loss risk**: Remote distributed storage can significantly reduce file loss risk from disasters
- **Information leak security**: AES-256 encrypted archives with 20-30 digit random alphanumeric symbol password combinations are virtually impossible to decrypt with current technology. File content leak risk is extremely low unless passwords are compromised.

`This is the core concept of Chall-Link "PreFAS Backup" and the solution PreFAS Backup provides.`  

### ■Chall-Link "PreFAS Backup"
Chall-Link "PreFAS Backup" is a 7-Zip enhanced script designed to execute this concept optimally.
PreFAS stands for "**Pre**cious **F**iles **A**rchive **S**cript"  
meaning "Precious Files Archive Script."

&emsp; 

---
## ■PreFAS Backup Features / Advantages Over Other Software
### ■Features
- Independent archive files: Created files can be freely copied and moved in Explorer as normal files  
- Large-scale capacity support: Fully automated backup of TB (terabyte) scale folders/drives  
- VSS support: When used with sister software Chall-Link "VSSDetector," Windows restore point snapshots can be used as backup sources, enabling continued work in original folders during backup.
- Comfortable PC work environment during processing: By controlling 7-Zip CPU load, comfortable editing work in source folders is achieved even during backup  
- Information leak security: Strong data protection with AES-256 encryption 
- Optimized for optical disc storage: Efficient default split size settings designed for 25GB, 50GB, 100GB optical disc storage (split size set to allow saving main file + bundled files (approx. 300MB) on 25GB optical discs (changeable)) 
- Customizability: Settings written directly in scripts enable repeatable custom backups. Comment memos can also be written in scripts  
- Professional-grade reliability: Error handling system comparable to commercial software
- Advanced archive control: Utilizes detailed control parameters not available in 7-Zip GUI  

### ■Advantages Over Common Commercial Backup Software

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
## ■System Requirements
### ■System Requirements
- **Download Link**: Please download "Source code (zip)" from [PreFAS Backup-GitHub Release](https://github.com/Chall-Link/PreFAS-Backup/releases). Downloading via GitHub Raw will result in LF line endings and the script will not work properly.  
- **Character Encoding & Line Endings**: This script is a Japanese-compatible Windows script that requires Shift-JIS encoding and CRLF line endings to function properly.  
- **Required Software**: 7-Zip (LGPL License) required (available from [https://www.7-zip.org/](https://www.7-zip.org/))  
- **Windows 10 Pro 64bit**: (Tested), theoretically compatible with Windows 7 SP1+ (untested, use at own risk)  
- **Requirements**: PowerShell 2.0+ (included with Windows), administrator privileges  
- **For using VSS snapshots as archive sources**: Chall-Link "VSSDetector" (available from [VSSDetector-GitHub Release](https://github.com/Chall-Link/VSSDetector/releases))
- While entire drives can be archived, this script is a data archiving tool, so archiving and restoring system drives (C:) will not function as an OS.

&emsp; 

### ■If "Windows protected your PC" appears when using the script
Windows Defender SmartScreen may display a warning when first using the software. This is a standard warning for unsigned new software.

**Safety Information:**
- ESET virus scan verified (locally confirmed)
- Completely open source (content verifiable)

**How to run:** Click "More info" → "Run anyway" on the warning screen

&emsp; 

---
## ■Please Read Before Use

- PreFAS-Main-en.bat requires administrator privileges to ensure all target files are backed up without omission.
- This script is designed for long-term execution and is controlled to avoid continuous high CPU load, but if you notice PC fans running at higher speeds than usual or other abnormal conditions during use, please consider stopping use immediately.
- Please use only **half-width alphanumeric characters** for compressed file names, target folders, output folders, etc.

&emsp; 

---
## ■PreFAS Backup Usage Scenarios for Large-capacity Drive and Folder Encrypted Backup
- **Creators**: Work files, completed work files, etc.
- **Developers**: Work-in-progress program files, completed program files, etc.
- **Photographers**: Photo image files, video footage files, etc.
- **Business users**: Contract files, business files, etc.

&emsp; 

---
## ■How to Use
### ■Overview
Open PreFAS-Sub-en.bat and set variables for archive source paths, output folder paths, etc., then run PreFAS-Main-en.bat with administrator privileges to automatically execute PreFAS-Sub-en.bat. Running Sub from Main controls script processing priority on Windows to prevent CPU overload by 7-Zip.
### ■For Normal Backup
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

### ■Advanced Execution Option: Using VSS Functionality with VSSDetector (Work continuation possible during backup)

> For details, please check Chall-Link "VSSDetector" README-en.md and advanced-backup-guide-en.md.
1. Run "ChaL-VSSDetector.bat" in the ChaL-VSSDetector folder with administrator privileges
2. Select the desired snapshot from the displayed snapshot list. Results are saved in "ChaL-RESULT-VSSDetector.txt"
3. Set the displayed VSS path (example: `\\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\*`) as the "Source folder to archive" in PreFAS-Sub-en.bat
4. Execute steps (3) and beyond from the "Normal Backup" procedure above
**👉 This enables continued work on original files/folders during backup processing!**

&emsp; 

---
## ■Error Handling

- If errors occur such as background color changing from light blue to yellow or "Everything is Ok" not being displayed, check the error log "Results_PreFAS_ERROR_*.log" in the output folder.
- If 7-Zip is not installed, obtain and install 7-Zip from [https://www.7-zip.org/](https://www.7-zip.org/) and review the [Required] Variable Group A (A-1) content in PreFAS-Sub-en.bat.
- If there are folder setting issues, review the [Required] Variable Group A (A-3)(A-4) settings in PreFAS-Sub-en.bat.

&emsp; 

---
## ■Copyright and Disclaimer

This software is free software (MIT License). Copyright belongs to Chall-Link. This tool uses 7-Zip (LGPL License). For 7-Zip details, please refer to [https://www.7-zip.org/](https://www.7-zip.org/).

The author assumes no responsibility for any damage or issues arising from the use of this script. When preserving the core logic of the script, redistribution via communication or personal handover is free, but please cite "Chall-Link" as the source. Malicious use or modification is prohibited.

Please submit feedback and comments to the GitHub repository [Issues](https://github.com/Chall-Link/PreFAS-Backup/issues).
Code reviews and improvement suggestions are also welcome.  
However, we do not provide individual support or responses.  

&emsp; 

---
## ■Tags
backup, disaster-recovery, data-protection, encryption, 7zip, archive, file-security, cloud-storage, M-Disc, VSS, volume-shadow-copy  
[Tags: backup, disaster-recovery, data-protection, encryption, 7zip, archive, file-security, cloud-storage, M-Disc, VSS, volume-shadow-copy]

&emsp; 

End
