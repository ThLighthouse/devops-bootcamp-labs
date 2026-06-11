#!/bin/bash

FILE_PATH="$1"

if [ -z "$FILE_PATH" ]; then
	echo "Usage: ./safe-read.sh <path>"
	exit 1
elif [ ! -e "$FILE_PATH" ]; then
       echo "Error: Path doesn't exist"
       exit 1
elif [ -d "$FILE_PATH" ]; then
       echo "This is a directory, file is needed"
       exit 1
elif [ -f "$FILE_PATH" ]; then
       echo "File found"
       wc -l "$FILE_PATH"
       head -n 5 "$FILE_PATH"
       exit 0
fi
