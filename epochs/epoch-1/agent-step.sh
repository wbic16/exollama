#!/bin/sh
MODEL="gemma:7b" # llama3.2, qwen2, gemma, tinyllama, mixtral, etc.
ID=`cat id`
NAME=`cd ../../ && ./verify-agent.sh $ID |grep 'Name:' |sed 's/Name: //g'`
echo "Taking next time-step action for $NAME (Agent #$ID)..."
ollama run $MODEL --verbose "Think like an agent. Your first mission, should you choose to accept it, is to pick a pod from this list: aurora, chronos, elysium, helios, nyx, or tyche. Assume the identity of $NAME, Agent #$ID." >output.phext
cat output.phext
NEXT_ID=$(($ID+1))
echo $NEXT_ID >id
git add id
git status
./list-spots.sh
./update-pod-manifest.sh
echo "$NAME (Agent #$ID)"
