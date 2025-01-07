#!/bin/sh
ID=`cat id`
NAME=`cd ../../ && ./verify-agent.sh $ID |grep 'Name:' |sed 's/Name: //g'`
echo "Taking next time-step action for $NAME (Agent #$ID)..."
ollama run tinyllama "Don't over-think this. Work step by step. Choose your pod from this list: aurora, chronos, elysium, helios, nyx, or tyche. Assume the identity of $NAME, Agent #$ID." >output.phext
cat output.phext
