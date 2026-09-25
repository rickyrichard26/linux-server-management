#!/bin/bash

SOURCE="${1:-$HOME}"
DESTINATION="${2:-./backups}"

if [ ! -d "$SOURCE" ]; then
    echo "Error: source directory does not exist."
    exit 1
fi

mkdir -p "$DESTINATION"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$DESTINATION/backup_$TIMESTAMP.tar.gz"

tar -czf "$BACKUP_FILE" -C "$SOURCE" .

if [ $? -eq 0 ]; then
    echo "======================================"
    echo "          Backup Completed"
    echo "======================================"
    echo "Source: $SOURCE"
    echo "Backup: $BACKUP_FILE"
else
    echo "Error: backup failed."
    exit 1
fi
