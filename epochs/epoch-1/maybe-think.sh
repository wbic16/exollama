#!/bin/sh
ID=$1
ROUND=0
if [ -f round ]; then ROUND=`cat round`; fi
if [ -z $ID ]; then ID=1; fi
COORDINATE=`./coordinate.sh $ID`
NAME=`./agent-name.sh $ID`
HAVE_ENTRY=`git log --oneline |grep "$NAME" |grep -c "Round $ROUND"`
if [ $HAVE_ENTRY -eq 0 ]; then
  ./think.sh $ID
  exit 0
fi
exit 1
