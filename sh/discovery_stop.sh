PID=${pgrep -f discovery-0.0.1.jar}

echo "Process ID: $PID"

if [ -z $PID ]; then
  echo "No process is running"
else
  echo "Kill process"
  kill -9 $PID
fi