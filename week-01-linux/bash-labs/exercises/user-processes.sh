#!/bin/bash



CURRENT_USER=$USER
NUMBER=

echo "Processes for user: $CURRENT_USER"
echo "Sort by CPU or memory? cpu/memory"
read SORT_BY
echo "How many processes to show?"
read PROCESS_COUNT

if [ "$SORT_BY" = "cpu" ]; then
	ps aux | grep "$CURRENT_USER" | sort -k3 -nr | head -n "$PROCESS_COUNT"
elif [ "$SORT_BY" = "memory" ]; then
	ps aux | grep "$CURRENT_USER" | sort -k4 -nr | head -n "$PROCESS_COUNT"
else 
	echo "Invalid option"
fi
