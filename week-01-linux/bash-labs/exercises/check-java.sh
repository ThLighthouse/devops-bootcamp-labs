#!/bin/bash


if ! command -v java > /dev/null 2>&1; then
	echo "Java is not found" 
	sudo apt update
	sudo apt install default-jdk -y
	if ! command -v java > /dev/null 2>&1; then
		echo "Java installation failed"
		exit 1
	fi
fi

JAVA_VERSION=$(java -version 2>&1 | head -1 | awk -F'[."]' '{print $2}')

if [ "$JAVA_VERSION" -lt 11 ]; then
	echo "Java is an old version"
	exit 1
else
	echo "Java version is 11 or higher"
	echo "Detected Java version: $JAVA_VERSION"
	exit 0
fi
