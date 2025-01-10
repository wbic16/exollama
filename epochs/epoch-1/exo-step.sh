#!/bin/sh
CHANGED=1
ROUND=0
if [ -f round ]; then ROUND=`cat round`; fi
POD=`cat /etc/exollama.id`
if [ -f .exo-step ]; then
  mv .exo-step .exo-prior
fi
while [ $CHANGED -gt 0 ]; do
  ./agent-step.sh |tee .exo-step
  CHANGED=`diff .exo-step .exo-prior |wc -l`
  if [ -f .exo-commit ]; then
    COMMIT_MSG=`cat .exo-commit`
    `$COMMIT_MSG`
    rm -f .exo-commit
  fi
  exit 0
done
echo " [ $POD ]: Round $ROUND Complete."
