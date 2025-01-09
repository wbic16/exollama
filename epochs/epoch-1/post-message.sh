#!/bin/sh
COORDINATE=$1
if [ -z $COORDINATE ]; then
  COORDINATE=`./coordinate.sh`
fi
sq push $COORDINATE msg.txt
rm -f msg.txt
