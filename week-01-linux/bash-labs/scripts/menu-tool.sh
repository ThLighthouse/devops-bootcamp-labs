#!/bin/bash

COMMAND="$1"

if [ -z "$COMMAND" ];then
	echo "Press 'help' to see available options"
	exit 1
fi

case "$COMMAND" in 
	help)
		echo "Usage: disk, memory, report"
		exit 0
		;;
	disk)
		DISK_USAGE="$(df -h / | awk 'NR==2 {sub(/%/,"",$5); print $5}')"
		echo "Disk Usage: $DISK_USAGE%"
		exit 0
		;;
	memory)
		MEMORY_USAGE="$(free -m | awk 'NR==2 {print int($3/$2 * 100)}')"
		echo "Memory Usage: $MEMORY_USAGE%"
		exit 0
		;;
	report)
		SYSTEM_HOSTNAME="$(hostname)"
		SYSTEM_USER="$(whoami)"
		SYSTEM_DATE="$(date)"

		printf "System report:\n"
		printf "Hostname: %s\n" "$SYSTEM_HOSTNAME"
		printf "User: %s\n" "$SYSTEM_USER"
		printf "Date: %s\n" "$SYSTEM_DATE"
		exit 0
		;;
	*)
		echo "Unknown command: $COMMAND"
		exit 1
		;;
esac
