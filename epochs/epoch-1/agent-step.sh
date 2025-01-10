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

if [ ! -f "/etc/exollama/pod.id" ]; then
  echo "Error: You need to run install.sh first."
  exit 1
fi
POD=`../../pod-name.sh`
./pod-status.sh
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
NAME=""
while [ $PROCESSED -eq 0 ]; do
  NAME=`./agent-name.sh $ID`
  POD_CHECK=`grep -c "$NAME" "$POD.roster"`
  if [ $POD_CHECK -eq 1 ]; then
    ./maybe-think.sh $ID
    if [ $? -eq 0 ]; then
      PROCESSED=1
      echo "git commit -m \"$NAME Update for $POD - Round $ROUND\"" >.exo-commit
    else
      ID=$(($ID+1))
    fi
  else
    ID=$(($ID+1))
  fi
  if [ $ID -eq 101 ]; then PROCESSED=1; fi
done

if [ $ID -eq 101 ]; then
  echo "Agent Processing Finished."
  ./round-status.sh
fi
git diff
git add .
git status
