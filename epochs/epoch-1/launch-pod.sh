#!/bin/sh
if [ ! -f /etc/exollama/pod.id ]; then
  echo "Error: you need to install a pod on this machine first."
  exit 1
fi
EXOLLAMA_ROOT="../.."
if [ -d "/usr/local/exollama" ]; then
  EXOLLAMA_ROOT="/usr/local/exollama"
fi
POD=`$EXOLLAMA_ROOT/pod-name.sh`
if [ ! -f "$POD.phext" ]; then
  echo "Unable to locate $POD."
  exit 1
fi

SQ_STATE=`ps -ef |grep sq |grep -v grep |grep -c $POD`
if [ $SQ_STATE -eq 0 ]; then
  rm -rf .sq
  killall sq
  if [ ! -d .sq ]; then mkdir .sq; fi
  sq $POD.phext >.sq/output 2>.sq/errors &
fi
if [ $SQ_STATE -eq 1 ]; then
  echo "$POD Online"
fi
