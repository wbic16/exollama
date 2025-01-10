#!/bin/sh
ROUND=0
POD=`../../pod-name.sh`
if [ -f round ]; then ROUND=`cat round`; fi
cat $POD.roster
git log --oneline origin/main..main
