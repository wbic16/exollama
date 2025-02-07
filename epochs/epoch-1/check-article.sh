#!/bin/bash
ARTICLE="$1"
FILE="article.txt"
if [ "x$2" != "x" ]; then
  FILE="$2"
fi
COORDINATE=`./wiki-coordinate.sh "$ARTICLE"`
SQ_RUNNING=`ps -ef |grep -v grep |grep -c "sq wikipedia.phext"`
if [ $SQ_RUNNING -eq 0 ]; then
  rm -rf .sq
  sq wikipedia.phext &
fi
FOUND=`sq toc |grep -c $COORDINATE`
if [ $FOUND -eq 0 ]; then
  echo "No entry for '$ARTICLE' => $COORDINATE found."
  echo "$ARTICLE" >$FILE
  echo "" >>$FILE
  echo "" >>$FILE
  echo "Initialized $FILE."
else
  sq pull $COORDINATE $FILE
fi
