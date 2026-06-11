#!/bin/bash

FILE_PATH="$1"

if [ "$#" -eq 0 ]; then
	echo "Usage: ./log-error-check.sh <path>"
	exit 1
elif [ ! -e  "$FILE_PATH" ]; then
	echo "ERROR: path does not exist"
	exit 1
elif [ -d "$FILE_PATH" ]; then
	echo "ERROR: this is a directory, file is needed"
        exit 1
elif [ -f "$FILE_PATH" ]; then
	
### if grep -q "pattern" "file"; then
# То есть grep тут работает как проверка: нашёл или не нашёл.
	 
	if  grep -q "ERROR" "$FILE_PATH"; then
	    echo "ERRORS found is $FILE_PATH" 
	    exit 1
    else 
	    echo "No errors found in $FILE_PATH"
	    exit 0
    fi
fi	
