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
./roster.sh >$POD.roster
PROCESSED=0
while [ $PROCESSED -eq 0 ]; do
  NAME=`./agent-name.sh $ID`
  POD_CHECK=`grep -c "$NAME" "$POD.roster"`
  if [ $POD_CHECK -eq 1 ]; then
    echo " [ $NAME ]: Running Round $ROUND"
    PROCESSED=1
    ./think.sh $ID
    git status
  else
    ID=$(($ID+1))
  fi
done
