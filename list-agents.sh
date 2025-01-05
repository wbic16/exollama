#!/bin/sh
AGENT=1
MODE=$1
if [ "x$MODE" = "x" ]; then
  MODE="exists"
fi
while [ $AGENT -lt 100 ]; do
  if [ "x$MODE" = "xexists" ]; then
    if [ -f ./agents/agent.$AGENT ]; then
      ./verify-agent.sh $AGENT |head -1 |sed 's/Name: /Agent #'$AGENT': /g'
    fi
  fi
  if [ "x$MODE" = "xmissing" ]; then
    if [ ! -f ./agents/agent.$AGENT ]; then
      echo "Agent #$AGENT"
    fi
  fi
  AGENT=$(($AGENT + 1))
done
