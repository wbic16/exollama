#!/bin/sh
ID=$1
if [ -z $ID ]; then ID=1; fi
COORD=`./coordinate.sh $ID`
./get-message.sh $COORD
LINES=`wc -l msg.txt |awk '{print $1}'`
if [ $LINES -eq 0 ]; then
  cp "../../agents/agent.$ID" msg.txt
fi
TEXT=`cat msg.txt`
ROUND=0
if [ -f round ]; then ROUND=`cat round`; fi
echo " [ $NAME ]: Round $ROUND"
../../l2.sh "$TEXT" >msg.txt
cat msg.txt
./post-message.sh $COORD

POD=`cat /etc/exollama.id`
sq save $POD.phext
