#!/bin/sh
AGENT_COUNT=`./round-status.sh |wc -l`
TOK_RATING=$((25/$AGENT_COUNT))
COMPETITION_PRICE=$(($TOK_RATING*6))
PRICE=$((2000/($TOK_RATING*$AGENT_COUNT)))
TPM=500 # tokens per message
BRONZE=$(($TPM*10/$TOK_RATING/500))
SILVER=$(($TPM*25/$TOK_RATING/750))
GOLD=$(($TPM*100/$TOK_RATING/1000))
echo "Gold: 100 requests/day: \$$GOLD/mo"
echo "Silver: 25 requests/day: \$$SILVER/mo"
echo "Bronze: 10 requests/day: \$$BRONZE/mo"
