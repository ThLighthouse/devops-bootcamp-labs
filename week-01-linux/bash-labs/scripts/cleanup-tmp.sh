#!/bin/bash


DIR_PATH="$1"
DAYS_COUNT="$2"

if [ -z "$DIR_PATH" ]; then
	echo "Usage: ./cleanup-tmp.sh <directory> <days>"
	exit 1

elif [ -z "$DAYS_COUNT" ]; then
        echo "ERROR: Days value is required"
        exit 1

elif [ ! -e "$DIR_PATH" ]; then
	echo "ERROR: Directory does not exist"
	exit 1

elif [ ! -d "$DIR_PATH" ]; then
	echo "This is not a directory"
	exit 1

else 
	echo "Files to delete" 
	find "$DIR_PATH" -type f -mtime "+$DAYS_COUNT"
fi

if find "$DIR_PATH" -type f -mtime "+$DAYS_COUNT" -delete; then
	echo "Cleanup completed"
	exit 0
else 
	echo "ERROR: Cleanup failed"
	exit 1
fi
