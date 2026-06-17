#!/bin/bash


echo "Network check report:"
echo "Hostname: $(hostname)"
echo "IP address: $(hostname -I | awk '{print $1}')"
echo "Default gateway: $(ip route | awk '/default/ {print $3}')"

if ping -c 3 8.8.8.8 > /dev/null 2>&1; then
	echo "Internet connectivity: OK"
else
	echo "Internet connectivity: FAILED"
fi

if nslookup google.com > /dev/null 2>&1; then
	echo "DNS resolution: OK"
else
	echo "DNS resolution: FAILED"
fi

if curl -Is https://localhost:3000 > /dev/null 2>&1; then
	echo "HTTP check: OK"
else
	echo "HTTP check: FAILED"
fi
