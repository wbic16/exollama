#!/bin/sh
AGENT_COUNT=`./round-status.sh |wc -l`
TOK_RATING=$((25/$AGENT_COUNT))
PRICE=$((2000/($TOK_RATING*$AGENT_COUNT)))
echo "Agents: $AGENT_COUNT"
echo "Price: \$$PRICE/mo"
