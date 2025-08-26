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
rclone (configured with Google Drive remote) 
Setup 
Clone this repository: bash git clone https://github.com/your-username/backup-script.git cd backup
script 
Make the script executable: bash chmod +x backup.sh 
Configure rclone: bash rclone config 
Add a new remote called gdrive (or update backup.sh to match your chosen name).
Make sure you have a folder backups in your Google Drive.
Edit the auto-backup.service file and update the file path.
Reload systemd and enable the service and timer: bash sudo systemctl daemon-reload sudo systemctl enable
auto-backup.timer sudo systemctl start auto-backup.timer sudo systemctl enable auto
backup.service sudo systemctl start auto-backup.service
