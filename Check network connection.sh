#!/bin/bash
host="google.com"

# Check network connectivity by pinging a host
if ping -c 1 "$host" &>/dev/null; then
echo "Network is up."
else
echo "Network is down."
fi