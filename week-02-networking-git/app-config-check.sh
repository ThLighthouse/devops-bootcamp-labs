#!/bin/bash


if [ -z "$APP_ENV" ]; then
	echo "Variable APP_ENV is not set"
	exit 1
fi

if [ -z "$DB_USER" ]; then
	echo "Variable DB_USER is not set"
	exit 1
fi

if [ -z "$DB_PWD" ]; then
	echo "Variable DB_PWD is not set"
	exit 1
fi

if [ -z "$PORT" ]; then
	echo "Variable PORT is not set"
	exit 1
fi

echo "Application config:"
echo "APP_ENV: $APP_ENV"
echo "DB_USER: $DB_USER"
echo "DB_PWD: *****"
echo "PORT: $PORT"
