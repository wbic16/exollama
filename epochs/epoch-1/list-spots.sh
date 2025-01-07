#!/bin/sh
for FILE in `ls -1 *.phext`; do
  COUNT=`cat $FILE |grep -c '\*'`
  COUNT=$((10 - $COUNT))
  LABEL=`echo $FILE |sed 's/\.phext//g'`
  echo "$LABEL: $COUNT"
done
