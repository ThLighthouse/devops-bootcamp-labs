#!/bin/bash


SERVICE_NAME="$1"

if [ -z "$SERVICE_NAME" ]; then
	echo "Usage: ./service-check.sh <service-name>"
	exit 1
elif systemctl is-active "$SERVICE_NAME" >/dev/null 2>&1; then
	echo "Service $SERVICE_NAME is running"
	exit 0
else 
	echo "Service $SERVICE_NAME is NOT running"
	exit 1
fi
