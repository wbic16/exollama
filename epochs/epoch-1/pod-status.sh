#!/bin/sh
RUNNING=`ps -ef |grep -v grep |grep -c sq`
if [ ! -f /etc/exollama.id ]; then
  echo "Error: install first."
  exit 1
fi
POD=`cat /etc/exollama.id`
if [ $RUNNING -eq 0 ]; then
  echo "$POD offline - attempting automatic resume..."
  ./launch-pod.sh
else
  sq select 1.1.1/1.1.1/1.1.1
fi
