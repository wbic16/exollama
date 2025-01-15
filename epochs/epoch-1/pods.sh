#!/bin/bash
source exollama.inc
cd $EXOLLAMA_ROOT
if [ ! -d .pods ]; then mkdir .pods; fi
killall sq
for ROW in `ls -1 agents`
do
  HAVE_THOUGHTS=`echo $ROW |grep -c '\.thought'`
  if [ $HAVE_THOUGHTS -eq 0 ]; then
    ID=`echo $ROW |sed 's/agent\.//g'`
    AGENT=`echo $ROW |sed 's/\..*$//g'`
    PORT=$(($ID + 11000))
    if [ ! -d .pods/$ID ]; then
      mkdir .pods/$ID
    fi
    sq $PORT >.pods/$ID/output.txt 2>.pods/$ID/error.txt &
  fi
done
