#!/bin/sh
ID=$1
if [ "x$ID" = "x" ]; then
  echo "USage: $0 <id>"
  exit 1
fi
FILE="agents/agent.$ID"
if [ ! -f $FILE ]; then
  echo "No agent definition for $ID yet."
  exit 1
fi
CONTENT=`cat $FILE`
NAME=`cat $FILE |grep 'Name:' |sed 's/Name: //g'`
BORN=`cat $FILE |grep 'Born:' |sed 's/Born: //g'`
BIO=`cat $FILE |grep 'Bio:' |sed 's/Bio: //g'`
VERIFIED=0
NAME_CHECK=`echo "$NAME" |sed 's/[a-zA-Z]//g'`
BORN_CHECK=`echo "$BORN" |sed 's/[a-zA-Z]//g'`
BIO_CHECK=`echo "$BIO" |sed 's/[a-zA-Z]//g'`
if [ ${#NAME} -gt ${#NAME_CHECK} ]; then VERIFIED=$(($VERIFIED+1)); fi
if [ ${#BORN} -gt ${#BORN_CHECK} ]; then VERIFIED=$(($VERIFIED+1)); fi
if [ ${#BIO}  -gt ${#BIO_CHECK}  ]; then VERIFIED=$(($VERIFIED+1)); fi
echo "Name: $NAME"
echo "Born: $BORN"
echo "Bio: $BIO"
if [ $VERIFIED -eq 3 ]; then echo "Verified."; exit 0; else echo "Failed."; exit 1; fi
