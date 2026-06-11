#!/bin/bash


show_help() {
	echo "Usage: ./functions-practice.sh <command>"
	echo "Commands: help, disk, memory, report"
}

check_disk() {
	 DISK_USAGE="$(df -h / | awk 'NR==2 {sub(/%/,"",$5); print $5}')"
	 echo "Disk usage: $DISK_USAGE%"
}

check_memory() {
	MEMORY_USAGE="$(free -m | awk 'NR==2 {print int($3/$2 * 100)}')"
        echo "Memory Usage: $MEMORY_USAGE%"
}


show_report() {
	SYSTEM_HOSTNAME="$(hostname)"
        SYSTEM_USER="$(whoami)"
       	SYSTEM_DATE="$(date)"

	printf "System report:\n"
	printf "Hostname: %s\n" "$SYSTEM_HOSTNAME"
	printf "User: %s\n" "$SYSTEM_USER"
	printf "Date: %s\n" "$SYSTEM_DATE"
}

COMMAND="$1"

if [ -z "$COMMAND" ]; then
	show_help
	exit 1
fi

case "$COMMAND" in 
	help)
		show_help
		exit 0
		;;
	disk)
		check_disk
		exit 0
		;;
	memory)
		check_memory
		exit 0
		;;
	report)
		show_report
		exit 0
		;;
	*)
		echo "Unknown command: $COMMAND"
		show_help
		exit 1
		;;
esac
