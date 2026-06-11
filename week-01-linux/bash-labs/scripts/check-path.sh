#!/bin/bash


TARGET_PATH="$1"

if [ -z "$TARGET_PATH" ]; then
	echo "Usage: ./check-path.sh <path>"
	exit 1
elif [ -f "$TARGET_PATH" ]; then
	echo "This is a file"
elif [ -d "$TARGET_PATH" ]; then
	echo "This is a directory"
else 
	echo "Path doesn't exist"
	exit 1
fi
