#!/bin/bash

FAILED=0


if [ "$#" -eq 0 ]; then
	echo "Usage: ./multi-service-check.sh <service>"
	exit 1
fi

for SERVICE_NAME in "$@"; do
	if systemctl is-active "$SERVICE_NAME"  >/dev/null 2>&1; then
		echo "$SERVICE_NAME: running"
	else 
		echo "$SERVICE_NAME: NOT running"
		FAILED=1
fi	
done

if [ "$FAILED" -eq 1 ]; then
	exit 1
else
	exit 0
fi
