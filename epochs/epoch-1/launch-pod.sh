#!/bin/sh
if [ ! -f /etc/exollama.id ]; then
  echo "Error: you need to install a pod on this machine first."
  exit 1
fi
POD=`cat /etc/exollama.id`
if [ ! -f "$POD.phext" ]; then
  echo "Unable to locate $POD."
  exit 1
fi

SQ_STATE=0
HOSTING=`ps -ef |grep sq |grep -v grep |grep -c $POD`
if [ $HOSTING -eq 1 ]; then SQ_STATE=1; fi

if [ $SQ_STATE -ne 1 ]; then
  sq $POD.phext &
fi

echo "$POD Online"
