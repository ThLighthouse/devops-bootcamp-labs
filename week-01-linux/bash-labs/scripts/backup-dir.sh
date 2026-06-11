#!/bin/bash

DIR_PATH="$1"

if [ -z "$DIR_PATH" ]; then
        echo "Usage: ./backup-dir.sh <directory>"
        exit 1

elif [ ! -e "$DIR_PATH" ]; then
        echo "ERROR: Directory does not exist"
        exit 1

elif [ ! -d "$DIR_PATH" ]; then
        echo "ERROR: This is not a directory"
        exit 1

else
        DIR_NAME="$(basename "$DIR_PATH")"
        BACKUP_DATE="$(date +%F)"
        BACKUP_DIR="backups"
        BACKUP_FILE="$BACKUP_DIR/backup-$DIR_NAME-$BACKUP_DATE.tar.gz"

        mkdir -p "$BACKUP_DIR"

        if tar -czf "$BACKUP_FILE" "$DIR_PATH"; then
                echo "Backup created: $BACKUP_FILE"
                exit 0
        else
                echo "ERROR: Backup failed"
                exit 1
        fi
fi
