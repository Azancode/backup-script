Automated Backup Script with Rclone

This project provides an automated backup solution using tar and rclone.

Features

Creates timestamped backups of specified directories

Compresses files into .tar.gz archives

Uploads backups automatically to Google Drive (via rclone)

Logs backup progress and errors

Requirements

Linux system

tar

rclone

 (configured with Google Drive remote)

Setup

Clone this repository:

git clone https://github.com/your-username/backup-script.git

cd backup-script

Make the script executable:
chmod +x backup.sh

Configure rclone:
rclone config

Add a new remote called gdrive (or update backup.sh to match your chosen name).

Make sure you have a folder backups in your Google Drive.

Now edit the auto-backup-service file and add your file path in it

Reload systemd and Enable:
   sudo systemctl daemon-reload
   sudo systemctl enable auto-backup.timer
   sudo systemctl start auto-backup.timer
   sudo systemctl enable auto-backup.service
   sudo systemctl start auto-backup.service
