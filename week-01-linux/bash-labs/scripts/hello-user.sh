#!/bin/bash

NAME="$1"

if [ -z "$NAME" ]; then
	echo "Usage: ./hello-user.sh <name>"
	exit 1
else
	echo "Hello, $NAME"
	exit 0
fi
