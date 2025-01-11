#!/bin/sh
BYTES=`wc -c *.phext |grep total |awk '{print $1}'`
TOKENS=$(($BYTES/4))
KTOKENS=$(($TOKENS/1000))
CENTS=$(($KTOKENS))
DOLLARS=$(($CENTS/100))
CENTS=$(($CENTS-(100*$DOLLARS)))
# OpenAI 
# https://openai.com/api/pricing/ = $10/1M tokens or $0.01 per 1K tokens
echo "API Credits Cost: \$$DOLLARS.$CENTS"
