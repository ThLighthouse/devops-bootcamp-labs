#!/bin/bash

LOG_DIRECTORY="$1"
echo "Log directory: $LOG_DIRECTORY"
if [ -z "$LOG_DIRECTORY" ]; then
	echo "Usage ./start-node-app.sh <log_directory>"
	exit 1
fi

if [ ! -d "$LOG_DIRECTORY" ]; then
	mkdir -p "$LOG_DIRECTORY"
	echo "Directory created successfully"
else
	echo "Directory already exists"
fi

LOG_DIR_ABSOLUTE=$(realpath "$LOG_DIRECTORY")
echo "Log directory absolute path: $LOG_DIR_ABSOLUTE"

APP_DIR="/opt/myapp"
if [ ! -d "$APP_DIR" ]; then
	sudo mkdir -p "$APP_DIR"
	echo "Application directory created: $APP_DIR"
else 
	echo "Application directory already exists: $APP_DIR"
fi
ls -ld "$APP_DIR"


if ! id myapp > /dev/null 2>&1; then
	sudo useradd myapp
	echo "User added successfully"
else 
	echo "User already exists"
fi

if ! command -v node > /dev/null 2>&1; then
	sudo apt update 
	sudo apt install nodejs npm -y
fi

if ! command -v npm > /dev/null 2>&1; then
	echo "ERROR: npm not installed"
        exit 1
fi

if ! command -v node > /dev/null 2>&1; then
	echo "ERROR: nodejs not installed"
	exit 1
fi

node -v
npm -v

ARTIFACT_URL="https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz"
ARTIFACT_FILE="bootcamp-node-envvars-project-1.0.0.tgz"

curl -O "$ARTIFACT_URL"

if [ ! -f "$ARTIFACT_FILE" ]; then
	echo "ERROR: Artifact download failed"
	exit 1
else
        echo "Artifact downloaded: $ARTIFACT_FILE"
	rm -rf package
	
	if tar -xzf "$ARTIFACT_FILE"; then
		echo "Artifact extracted successfully"
	else 
		echo "ERROR: Artifact extraction failed"
		exit 1
	fi

	if [ -d "package" ]; then
		echo "Directory extracted successfully"
		sudo rm -rf "$APP_DIR"/*
		sudo cp -r package/. "$APP_DIR"/
		sudo chown -R myapp:myapp "$APP_DIR"
		cd "$APP_DIR" || exit 1
		export APP_ENV=dev
		export DB_USER=myuser
		export DB_PWD=mysecret
		if sudo -u myapp env HOME="$APP_DIR" npm install; then
			echo "Dependencies installed successfully"
		else 
			echo "ERROR: npm install failed"
			exit 1
		fi
		export LOG_DIR="$LOG_DIR_ABSOLUTE"
		sudo chown -R myapp:myapp .
                sudo chown -R myapp:myapp "$LOG_DIR_ABSOLUTE"
		sudo -u myapp env APP_ENV="$APP_ENV" DB_USER="$DB_USER" DB_PWD="$DB_PWD" LOG_DIR="$LOG_DIR" node server.js &
		sleep 2
		pgrep -fl "node server.js"
		ss -tulnp | grep node
		pwd
	else 
		echo "Directory is not present"
		exit 1
	fi
fi

