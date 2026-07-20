#!/bin/bash

set -euo pipefail

NEXUS_URL="http://localhost:8081"
NEXUS_REPOSITORY="npm"
PACKAGE_NAME="bootcamp-node-project"
DEPLOY_DIR="$HOME/bootcamp-node-app"
PACKAGE_DIR="$DEPLOY_DIR/package"
APP_PORT="3000"
LOG_FILE="$HOME/bootcamp-node-app.log"
PID_FILE="$HOME/bootcamp-node-app.pid"


NEXUS_USER="${NEXUS_USER:-repos-reader}"
NEXUS_PASS="${NEXUS_PASS:-}"

if [ -z "$NEXUS_PASS" ]; then
	echo "Error: NEXUS_PASS environment variable is not set"
	echo "Usage: export NEXUS_PASS='your password'"
	exit 1
fi

echo "Fetching artifact info from Nexus..."

DOWNLOAD_URL=$(curl -s -u "$NEXUS_USER:$NEXUS_PASS" \
  "$NEXUS_URL/service/rest/v1/components?repository=$NEXUS_REPOSITORY" \
  | jq -r --arg PACKAGE_NAME "$PACKAGE_NAME" \
  '.items[] | select(.name == $PACKAGE_NAME) | .assets[0].downloadUrl' \
  | head -n 1)

if [ -z "$DOWNLOAD_URL" ] || [ "$DOWNLOAD_URL" = "null" ]; then
	echo "Error: download URL not found for package: $PACKAGE_NAME"
	exit 1
fi

echo "Download URL found:"
echo "$DOWNLOAD_URL"

ARTIFACT_FILE=$(basename "$DOWNLOAD_URL")

echo "Downloading artifact: $ARTIFACT_FILE"

curl -fL -u "$NEXUS_USER:$NEXUS_PASS" \
	-o "$ARTIFACT_FILE" \
	"$DOWNLOAD_URL"

echo "Artifact downloaded:"
ls -lh "$ARTIFACT_FILE"

echo "Checking archive content:"
tar -tzf "$ARTIFACT_FILE" | head

echo "Preparing deployment directory: $DEPLOY_DIR"

rm -rf "$DEPLOY_DIR"
mkdir -p "$DEPLOY_DIR"

echo "Extracting artifact..."
tar -xzf "$ARTIFACT_FILE" -C "$DEPLOY_DIR"

echo "Extracted files:"
ls -la "$DEPLOY_DIR"
ls -la "$PACKAGE_DIR"

if [ ! -f "$PACKAGE_DIR/package.json" ]; then
	echo "Error: package.json not found in $PACKAGE_DIR"
	exit 1
fi

echo "Artifact extracted successfully"

echo "Installing npm dependencies..."

cd "$PACKAGE_DIR"
npm install

echo "Dependencies installed successfully"

echo "Stopping old application procces if exists..."

if [ -f "$PID_FILE" ]; then
	OLD_PID=$(cat "$PID_FILE")

	if ps -p "$OLD_PID" > /dev/null 2>&1; then
		echo "Stopping old process with PID: $OLD_PID"
		kill "OLD_PID"
		sleep 2
	else
		echo "Old PID file exists, but process is not running"
	fi

	rm -f "$PID_FILE"
fi

echo "Starting Node.js application..."
cd "$PACKAGE_DIR"

nohup node server.js > "$LOG_FILE" 2>&1 &
APP_PID=$!

echo "$APP_PID" > "$PID_FILE"

echo "Application started with PID: $APP_PID"
echo "Log file: $LOG_FILE"

sleep 3

echo "Checking application process..."

if ! ps -p "$APP_PID" > /dev/null 2>&1; then
	echo "Error: application process is not running"
	echo "Application logs:"
	cat "$LOG_FILE"
	exit 1
fi

echo "Checking application on localhost:$APP_PORT..."

if curl -fsS "http://localhost:$APP_PORT" > /dev/null; then
	echo "Application is running successfully on port $APP_PORT"
else
	echo "Error: application is not responding on port $APP_PORT"
	echo "Application logs:"
	cat "$LOG_FILE"
	exit 1
fi
