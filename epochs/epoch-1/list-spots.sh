#!/bin/sh
ACTION=$1
for FILE in `ls -1 *.phext`; do
  COUNT=`cat $FILE |grep -c '\*'`
  COUNT=$((20 - $COUNT))
  LABEL=`echo $FILE |sed 's/\.phext//g'`
  SHOW=1
  if [ "x$ACTION" = "xshow" ]; then SHOW=2; fi

  if [ "x$LABEL" = "xjobs" ]; then SHOW=0; fi
  if [ "x$LABEL" = "xoutput" ]; then SHOW=0; fi
  if [ "x$LABEL" = "xfate" ]; then SHOW=0; fi
  if [ $SHOW -eq 1 ]; then
    echo "$LABEL: $COUNT"
  fi
  if [ $SHOW -eq 2 ]; then
    echo $LABEL
    cat $FILE |grep '\*'
    echo
  fi
done
