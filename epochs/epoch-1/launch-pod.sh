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
