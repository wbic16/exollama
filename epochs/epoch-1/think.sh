#!/bin/sh
ID=$1
if [ -z $ID ]; then ID=1; fi
COORD=`./coordinate.sh $ID`
ROUND=0
if [ -f round ]; then ROUND=`cat round`; fi
if [ $ROUND -eq 2 ]; then
  if [ -f exocortexia.phext ]; then
    ./get-exocortexum.sh $ID
  fi
else
  ./get-message.sh $COORD
fi
EXOLLAMA_ROOT="../.."
if [ -d "/usr/local/exollama" ]; then
  EXOLLAMA_ROOT="/usr/local/exollama"
fi
LINES=`wc -l msg.txt |awk '{print $1}'`
if [ $LINES -eq 0 ]; then
  cp "$EXOLLAMA_ROOT/agents/agent.$ID" msg.txt
fi
TEXT=`cat msg.txt`
ROUND=0
if [ -f round ]; then ROUND=`cat round`; fi
echo " [ $NAME ]: Round $ROUND"
$EXOLLAMA_ROOT/l2.sh "$TEXT" >msg.txt
cat msg.txt
./post-message.sh $COORD

POD=`$EXOLLAMA_ROOT/pod-name.sh`
sq save $POD.phext
