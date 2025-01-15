#!/bin/bash
ROUND=0
source exollama.inc
POD=`$EXOLLAMA_ROOT/pod-name.sh`
if [ -f round ]; then ROUND=`cat round`; fi
cat $POD.roster
git log --oneline "origin/$EXOLLAMA_BRANCH..$EXOLLAMA_BRANCH"
