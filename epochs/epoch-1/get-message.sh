#!/bin/sh
COORDINATE=$1
if [ -z $COORDINATE ]; then
  COORDINATE=`./coordinate.sh`
fi
sq pull $COORDINATE msg.txt
