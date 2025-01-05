#!/bin/sh
AGENT=1
while [ $AGENT -lt 100 ]; do
  if [ -f ./agents/agent.$AGENT ]; then
    ./verify-agent.sh $AGENT |head -1 |sed 's/Name: /Agent #'$AGENT': /g'
  fi
  AGENT=$(($AGENT + 1))
done
