#!/bin/bash
source exollama.inc
PHEXT=$2
if [ -z $PHEXT ]; then
  echo "Usage: $0 <id> <phext> <coordinate> <message>"
  exit 1
fi
COORDINATE=$3
MESSAGE=`echo "$4" |sed 's/ /+/g'`
if [ -z $COORDINATE ]; then
  COORDINATE="1.1.1/1.1.1/1.1.1"
fi
PORT=$((11000+$ID))
URL="http://127.0.0.1:$PORT/api/v2/update?p=$PHEXT&c=$COORDINATE&s=$MESSAGE"
echo "URL: $URL"
curl -s $URL
