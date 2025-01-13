#!/bin/sh
RUNNING=`ps -ef |grep -v grep |grep -c sq`
if [ ! -f /etc/exollama/pod.id ]; then
  echo "Error: install first."
  exit 1
fi
EXOLLAMA_ROOT="../.."
if [ -f "/usr/local/exollama" ]; then
  EXOLLAMA_ROOT="/usr/local/exollama"
fi
POD=`$EXOLLAMA_ROOT/pod-name.sh`
if [ $RUNNING -eq 0 ]; then
  echo "$POD offline - attempting automatic resume..."
  ./launch-pod.sh
else
  sq select 1.1.1/1.1.1/1.1.1
fi
