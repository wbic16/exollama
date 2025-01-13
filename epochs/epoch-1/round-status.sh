#!/bin/sh
ROUND=0
EXOLLAMA_ROOT="../.."
if [ -d "/usr/local/exollama" ]; then
  EXOLLAMA_ROOT="/usr/local/exollama"
fi
POD=`$EXOLLAMA_ROOT/pod-name.sh`
if [ -f round ]; then ROUND=`cat round`; fi
cat $POD.roster
git log --oneline origin/main..main
