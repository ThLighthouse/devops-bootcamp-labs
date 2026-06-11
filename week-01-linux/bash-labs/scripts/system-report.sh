#!/bin/bash


HOSTNAME_VALUE=$(hostname)
CURRENT_USER=$(whoami)
CURRENT_DATE=$(date)
IP_ADDRESS=$(hostname -I)
KERNEL_VERSION=$(uname -r)
DISK_USAGE="$(df -h / | awk 'NR==2 {sub(/%/,"",$5); print $5}')"
MEMORY_USAGE="$(free -m | awk 'NR==2 {print int($3/$2 * 100)}')"

echo "======= System Report ======="


echo "Hostname: $HOSTNAME_VALUE"
echo "Username: $CURRENT_USER"
echo "Today: $CURRENT_DATE"
echo "IP Address: $IP_ADDRESS"
echo "Kernel Version: $KERNEL_VERSION"
echo "Disk Usage: $DISK_USAGE"
echo "Memory Usage: $MEMORY_USAGE"


echo "==============================="

exit 0
