#!/bin/bash


MEMORY_USAGE="$(free -m | awk 'NR==2 {print int($3/$2 * 100)}')"
THRESHOLD=80

if [ "$MEMORY_USAGE" -ge "$THRESHOLD" ]; then
	echo "WARNING: Memory usage is high: $MEMORY_USAGE% >= $THRESHOLD%"
	exit 1
else 
	echo "Memory usage is OK: $MEMORY_USAGE%"
	exit 0
fi
