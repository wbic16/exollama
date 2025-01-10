#!/bin/sh
MODEL="llama3.2" # llama3.2, qwen2:7b, gemma:7b, tinyllama, mixtral, etc.
ROUND=0
if [ -f round ]; then
  ROUND=`cat round`
fi
ID=0
if [ -f id ]; then
  ID=`cat id`
fi

if [ $ROUND -eq 0 ]; then
  if [ $ID -eq 101 ]; then
    echo "Initialization Complete."
    echo "Initiating evolution."
    ROUND=1
    ID=1
    echo $ID >id
    echo $ROUND >round
  else
    ./init-agent.sh $ID $MODEL
  fi
fi

if [ ! -f "/etc/exollama.id" ]; then
  echo "Error: You need to run install.sh first."
  exit 1
fi
POD=`cat /etc/exollama.id`
if [ -f .exosync ]; then
  ELAPSED=`stat -c %Y .exosync`
  ELAPSED=$(($EPOCHSECONDS - $ELAPSED))
  ELAPSED=$(($ELAPSED/3600))
  if [ $ELAPSED -gt 0 ]; then
    git pull
    touch .exosync
  fi
fi
./roster.sh >$POD.roster
PROCESSED=0
while [ $PROCESSED -eq 0 ]; do
  NAME=`./agent-name.sh $ID`
  POD_CHECK=`grep -c "$NAME" "$POD.roster"`
  if [ $POD_CHECK -eq 1 ]; then
    echo " [ $NAME ]: Running Round $ROUND"
    ./maybe-think.sh $ID
    if [ $? -eq 0 ]; then PROCESSED=1; else ID=$(($ID+1)); fi
    git status
  else
    ID=$(($ID+1))
    echo " [ $NAME ]: skipped"
  fi
  if [ $ID -eq 101 ]; then PROCESSED=1; fi
done
