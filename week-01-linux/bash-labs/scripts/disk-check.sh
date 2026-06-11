#!/bin/bash

DISK_USAGE="$(df -h / | awk 'NR==2 {sub(/%/,"",$5); print $5}')"

if [ "$DISK_USAGE" -ge 80 ]; then
       echo "WARNING! Disk usage is above 80%"
       exit 1
else 
       echo "Disk usage is OK: $DISK_USAGE%"
       exit 0       
fi
