#!/bin/bash

# PID=${pgrep -f discovery-0.0.1.jar}
PID=ps -ef | grep "discovery-0.0.1.jar" | grep -v 'grep' | awk '{print $1}'

echo "Process ID: $PID"

if [ -z $PID ]; then
  echo "No process is running"
else
  echo "Kill process"
  kill -9 $PID
fi