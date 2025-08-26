
# Automated Backup Script

This project provides a simple **automated backup solution** using `tar`, `rclone`, and `systemd`.  
It creates compressed backups of your files and optionally uploads them to Google Drive.

---

## Features
- 📦 Compresses files into a `.tar.gz` archive  
- 📁 Stores backups locally under `/var/backups/auto-backup/`  
- ☁️ Supports **cloud upload** via `rclone` (Google Drive, etc.)  
- ⚡ Fully automated using **systemd timers**  

---

## Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/auto-backup.git
   cd auto-backup
2. Configure rclone (Google Drive):
   rclone config
   Add a remote named gdrive (or update backup.sh to your remote name).
   Ensure a folder named backups exists in Google Drive.
3. Make the script executable:
   chmod +x backup.sh
4. Move the script to /usr/local/bin/:
   sudo cp backup.sh /usr/local/bin/backup.sh
5. Setup (Systemd Service & Timer)
   sudo cp auto-backup.service /etc/systemd/system/
   sudo cp auto-backup.timer /etc/systemd/system/
6. Reload systemd:
   sudo systemctl daemon-reload
7. Enable and start the timer and service:
   sudo systemctl daemon-reload
   sudo systemctl enable --now auto-backup.timer
   sudo systemctl enable --now auto-backup.service
