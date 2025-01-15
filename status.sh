#!/bin/sh
if [ ! -f /etc/exollama/pod.id ]; then
  ./install.sh
  exit 1
fi
POD=`./pod-name.sh`
if [ ! -f /etc/exollama/el-version ]; then
  ./install.sh $POD
  exit 1
fi
ROUND=0
if [ -f epochs/epoch-1/round ]; then ROUND=`cat epochs/epoch-1/round`; fi
VERSION=`cat el-version`
if [ -f /etc/exollama/el-version ]; then
  VERSION=`cat /etc/exollama/el-version`
fi
echo "exollama v$VERSION"
echo "Pod: $POD"
echo "Round: $ROUND"
echo "Branch: `git branch --show-current`"
echo "Synapses: `ps -ef |grep -c sq`"
