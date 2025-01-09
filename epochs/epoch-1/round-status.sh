#!/bin/sh
ROUND=0
POD=`cat /etc/exollama.id`
if [ -f round ]; then ROUND=`cat round`; fi
cat $POD.roster
git log |grep "Round $ROUND" |grep -i $POD
