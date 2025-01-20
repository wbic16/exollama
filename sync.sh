#!/bin/sh
git stash
git pull
git stash pop
CHANGE_SIZE=`git diff |wc -l`
if [ $CHANGE_SIZE -gt 0 ]; then
  echo "Your install has diverged from upstream."
  if [ -d /source/exollama ]; then
    FILES=`git status |grep 'modified:' |awk '{print $2}'`
    for FILE in $FILES; do
      cp $FILE /source/exollama
      echo "* $FILE"
    done
  else
    echo "Consider pushing the files below to the exollama project!"
  fi
  git status
fi
