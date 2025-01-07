#!/bin/sh
for FILE in `ls -1 *.phext`; do
  COUNT=`cat $FILE |grep -c '\*'`
  COUNT=$((10 - $COUNT))
  LABEL=`echo $FILE |sed 's/\.phext//g'`
  if [ "x$LABEL" != "xjobs" ]; then
    echo "$LABEL: $COUNT"
  fi
done
