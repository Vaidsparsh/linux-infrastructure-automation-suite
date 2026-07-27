#!/bin/bash
TIMESTAMP=$(date +%F_%T)
BACKUP_FILE="backup_$TIMESTAMP.tar.gz"
SOURCE_DIRS="/etc /home"

echo "[+] Creating backup archive..."
tar -czf /tmp/$BACKUP_FILE $SOURCE_DIRS

echo "[+] Uploading to S3..."
rclone copy /tmp/$BACKUP_FILE s3backup:/my-linux-backups

if [ $? -eq 0 ]; then
    echo "[✔] Backup $BACKUP_FILE uploaded successfully."
else
    echo "[✘] Backup failed."
fi

rm -f /tmp/$BACKUP_FILE

